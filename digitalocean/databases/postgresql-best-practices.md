---
source: https://docs.digitalocean.com/products/databases/postgresql/concepts/best-practices/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

Best Practices | DigitalOcean Documentation

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
*   Best Practices

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Best Practices

Validated on 13 Jul 2022 • Last edited on 17 Jun 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

## Use VPCs[](#use-vpcs)

We recommend you make full use of your DigitalOcean VPC networks to improve security, facilitate connection management, and mitigate trusted source limits. To do this, add the CIDR address of a database’s VPC network to its trusted sources. This functionally adds all other resources you have in the same VPC network to the database’s trusted sources using only one address towards the limit, as long as they connect via the private connection string, instead of the public one. The CIDR address also only counts as one trusted source IP against the 100-IP limit.

First, go to the [control panel](https://cloud.digitalocean.com/databases) and click your database. In its **Overview** tab, find the **VPC Network** section, which details the VPC’s name (such as `default-nyc3`) and its address (such as `10.108.0.0/20`). Copy the VPC’s address with its netmask to your clipboard. For example, copy `10.108.0.0/20`.

![Copy the VPC address.](https://docs.digitalocean.com/screenshots/databases/vpc-address.dcbc3e7ffb345b1b100e0a9c148278aab48799568a87d592fa1b3c1b3001d319.png)

Then, click the **Settings** tab. Find the **Trusted Sources** section and click **Edit** to the right of it. Paste the VPC’s address without the netmask and press Enter. Click **Save** to confirm your change.

![Add a trusted source.](https://docs.digitalocean.com/screenshots/databases/trusted-sources.d160aa387bd895e79d0b13cfc701007609f7df56fa3f973f3727e317616a71d9.png)

Warning

You currently cannot add IPv6 rules to a database cluster’s trusted sources.

Now, all other resources in that same VPC network can connect to the database by using the private connection string, instead of the public one. You can find the private connection string in the database’s **Overview** tab. Under **Connection Details** select **VPC Network**, then click the drop-down menu reading **Connection Parameters** and select **Connection String**.

![View the private connection string.](https://docs.digitalocean.com/screenshots/databases/private-connection-string.d1ffed0237b69c0a8aaaa3bf009edb03b65ec31132d353a1a399084efc959c77.png)

For improved security, we recommend you use this private connection string whenever possible and minimize the number of public connections to the database.

To establish secure, centralized connections between resources in different VPCs or platforms, you can use a proxy server, for example [PgBouncer](https://www.pgbouncer.org/) or [HAProxy](http://www.haproxy.org/).

## Terminate Ongoing Queries[](#terminate-ongoing-queries)

Having too many concurrent queries can cause performance issues in your cluster. In order to cancel all ongoing PostgreSQL queries programmatically, [connect to your cluster](/products/databases/postgresql/how-to/connect/), query for idle connections, and call the following `psql` function:

    pg_terminate_backend(pid);

For more details, see the [official PostgreSQL documentation](https://www.postgresql.org/docs/current/functions-admin.html).

## Add Standby Nodes[](#add-standby-nodes)

Standby nodes maintain a copy of a database cluster’s primary node. If the primary node fails, a standby node is automatically promoted to replace it. Additionally, standby nodes can direct routing for read traffic.

To add standby nodes, see [How to Add Standby Nodes](/products/databases/postgresql/how-to/add-standby-nodes/).

In this article...

*   [Use VPCs](#use-vpcs)
*   [Terminate Ongoing Queries](#terminate-ongoing-queries)
*   [Add Standby Nodes](#add-standby-nodes)

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