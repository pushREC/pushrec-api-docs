---
source: https://docs.digitalocean.com/products/databases/mysql/concepts/sort-buffer-size/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                Sort Buffer Size on MySQL | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/mysql.15f32316da2692011abce02f393a1ee6db469250230cf1ea962c181c0e9e7de5.svg)MySQL](/products/databases/mysql/)
*   [Getting Started](/products/databases/mysql/getting-started/)
    *   [Quickstart](/products/databases/mysql/getting-started/quickstart/)
*   [How-Tos](/products/databases/mysql/how-to/)
    *   [Create MySQL Clusters](/products/databases/mysql/how-to/create/)
    *   [Connect to MySQL Clusters](/products/databases/mysql/how-to/connect/)
    *   [Resize Database Clusters](/products/databases/mysql/how-to/resize/)
    *   [Import Databases](/products/databases/mysql/how-to/import-databases/)
    *   [Secure MySQL Clusters](/products/databases/mysql/how-to/secure/)
    *   [Migrate MySQL Databases](/products/databases/mysql/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/mysql/how-to/schedule-updates/)
    *   [Manage Users and Databases](/products/databases/mysql/how-to/manage-users-and-databases/)
    *   [Modify User Privileges](/products/databases/mysql/how-to/modify-user-privileges/)
    *   [Monitor MySQL Performance](/products/databases/mysql/how-to/monitor-databases/)
    *   [Add Standby Nodes](/products/databases/mysql/how-to/add-standby-nodes/)
    *   [Add Read-Only Nodes](/products/databases/mysql/how-to/add-read-only-nodes/)
    *   [Monitor Cluster Performance](/products/databases/mysql/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/mysql/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/mysql/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/mysql/how-to/fork-clusters/)
    *   [Forward Logs](/products/databases/mysql/how-to/forward-logs/)
    *   [Restore from Backups](/products/databases/mysql/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/mysql/how-to/destroy/)
    *   [Set Global SQL Mode](/products/databases/mysql/how-to/set-sql-mode/)
    *   [Tag Database Clusters](/products/databases/mysql/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/mysql/how-to/reconfigure/)
    *   [Create Primary Keys](/products/databases/mysql/how-to/create-primary-keys/)
*   [Reference](/products/databases/mysql/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/mysql/concepts/)
    *   [Migration Strategies](/products/databases/mysql/concepts/migration-strategies/)
    *   [Sort Buffer Size](/products/databases/mysql/concepts/sort-buffer-size/)
    *   [Best Practices](/products/databases/mysql/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/mysql/concepts/responsibility-model/)
*   [Details](/products/databases/mysql/details/)
    *   [Features](/products/databases/mysql/details/features/)
    *   [Pricing](/products/databases/mysql/details/pricing/)
    *   [Availability](/products/databases/mysql/details/availability/)
    *   [Limits](/products/databases/mysql/details/limits/)
    *   [Cluster Notifications](/products/databases/mysql/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/mysql/support/)

*   [Concepts](/products/databases/mysql/concepts/) 
*   Sort Buffer Size

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Sort Buffer Size on MySQL

Validated on 7 Jul 2022 • Last edited on 24 Jan 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

[Sort Buffer Size (`sort_buffer_size`)](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_sort_buffer_size) is a MySQL server system variable that can affect your query performance. It is defined on a per-session level, impacting your cluster’s memory consumption.

Warning

Changing `sort_buffer_size` can reduce query performance, increase overall memory consumption, and even crash your cluster. This process is highly specific to your workload and we do not recommend changing the default value. Please read the following potential use cases and disclaimers before changing it.

## Use Cases[](#use-cases)

In only the following cases, [increasing `sort_buffer_size`](#adjust-sort-buffer-size) might help:

*   If the `sort_merge_passes` variable is [increasing rapidly throughout the day](#check-sort-merge-passes)
*   If your `ORDER BY` or `GROUP BY` queries are performing poorly

If your `ORDER BY` or `GROUP BY` queries are performing poorly, first try adding [an index](https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html) to improve performance instead. This method does not use the `sort_buffer` and does not require that you change `sort_buffer_size`.

## Check Sort Merge Passes[](#check-sort-merge-passes)

[Sort Merge Passes (`sort_merge_passes`)](https://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html#statvar_Sort_merge_passes) is a relatively static variable that slowly increases the longer your database instance has been up. High `sort_merge_passes` values are normal for instances that have been running for some time. However, if the value is increasing rapidly, such as within the span of a day, consider [increasing `sort_buffer_size`](#adjust-sort-buffer-size) until `sort_merge_passes` stabilizes.

To check the current value, run an `ORDER BY` or `GROUP BY` query leading to a `filesort`, including the parameter `show session status like 'sort_merge_passes'`. For example:

    mysql> pager grep "rows in set"; SELECT * FROM employees ORDER BY hire_date; nopager; show session status like 'sort_merge_passes'; PAGER set to 'grep "rows in set"'

Which returns an output similar to:

    300024 rows in set (3.89 sec)
    
    PAGER set to stdout
    +-------------------+-------+
    | Variable_name     | Value |
    +-------------------+-------+
    | sort_merge_passes | 18    |
    +-------------------+-------+
    1 row in set (0.12 sec)

If this value increases rapidly after checking it multiple times throughout the day, try [increasing `sort_buffer_size`](#adjust-sort-buffer-size) until it decreases or stabilizes.

## Adjust Sort Buffer Size[](#adjust-sort-buffer-size)

You can adjust `sort_buffer_size` using [our API](/reference/api/digitalocean/#operation/patch_database_config). For example:

    curl -X PATCH \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    -d '{"config": {"sort_buffer_size":2097152}}' \
    "https://api.digitalocean.com/v2/databases/$database_cluster_uuid/config"

You can create a DigitalOcean API token by [following our guide](/reference/api/create-personal-access-token/), and you can fetch your database cluster’s UUID by calling our API’s [List Database Clusters endpoint](/reference/api/digitalocean/#operation/list_database_clusters).

Having `sort_buffer_size` over 5MB may significantly slow down memory allocation.

Once you have changed `sort_buffer_size`, [check your query performance and `sort_merge_passes`](#check-sort-merge-passes). If your query performance has not improved or `sort_merge_passes` is still increasing rapidly, you can try increasing `sort_buffer_size` incrementally again and running the same diagnostics until you see an improvement.

In this article...

*   [Use Cases](#use-cases)
*   [Check Sort Merge Passes](#check-sort-merge-passes)
*   [Adjust Sort Buffer Size](#adjust-sort-buffer-size)

##### Company

*   [About](https://www.digitalocean.com/about)
*   [Careers](https://www.digitalocean.com/careers)
*   [Blog](https://www.digitalocean.com/blog)

##### Docs

*   [Docs Home](https://docs.digitalocean.com)
*   [API Reference](https://docs.digitalocean.com/reference/api)
*   [CLI Reference](https://docs.digitalocean.com/reference/doctl)
*   [Release Notes](https://docs.digitalocean.com/release-notes)
*   [Trust Platform](https://www.digitalocean.com/trust)

##### Community

*   [Tutorials](https://www.digitalocean.com/community/tutorials)
*   [Q&A](https://www.digitalocean.com/community/questions)
*   [Write for DOnations](https://www.digitalocean.com/community/pages/write-for-digitalocean)
*   [Currents Research](https://www.digitalocean.com/currents)
*   [Legal](https://www.digitalocean.com/legal)
*   [Code of Conduct](https://www.digitalocean.com/community/pages/code-of-conduct)

##### Support

*   [Support Center](/support)
*   [Report Abuse](https://www.digitalocean.com/company/contact/abuse)

* * *

© 2025 DigitalOcean, LLC. All rights reserved

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https://www.linkedin.com/company/digitalocean)[](https://github.com/digitalocean)

### We can't find any results for your search.

Try using different keywords or simplifying your se
