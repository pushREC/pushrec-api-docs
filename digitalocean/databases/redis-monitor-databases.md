---
source: https://docs.digitalocean.com/products/databases/redis/how-to/monitor-databases/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Monitor Caching Database Performance | DigitalOcean Documentation

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
*   Monitor Caching Performance

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Monitor Caching Database Performance

Validated on 8 Apr 2024 • Last edited on 17 Jun 2025

Managed Caching is a database engine that supports Redis, an open source, key-value database built with an in-memory design that emphasizes speed. It supports rich data types, atomic operations, and Lua scripting.

DigitalOcean Managed Databases include metrics visualizations so you can monitor performance and health of your database cluster.

*   **Cluster metrics** monitor the performance of the nodes in a database cluster. Cluster metrics cover primary and standby nodes; metrics for each read-only node are displayed independently. This data can help guide capacity planning and optimization. You can also set up alerting on cluster metrics.
    
*   **Database metrics** monitor the performance of the database itself. This data can help assess the health of the database, pinpoint performance bottlenecks, and identify unusual use patterns that may indicate an application bug or security breach.
    

For more information on cluster metrics, see our [how-to on monitoring cluster performance](/products/databases/redis/how-to/monitor-clusters/).

## View Caching Metrics[](#view-caching-metrics)

To view performance metrics for a Caching database cluster, click the name of the database to go to its **Overview** page, then click the **Insights** tab.

![The Insights tab of a Managed Database cluster](https://docs.digitalocean.com/screenshots/databases/redis-insights-tab.c7ed20a188155485ea164c155c5611eef1032fa7eb3f1dece77644de46313983.png)

The **Select object** drop-down menu lists the cluster itself and all of the databases in the cluster. Choose the database to view its metrics.

In the **Select Period** drop-down menu, you can choose a time frame for the x-axis of the graphs, ranging from 1 hour to 30 days. Each line in the graphs displays about 300 data points.

By default, the summary to the right shows the most recent metrics values. When you hover over a different time in a graph, the summary displays the values from that time instead.

Note

You may notice gaps in your metrics data from outages, platform maintenance, or a database failover or migration. You can check [DigitalOcean’s status page](https://status.digitalocean.com) for outages, review the cluster maintenance window, visit the cluster’s **Settings** > **Logs** (or **Logs & Queries**) page to look for failovers and migrations.

If you recently provisioned the cluster or changed its configuration, it may take a few minutes for the metrics data to finish processing before you see it on the **Insights** page.

## Caching Metrics Details[](#caching-metrics-details)

Caching databases have the following metrics:

*   **Connection Status**: the number of successful and rejected client connections
    
*   **Connected Clients**: the number of connected clients
    
*   **Throughput**: the rate of commands processed per second
    
*   **Key Evictions**: the number of keys removed by Caching due to memory constraints
    
*   **Memory Fragmentation**: the ratio of the memory allocated by the operating system to Caching to the memory used by Caching
    
*   **Cache Hit Ratio**: the ratio of keyspace hits to the number of keyspace hits and misses, which is a measure of cache usage efficiency
    
*   **Replication Status**: the number of connected standby nodes
    

Warning

If you have 200 or more databases on a single cluster, you may be unable to retrieve their metrics. If you reach this limit, create any additional databases in a new cluster.

### Connection Status[](#connection-status)

The connection status plot displays the rate of new connections being received and rejected per second.

![Redis connection status plot](https://docs.digitalocean.com/screenshots/databases/metrics/redis/connection-status.f0febd955d08b5afc1e2ddf43cfaf4e51a4ee92ab8f8b652dce60f10b81b881d.png)

If the number of connected threads regularly approaches or exceeds the connection limit, or if you often see an unacceptable number of rejected connections, consider upgrading your database plan to increase your connection limit.

### Connected Clients[](#connected-clients)

The connected clients plot displays the number of clients currently connected to your cluster.

![Redis connected clients plot](https://docs.digitalocean.com/screenshots/databases/metrics/redis/connected-clients.6af00854a014c78b9d4d5f3a3bafb3476e49fd4a410972f4e9226b6e00b7cc00.png)

### Throughput[](#throughput)

The throughput plot displays the overall rate of all Redis operations on the main server, expressed as a moving average of operations per second.

![Redis operations throughput plot](https://docs.digitalocean.com/screenshots/databases/metrics/redis/throughput.8b2db867b71b5fc3029e9a95101ab0d60aef9a813e9b0baa5fcd0aa661d520aa.png)

You can compare this plot with node performance metrics to identify potential resource constraints. For more insights, look at the query statistics on the **Logs & Queries** page.

### Key Evictions[](#key-evictions)

By default, the Caching key eviction policy is set to `noeviction`. If you [set the eviction policy](https://docs.redis.com/latest/rs/databases/memory-performance/eviction-policy/) (on the **Settings** page) to something other than `noeviction`, Caching evicts keys when it is constrained for memory. The key evictions plot displays the number of evicted keys.

![Redis key evictions plot](https://docs.digitalocean.com/screenshots/databases/metrics/redis/key-evictions.0d3d6df013b3faf13c0a1a0162ed10aafd1e3f8d049641c32b9420d6422f41dc.png)

This metric is useful when using Caching as a cache or assessing the impact of key evictions on overall key retrieval efficiency. Consider increasing the memory of your Caching cluster if the number of key evictions is consistently significantly greater than zero.

Learn more about key eviction policies and tuning in [Using Redis as an LRU cache](https://redis.io/topics/lru-cache) in the Redis documentation.

### Memory Fragmentation[](#memory-fragmentation)

The memory fragmentation plot displays the efficiency of memory mapping, which is defined as the ratio of memory usage measured by the operating system to memory allocated by Caching.

![Caching memory fragmentation plot](https://docs.digitalocean.com/screenshots/databases/metrics/redis/memory-fragmentation.b4632d4cbd7642011f39541f02fd6f2768eab7e0d3184fe315c5b52c37b0668f.png)

When adjacent memory blocks are not available, Caching requires additional memory overhead to allocate memory across the non-contiguous blocks, so this ratio is an indication of memory mapping efficiency:

*   **Ratios over 1.0** indicate that memory fragmentation is very likely.
*   **Ratios under 1.0** indicate that Caching likely has insufficient memory available. Consider optimizing memory usage or upgrading to a plan with more memory.

Note

If your peak memory usage is much higher than your current memory usage, the memory fragmentation ratio may be unreliable.

Learn more about memory allocation and fragmentation in [the Redis documentation on memory optimization](https://redis.io/topics/memory-optimization).

### Cache Hit Ratio[](#cache-hit-ratio)

The cache hit ratio plot displays the efficiency of key retrieval from the Caching cache, which is defined as the ratio of key hits to the total number of key hits and misses. Key misses occur when a key has been expired or evicted from the cache, or it never existed.

![Redis cache hit ratio plot](https://docs.digitalocean.com/screenshots/databases/metrics/redis/cache-hit-ratio.6fae8ff0dbd5126985dc3c3ad3fc3fb9a6a43c5323afdeaf0cb1bf036c883834.png)

For optimal responsiveness, keep your cache hit ratio at 0.8 or higher.

### Replication Status[](#replication-status)

The replication status plot displays the count of connected standby nodes if replication is enabled.

![Redis replication status plot](https://docs.digitalocean.com/screenshots/databases/metrics/redis/replication-status.adfacec147b7d172b0df401416fc0c98a5f494f895bcc2b41bf9e0ce76517502.png)

## Access the Metrics Endpoint[](#access-the-metrics-endpoint)

You can also view your database cluster’s metrics programmatically via the metrics endpoint. This endpoint includes over twenty times the metrics you can access in the **Insights** tab in the control panel.

You can access the metrics endpoint with a cURL command or a monitoring system like [Prometheus](https://prometheus.io/).

### Get Hostname and Credentials[](#get-hostname-and-credentials)

First, you need to retrieve your cluster’s metrics hostname by sending a [`GET` request to `https://api.digitalocean.com/v2/databases/${UUID}`](/reference/api/digitalocean/#operation/databases_get). In the following example, the target database cluster has a standby node, which requires a second `host`/`port` pair:

    curl --silent -XGET --location 'https://api.digitalocean.com/v2/databases/${UUID}' --header 'Content-Type: application/json' --header "Authorization: Bearer $RO_DIGITALOCEAN_TOKEN" | jq '.database.metrics_endpoints'

Which returns the following `host`/`port` pairs:

    [
      {
        "host": "db-test-for-metrics.c.db.ondigitalocean.com",
        "port": 9273
      },
      {
        "host": "replica-db-test-for-metrics.c.db.ondigitalocean.com",
        "port": 9273
      }
    ]

Next, you need your cluster’s metrics credentials. You can retrieve these by making a [`GET` request to `https://api.digitalocean.com/v2/databases/metrics/credentials`](/reference/api/digitalocean/#operation/databases_get_cluster_metrics_credentials) with an admin or write token:

    curl --silent -XGET --location 'https://api.digitalocean.com/v2/databases/metrics/credentials' --header 'Content-Type: application/json' --header "Authorization: Bearer $RW_DIGITALOCEAN_TOKEN" | jq '.'

Which returns the following credentials:

    {
      "credentials": {
        "basic_auth_username": "..."
        "basic_auth_password": "...",
      }
    }

### Access with cURL[](#access-with-curl)

To access the endpoint using cURL, make a [`GET` request to `https://$HOST:9273/metrics`](/reference/api/digitalocean/#operation/databases_get), replacing the hostname, username, and password variables with the credentials you found in the previous steps:

    curl -XGET -k -u $USERNAME:$PASSWORD https://$HOST:9273/metrics

### Access with Prometheus[](#access-with-prometheus)

To access the endpoint using Prometheus, first copy the following configuration into a file `prometheus.yml`, replacing the hostname, username, password, and path to CA cert. This configures Prometheus to use all the credentials necessary to access the endpoint:

    # prometheus.yml
    global:
      scrape_interval: 15s
      evaluation_interval: 15s
    
    scrape_configs:
      - job_name: 'dbaas_cluster_metrics_svc_discovery'
        scheme: https
        tls_config: 
          ca_file: /path/to/ca.crt
        dns_sd_configs:
        - names:
          - $TARGET_ADDRESS
          type: 'A'
          port: 9273
          refresh_interval: 15s
        metrics_path: '/metrics'
        basic_auth:
          username: $BASIC_AUTH_USERNAME
          password: $BASIC_AUTH_PASSWORD

Then, copy the following connection script into a file named `up.sh`. This script runs `envsubst` and starts a Prometheus container with the config from the previous step:

    #!/bin/bash
    envsubst < prometheus.yml > /tmp/dbaas-prometheus.yml
    
    docker run -p 9090:9090 \
      -v /tmp/dbaas-prometheus.yml:/etc/prometheus/prometheus.yml \
      prom/prometheus

Go to `http://localhost:9090/targets` in a browser to confirm that multiple hosts are up and healthy.

![The Prometheus dashboard](https://docs.digitalocean.com/screenshots/databases/prometheus-check.db5b24f1902682f3f89c9392aedd7886e9239093f454e7ce6e359a5ed9c67272.png)

Then, navigate to `http://localhost:9090/graph` to query Prometheus for metrics.

![A Prometheus graph](https://docs.digitalocean.com/screenshots/databases/prometheus-graph.95a3e0ab293441c91a195d7580d839edafa9acc0bd067373b16b74eb9f9cab66.png)

For more details, see the Prometheus [DNS SD docs](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#dns_sd_config) and [TLS config docs](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#tls_config).

### Additional Resources[](#additional-resources)

For more details on each available metric, see the [Redis documentation](https://redis.io/docs/latest/commands/info/).

In this article...

*   [View Caching Metrics](#view-caching-metrics)
*   [Caching Metrics Details](#caching-metrics-details)
    *   [Connection Status](#connection-status)
    *   [Connected Clients](#connected-clients)
    *   [Throughput](#throughput)
    *   [Key Evictions](#key-evictions)
    *   [Memory Fragmentation](#memory-fragmentation)
    *   [Cache Hit Ratio](#cache-hit-ratio)
    *   [Replication Status](#replication-status)
*   [Access the Metrics Endpoint](#access-the-metrics-endpoint)
    *   [Get Hostname and Credentials](#get-hostname-and-credentials)
    *   [Access with cURL](#access-with-curl)
    *   [Access with Prometheus](#access-with-prometheus)
    *   [Additional Resources](#additional-resources)

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

Try using different keywords or simplifying your