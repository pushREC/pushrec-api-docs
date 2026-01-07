---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/monitor-databases/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Monitor PostgreSQL Database Performance | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/postgresql.855c43f1f82e98a24a05998729b39a9937438c7f77af3dc0c22da5a5739f5eb7.svg)PostgreSQL](/products/databases/postgresql/)
*   [Getting Started](/products/databases/postgresql/getting-started/)
    *   [Quickstart](/products/databases/postgresql/getting-started/quickstart/)
*   [How-Tos](/products/databases/postgresql/how-to/)
    *   [Create PostgreSQL Clusters](/products/databases/postgresql/how-to/create/)
    *   [Connect to PostgreSQL Cluster](/products/databases/postgresql/how-to/connect/)
    *   [Resize Database Clusters](/products/databases/postgresql/how-to/resize/)
    *   [Import Databases](/products/databases/postgresql/how-to/import-databases/)
    *   [Secure PostgreSQL Clusters](/products/databases/postgresql/how-to/secure/)
    *   [Migrate External Databases](/products/databases/postgresql/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/postgresql/how-to/schedule-updates/)
    *   [Manage Users and Databases](/products/databases/postgresql/how-to/manage-users-and-databases/)
    *   [Modify User Privileges](/products/databases/postgresql/how-to/modify-user-privileges/)
    *   [Monitor PostgreSQL Performance](/products/databases/postgresql/how-to/monitor-databases/)
    *   [Add Standby Nodes](/products/databases/postgresql/how-to/add-standby-nodes/)
    *   [Add Read-Only Nodes](/products/databases/postgresql/how-to/add-read-only-nodes/)
    *   [Manage Connection Pools](/products/databases/postgresql/how-to/manage-connection-pools/)
    *   [Monitor Cluster Performance](/products/databases/postgresql/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/postgresql/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/postgresql/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/postgresql/how-to/fork-clusters/)
    *   [Forward Logs](/products/databases/postgresql/how-to/forward-logs/)
    *   [Restore from Backups](/products/databases/postgresql/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/postgresql/how-to/destroy/)
    *   [Tag Database Clusters](/products/databases/postgresql/how-to/tag/)
    *   [Upgrade PostgreSQL](/products/databases/postgresql/how-to/upgrade-version/)
    *   [Reconfigure Database Clusters](/products/databases/postgresql/how-to/reconfigure/)
*   [Reference](/products/databases/postgresql/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/postgresql/concepts/)
    *   [Best Practices](/products/databases/postgresql/concepts/best-practices/)
    *   [Migration Strategies](/products/databases/postgresql/concepts/migration-strategies/)
    *   [Shared Buffers](/products/databases/postgresql/concepts/shared-buffers/)
    *   [Shared Responsibility Model](/products/databases/postgresql/concepts/responsibility-model/)
*   [Details](/products/databases/postgresql/details/)
    *   [Features](/products/databases/postgresql/details/features/)
    *   [Pricing](/products/databases/postgresql/details/pricing/)
    *   [Availability](/products/databases/postgresql/details/availability/)
    *   [Limits](/products/databases/postgresql/details/limits/)
    *   [Supported Extensions](/products/databases/postgresql/details/supported-extensions/)
    *   [Cluster Notifications](/products/databases/postgresql/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/postgresql/support/)

*   [How-Tos](/products/databases/postgresql/how-to/) 
*   Monitor PostgreSQL Performance

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Monitor PostgreSQL Database Performance

Validated on 8 Apr 2024 • Last edited on 17 Jun 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

DigitalOcean Managed Databases include metrics visualizations so you can monitor performance and health of your database cluster.

*   **Cluster metrics** monitor the performance of the nodes in a database cluster. Cluster metrics cover primary and standby nodes; metrics for each read-only node are displayed independently. This data can help guide capacity planning and optimization. You can also set up alerting on cluster metrics.
    
*   **Database metrics** monitor the performance of the database itself. This data can help assess the health of the database, pinpoint performance bottlenecks, and identify unusual use patterns that may indicate an application bug or security breach.
    

For more information on cluster metrics, see our [how-to on monitoring cluster performance](/products/databases/postgresql/how-to/monitor-clusters/).

## View PostgreSQL Metrics[](#view-postgresql-metrics)

To view performance metrics for a PostgreSQL database cluster, click the name of the database to go to its **Overview** page, then click the **Insights** tab.

![The Insights tab of a managed database cluster](https://docs.digitalocean.com/screenshots/databases/postgresql-insights-tab.dbae55484d337efc3bac5a05e473208d629625f34af5b03ac8e9712f46038a7a.png)

The **Select object** drop-down menu lists the cluster itself and all of the databases in the cluster. Choose the database to view its metrics.

In the **Select Period** drop-down menu, you can choose a time frame for the x-axis of the graphs, ranging from 1 hour to 30 days. Each line in the graphs displays about 300 data points.

By default, the summary to the right shows the most recent metrics values. When you hover over a different time in a graph, the summary displays the values from that time instead.

Note

You may notice gaps in your metrics data from outages, platform maintenance, or a database failover or migration. You can check [DigitalOcean’s status page](https://status.digitalocean.com) for outages, review the cluster maintenance window, visit the cluster’s **Settings** > **Logs** (or **Logs & Queries**) page to look for failovers and migrations.

If you recently provisioned the cluster or changed its configuration, it may take a few minutes for the metrics data to finish processing before you see it on the **Insights** page.

## PostgreSQL Metrics Details[](#postgresql-metrics-details)

PostgreSQL databases have the following metrics:

*   Number of database connections
*   Cache hit ratio
*   Proportion of index scans over total scans
*   Fetch, insert, update and delete throughput
*   Rate of deadlock creation
*   Replication delay in bytes (if replication is enabled)

Note

Due to limitations with the Postgres metrics agent, some Postgres graphs may not be populated under certain scenarios when the data point values are expected to be 0. Examples include if you haven’t run any queries, you don’t have any active queries running, or haven’t yet added any tables to a new database.

If you have 200 or more databases on a single cluster, you may be unable to retrieve their metrics. If you reach this limit, create any additional databases in a new cluster.

### Connections[](#connections)

The connections plot displays the number of client connections to the database and the connection limit as defined by the amount of memory associated with your primary node. Once the limit is reached, new client connections will be blocked until existing ones are closed.

![Database connections graph](https://docs.digitalocean.com/screenshots/databases/metrics/postgresql/connections.12790e31e570c283ac7aacb2e53f0295198824d9aaf681878d377039e36d2f1b.png)

You can use a connection pooling utility to avoid connection contention. [Learn more about managing connection pools](/products/databases/postgresql/how-to/manage-connection-pools/).

### Cache Hit Ratio[](#cache-hit-ratio)

The cache hit ratio plot tracks read efficiency as measured by the proportion of reads from cache versus the total reads from both disk and cache. With the exception of data warehouse use cases, an ideal cache hit ratio is 99% or higher, meaning that at least 99% of reads are from cache and no more than 1% are from disk.

![Database cache hit ratio graph](https://docs.digitalocean.com/screenshots/databases/metrics/postgresql/cache-hit-ratio.6571c0cbf1bbdc449315d3e19c3a28465a9870136241dd37dfe852f32f77d565.png)

If your cache hit ratio is consistently lower than 99%, consider upgrading to a plan with additional memory to increase your cache size.

### Index vs Sequential Scans[](#index-vs-sequential-scans)

The index vs sequential scans plot displays the percentage of index scans as proportion of all scans, index and sequential, across all user table in the database. Indexes are pointers to table data and make data retrieval more efficient than when using row-based sequential scans. Ideally for read-heavy use cases, the proportion of index scans should be 99% for larger tables.

![Index versus sequential scan plot](https://docs.digitalocean.com/screenshots/databases/metrics/postgresql/index-vs-sequential-scans.78ccdedd4becba4b0a2ea4cd3ccf9218363f6aae5c59223b532942c01138585b.png)

If you are using larger tables and the proportion of index scans is consistently much lower than 99%, ensure that your larger tables are indexed.

### Throughput[](#throughput)

The throughput plot records the rate of row fetches, row inserts, row updates, and row deletes across all user tables in the database. Monitoring the overall usage pattern is useful for making tuning decisions and identifying potential problems. For example, unexpected changes in usage patterns could indicate a newly introduced bug or security breach.

![Throughput plot](https://docs.digitalocean.com/screenshots/databases/metrics/postgresql/throughput.e80ee4d8ecddf4f8a265852d70abd4904c392b61b9edeae66e07fbd2dd5d80de.png)

This data is also useful for understanding how efficiently your database handles each type of operation and identifying opportunities to improve performance through tuning, design modifications, and scaling. For example, while indexes are helpful for improving performance in read-heavy use cases, they can slow down insert, update and delete (DML) operations.

### Deadlocks[](#deadlocks)

The deadlocks plot shows the rate of deadlock creation in the database. Deadlocks occur when two or more transactions have simultaneous, conflicting locks on the same database object. PostgreSQL will abort at least one of the deadlocked transactions.

![Deadlock rate plot](https://docs.digitalocean.com/screenshots/databases/metrics/postgresql/deadlocks.c2169f0b3eedbe11f1c36f1775a513e2c88e902f3a753214e4ed1604576595aa.png)

To identify the transactions involved in a deadlock, refer to the deadlock error details in your PostgreSQL logs. Look for log entries with `process 12345 detected deadlock`. It may also be helpful to correlate the PostgreSQL error timestamp with the same time point in your application logs to understand under what conditions the deadlock was triggered.

You can prevent deadlocks by ensuring that all applications that use the database acquire locks on multiple objects in a consistent order.

### Replication status[](#replication-status)

If you have a standby node configured, the replication status plot records the lag in replicating data from primary to standby node(s), as expressed in bytes.

![Replication status plot](https://docs.digitalocean.com/screenshots/databases/metrics/postgresql/replication-status.b13f7e85d39e761f38b0549045de0816fdcbba8acd2082df6c054ce58da2c9ff.png)

Significant replication lags could indicate a network connectivity problem or insufficient CPU resources.

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

For more details on each available metric, see the [PostgreSQL documentation](https://www.postgresql.org/docs/current/monitoring-stats.html).

In this article...

*   [View PostgreSQL Metrics](#view-postgresql-metrics)
*   [PostgreSQL Metrics Details](#postgresql-metrics-details)
    *   [Connections](#connections)
    *   [Cache Hit Ratio](#cache-hit-ratio)
    *   [Index vs Sequential Scans](#index-vs-sequential-scans)
    *   [Throughput](#throughput)
    *   [Deadlocks](#deadlocks)
    *   [Replication status](#replication-status)
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

Try using different keywords or simplifying