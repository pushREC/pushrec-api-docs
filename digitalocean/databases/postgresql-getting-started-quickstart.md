---
source: https://docs.digitalocean.com/products/databases/postgresql/getting-started/quickstart/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                PostgreSQL Quickstart | DigitalOcean Documentation

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

*   [Getting Started](/products/databases/postgresql/getting-started/) 
*   Quickstart

[Give Feedback](https://ideas.digitalocean.com/documentation)

# PostgreSQL Quickstart

Validated on 30 Jul 2019 • Last edited on 27 Sep 2023

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

## Create PostgreSQL Database Clusters[](#create-postgresql-database-clusters)

1.  From the **Create** menu in the top right of the [control panel](https://cloud.digitalocean.com/databases), click **Databases**.
2.  Select PostgreSQL as the database engine.
3.  Choose the cluster configuration and datacenter, and give the cluster a unique name.
    
    Tip
    
    For the best performance, create your database cluster in the same region as your Droplets.
    
4.  Click **Create a Database Cluster**.

## Change Size or Number of Cluster Nodes[](#change-size-or-number-of-cluster-nodes)

1.  Select your database cluster from the [**Databases** page](https://cloud.digitalocean.com/databases).
2.  Click the **Settings** tab.
3.  Click **Edit** in the **Cluster configuration** section.
4.  Select the node size and number of optional standby nodes.
5.  Click **Save**.

## Relocate Database Clusters[](#relocate-database-clusters)

1.  Select your database cluster from the [**Databases** page](https://cloud.digitalocean.com/databases).
2.  Click the **Settings** tab.
3.  Click **Edit** in the **Cluster datacenter** section.
4.  Select the region and datacenter to which you want to relocate your cluster.
5.  Click **Save**.

## Add Additional Users or Databases[](#add-additional-users-or-databases)

1.  Select your database cluster from the [**Databases** page](https://cloud.digitalocean.com/databases).
2.  Click the **Users & Databases** tab.
3.  Enter users or database names in the corresponding field.
4.  Click **Save**.

Use a client application or command-line tool to manage specific user permissions.

## Create Connection Pools[](#create-connection-pools)

1.  Select your database cluster from the [**Databases** page](https://cloud.digitalocean.com/databases).
2.  Click the **Connection Pools** tab.
3.  Click **Create a Connection Pool**.
4.  Enter your pool name, the logical database to which the pool will connect, the user it will connect with, the pooling mode, and the pool size.
5.  Click **Create Pool**.

## Delete Database Clusters[](#delete-database-clusters)

1.  Select your database cluster from the [**Databases** page](https://cloud.digitalocean.com/databases).
2.  Click the **Settings** tab.
3.  Click **Destroy** in the **Destroy this database cluster** section.
4.  Enter the name of the database cluster.
5.  Click **Destroy**.

In this article...

*   [Create PostgreSQL Database Clusters](#create-postgresql-database-clusters)
*   [Change Size or Number of Cluster Nodes](#change-size-or-number-of-cluster-nodes)
*   [Relocate Database Clusters](#relocate-database-clusters)
*   [Add Additional Users or Databases](#add-additional-users-or-databases)
*   [Create Connection Pools](#create-connection-pools)
*   [Delete Database Clusters](#delete-database-clusters)

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

Try using different keywords or simplifying your search ter
