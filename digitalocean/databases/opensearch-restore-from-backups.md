---
source: https://docs.digitalocean.com/products/databases/opensearch/how-to/restore-from-backups/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Manually Restore OpenSearch Database Clusters from Backups | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/opensearch.2629f480d99bedd31ae31e9fd8269c327373bb1a8ecc38a68f458985e2393b42.svg)OpenSearch](/products/databases/opensearch/)
*   [Getting Started](/products/databases/opensearch/getting-started/)
    *   [Quickstart](/products/databases/opensearch/getting-started/quickstart/)
*   [How-Tos](/products/databases/opensearch/how-to/)
    *   [Create OpenSearch Clusters](/products/databases/opensearch/how-to/create/)
    *   [Forward Logs](/products/databases/opensearch/how-to/forward-logs/)
    *   [Resize Database Clusters](/products/databases/opensearch/how-to/resize/)
    *   [Secure OpenSearch Clusters](/products/databases/opensearch/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/opensearch/how-to/schedule-updates/)
    *   [Manage Users](/products/databases/opensearch/how-to/manage-users/)
    *   [Monitor Cluster Performance](/products/databases/opensearch/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/opensearch/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/opensearch/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/opensearch/how-to/fork-clusters/)
    *   [Restore from Backups](/products/databases/opensearch/how-to/restore-from-backups/)
    *   [Destroy Clusters](/products/databases/opensearch/how-to/destroy/)
    *   [Tag Database Clusters](/products/databases/opensearch/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/opensearch/how-to/reconfigure/)
*   [Reference](/products/databases/opensearch/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/opensearch/concepts/)
    *   [Best Practices](/products/databases/opensearch/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/opensearch/concepts/responsibility-model/)
*   [Details](/products/databases/opensearch/details/)
    *   [Features](/products/databases/opensearch/details/features/)
    *   [Pricing](/products/databases/opensearch/details/pricing/)
    *   [Availability](/products/databases/opensearch/details/availability/)
    *   [Limits](/products/databases/opensearch/details/limits/)
    *   [Cluster Notifications](/products/databases/opensearch/details/notifications/)
    *   [Supported Plugins](/products/databases/opensearch/details/supported-plugins/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)

*   [How-Tos](/products/databases/opensearch/how-to/) 
*   Restore from Backups

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Manually Restore OpenSearch Database Clusters from Backups

Validated on 17 Jun 2024 • Last edited on 22 Dec 2025

OpenSearch is an open-source search and analytics suite which serves as a centralized location to manage logs forwarded from other resources, such as databases and Droplets.

DigitalOcean Managed Databases automatically handle recovery from hardware and software failures by replacing degraded nodes with new ones that resume directly from the point of failure. To recover from situations like a database administrator or application accidentally destroying data, you can manually restore a OpenSearch database cluster from backups.

When you restore from a backup, we create a new copy of your cluster’s primary node. You cannot restore directly into the primary node itself because this creates alternative timelines for the database that introduce unwarranted complexity in a managed service. By restoring into a new primary node, a single linear timeline history is preserved.

OpenSearch cluster backups are automatically created once per day and retained for 7 days. Backups do not result in downtime or performance degradation. The time of day at which backups run is set automatically by DigitalOcean and you cannot change it.

## Restore a OpenSearch Cluster from Backups[](#restore-a-opensearch-cluster-from-backups)

To restore from a backup, from the **Databases** page, click the name of the OpenSearch database you want to restore to go to its **Overview** page, then click the **Actions** button and choose **Restore from backup** from the menu.

![Screenshot of OpenSearch Actions menu](https://docs.digitalocean.com/screenshots/databases/opensearch-restore.d6d8cb507dc91c12d1d99faf96a71993721a785f13eb22a702afa96466bb4aa5.png)

Note

If you cannot select **Restore from backup**, it means that you have hit the limit of database clusters for the account or team. You can delete a cluster or [contact our support team](https://cloudsupport.digitalocean.com) for a limit increase.

In the **Create a new cluster from a backup** window, choose whether you want to restore to the latest transaction available or choose a point in time. Then, choose a name for the new database. By default, the name is the original database’s name appended with the date of the backup and the word “backup”, for example `originalname-aug-13-backup`.

When you’re ready, click **Restore to New Cluster** to begin the restoration. The time it takes to create the new cluster depends on the amount of data in the original.

Warning

Destroying a database cluster destroys the backups of that database. Make sure you download any important data before you destroy a cluster.

In this article...

*   [Restore a OpenSearch Cluster from Backups](#restore-a-opensearch-cluster-from-backups)

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

Try using different keywords or simplifying your