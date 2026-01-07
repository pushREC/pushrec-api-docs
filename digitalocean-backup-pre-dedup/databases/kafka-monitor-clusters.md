---
source: https://docs.digitalocean.com/products/databases/kafka/how-to/monitor-clusters/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Monitor Kafka Database Cluster Performance | DigitalOcean Documentation

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
*   Monitor Cluster Performance

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Monitor Kafka Database Cluster Performance

Validated on 8 Apr 2024 • Last edited on 17 Jun 2025

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

DigitalOcean Managed Databases include metrics visualizations so you can monitor performance and health of your database cluster.

*   **Cluster metrics** monitor the performance of the nodes in a database cluster. Cluster metrics cover primary and standby nodes; metrics for each read-only node are displayed independently. This data can help guide capacity planning and optimization. You can also set up alerting on cluster metrics.
    
*   **Database metrics** monitor the performance of the database itself. This data can help assess the health of the database, pinpoint performance bottlenecks, and identify unusual use patterns that may indicate an application bug or security breach.
    

For more information on database metrics, see our [how-to on monitoring database performance](/products/databases/kafka/how-to/monitor-databases/).

## View Cluster Metrics[](#view-cluster-metrics)

To view Kafka performance metrics, click the name of the database to go to its **Overview** page, then click the **Insights** tab.

![The Insights tab of a managed databases cluster](https://docs.digitalocean.com/screenshots/databases/kafka-insights-tab.37d966e3f3cda8cbfa8e5937a943834c3115f70b871ba4de91e08bb428e3fe3e.png)

The **Select object** drop-down menu lists the cluster itself and all of the databases in the cluster. Choose the cluster to view its metrics.

In the **Select Period** drop-down menu, you can choose a time frame for the x-axis of the graphs, ranging from 1 hour to 30 days. Each line in the graphs displays about 300 data points.

By default, the summary to the right shows the most recent metrics values. When you hover over a different time in a graph, the summary displays the values from that time instead.

Note

You may notice gaps in your metrics data from outages, platform maintenance, or a database failover or migration. You can check [DigitalOcean’s status page](https://status.digitalocean.com) for outages, review the cluster maintenance window, visit the cluster’s **Settings** > **Logs** (or **Logs & Queries**) page to look for failovers and migrations.

If you recently provisioned the cluster or added nodes, it may take a few minutes for the metrics data to finish processing before you see it on the **Insights** page.

If you have 200 or more databases on a single cluster, you may be unable to retrieve their metrics. If you reach this limit, create any additional databases in a new cluster.

## Cluster Metrics Details[](#cluster-metrics-details)

Database clusters have the following cluster metrics:

*   CPU usage
*   1-, 5-, and 15-minute load average
*   Memory usage
*   Disk usage

All resource usage graphs have three lines for minimum, maximum, and average. If you have a one-node cluster or are viewing a read-only node, all three lines are be a single, superimposed line. Read-only node metrics are displayed independently from clusters which are comprised of primary and standby nodes.

### CPU Usage[](#cpu-usage)

The CPU usage plot shows, for all nodes in the cluster, the minimum, maximum, and average percentage of processing power being used across all cores.

![Cluster CPU usage](https://docs.digitalocean.com/screenshots/databases/metrics/cpu.004cb12362c66e709ffb4ac1c301f9416a132083864f5da1bf3d49625313e83e.png)

If you experience a significant increase in CPU usage, check the throughput plot and query statistics to look for unexpected usage patterns or long-running queries.

Learn more about [CPU usage in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#cpu).

### Load Average[](#load-average)

The load average plot displays 1-, 5-, and 15-minute load averages, averaged across all primary and standby nodes in the cluster. Load average measures the processes that are either being handled by the processor or are waiting for processor time.

![Cluster load averages](https://docs.digitalocean.com/screenshots/databases/metrics/load-average.ebb0041827b657fd71edf914a1764500a118d717a00da08385abe9b1e2eb351a.png)

The three time-based load average metrics are calculated as an exponentially weighted moving average over the past 1, 5, and 15 minutes. This metric does not adjust for multiple cores. Learn more about [load averages in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#load-average).

### Memory Usage[](#memory-usage)

The memory usage plot presents the minimum, maximum, and average percentage of memory consumption across all nodes in the cluster. Because cached memory can be released on demand, it is not considered in use.

![Cluster memory usage](https://docs.digitalocean.com/screenshots/databases/metrics/memory.2005ca5da17ec7b5214c891d7d40dbfe9645ce10757917e87f549334b12f5384.png)

Learn more about [memory usage in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#memory).

### Disk Usage[](#disk-usage)

The disk usage plot shows the minimum, maximum, and average percentage of disk consumed across all primary and standby nodes in the cluster. You should maintain disk usage below 90%.

![Cluster disk usage](https://docs.digitalocean.com/screenshots/databases/metrics/disk.9d17a810f15ae90f773a1917dd2fa63e46bc903f2be8c5e44838c1d1982b5b11.png)

Learn more about [disk I/O in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#disk-i-o).

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

*   [View Cluster Metrics](#view-cluster-metrics)
*   [Cluster Metrics Details](#cluster-metrics-details)
    *   [CPU Usage](#cpu-usage)
    *   [Load Average](#load-average)
    *   [Memory Usage](#memory-usage)
    *   [Disk Usage](#disk-usage)
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