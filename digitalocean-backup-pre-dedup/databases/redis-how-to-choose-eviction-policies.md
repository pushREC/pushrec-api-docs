---
source: https://docs.digitalocean.com/products/databases/redis/how-to/choose-eviction-policies/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Choose Eviction Policies on Caching Database Clusters | DigitalOcean Documentation

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

*   [How-Tos](/products/databases/redis/how-to/) 
*   Choose Eviction Policies

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Choose Eviction Policies on Caching Database Clusters

Validated on 24 Sep 2019 • Last edited on 16 Apr 2025

Managed Caching is a database engine that supports Redis, an open source, key-value database built with an in-memory design that emphasizes speed. It supports rich data types, atomic operations, and Lua scripting.

Caching stores its data, called keys, in memory only and uses eviction policies to free memory to write new data. Eviction policies fall into two main categories: general policies that apply to all keys and policies that use a Time to Live (TTL) expiration value. General policies consume less memory but require more CPU processing when Caching samples to choose which key to evict. TTL policies require you to set the TTL from your application. The extra TTL data consumes a bit more memory but TTL policies require less CPU processing when Caching is determining which keys to evict.

Tip

You can use the control panel to reconfigure eviction policies while your application runs and use the `INFO` command to reveal cache hits/misses to fine tune Caching.

## General Eviction Policies[](#general-eviction-policies)

General policies apply to any keys that do not have expiration set.

### `noeviction`[](#noeviction)

`noeviction` Don’t evict any data, returns error when memory limit is reached. _Default_

With the `noeviction` policy set, Caching may stop responding if it runs out of memory but no data is ever evicted. This policy is generally appropriate only when your application removes keys itself. This is the Caching default setting and poses the least chance of data loss.

### `allkeys-lru`[](#allkeys-lru)

`allkeys-lru` Evict any key, least recently used (LRU) first. **Recommended**.

`allkeys-lru` helps keep Caching from becoming unresponsive due to insufficient memory and operates on the assumption that you no longer need the least recently used keys. When Caching begins to run out of memory, it samples a small set of keys using an algorithm, then evicts the least recently used key from that set. Because of the sampling algorithm, the key may not be the least recently used of all keys in memory.

### `allkeys-lfu`[](#allkeys-lfu)

`allkeys-lfu` Evict any key, least frequently used (LFU) first.

`allkeys-lfu` helps keep Caching from becoming unresponsive due to insufficient memory and operates on the assumption that you no longer need the least frequently used keys. When Caching begins to run out of memory, it samples a small set of keys using an algorithm, then evicts the least frequently used key from that set. Because of the sampling algorithm, the key may not be the least frequently used of all keys in memory.

### `allkeys-random`[](#allkeys-random)

`allkeys-random` Evict keys in a random order.

`allkeys-random` randomly evicts keys. It is appropriate for cases where your application continuously scans keys or no key is more important than any other key.

## Eviction Policies Dependent on Expiration[](#eviction-policies-dependent-on-expiration)

These policies require that some keys have an expiration set.

### `volatile-lru`[](#volatile-lru)

`volatile-lru` Evict keys with expiration only, least recently used (LRU) first.

This policy is similar to `allkeys-lru`. Caching evicts keys least recently used first, but only samples keys that are expired. This policy operates on the assumption that expired keys that are also least recently used are no longer required by your application.

### `volatile-lfu`[](#volatile-lfu)

`volatile-lfu` Evict keys with expiration only, least frequently used (LFU) first.

Caching evicts keys least frequently used first, but only samples keys that are expired. This policy operates on the assumption that expired keys that are also least frequently used are no longer required by your application.

### `volatile-random`[](#volatile-random)

`volatile-random` Evict keys with expiration only in a random order.

Similar to the `allkeys-random` policy, with this policy Caching evicts random keys but only those that have expired.

### `volatile-ttl`[](#volatile-ttl)

`volatile-ttl` Evict keys with expiration only, shortest time-to-live (TTL) first.

The `volatile-ttl` policy frees memory by evicting expired keys, regardless of when the key was last used. This policy allows you to tell Caching which keys are most important by explicitly setting an expiration value.

Learn more about Caching eviction policies in the official Redis documentation, [Using Redis as an LRU cache](https://redis.io/topics/lru-cache)

In this article...

*   [General Eviction Policies](#general-eviction-policies)
    *   [`noeviction`](#noeviction)
    *   [`allkeys-lru`](#allkeys-lru)
    *   [`allkeys-lfu`](#allkeys-lfu)
    *   [`allkeys-random`](#allkeys-random)
*   [Eviction Policies Dependent on Expiration](#eviction-policies-dependent-on-expiration)
    *   [`volatile-lru`](#volatile-lru)
    *   [`volatile-lfu`](#volatile-lfu)
    *   [`volatile-random`](#volatile-random)
    *   [`volatile-ttl`](#volatile-ttl)

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
