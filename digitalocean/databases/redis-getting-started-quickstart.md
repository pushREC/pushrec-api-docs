---
source: https://docs.digitalocean.com/products/databases/redis/getting-started/quickstart/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               Caching Quickstart | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/redis.213385ebd06d3cd436657564821380f108a92109b568f05c3313d87fc0bc0c96.svg)Caching](/products/databases/redis/)
*   [Getting Started](/products/databases/redis/getting-started/)
    *   [Quickstart](/products/databases/redis/getting-started/quickstart/)
*   [How-Tos](/products/databases/redis/how-to/)
    *   [Create Caching Clusters](/products/databases/redis/how-to/create/)
    *   [Connect to Caching Clusters](/products/databases/redis/how-to/connect/)
    *   [Secure Caching Clusters](/products/databases/redis/how-to/secure/)
    *   [Migrate Caching Databases](/products/databases/redis/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/redis/how-to/schedule-updates/)
    *   [Choose Eviction Policies](/products/databases/redis/how-to/choose-eviction-policies/)
    *   [Tag Database Clusters](/products/databases/redis/how-to/tag/)
    *   [Monitor Cluster Performance](/products/databases/redis/how-to/monitor-clusters/)
    *   [Add Standby Nodes](/products/databases/redis/how-to/add-standby-nodes/)
    *   [Set Up Monitoring Alerts](/products/databases/redis/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/redis/how-to/relocate/)
    *   [Resize Database Clusters](/products/databases/redis/how-to/resize/)
    *   [Destroy Database Clusters](/products/databases/redis/how-to/destroy/)
    *   [Monitor Caching Performance](/products/databases/redis/how-to/monitor-databases/)
    *   [Forward Logs](/products/databases/redis/how-to/forward-logs/)
    *   [Reconfigure Database Clusters](/products/databases/redis/how-to/reconfigure/)
*   [Reference](/products/databases/redis/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/redis/concepts/)
    *   [Best Practices](/products/databases/redis/concepts/best-practices/)
    *   [Migration Strategies](/products/databases/redis/concepts/migration-strategies/)
    *   [Shared Responsibility Model](/products/databases/redis/concepts/responsibility-model/)
*   [Details](/products/databases/redis/details/)
    *   [Features](/products/databases/redis/details/features/)
    *   [Pricing](/products/databases/redis/details/pricing/)
    *   [Availability](/products/databases/redis/details/availability/)
    *   [Limits](/products/databases/redis/details/limits/)
    *   [Cluster Notifications](/products/databases/redis/details/notifications/)
    *   [Memory Usage](/products/databases/redis/details/memory-usage/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/redis/support/)

*   [Getting Started](/products/databases/redis/getting-started/) 
*   Quickstart

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Caching Quickstart

Validated on 20 Aug 2019 • Last edited on 27 Aug 2024

Managed Caching is a database engine that supports Redis, an open source, key-value database built with an in-memory design that emphasizes speed. It supports rich data types, atomic operations, and Lua scripting.

## Create Caching Database Clusters[](#create-caching-database-clusters)

1.  From the **Create** menu in the top right of the [control panel](https://cloud.digitalocean.com/databases), click **Databases**.
2.  Select Caching as the database engine.
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

*   [Create Caching Database Clusters](#create-caching-database-clusters)
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
