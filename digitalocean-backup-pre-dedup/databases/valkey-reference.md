---
source: https://docs.digitalocean.com/products/databases/valkey/reference/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               Valkey Reference | DigitalOcean Documentation

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
*   Reference

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Valkey Reference

Validated on 24 Apr 2025 • Last edited on 5 Dec 2025

Valkey is a high-performance, open-source database that stores key-value data in memory, and is designed for caching, message queues, and primary database use. Fully compatible with Redis, Valkey serves as a drop-in replacement.

The [DigitalOcean API](/reference/) lets you manage resources programmatically with standard HTTP requests. All actions available in the control panel are also available through the API.

By sending requests to the API’s `/v2/databases` endpoint, you can list, create, or delete database clusters as well as scale the size of a cluster, add or remove read-only replicas, and manage other configuration details. See the [API documentation on databases](/reference/api/digitalocean/#tag/Databases) for more information.

### The DigitalOcean API[](#the-digitalocean-api)

You can use the API to [manage database clusters, database pools, replicas, and users](/reference/api/digitalocean/#tag/Databases).

### The DigitalOcean Command Line Client, doctl[](#the-digitalocean-command-line-client-doctl)

[`doctl`](https://github.com/digitalocean/doctl) is the command-line interface for the DigitalOcean API. It supports most of the same actions available in the API and DigitalOcean Control Panel.

[`doctl`](https://github.com/digitalocean/doctl) supports managing database clusters, database pools, replicas, and users, and more from the command line. See the [`doctl` documentation](/reference/doctl/reference/registry/) or use `doctl databases --help` for more information.

### The DigitalOcean MCP Server[](#the-digitalocean-mcp-server)

The [DigitalOcean Model Context Protocol (MCP) server](/reference/mcp/) lets you use natural language prompts to interact with DigitalOcean Managed Databases to create, resize, configure, migrate, and inspect clusters across all supported engines. All operations use argument-based input, and no resource URIs are used. The tools also support pagination, configuration management, firewall updates, user management, topic operations for Kafka, and other engine-specific settings where applicable.

## Official Valkey Documentation[](#official-valkey-documentation)

*   [Valkey documentation](https://valkey.io/docs/)
    
*   The [Redis command reference](https://redis.io/commands)
    
*   [Redis’s list of clients](https://redis.io/clients), including their official recommendations
    
*   [Redis use cases](https://redislabs.com/redis-enterprise/use-cases/)
    
*   [Redli’s GitHub repository](https://github.com/IBM-Cloud/redli)
    

In this article...

*   *   [The DigitalOcean API](#the-digitalocean-api)
    *   [The DigitalOcean Command Line Client, doctl](#the-digitalocean-command-line-client-doctl)
    *   [The DigitalOcean MCP Server](#the-digitalocean-mcp-server)
*   [Official Valkey Documentation](#official-valkey-documentation)

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
