---
source: https://docs.digitalocean.com/products/databases/postgresql/concepts/migration-strategies/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
igration Strategies | DigitalOcean Documentation

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

*   [Concepts](/products/databases/postgresql/concepts/) 
*   Migration Strategies

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Migration Strategies

Validated on 10 Feb 2022 • Last edited on 29 Nov 2023

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

Depending on your database’s write workload, you can choose one of the following strategies to redirect its traffic to the new target database:

## Updating Connection Parameters[](#updating-connection-parameters)

If your database’s workload is read-heavy, such as hosting blog entries or other static files, change the connection parameters in the applications and clients accessing the source database. This strategy results in downtime while you update connection parameters for all applications and clients, but does not require proxy configuration to implement.

To migrate using this strategy:

1.  Start [migrating your data](/products/databases/postgresql/how-to/migrate/) from the source database to the target database.
2.  When you are ready to cut over, stop all writes to the source database.
3.  Update the connection parameters in your applications and clients to the new database’s parameters.
4.  Stop the migration in the [DigitalOcean Control Panel](https://cloud.digitalocean.com).
5.  Restart all applications and clients that are using the new database connection parameters.

## Using a Proxy[](#using-a-proxy)

If your database’s workload is write-heavy and requires minimal downtime, you can use a proxy software, such as [Pgpool](https://pgpool.net/mediawiki/index.php/Main_Page), to reroute the source database’s queries to the target database after the migration is complete. This strategy updates only one set of connection parameters instead of updating the connection parameters for all applications accessing the database.

Warning

If the migration suffers from replication lag, disable writing to the source database. This lag can result in data loss when you redirect queries to your target database, since it may not be entirely up to date.

To migrate using this strategy:

1.  Download and install your proxy software on a Droplet or other web server. We recommend [Pgpool](https://pgpool.net/mediawiki/index.php/Main_Page) for PostgreSQL.
2.  Configure the proxy to connect to the source database.
3.  Update all applications and clients connecting to the database to use the proxy’s hostname instead of the source database’s hostname.
4.  Start [migrating your data](/products/databases/postgresql/how-to/migrate/) from the source database to the target database.
5.  Once the target database is up to date, update the proxy with the target database’s connection parameters to redirect queries from the source database to the target database. The method to do this can vary depending on your proxy, so reference its documentation for more detailed steps.
6.  Stop the migration in the [DigitalOcean Control Panel](https://cloud.digitalocean.com).

In this article...

*   [Updating Connection Parameters](#updating-connection-parameters)
*   [Using a Proxy](#using-a-proxy)

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

Try using different keywords or simplifying