---
source: https://docs.digitalocean.com/products/databases/postgresql/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               PostgreSQL | DigitalOcean Documentation

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

*   PostgreSQL

[Give Feedback](https://ideas.digitalocean.com/documentation)

# PostgreSQL

Generated on 6 Jan 2026

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

Most Viewed PostgreSQL Articles

1.  [How do I fix a "permission denied for schema public" error in PostgreSQL?](/support/how-do-i-fix-a-permission-denied-for-schema-public-error-in-postgresql/ "Update the user's privileges to `CREATE`, `USAGE`, or `ALL` on the public schema.")
2.  [How do I fix the "Connection Timed Out" error when connecting to my database?](/support/how-do-i-fix-the-connection-timed-out-error-when-connecting-to-my-database/ "Add your machine to the database cluster's list of trusted sources in the firewall settings.")
3.  [How to Manage Connection Pools for PostgreSQL Database Clusters](/products/databases/postgresql/how-to/manage-connection-pools/ "Use connection pools to improve PostgreSQL database performance.")
4.  [How to Connect to PostgreSQL Database Clusters](/products/databases/postgresql/how-to/connect/ "Connect to PostgreSQL database clusters from the command line or other applications.")
5.  [Supported PostgreSQL Extensions](/products/databases/postgresql/details/supported-extensions/ "A list of the PostgreSQL extensions supported by DigitalOcean PostgreSQL managed databases and how to manage them.")
6.  [How do I fix the "Connection Refused" error when connecting to my database?](/support/how-do-i-fix-the-connection-refused-error-when-connecting-to-my-database/ "Verify the connection string, ensure correct port usage, and add your local machine to the database cluster's trusted sources.")
7.  [PostgreSQL Pricing](/products/databases/postgresql/details/pricing/ "Pricing for PostgreSQL database clusters.")
8.  [How to Manage PostgreSQL Users and Databases in a Database Cluster](/products/databases/postgresql/how-to/manage-users-and-databases/ "Create and delete a database cluster's databases and database users from the DigitalOcean Control Panel.")
9.  [How to Upgrade PostgreSQL to a New Version](/products/databases/postgresql/how-to/upgrade-version/ "Upgrade your PostgreSQL cluster to the latest supported version of PostgreSQL from the control panel.")
10.  [How to Secure PostgreSQL Managed Database Clusters](/products/databases/postgresql/how-to/secure/ "Add additional security to a PostgreSQL managed database cluster by restricting incoming connections and increasing the SSL mode verification level.")

[](/products/databases/postgresql/getting-started/)

![](https://docs.digitalocean.com/images/icons/postgresql.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/databases/postgresql/how-to/)

![](https://docs.digitalocean.com/images/icons/postgresql.svg)

How-Tos

How to modify users and databases, improve performance and high availability, migrate data, and more.

[](/products/databases/postgresql/reference/)

![](https://docs.digitalocean.com/images/icons/postgresql.svg)

Reference

Native and third-party tools, troubleshooting, and answers to frequently asked questions.

[](/products/databases/postgresql/concepts/)

![](https://docs.digitalocean.com/images/icons/postgresql.svg)

Concepts

Explanations and definitions of core concepts in PostgreSQL.

[](/products/databases/postgresql/details/)

![](https://docs.digitalocean.com/images/icons/postgresql.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

[](/products/databases/postgresql/support/)

![](https://docs.digitalocean.com/images/icons/postgresql.svg)

Support

Get help with technical support and answers to frequently asked questions.

## Latest Updates[](#latest-updates)

### 5 November 2025[](#5-november-2025)

*   PostgreSQL 18 is [now available for database clusters](/products/databases/postgresql/how-to/create/). You can [upgrade earlier versions of PostgreSQL clusters to newer versions](/products/databases/postgresql/how-to/upgrade-version/) without any downtime using the [DigitalOcean Control Panel](https://cloud.digitalocean.com/databases).
    

### 17 September 2025[](#17-september-2025)

*   Now in public preview, you can now enable storage autoscaling on all Managed Database engines. To enable autoscaling, see our resizing guides for [MySQL](/products/databases/mysql/how-to/resize/), [PostgreSQL](/products/databases/postgresql/how-to/resize/), [MongoDB](/products/databases/mongodb/how-to/resize/), [OpenSearch](/products/databases/opensearch/how-to/resize/), and [Kafka](/products/databases/kafka/how-to/resize/).
    
*   Storage autoscaling is now in general availability. Additionally, you can now reduce your cluster’s amount of additional storage, as long as the new storage size is greater than or equal to the latest backup’s size plus any data growth since then and a 25% buffer.
    

### 1 July 2025[](#1-july-2025)

*   The DOKS database operator, which facilitated integration of DOKS clusters with managed databases, is deprecated. Your existing databases remain operational and the [operator-related CRDs](https://github.com/digitalocean/do-operator/tree/main/docs/databases) are not removed. You can use the DigitalOcean API, CLI, or control panel to manage the databases created with the operator.
    

For more information, see [all PostgreSQL release notes](https://docs.digitalocean.com/release-notes/postgresql/).

In this article...

[PostgreSQL](https://docs.digitalocean.com/products/databases/postgresql/)

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

Try using different keywords or simplifying your search t
