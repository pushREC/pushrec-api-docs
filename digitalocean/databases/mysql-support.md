---
source: https://docs.digitalocean.com/products/databases/mysql/support/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               MySQL Support | DigitalOcean Documentation

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

*   Support

[Give Feedback](https://ideas.digitalocean.com/documentation)

# MySQL Support

Generated on 6 Jan 2026

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

[](/support/how-do-i-fix-the-mysqldump-couldnt-execute-flush-tables-access-denied-error/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the mysqldump "Couldn't execute FLUSH TABLES Access denied" error?

Update backup user permissions, remove the –single-transaction flag, or downgrade mysqldump.

[](/support/why-does-mysql-shut-down-when-importing-data-with-the-source-command/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why does MySQL shut down when importing data with the source command?

Use MySQL’s import command instead of source for handling large data imports.

[](/support/how-do-i-fix-the-1227-error/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "1227" error?

Remove or replace the DEFINER in the dump file.

[](/support/how-do-i-fix-the-out-of-sort-memory-error/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Out of sort memory" error?

Adjust the sort\_buffer\_size value while assessing its impact on memory consumption and query performance.

[](/support/how-do-i-fix-an-access-denied-error-when-connecting-to-mysql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix an "Access Denied" error when connecting to MySQL?

Verify your connection string, login credentials, and user permissions.

[](/support/how-do-i-fix-the-connection-refused-error-when-connecting-to-my-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Connection Refused" error when connecting to my database?

Verify the connection string, ensure correct port usage, and add your local machine to the database cluster’s trusted sources.

[](/support/how-do-i-fix-the-connection-timed-out-error-when-connecting-to-my-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Connection Timed Out" error when connecting to my database?

Add your machine to the database cluster’s list of trusted sources in the firewall settings.

[](/support/how-do-i-fix-the-host-is-blocked-error-when-connecting-to-mysql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Host is Blocked" error when connecting to MySQL?

Check for query timeouts and ensure your network connection is stable.

[](/support/how-do-i-fix-the-invalid-parameters-and-values-error-when-connecting-to-my-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Invalid Parameters and Values" error when connecting to my database?

Verify the format and values in the connection string for typos or formatting errors.

[](/support/how-do-i-fix-the-lost-connection-error-when-issuing-a-query-on-mysql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Lost Connection" error when issuing a query on MySQL?

Check your network connection and optimize your query.

[](/support/how-do-i-fix-the-no-such-file-or-directory-error-when-connecting-to-my-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "No Such File or Directory" error when connecting to my database?

Prepend your database client command to the connection string.

[](/support/how-do-i-fix-the-unknown-database-error-when-connecting-to-mysql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Unknown Database" error when connecting to MySQL?

Ensure the hostname is correct and confirm the database exists in your specified cluster.

[](/support/how-do-i-fix-the-unknown-host-error-when-connecting-to-mysql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the "Unknown Host" error when connecting to MySQL?

Verify the hostname is correct and check for DNS resolution issues.

[](/support/how-do-i-fix-the-authentication-error-when-connecting-to-mysql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the authentication error when connecting to MySQL?

Update user settings or change the password type to resolve authentication errors in MySQL.

[](/support/how-do-i-fix-the-ssl-unknown-error-number-error-when-connecting-to-mysql/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the SSL "unknown error number" error when connecting to MySQL?

Upgrade your client to support TLSv1.2 or TLSv1.3 for secure MySQL connections.

[](/support/why-is-my-cluster-rebalancing/resizing/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why is my cluster rebalancing/resizing?

We are currently processing the cluster, most likely for maintenance. You can expect no downtime or performance issues.

In this article...

[MySQL Support](https://docs.digitalocean.com/products/databases/mysql/support/)

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
