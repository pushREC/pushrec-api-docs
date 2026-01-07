---
source: https://docs.digitalocean.com/products/databases/postgresql/details/limits/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               PostgreSQL Limits | DigitalOcean Documentation

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

*   [Details](/products/databases/postgresql/details/) 
*   Limits

[Give Feedback](https://ideas.digitalocean.com/documentation)

# PostgreSQL Limits

Validated on 26 Jul 2019 • Last edited on 5 Nov 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

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
    
*   When you restore from a backup, you must restore to a new node and re-add any read-only or standby nodes. See [How to Restore from Backups](/products/databases/postgresql/how-to/restore-from-backups/) for details.
    

## PostgreSQL Limits[](#postgresql-limits)

*   Each cluster is limited to 3 nodes.
    
*   We only support PostgreSQL v13, v14, v15, v16, v17 and v18. See the following table for EOL (End of Life) dates:
    
    PostgreSQL Version
    
    EOL Date
    
    13
    
    2025-11-13
    
    14
    
    2026-11-12
    
    15
    
    2027-11-12
    
    16
    
    2028-11-09
    
    17
    
    2029-11-08
    
    18
    
    2030-11-08
    
*   We only support selected PostgreSQL extensions. See [Supported PostgreSQL Extensions](/products/databases/postgresql/details/supported-extensions/) for a comprehensive list.
    
*   The number of available backend connections varies by plan size:
    
    Plan Size
    
    Available Backend Connections
    
    1 GiB RAM
    
    22
    
    2 GiB RAM
    
    47
    
    4 GiB RAM
    
    97
    
    8 GiB RAM
    
    197
    
    16 GiB RAM
    
    397
    
    32 GiB RAM
    
    797
    
    64 GiB RAM
    
    997
    
    128 GiB RAM
    
    997
    
    160 GiB RAM
    
    997
    
    192 GiB RAM
    
    997
    
    256 GiB RAM
    
    997
    
    For databases with high connection requirements, we recommend using [connection pooling](/products/databases/postgresql/how-to/manage-connection-pools/), backed by PgBouncer. Each database cluster supports 21 PgBouncer pools and up to 1,000 connections, depending on the plan size. If you need more pools or connections than this, [contact support](https://cloudsupport.digitalocean.com).
    
*   To maintain cluster stability, users cannot access the `superuser` role.
    
*   You cannot migrate a cluster using the default `postgres` user.
    
*   We do not currently support migrating managed database clusters on DigitalOcean to other managed database clusters on DigitalOcean using continuous migration. For example, you cannot migrate a managed database cluster from one DigitalOcean account to another. However, you can migrate with a dump.
    

## Known Issues[](#known-issues)

### Managed Database Cluster Known Issues[](#managed-database-cluster-known-issues)

*   You must use a third-party client to manage access control lists (ACLs). You can add users and databases from the DigitalOcean Control Panel.
    
*   You can’t use DigitalOcean’s Cloud Firewalls with managed databases. Until support is available, you can restrict access to nodes by their incoming IPv4 addresses.
    
*   Point-in-time-recovery (PITR) operations are limited to the last 7 days. The date picker doesn’t restrict you from choosing an earlier date; you will receive an error if you try to recover from a date outside of the 7-day window.
    

### PostgreSQL Known Issues[](#postgresql-known-issues)

*   Alerting on PostgreSQL metrics is not yet available.
    
*   Additional storage can cause slight performance degradation in database clusters.
    

In this article...

*   [Managed Database Cluster Limits](#managed-database-cluster-limits)
*   [PostgreSQL Limits](#postgresql-limits)
*   [Known Issues](#known-issues)
    *   [Managed Database Cluster Known Issues](#managed-database-cluster-known-issues)
    *   [PostgreSQL Known Issues](#postgresql-known-issues)

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

Try using different keywords or simplifying y
