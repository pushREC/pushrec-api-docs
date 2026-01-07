---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/upgrade-version/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Upgrade PostgreSQL to a New Version | DigitalOcean Documentation

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
*   Upgrade PostgreSQL

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Upgrade PostgreSQL to a New Version

Validated on 26 Jun 2020 • Last edited on 3 Dec 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

You can upgrade earlier versions of PostgreSQL clusters or nodes to newer versions using the [DigitalOcean Control Panel](https://cloud.digitalocean.com). The upgrade process has a small risk of downtime and data loss in case of a crash, so consider adding a [read-only node](/products/databases/postgresql/how-to/add-read-only-nodes/) as a backup before upgrading.

Note

You may receive a compatibility check error if you try to upgrade PostgreSQL twice in quick succession (for example, if you upgrade from PostgreSQL 12 to 13 and then immediately try to upgrade from 13 to 14). This is because the prior version hasn’t finished installing. If this happens, wait a few minutes and retry the upgrade.

To upgrade a cluster to a newer version of PostgreSQL, open the [**Databases**](https://cloud.digitalocean.com/databases) page and then click the cluster you want to upgrade.

On the cluster’s **Overview** page, scroll down to the **CURRENT VERSION** section and then click **Upgrade Now**.

![The cluster's current version of PostgreSQL.](https://docs.digitalocean.com/screenshots/databases/postgresql-current-version.adbbbcd8d38122d6345f76e6fe29e03204ffd01556e91e3d311a262d893373f9.png)

Select the version of PostgreSQL you want to use.

![PostgreSQL upgrade menu.](https://docs.digitalocean.com/screenshots/databases/postgresql-upgrade.a40db89a96db3e3355646ab5e7269515dd3ce9faa802ee5304fed024dbc35ade.png)

The control panel will run an upgrade compatibility check to ensure the new version is safe to install. If the check returns `Cluster Check found no issues - Safe to install`, click **Upgrade Now**.

Warning

Once the upgrade starts, you cannot restore the PostgreSQL instance to the previous version. Similarly, you can no longer use its past backups for procedures such as Point In Time Recovery (PITR), since they were created with an earlier version of PostgreSQL.

If the upgrade check fails, address the errors in the message and retry the upgrade.

![PostgreSQL upgrade error.](https://docs.digitalocean.com/screenshots/databases/postgresql-upgrade-error.22cba5af835244dba42f407fe798a385b9c699354f01f1f1e2e839f9036ba03a.png)

To verify the upgrade was successful, log in to your database and run the following statement:

    select version();

The statement returns the current version of PostgreSQL.

    version                                          
    -------------------------------------------------------------------------------------------
    PostgreSQL 12.3 on x86_64-pc-linux-gnu, compiled by gcc, a 0e5a33d4e p 6dc8de8930, 64-bit
    (1 row)

In this article...

[How to Upgrade PostgreSQL to a New Version](https://docs.digitalocean.com/products/databases/postgresql/how-to/upgrade-version/)

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

Try using different keywords or simplifying your search