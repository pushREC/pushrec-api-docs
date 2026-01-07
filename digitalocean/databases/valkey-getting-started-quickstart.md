---
source: https://docs.digitalocean.com/products/databases/valkey/getting-started/quickstart/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                Valkey Quickstart | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/valkey.f170106c44632502ecb41bfb74b6d22d99f94ad223afccd11be669fedac30b18.svg)Valkey](/products/databases/valkey/)
    *   [Getting Started](/products/databases/valkey/getting-started/)
        *   [Quickstart](/products/databases/valkey/getting-started/quickstart/)
        *   [Convert Caching to Valkey](/products/databases/valkey/getting-started/convert/)
    *   [How-Tos](/products/databases/valkey/how-to/)
        *   [Connect to Valkey Clusters](/products/databases/valkey/how-to/connect/)
        *   [Secure Valkey Clusters](/products/databases/valkey/how-to/secure/)
        *   [Migrate Valkey Databases](/products/databases/valkey/how-to/migrate/)
        *   [Schedule Automatic Updates](/products/databases/valkey/how-to/schedule-updates/)
        *   [Choose Eviction Policies](/products/databases/valkey/how-to/choose-eviction-policies/)
        *   [Tag Database Clusters](/products/databases/valkey/how-to/tag/)
        *   [Monitor Cluster Performance](/products/databases/valkey/how-to/monitor-clusters/)
        *   [Add Standby Nodes](/products/databases/valkey/how-to/add-standby-nodes/)
        *   [Set Up Monitoring Alerts](/products/databases/valkey/how-to/set-up-alerts/)
        *   [Relocate Database Clusters](/products/databases/valkey/how-to/relocate/)
        *   [Resize Database Clusters](/products/databases/valkey/how-to/resize/)
        *   [Destroy Database Clusters](/products/databases/valkey/how-to/destroy/)
        *   [Monitor Valkey Performance](/products/databases/valkey/how-to/monitor-databases/)
        *   [Forward Logs](/products/databases/valkey/how-to/forward-logs/)
        *   [Reconfigure Database Clusters](/products/databases/valkey/how-to/reconfigure/)
        *   [Create Valkey Clusters](/products/databases/valkey/how-to/create/)
    *   [Reference](/products/databases/valkey/reference/)
        *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
        *   [CLI Reference](/reference/doctl/reference/databases/)
        *   [MCP Reference](/reference/mcp/)
    *   [Concepts](/products/databases/valkey/concepts/)
        *   [Best Practices](/products/databases/valkey/concepts/best-practices/)
        *   [Migration Strategies](/products/databases/valkey/concepts/migration-strategies/)
        *   [Shared Responsibility Model](/products/databases/valkey/concepts/responsibility-model/)
    *   [Details](/products/databases/valkey/details/)
        *   [Features](/products/databases/valkey/details/features/)
        *   [Pricing](/products/databases/valkey/details/pricing/)
        *   [Availability](/products/databases/valkey/details/availability/)
        *   [Limits](/products/databases/valkey/details/limits/)
        *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)

*   [Valkey](/products/databases/valkey/) 
*   [Getting Started](/products/databases/valkey/getting-started/) 
*   Quickstart

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Valkey Quickstart

Validated on 24 Apr 2025 • Last edited on 24 Apr 2025

Valkey is a high-performance, open-source database that stores key-value data in memory, and is designed for caching, message queues, and primary database use. Fully compatible with Redis, Valkey serves as a drop-in replacement.

## Create Valkey Database Clusters[](#create-valkey-database-clusters)

1.  From the **Create** menu in the top right of the [control panel](https://cloud.digitalocean.com/databases), click **Databases**.
2.  Select Valkey as the database engine.
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

## Edit the Eviction Policy[](#edit-the-eviction-policy)

1.  Select your database cluster from the [**Databases** page](https://cloud.digitalocean.com/databases).
2.  Click the **Settings** tab.
3.  Click **Edit** in the **Eviction Policy** section.
4.  Select the eviction policy you wish to use for this cluster.
5.  Click **Save**.

## Delete Database Clusters[](#delete-database-clusters)

1.  Select your database cluster from the [**Databases** page](https://cloud.digitalocean.com/databases).
2.  Click the **Settings** tab.
3.  Click **Destroy** in the **Destroy this database cluster** section.
4.  Enter the name of the database cluster.
5.  Click **Destroy**.

In this article...

*   [Create Valkey Database Clusters](#create-valkey-database-clusters)
*   [Change Size or Number of Cluster Nodes](#change-size-or-number-of-cluster-nodes)
*   [Relocate Database Clusters](#relocate-database-clusters)
*   [Edit the Eviction Policy](#edit-the-eviction-policy)
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
