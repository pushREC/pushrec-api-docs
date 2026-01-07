---
source: https://docs.digitalocean.com/products/databases/postgresql/support/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               PostgreSQL Support | DigitalOcean Documentation

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

*   Support

[Give Feedback](https://ideas.digitalocean.com/documentation)

# PostgreSQL Support

Generated on 6 Jan 2026

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

[](/support/how-do-i-fix-a-permission-denied-for-schema-public-error-in-postgresql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix a "permission denied for schema public" error in PostgreSQL?

Update the user’s privileges to `CREATE`, `USAGE`, or `ALL` on the public schema.

[](/support/how-do-i-fix-the-pgvector-could-not-open-extension-control-file-error/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the pgvector "could not open extension control file" error?

Use the command CREATE EXTENSION vector; instead of pgvector.

[](/support/how-do-i-fix-the-pg_dumpall-permission-denied-for-table-pg_authid-error/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the pg\_dumpall "permission denied for table pg\_authid" error?

Add the –no-role-passwords flag to the pg\_dumpall command.

[](/support/how-do-i-fix-the-pg_dump-aborting-because-of-server-version-mismatch-error/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the pg\_dump "aborting because of server version mismatch" error?

Resolve the pg\_dump server version mismatch by upgrading pg\_dump, matching it to the server version, or using a third-party backup tool.

[](/support/how-do-i-fix-the-authentication-failed-error-when-connecting-to-postgresql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Authentication Failed" error when connecting to PostgreSQL?

Verify the database cluster, username, and password.

[](/support/how-do-i-fix-the-connection-refused-error-when-connecting-to-my-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Connection Refused" error when connecting to my database?

Verify the connection string, ensure correct port usage, and add your local machine to the database cluster’s trusted sources.

[](/support/how-do-i-fix-the-connection-timed-out-error-when-connecting-to-my-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Connection Timed Out" error when connecting to my database?

Add your machine to the database cluster’s list of trusted sources in the firewall settings.

[](/support/how-do-i-fix-the-could-not-translate-hostname-to-address-error-when-connecting-to-postgresql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Could Not Translate Hostname to Address" error when connecting to PostgreSQL?

Verify the hostname and check your local machine for DNS resolution issues.

[](/support/how-do-i-fix-the-database-does-not-exist-error-when-connecting-to-postgresql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Database Does Not Exist" error when connecting to PostgreSQL?

Verify the hostname and confirm the database exists in the specified cluster.

[](/support/how-do-i-fix-the-invalid-parameters-and-values-error-when-connecting-to-my-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Invalid Parameters and Values" error when connecting to my database?

Verify the format and values in the connection string for typos or formatting errors.

[](/support/how-do-i-fix-the-no-such-file-or-directory-error-when-connecting-to-my-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "No Such File or Directory" error when connecting to my database?

Prepend your database client command to the connection string.

[](/support/why-is-my-cluster-rebalancing/resizing/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why is my cluster rebalancing/resizing?

We are currently processing the cluster, most likely for maintenance. You can expect no downtime or performance issues.

In this article...

[PostgreSQL Support](https://docs.digitalocean.com/products/databases/postgresql/support/)

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

Try using different keywords or simplifying your sear
