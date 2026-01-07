---
source: https://docs.digitalocean.com/products/databases/mongodb/how-to/monitor-clusters/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Monitor MongoDB Database Cluster Performance | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/mongodb.15f32316da2692011abce02f393a1ee6db469250230cf1ea962c181c0e9e7de5.svg)MongoDB](/products/databases/mongodb/)
*   [Getting Started](/products/databases/mongodb/getting-started/)
    *   [Quickstart](/products/databases/mongodb/getting-started/quickstart/)
    *   [Serverless Jamstack Site](/products/functions/getting-started/serverless-jamstack/)
*   [How-Tos](/products/databases/mongodb/how-to/)
    *   [Create MongoDB Clusters](/products/databases/mongodb/how-to/create/)
    *   [Resize Database Clusters](/products/databases/mongodb/how-to/resize/)
    *   [Connect to MongoDB Clusters](/products/databases/mongodb/how-to/connect/)
    *   [Import MongoDB Data](/products/databases/mongodb/how-to/import-collections/)
    *   [Secure MongoDB Clusters](/products/databases/mongodb/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/mongodb/how-to/schedule-updates/)
    *   [Tag Database Clusters](/products/databases/mongodb/how-to/tag/)
    *   [Manage Users and Databases](/products/databases/mongodb/how-to/manage-users-and-databases/)
    *   [Upgrade Database Clusters](/products/databases/mongodb/how-to/upgrade/)
    *   [Add Standby Nodes](/products/databases/mongodb/how-to/add-standby-nodes/)
    *   [Monitor Cluster Performance](/products/databases/mongodb/how-to/monitor-clusters/)
    *   [Forward Logs](/products/databases/mongodb/how-to/forward-logs/)
    *   [Set Up Monitoring Alerts](/products/databases/mongodb/how-to/set-up-alerts/)
    *   [Fork Database Clusters](/products/databases/mongodb/how-to/fork-clusters/)
    *   [Reconfigure Database Clusters](/products/databases/mongodb/how-to/reconfigure/)
    *   [Restore from Backups](/products/databases/mongodb/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/mongodb/how-to/destroy/)
*   [Reference](/products/databases/mongodb/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/mongodb/concepts/)
    *   [Best Practices](/products/databases/mongodb/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/mongodb/concepts/responsibility-model/)
*   [Details](/products/databases/mongodb/details/)
    *   [Features](/products/databases/mongodb/details/features/)
    *   [Pricing](/products/databases/mongodb/details/pricing/)
    *   [Availability](/products/databases/mongodb/details/availability/)
    *   [Limits](/products/databases/mongodb/details/limits/)
    *   [Cluster Notifications](/products/databases/mongodb/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/mongodb/support/)

*   [How-Tos](/products/databases/mongodb/how-to/) 
*   Monitor Cluster Performance

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Monitor MongoDB Database Cluster Performance

Validated on 28 Jun 2021 • Last edited on 17 Jun 2025

MongoDB is a source-available cross-platform document-oriented database program for high-volume storage. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.

DigitalOcean Managed Databases include metrics visualizations so you can monitor performance and health of your database cluster.

Cluster metrics monitor the performance of the nodes in a database cluster. This data can help guide capacity planning and optimization. You can also set up alerting on cluster metrics.

## View Cluster Metrics[](#view-cluster-metrics)

To view performance metrics, click the name of the database to go to its **Overview** page, then click the **Insights** tab.

![The Insights tab of a managed databases cluster](https://docs.digitalocean.com/screenshots/databases/mongodb-insights-tab.291279f7bc5b2e5c5634753b1c4bfd068d300e9ce80030467262b98d7a618d26.png)

In the **Select Period** drop-down menu, you can choose a time frame for the x-axis of the graphs, ranging from 1 hour to 30 days. Each line in the graphs displays about 300 data points.

By default, the summary to the right shows the most recent metrics values. When you hover over a different time in a graph, the summary displays the values from that time instead.

Note

You may notice gaps in your metrics data from outages, platform maintenance, or a database failover or migration. You can check [DigitalOcean’s status page](https://status.digitalocean.com) for outages, review the cluster maintenance window, visit the cluster’s **Settings** > **Logs** (or **Logs & Queries**) page to look for failovers and migrations.

If you recently provisioned the cluster or added nodes, it may take a few minutes for the metrics data to finish processing before you see it on the **Insights** page.

## Cluster Metrics Details[](#cluster-metrics-details)

Database clusters have the following cluster metrics:

*   CPU usage
*   1-, 5-, and 15-minute load average
*   Memory usage
*   Disk usage

All resource usage graphs have three lines for minimum, maximum, and average. If you have a one-node cluster, all three lines are a single, superimposed line.

### CPU Usage[](#cpu-usage)

The CPU usage plot shows, for all nodes in the cluster, the minimum, maximum, and average percentage of processing power being used across all cores.

![Cluster CPU usage](https://docs.digitalocean.com/screenshots/databases/metrics/cpu.004cb12362c66e709ffb4ac1c301f9416a132083864f5da1bf3d49625313e83e.png)

If you experience a significant increase in CPU usage, check the MongoDB throughput plot and query statistics to look for unexpected usage patterns or long-running queries.

Learn more about [CPU usage in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#cpu).

### Load Average[](#load-average)

The load average plot displays 1-, 5-, and 15-minute load averages, averaged across all nodes in the cluster. Load average measures the processes that are either being handled by the processor or are waiting for processor time.

![Cluster load averages](https://docs.digitalocean.com/screenshots/databases/metrics/load-average.ebb0041827b657fd71edf914a1764500a118d717a00da08385abe9b1e2eb351a.png)

The three time-based load average metrics are calculated as an exponentially weighted moving average over the past 1, 5, and 15 minutes. This metric does not adjust for multiple cores. Learn more about [load averages in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#load-average).

### Memory Usage[](#memory-usage)

The memory usage plot presents the minimum, maximum, and average percentage of memory consumption across all nodes in the cluster. Because cached memory can be released on demand, it is not considered in use.

![Cluster memory usage](https://docs.digitalocean.com/screenshots/databases/metrics/memory.2005ca5da17ec7b5214c891d7d40dbfe9645ce10757917e87f549334b12f5384.png)

Learn more about [memory usage in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#memory).

### Disk Usage[](#disk-usage)

The disk usage plot shows the minimum, maximum, and average percentage of disk consumed across all nodes in the cluster. Disk usage is expected to fluctuate during vacuuming, particularly with write-heavy use cases, but you should maintain disk usage below 90%.

![Cluster disk usage](https://docs.digitalocean.com/screenshots/databases/metrics/disk.9d17a810f15ae90f773a1917dd2fa63e46bc903f2be8c5e44838c1d1982b5b11.png)

Learn more about [disk I/O in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#disk-i-o).

In this article...

*   [View Cluster Metrics](#view-cluster-metrics)
*   [Cluster Metrics Details](#cluster-metrics-details)
    *   [CPU Usage](#cpu-usage)
    *   [Load Average](#load-average)
    *   [Memory Usage](#memory-usage)
    *   [Disk Usage](#disk-usage)

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

Try using different keywords or simplifying your search