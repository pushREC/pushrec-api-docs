---
source: https://docs.digitalocean.com/products/databases/mysql/details/limits/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                MySQL Limits | DigitalOcean Documentation

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

*   [Details](/products/databases/mysql/details/) 
*   Limits

[Give Feedback](https://ideas.digitalocean.com/documentation)

# MySQL Limits

Validated on 20 Aug 2019 • Last edited on 17 Jul 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

## Managed Database Cluster Limits[](#managed-database-cluster-limits)

*   By default, you are limited to 10 clusters per account or team. If you reach this limit but need to create more database clusters, you can submit a request for a higher limit by clicking “Request Increase” on the window that shows when you attempt to create another cluster.
    
*   You can only reduce additional storage if the new storage size is greater than or equal to the latest backup’s size plus any data growth since then and a 25% buffer.
    
*   You cannot delete the default database and user.
    
*   VPC networks are only available to resources, accounts, and teams in the same region as the VPC network.
    
*   You cannot migrate databases from clusters inside of DigitalOcean to other clusters inside of DigitalOcean using the online migration feature.
    
*   You can only deploy standby nodes in the same region as your database cluster.
    
*   You cannot reconfigure or resize a cluster while upgrading it.
    
*   You currently cannot add IPv6 rules to a database cluster’s trusted sources.
    

*   By default, database clusters only support up to 2,000 IP addresses as trusted sources. Different types of resources add varying numbers of IP addresses to your cluster. For example, Droplets typically have two IP addresses, one public and one private, both of which count towards the 2,000-address maximum. To add more than 2,000 IP addresses, [contact support](https://cloudsupport.digitalocean.com).
    
*   Point-in-time-recovery (PITR) is limited to the last 7 days.
    
*   When you restore from a backup, you must restore to a new node and re-add any read-only or standby nodes. See [How to Restore from Backups](/products/databases/mysql/how-to/restore-from-backups/) for details.
    

## MySQL Limits[](#mysql-limits)

*   Each cluster is limited to 3 nodes.
    
*   We only support MySQL v8.
    
*   We do not support query statistics.
    
*   Connection pooling is not supported for MySQL.
    
*   You cannot change the storage engine for MySQL from InnoDB to MyISAM.
    
*   To maintain cluster stability, users cannot use the `root` user.
    
*   During daily MySQL backups, there is a table lock and block concurrent schema-altering operations (DDL) are disallowed. To avoid conflicts with restricted actions during backups, [use the API to schedule schema updates](/reference/api/digitalocean/#operation/databases_patch_config) outside the backup window.
    
*   The MySQL system variables are set depending upon the size of the cluster’s Droplets. You can’t edit them, but you can see what they are with `SHOW VARIABLES;`.
    
*   MySQL nodes can have up to 75 (for plans under 4 GiB) or 100 (for plans greater than or equal to 4 GiB) simultaneous connections per gigabyte of usable memory, rounded down to the nearest gigabyte. Usable memory is the total memory on the node minus approximately 350 MB of overhead for the operating system and management.
    
    Plan Size
    
    Available Backend Connections
    
    1 GiB RAM
    
    75
    
    2 GiB RAM
    
    150
    
    4 GiB RAM
    
    400
    
    8 GiB RAM
    
    800
    
    16 GiB RAM
    
    1,600
    
    32 GiB RAM
    
    3,200
    
    64 GiB RAM
    
    6,400
    
    128 GiB RAM
    
    12,800
    
    160 GiB RAM
    
    16,000
    
    192 GiB RAM
    
    19,200
    
    256 GiB RAM
    
    25,600
    
    `max_connections` for a given node is one higher than the available backend connections for its plan, to accommodate an extra system process that does not count against the node’s connection limit. For example, `max_connections` for a 4 GiB node is 401.
    
*   We do not currently support migrating managed database clusters on DigitalOcean to other managed database clusters on DigitalOcean using continuous migration. For example, you cannot migrate a managed database cluster from one DigitalOcean account to another. However, you can migrate with a dump.
    

## Known Issues[](#known-issues)

### Managed Database Cluster Known Issues[](#managed-database-cluster-known-issues)

*   You must use a third-party client to manage access control lists (ACLs). You can add users and databases from the DigitalOcean Control Panel.
    
*   You can’t use DigitalOcean’s Cloud Firewalls with managed databases. Until support is available, you can restrict access to nodes by their incoming IPv4 addresses.
    
*   Point-in-time-recovery (PITR) operations are limited to the last 7 days. The date picker doesn’t restrict you from choosing an earlier date; you will receive an error if you try to recover from a date outside of the 7-day window.
    
*   MySQL databases containing tables without a primary key and which contain more than 5000 rows may experience replication issues. To prevent this, by default, DigitalOcean now requires you to add a primary key for each new table you create in any managed MySQL database created after 8 April 2020. We strongly recommend that you also [add primary keys](/products/databases/mysql/how-to/create-primary-keys/) in existing databases to avoid replication issues. You can override this requirement by making a [configuration request](/reference/api/digitalocean/#operation/databases_patch_config) via our API.
    
*   Additional storage can cause slight performance degradation in database clusters.
    

In this article...

*   [Managed Database Cluster Limits](#managed-database-cluster-limits)
*   [MySQL Limits](#mysql-limits)
*   [Known Issues](#known-issues)
    *   [Managed Database Cluster Known Issues](#managed-database-cluster-known-issues)

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

Try using different keywords or simpl
