---
source: https://docs.digitalocean.com/products/databases/mongodb/how-to/restore-from-backups/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Manually Restore MongoDB Database Clusters from Backups | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/mongodb.15f32316da2692011abce02f393a1ee6db469250230cf1ea962c181c0e9e7de5.svg)MongoDB](/products/databases/mongodb/)
*   [Getting Started](/products/databases/mongodb/getting-started/)
    *   [Quickstart](/products/databases/mongodb/getting-started/quickstart/)
    *   [Serverless Jamstack Site](/products/functions/getting-started/serverless-jamstack/)
*   [How-Tos](/products/databases/mongodb/how-to/)
    *   [Create MongoDB Clusters](/products/databases/mongodb/how-to/create/)
    *   [Resize Database Clusters](/products/databases/mongodb/how-to/resize/)
    *   [Connect to MongoDB Clusters](/products/databases/mongodb/how-to/connect/)
    *   [Import MongoDB Data](/products/databases/mongodb/how-to/import-collections/)
    *   [Secure MongoDB Clusters](/products/databases/mongodb/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/mongodb/how-to/schedule-updates/)
    *   [Tag Database Clusters](/products/databases/mongodb/how-to/tag/)
    *   [Manage Users and Databases](/products/databases/mongodb/how-to/manage-users-and-databases/)
    *   [Upgrade Database Clusters](/products/databases/mongodb/how-to/upgrade/)
    *   [Add Standby Nodes](/products/databases/mongodb/how-to/add-standby-nodes/)
    *   [Monitor Cluster Performance](/products/databases/mongodb/how-to/monitor-clusters/)
    *   [Forward Logs](/products/databases/mongodb/how-to/forward-logs/)
    *   [Set Up Monitoring Alerts](/products/databases/mongodb/how-to/set-up-alerts/)
    *   [Fork Database Clusters](/products/databases/mongodb/how-to/fork-clusters/)
    *   [Reconfigure Database Clusters](/products/databases/mongodb/how-to/reconfigure/)
    *   [Restore from Backups](/products/databases/mongodb/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/mongodb/how-to/destroy/)
*   [Reference](/products/databases/mongodb/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/mongodb/concepts/)
    *   [Best Practices](/products/databases/mongodb/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/mongodb/concepts/responsibility-model/)
*   [Details](/products/databases/mongodb/details/)
    *   [Features](/products/databases/mongodb/details/features/)
    *   [Pricing](/products/databases/mongodb/details/pricing/)
    *   [Availability](/products/databases/mongodb/details/availability/)
    *   [Limits](/products/databases/mongodb/details/limits/)
    *   [Cluster Notifications](/products/databases/mongodb/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/mongodb/support/)

*   [How-Tos](/products/databases/mongodb/how-to/) 
*   Restore from Backups

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Manually Restore MongoDB Database Clusters from Backups

Validated on 28 Jun 2021 • Last edited on 17 Jun 2025

MongoDB is a source-available cross-platform document-oriented database program for high-volume storage. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.

DigitalOcean Managed Databases automatically handle recovery from hardware and software failures by replacing degraded nodes with new ones that resume directly from the point of failure. To recover from situations like a database administrator or application accidentally destroying data, you can manually restore a MongoDB database cluster from backups.

MongoDB cluster backups are automatically created once per day and retained for 7 days. Backups do not result in downtime or performance degradation, and the time of day at which they run is set automatically by DigitalOcean and cannot be changed.

## Restore a MongoDB Cluster from Backups[](#restore-a-mongodb-cluster-from-backups)

To restore from a backup, from the **Databases** page, click the name of the MongoDB database you want to restore to go to its **Overview** page, then click the **Actions** button and choose **Restore from backup** from the menu.

![Screenshot of MongoDB Actions page](https://docs.digitalocean.com/screenshots/databases/mongodb-restore.f272369f00c946a7e8adab0c11ca86637076582f711d01fc3c2afe317ea8e864.png)

Note

If you cannot select **Restore from backup**, it means that you have hit the limit of database clusters for the account or team, or that your cluster is new and doesn’t have backups yet. You can delete a cluster or [contact our support team](https://cloudsupport.digitalocean.com) for a limit increase.

In the **Restore from backup** window that opens, choose one of the available backups from the **Select a backup** field, then choose a name for the new database. By default, the name is the original databases’ name appended with the date of the backup and the word “backup”, like `originalname-aug-13-backup`.

When you’re ready, click **Restore to New Cluster** to begin the restoration. The time it takes to create the new cluster depends on the amount of data in the original.

Warning

Destroying a database cluster destroys the backups of that database. Make sure you download any important data before you destroy a cluster.

In this article...

*   [Restore a MongoDB Cluster from Backups](#restore-a-mongodb-cluster-from-backups)

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