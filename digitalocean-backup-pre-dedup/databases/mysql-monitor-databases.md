---
source: https://docs.digitalocean.com/products/databases/mysql/how-to/monitor-databases/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Monitor MySQL Database Performance | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/mysql.15f32316da2692011abce02f393a1ee6db469250230cf1ea962c181c0e9e7de5.svg)MySQL](/products/databases/mysql/)
*   [Getting Started](/products/databases/mysql/getting-started/)
    *   [Quickstart](/products/databases/mysql/getting-started/quickstart/)
*   [How-Tos](/products/databases/mysql/how-to/)
    *   [Create MySQL Clusters](/products/databases/mysql/how-to/create/)
    *   [Connect to MySQL Clusters](/products/databases/mysql/how-to/connect/)
    *   [Resize Database Clusters](/products/databases/mysql/how-to/resize/)
    *   [Import Databases](/products/databases/mysql/how-to/import-databases/)
    *   [Secure MySQL Clusters](/products/databases/mysql/how-to/secure/)
    *   [Migrate MySQL Databases](/products/databases/mysql/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/mysql/how-to/schedule-updates/)
    *   [Manage Users and Databases](/products/databases/mysql/how-to/manage-users-and-databases/)
    *   [Modify User Privileges](/products/databases/mysql/how-to/modify-user-privileges/)
    *   [Monitor MySQL Performance](/products/databases/mysql/how-to/monitor-databases/)
    *   [Add Standby Nodes](/products/databases/mysql/how-to/add-standby-nodes/)
    *   [Add Read-Only Nodes](/products/databases/mysql/how-to/add-read-only-nodes/)
    *   [Monitor Cluster Performance](/products/databases/mysql/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/mysql/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/mysql/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/mysql/how-to/fork-clusters/)
    *   [Forward Logs](/products/databases/mysql/how-to/forward-logs/)
    *   [Restore from Backups](/products/databases/mysql/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/mysql/how-to/destroy/)
    *   [Set Global SQL Mode](/products/databases/mysql/how-to/set-sql-mode/)
    *   [Tag Database Clusters](/products/databases/mysql/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/mysql/how-to/reconfigure/)
    *   [Create Primary Keys](/products/databases/mysql/how-to/create-primary-keys/)
*   [Reference](/products/databases/mysql/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/mysql/concepts/)
    *   [Migration Strategies](/products/databases/mysql/concepts/migration-strategies/)
    *   [Sort Buffer Size](/products/databases/mysql/concepts/sort-buffer-size/)
    *   [Best Practices](/products/databases/mysql/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/mysql/concepts/responsibility-model/)
*   [Details](/products/databases/mysql/details/)
    *   [Features](/products/databases/mysql/details/features/)
    *   [Pricing](/products/databases/mysql/details/pricing/)
    *   [Availability](/products/databases/mysql/details/availability/)
    *   [Limits](/products/databases/mysql/details/limits/)
    *   [Cluster Notifications](/products/databases/mysql/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/mysql/support/)

*   [How-Tos](/products/databases/mysql/how-to/) 
*   Monitor MySQL Performance

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Monitor MySQL Database Performance

Validated on 8 Apr 2024 • Last edited on 17 Jun 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

DigitalOcean Managed Databases include metrics visualizations so you can monitor performance and health of your database cluster.

*   **Cluster metrics** monitor the performance of the nodes in a database cluster. Cluster metrics cover primary and standby nodes; metrics for each read-only node are displayed independently. This data can help guide capacity planning and optimization. You can also set up alerting on cluster metrics.
    
*   **Database metrics** monitor the performance of the database itself. This data can help assess the health of the database, pinpoint performance bottlenecks, and identify unusual use patterns that may indicate an application bug or security breach.
    

For more information on cluster metrics, see our [how-to on monitoring cluster performance](/products/databases/mysql/how-to/monitor-clusters/).

There are two groups of MySQL database metrics: [main server metrics](#master-server-metrics), which are metrics on all databases in the cluster, and [database metrics](#database-metrics), which are metrics on individual database performance.

## View MySQL Metrics[](#view-mysql-metrics)

To view performance metrics for a MySQL database cluster, click the name of the database to go to its **Overview** page, then click the **Insights** tab.

![The Insights tab of a Managed Database cluster](https://docs.digitalocean.com/screenshots/databases/mysql-insights-tab.1fbd57f47463ef75086f6c696d6b9e85cd70564defd4fb07a1729e0558710991.png)

The **Select object** drop-down menu lists the cluster itself and all of the databases in the cluster. Choose the database to view its metrics.

In the **Select Period** drop-down menu, you can choose a time frame for the x-axis of the graphs, ranging from 1 hour to 30 days. Each line in the graphs displays about 300 data points.

By default, the summary to the right shows the most recent metrics values. When you hover over a different time in a graph, the summary displays the values from that time instead.

Note

You may notice gaps in your metrics data from outages, platform maintenance, or a database failover or migration. You can check [DigitalOcean’s status page](https://status.digitalocean.com) for outages, review the cluster maintenance window, visit the cluster’s **Settings** > **Logs** (or **Logs & Queries**) page to look for failovers and migrations.

If you recently provisioned the cluster or changed its configuration, it may take a few minutes for the metrics data to finish processing before you see it on the **Insights** page.

If you have 200 or more databases on a single cluster, you may be unable to retrieve their metrics. If you reach this limit, create any additional databases in a new cluster.

## MySQL Main Server Metrics Details[](#master-server-metrics)

MySQL-specific main server metrics include:

*   **Connection status**: the number of threads created, connected, and running in relation to the connection limit.
    
*   **Index vs. sequential reads**: The reads using an index as a proportion of the total reads across all databases on the server.
    
*   **Operations throughput**: Throughput of fetch, insert, update and delete operations across all databases on the server.
    

Main server metrics are displayed in the same view as [cluster performance metrics](/products/databases/mysql/how-to/monitor-clusters/).

### Connection Status[](#connection-status)

The connection status plot displays:

*   The total number of threads connected to the database per second
*   The number of newly created threads per second
*   The number of active threads connected to the database per second

![MySQL connection status plot](https://docs.digitalocean.com/screenshots/databases/metrics/mysql/connection-status.0020a5e7e6a83904cae5d183eb22d263c0c41f2863d657e4c35f85e2a7c969f5.png)

If the number of connected threads regularly approaches or exceeds the connection limit, consider implementing client-side connection pooling or upgrading your database plan to increase your connection limit.

### Index vs. Sequential Reads[](#index-vs-sequential-reads)

The index vs. sequential reads plot presents the proportion of reads that use an index over the total number of reads across all databases (schemas) on the main server.  

![MySQL index vs. sequential reads plot](https://docs.digitalocean.com/screenshots/databases/metrics/mysql/index-vs-sequential-reads.52347fa336a903d72b22472d84e9943e2641f2f4089b25966c579ebdf9248d07.png)

In general, queries across large tables can be optimized through the use of an index. Use the MySQL query statistics on the **Logs & Queries** tab and [the EXPLAIN statement](https://dev.mysql.com/doc/refman/8.0/en/using-explain.html) to identify slow queries that may benefit from the addition of an index.

### Operations throughput[](#operations-throughput)

The operations throughput plot displays the rate of fetch, insert, update and delete operations per second across all databases (schemas) on the main server.

![MySQL operations throughput plot](https://docs.digitalocean.com/screenshots/databases/metrics/mysql/operations-throughput.4efe62642e9b1d4ef103f1addbbaacc02a2ff0bf98886328522a95f264d409c7.png)

You can compare this plot with node performance metrics to identify potential resource constraints. For more insights, look at the [individual database-level metrics](#database-metrics) and the query statistics on the **Logs & Queries** page.

## MySQL Database Metrics[](#database-metrics)

MySQL databases have the following metrics:

*   **Throughput**: row-based throughput of fetches, inserts, updates, and deletes
*   **Latency**: latency of fetches, inserts, updates, and deletes

### Throughput[](#throughput)

The throughput plot shows the rate of fetches, inserts, updates, and deletes in rows per second.

![MySQL throughput plot](https://docs.digitalocean.com/screenshots/databases/metrics/mysql/throughput.ffabcd16f4a8af466f02bb89f44844defa2b8508e5a9a46e8c743f506e908aba.png)

If you observe bottlenecks, look for slow queries in the query statistics on the **Logs & Queries** page, then use [the EXPLAIN statement](https://dev.mysql.com/doc/refman/8.0/en/using-explain.html) to explore opportunities for query optimization.

### Latency[](#latency)

The latency plot shows the average time, in seconds, of fetches, inserts, updates, and deletes.

![MySQL latency plot](https://docs.digitalocean.com/screenshots/databases/metrics/mysql/latency.cce2af0ebb942da211eb8016fdeb3f22378ad796a97a2d176d142c58fd2c16d8.png)

If you observe bottlenecks, use [the EXPLAIN statement](https://dev.mysql.com/doc/refman/8.0/en/using-explain.html) for optimization recommendations.

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

For more details on each available metric, see the [MySQL documentation](https://dev.mysql.com/doc/refman/8.3/en/telemetry-metrics-meter-metrics.html).

In this article...

*   [View MySQL Metrics](#view-mysql-metrics)
*   [MySQL Main Server Metrics Details](#master-server-metrics)
    *   [Connection Status](#connection-status)
    *   [Index vs. Sequential Reads](#index-vs-sequential-reads)
    *   [Operations throughput](#operations-throughput)
*   [MySQL Database Metrics](#database-metrics)
    *   [Throughput](#throughput)
    *   [Latency](#latency)
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

Try using different keywords or simplifying y