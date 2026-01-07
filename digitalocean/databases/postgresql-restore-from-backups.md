---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/restore-from-backups/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Manually Restore PostgreSQL Database Clusters from Backups | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/postgresql.855c43f1f82e98a24a05998729b39a9937438c7f77af3dc0c22da5a5739f5eb7.svg)PostgreSQL](/products/databases/postgresql/)
*   [Getting Started](/products/databases/postgresql/getting-started/)
    *   [Quickstart](/products/databases/postgresql/getting-started/quickstart/)
*   [How-Tos](/products/databases/postgresql/how-to/)
    *   [Create PostgreSQL Clusters](/products/databases/postgresql/how-to/create/)
    *   [Connect to PostgreSQL Cluster](/products/databases/postgresql/how-to/connect/)
    *   [Resize Database Clusters](/products/databases/postgresql/how-to/resize/)
    *   [Import Databases](/products/databases/postgresql/how-to/import-databases/)
    *   [Secure PostgreSQL Clusters](/products/databases/postgresql/how-to/secure/)
    *   [Migrate External Databases](/products/databases/postgresql/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/postgresql/how-to/schedule-updates/)
    *   [Manage Users and Databases](/products/databases/postgresql/how-to/manage-users-and-databases/)
    *   [Modify User Privileges](/products/databases/postgresql/how-to/modify-user-privileges/)
    *   [Monitor PostgreSQL Performance](/products/databases/postgresql/how-to/monitor-databases/)
    *   [Add Standby Nodes](/products/databases/postgresql/how-to/add-standby-nodes/)
    *   [Add Read-Only Nodes](/products/databases/postgresql/how-to/add-read-only-nodes/)
    *   [Manage Connection Pools](/products/databases/postgresql/how-to/manage-connection-pools/)
    *   [Monitor Cluster Performance](/products/databases/postgresql/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/postgresql/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/postgresql/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/postgresql/how-to/fork-clusters/)
    *   [Forward Logs](/products/databases/postgresql/how-to/forward-logs/)
    *   [Restore from Backups](/products/databases/postgresql/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/postgresql/how-to/destroy/)
    *   [Tag Database Clusters](/products/databases/postgresql/how-to/tag/)
    *   [Upgrade PostgreSQL](/products/databases/postgresql/how-to/upgrade-version/)
    *   [Reconfigure Database Clusters](/products/databases/postgresql/how-to/reconfigure/)
*   [Reference](/products/databases/postgresql/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/postgresql/concepts/)
    *   [Best Practices](/products/databases/postgresql/concepts/best-practices/)
    *   [Migration Strategies](/products/databases/postgresql/concepts/migration-strategies/)
    *   [Shared Buffers](/products/databases/postgresql/concepts/shared-buffers/)
    *   [Shared Responsibility Model](/products/databases/postgresql/concepts/responsibility-model/)
*   [Details](/products/databases/postgresql/details/)
    *   [Features](/products/databases/postgresql/details/features/)
    *   [Pricing](/products/databases/postgresql/details/pricing/)
    *   [Availability](/products/databases/postgresql/details/availability/)
    *   [Limits](/products/databases/postgresql/details/limits/)
    *   [Supported Extensions](/products/databases/postgresql/details/supported-extensions/)
    *   [Cluster Notifications](/products/databases/postgresql/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/postgresql/support/)

*   [How-Tos](/products/databases/postgresql/how-to/) 
*   Restore from Backups

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Manually Restore PostgreSQL Database Clusters from Backups

Validated on 1 Oct 2019 • Last edited on 17 Jun 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

DigitalOcean Managed Databases automatically handle recovery from hardware and software failures by replacing degraded nodes with new ones that resume directly from the point of failure. To recover from situations like a database administrator or application accidentally destroying data, you can manually restore a PostgreSQL database cluster from backups.

When you restore from a backup, we create a new copy of your cluster’s primary node. You cannot restore directly into the primary node itself because this creates alternative timelines for the database that introduce unwarranted complexity in a managed service. By restoring into a new primary node, a single linear timeline history is preserved.

PostgreSQL cluster backups are automatically created once per day and retained for 7 days. Backups do not result in downtime or performance degradation, and the time of day at which they run is set automatically by DigitalOcean and cannot be changed.

## Restore a PostgreSQL Cluster from Backups[](#restore-a-postgresql-cluster-from-backups)

To restore from a backup, from the **Databases** page, click the name of the PostgreSQL database you want to restore to go to its **Overview** page, then click the **Actions** button and choose **Restore from backup** from the menu.

![Screenshot of PostgreSQL Actions page](https://docs.digitalocean.com/screenshots/databases/postgresql-restore.bb3b7f8c5c5b5a3f59004d257e71b06471590faff8a9134dbff5d8ffc48e110c.png)

Note

If you cannot select **Restore from backup**, it means that you have hit the limit of database clusters for the account or team. You can delete a cluster or [contact our support team](https://cloudsupport.digitalocean.com) for a limit increase.

In the **Create a new cluster from a backup** window that opens, choose whether you want to restore to the latest transaction available or choose a point in time, then choose a name for the new database. By default, the name is the original databases’ name appended with the date of the backup and the word “backup”, like `originalname-aug-13-backup`.

When you’re ready, click **Restore to New Cluster** to begin the restoration. The time it takes to create the new cluster depends on the amount of data in the original.

When the restoration completes, you can add [standby nodes](/products/databases/postgresql/how-to/add-standby-nodes/) and [read-only nodes](/products/databases/postgresql/how-to/add-read-only-nodes/) as needed.

Warning

Destroying a database cluster destroys the backups of that database. Make sure you download any important data before you destroy a cluster.

In this article...

*   [Restore a PostgreSQL Cluster from Backups](#restore-a-postgresql-cluster-from-backups)

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