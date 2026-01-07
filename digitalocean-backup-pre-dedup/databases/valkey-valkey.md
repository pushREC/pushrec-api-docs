---
source: https://docs.digitalocean.com/products/databases/valkey/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
alkey | DigitalOcean Documentation

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

*   Valkey

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Valkey

Generated on 6 Jan 2026

Valkey is a high-performance, open-source database that stores key-value data in memory, and is designed for caching, message queues, and primary database use. Fully compatible with Redis, Valkey serves as a drop-in replacement.

Most Viewed Valkey Articles

1.  [How to Connect to Valkey Database Clusters](/products/databases/valkey/how-to/connect/ "Connect to Valkey database clusters from the command line or other applications.")
2.  [How to Schedule Automatic Software Updates for Valkey Database Clusters](/products/databases/valkey/how-to/schedule-updates/ "Customize the maintenance window for automatic software updates to your database cluster.")
3.  [Valkey Limits](/products/databases/valkey/details/limits/ "Limits and known issues for Valkey.")
4.  [Valkey Pricing](/products/databases/valkey/details/pricing/ "Pricing for Valkey database cluster plans, both single node and high availability.")
5.  [How to Monitor Valkey Database Performance](/products/databases/valkey/how-to/monitor-databases/ "Access and interpret Valkey database performance metrics.")
6.  [How to Create Valkey Clusters](/products/databases/valkey/how-to/create/ "Create a Valkey database cluster from the DigitalOcean Control Panel.")
7.  [Valkey Concepts](/products/databases/valkey/concepts/ "Explanations and definitions of core concepts in Valkey.")
8.  [How to Choose Eviction Policies on Valkey Database Clusters](/products/databases/valkey/how-to/choose-eviction-policies/ "Choose and set eviction policies for your Valkey database clusters")
9.  [Best Practices](/products/databases/valkey/concepts/best-practices/ "Recommended practices to implement when setting up and running your MySQL clusters.")
10.  [Shared Responsibility Model](/products/databases/valkey/concepts/responsibility-model/ "Description of DigitalOcean's responsibilities as a managed database provider.")

[](/products/databases/valkey/getting-started/)

![](https://docs.digitalocean.com/images/icons/valkey.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/databases/valkey/how-to/)

![](https://docs.digitalocean.com/images/icons/valkey.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/databases/valkey/reference/)

![](https://docs.digitalocean.com/images/icons/valkey.svg)

Reference

Native and third-party tools, troubleshooting, and answers to frequently asked questions.

[](/products/databases/valkey/concepts/)

![](https://docs.digitalocean.com/images/icons/valkey.svg)

Concepts

Explanations and definitions of core concepts in Valkey.

[](/products/databases/valkey/details/)

![](https://docs.digitalocean.com/images/icons/valkey.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

## Latest Updates[](#latest-updates)

### Upcoming Changes[](#upcoming-changes)

*   [DigitalOcean Managed Caching](/products/databases/redis/) is being discontinued on 30 June 2025.
    
    To replace Managed Caching, we are offering [Managed Valkey](/products/databases/valkey/), a Redis-compatible alternative with RDMA and higher throughput. All existing Managed Caching clusters automatically convert to Valkey clusters by 30 June 2025 during your [upgrade window](/products/databases/redis/how-to/schedule-updates/), retaining all data.
    

### 7 May 2025[](#7-may-2025)

*   You can now [manually convert your Caching cluster to a Valkey cluster](/products/databases/valkey/getting-started/convert/). All Caching clusters automatically convert to Valkey clusters by the [Managed Caching discontinuation date](/release-notes/caching/).
    

For more information, see [all Valkey release notes](https://docs.digitalocean.com/release-notes/valkey/).

In this article...

[Valkey](https://docs.digitalocean.com/products/databases/valkey/)

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

Try using different keywords or simplifying your search terms