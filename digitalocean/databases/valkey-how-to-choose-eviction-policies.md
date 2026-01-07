---
source: https://docs.digitalocean.com/products/databases/valkey/how-to/choose-eviction-policies/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                How to Choose Eviction Policies on Valkey Database Clusters | DigitalOcean Documentation

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
*   [How-Tos](/products/databases/valkey/how-to/) 
*   Choose Eviction Policies

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Choose Eviction Policies on Valkey Database Clusters

Validated on 24 Apr 2025 • Last edited on 24 Apr 2025

Valkey is a high-performance, open-source database that stores key-value data in memory, and is designed for caching, message queues, and primary database use. Fully compatible with Redis, Valkey serves as a drop-in replacement.

Valkey stores its data, called keys, in memory only and uses eviction policies to free memory to write new data. Eviction policies fall into two main categories: general policies that apply to all keys and policies that use a Time to Live (TTL) expiration value. General policies consume less memory but require more CPU processing when Valkey samples to choose which key to evict. TTL policies require you to set the TTL from your application. The extra TTL data consumes a bit more memory but TTL policies require less CPU processing when Valkey is determining which keys to evict.

Tip

You can use the control panel to reconfigure eviction policies while your application runs and use the `INFO` command to reveal cache hits/misses to fine tune Valkey.

## General Eviction Policies[](#general-eviction-policies)

General policies apply to any keys that do not have expiration set.

### `noeviction`[](#noeviction)

`noeviction` Don’t evict any data, returns error when memory limit is reached. _Default_

With the `noeviction` policy set, Valkey may stop responding if it runs out of memory but no data is ever evicted. This policy is generally appropriate only when your application removes keys itself. This is the Valkey default setting and poses the least chance of data loss.

### `allkeys-lru`[](#allkeys-lru)

`allkeys-lru` Evict any key, least recently used (LRU) first. **Recommended**.

`allkeys-lru` helps keep Valkey from becoming unresponsive due to insufficient memory and operates on the assumption that you no longer need the least recently used keys. When Valkey begins to run out of memory, it samples a small set of keys using an algorithm, then evicts the least recently used key from that set. Because of the sampling algorithm, the key may not be the least recently used of all keys in memory.

### `allkeys-lfu`[](#allkeys-lfu)

`allkeys-lfu` Evict any key, least frequently used (LFU) first.

`allkeys-lfu` helps keep Valkey from becoming unresponsive due to insufficient memory and operates on the assumption that you no longer need the least frequently used keys. When Valkey begins to run out of memory, it samples a small set of keys using an algorithm, then evicts the least frequently used key from that set. Because of the sampling algorithm, the key may not be the least frequently used of all keys in memory.

### `allkeys-random`[](#allkeys-random)

`allkeys-random` Evict keys in a random order.

`allkeys-random` randomly evicts keys. It is appropriate for cases where your application continuously scans keys or no key is more important than any other key.

## Eviction Policies Dependent on Expiration[](#eviction-policies-dependent-on-expiration)

These policies require that some keys have an expiration set.

### `volatile-lru`[](#volatile-lru)

`volatile-lru` Evict keys with expiration only, least recently used (LRU) first.

This policy is similar to `allkeys-lru`. Valkey evicts keys least recently used first, but only samples keys that are expired. This policy operates on the assumption that expired keys that are also least recently used are no longer required by your application.

### `volatile-lfu`[](#volatile-lfu)

`volatile-lfu` Evict keys with expiration only, least frequently used (LFU) first.

Valkey evicts keys least frequently used first, but only samples keys that are expired. This policy operates on the assumption that expired keys that are also least frequently used are no longer required by your application.

### `volatile-random`[](#volatile-random)

`volatile-random` Evict keys with expiration only in a random order.

Similar to the `allkeys-random` policy, with this policy Valkey evicts random keys but only those that have expired.

### `volatile-ttl`[](#volatile-ttl)

`volatile-ttl` Evict keys with expiration only, shortest time-to-live (TTL) first.

The `volatile-ttl` policy frees memory by evicting expired keys, regardless of when the key was last used. This policy allows you to tell Valkey which keys are most important by explicitly setting an expiration value.

Learn more about Valkey eviction policies in the official Redis documentation, [Using Redis as an LRU cache](https://redis.io/topics/lru-cache).

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
