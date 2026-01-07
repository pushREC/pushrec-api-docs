---
source: https://docs.digitalocean.com/products/databases/kafka/how-to/monitor-databases/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Monitor Kafka Database Performance | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/kafka.6e5f03a9446ce8ef1cb8ff94d5cfc2174c6a0778b884650e64476af3a9d0888b.svg)Kafka](/products/databases/kafka/)
*   [Getting Started](/products/databases/kafka/getting-started/)
    *   [Quickstart](/products/databases/kafka/getting-started/quickstart/)
*   [How-Tos](/products/databases/kafka/how-to/)
    *   [Create Kafka Clusters](/products/databases/kafka/how-to/create/)
    *   [Connect to Kafka Clusters](/products/databases/kafka/how-to/connect/)
    *   [Create Kafka Topics](/products/databases/kafka/how-to/create-topics/)
    *   [Resize Database Clusters](/products/databases/kafka/how-to/resize/)
    *   [Secure Kafka Clusters](/products/databases/kafka/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/kafka/how-to/schedule-updates/)
    *   [Manage Users and Privileges](/products/databases/kafka/how-to/manage-users-and-privileges/)
    *   [Monitor Kafka Performance](/products/databases/kafka/how-to/monitor-databases/)
    *   [Monitor Cluster Performance](/products/databases/kafka/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/kafka/how-to/set-up-alerts/)
    *   [Forward Logs](/products/databases/kafka/how-to/forward-logs/)
    *   [Destroy Clusters](/products/databases/kafka/how-to/destroy/)
    *   [Enable Schema Registry](/products/databases/kafka/how-to/enable-schema-registry/)
    *   [Tag Database Clusters](/products/databases/kafka/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/kafka/how-to/reconfigure/)
*   [Reference](/products/databases/kafka/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/kafka/concepts/)
    *   [Best Practices](/products/databases/kafka/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/kafka/concepts/responsibility-model/)
*   [Details](/products/databases/kafka/details/)
    *   [Features](/products/databases/kafka/details/features/)
    *   [Pricing](/products/databases/kafka/details/pricing/)
    *   [Availability](/products/databases/kafka/details/availability/)
    *   [Limits](/products/databases/kafka/details/limits/)
    *   [Cluster Notifications](/products/databases/kafka/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)

*   [How-Tos](/products/databases/kafka/how-to/) 
*   Monitor Kafka Performance

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Monitor Kafka Database Performance

Validated on 8 Apr 2024 • Last edited on 17 Jun 2025

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

DigitalOcean Managed Databases include metrics visualizations so you can monitor performance and health of your database cluster.

*   **Cluster metrics** monitor the performance of the nodes in a database cluster. Cluster metrics cover primary and standby nodes; metrics for each read-only node are displayed independently. This data can help guide capacity planning and optimization. You can also set up alerting on cluster metrics.
    
*   **Database metrics** monitor the performance of the database itself. This data can help assess the health of the database, pinpoint performance bottlenecks, and identify unusual use patterns that may indicate an application bug or security breach.
    

For more information on cluster metrics, see our [how-to on monitoring cluster performance](/products/databases/kafka/how-to/monitor-clusters/).

There are two groups of Kafka metrics: [main server metrics](#master-server-metrics), which are metrics on all databases in the cluster, and [database metrics](#database-metrics), which are metrics on individual database performance.

## View Kafka Metrics[](#view-kafka-metrics)

To view performance metrics for a Kafka database cluster, click the name of the database to go to its **Overview** page, then click the **Insights** tab.

![The Insights tab of a Managed Database cluster](https://docs.digitalocean.com/screenshots/databases/kafka-insights-tab.37d966e3f3cda8cbfa8e5937a943834c3115f70b871ba4de91e08bb428e3fe3e.png)

The **Select object** drop-down menu lists the cluster itself and all of the databases in the cluster. Choose the database to view its metrics.

In the **Select Period** drop-down menu, you can choose a time frame for the x-axis of the graphs, ranging from 1 hour to 30 days. Each line in the graphs displays about 300 data points.

By default, the summary to the right shows the most recent metrics values. When you hover over a different time in a graph, the summary displays the values from that time instead.

Note

You may notice gaps in your metrics data from outages, platform maintenance, or a database failover or migration. You can check [DigitalOcean’s status page](https://status.digitalocean.com) for outages, review the cluster maintenance window, visit the cluster’s **Settings** > **Logs** (or **Logs & Queries**) page to look for failovers and migrations.

If you recently provisioned the cluster or changed its configuration, it may take a few minutes for the metrics data to finish processing before you see it on the **Insights** page.

If you have 200 or more databases on a single cluster, you may be unable to retrieve their metrics. If you reach this limit, create any additional databases in a new cluster.

## Kafka Main Server Metrics Details[](#master-server-metrics)

Kafka-specific main server metrics include:

*   Log Size (Largest Topics)
*   Disk I/O
*   Server - Messages per Second
*   Server - Incoming Messages - Count
*   Server - Bytes In and Out
*   Network Requests per Operation
*   Controller Offline Partitions

Main server metrics are displayed in the same view as [cluster performance metrics](/products/databases/mysql/how-to/monitor-clusters/).

### Log Size (Largest Topics)[](#log-size-largest-topics)

The log size plot presents the log size for each of your cluster’s largest Topics.

### Disk I/O[](#disk-io)

The disk I/O plot presents the overall amount of data being written to and read from all nodes in the cluster.

### Server - Messages Per Second[](#server---messages-per-second)

The messages-per-second plot presents the messages per second per node in the cluster.

### Server - Incoming Messages - Count[](#server---incoming-messages---count)

The incoming messages plot presents the total number of messages received by the cluster by all nodes in the cluster.

### Server - Bytes In and Out[](#server---bytes-in-and-out)

The bytes-in-and-out plot presents the amount of bytes being sent and received by the cluster, organized into client bytes and replication bytes.

### Network Requests Per Operation[](#network-requests-per-operation)

The network requests per operation plot presents the amount of network requests across all nodes in the cluster for each of the following operations: `FetchConsumer`, `FetchFollower`, and `Produce`.

### Controller Offline Partitions[](#controller-offline-partitions)

The controller offline partitions plot presents the number of offline partitions per node in the cluster.

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

For more details on each available metric, see the [Kafka documentation](https://kafka.apache.org/documentation/).

In this article...

*   [View Kafka Metrics](#view-kafka-metrics)
*   [Kafka Main Server Metrics Details](#master-server-metrics)
    *   [Log Size (Largest Topics)](#log-size-largest-topics)
    *   [Disk I/O](#disk-io)
    *   [Server - Messages Per Second](#server---messages-per-second)
    *   [Server - Incoming Messages - Count](#server---incoming-messages---count)
    *   [Server - Bytes In and Out](#server---bytes-in-and-out)
    *   [Network Requests Per Operation](#network-requests-per-operation)
    *   [Controller Offline Partitions](#controller-offline-partitions)
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

Try using different keywords or simplifying you