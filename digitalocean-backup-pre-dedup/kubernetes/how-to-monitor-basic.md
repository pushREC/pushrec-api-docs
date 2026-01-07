---
source: https://docs.digitalocean.com/products/kubernetes/how-to/monitor-basic/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to View Basic Performance Metrics for Nodes in DigitalOcean Kubernetes Clusters | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/kubernetes.5c9f5538fc3c9db4ddd19b3b4c2166c4e06a899c3582345cc892b570bd214072.svg)Kubernetes](/products/kubernetes/)
*   [Getting Started](/products/kubernetes/getting-started/)
    *   [Quickstart](/products/kubernetes/getting-started/quickstart/)
    *   [Deploy Image to Cluster](/products/kubernetes/getting-started/deploy-image-to-cluster/)
    *   [Set Up Operational Readiness](/products/kubernetes/getting-started/operational-readiness/)
*   [How-Tos](/products/kubernetes/how-to/)
    *   [Create Clusters](/products/kubernetes/how-to/create-clusters/)
    *   [Connect to a Cluster](/products/kubernetes/how-to/connect-to-cluster/)
    *   [Add Node Pools](/products/kubernetes/how-to/add-node-pools/)
    *   [Enable Autoscaling](/products/kubernetes/how-to/autoscale/)
    *   [Configure Multi-Node GPU Nodes](/products/kubernetes/how-to/configure-multinode-gpus/)
    *   [Manage 1-Click Apps](/products/kubernetes/how-to/manage-1click-apps/)
    *   [Back Up Managed Kubernetes Resources](/products/snapshooter/how-to/back-up-doks/)
    *   [Destroy Clusters](/products/kubernetes/how-to/destroy-clusters/)
    *   [Enable High Availability](/products/kubernetes/how-to/enable-high-availability/)
    *   [Integrate with Container Registry](/products/kubernetes/how-to/integrate-with-docr/)
    *   [Add Volumes](/products/kubernetes/how-to/add-volumes/)
    *   [Delete Volumes](/products/kubernetes/how-to/delete-volumes/)
    *   [Restore Volumes](/products/kubernetes/how-to/restore-volumes/)
    *   [Use NFS Storage](/products/kubernetes/how-to/use-nfs-storage/)
    *   [Import DigitalOcean Snapshots](/products/kubernetes/how-to/import-snapshot/)
    *   [Create Snapshots](/products/kubernetes/how-to/create-snapshots/)
    *   [Add Load Balancers](/products/kubernetes/how-to/add-load-balancers/)
    *   [Configure Load Balancers](/products/kubernetes/how-to/configure-load-balancers/)
    *   [Migrate Load Balancers](/products/kubernetes/how-to/migrate-load-balancers/)
    *   [Delete Load Balancers](/products/kubernetes/how-to/delete-load-balancers/)
    *   [Use Routing Agent](/products/kubernetes/how-to/use-routing-agent/)
    *   [Use Spaces](/products/kubernetes/how-to/use-spaces/)
    *   [Customize Cluster DNS Settings](/products/kubernetes/how-to/customize-coredns/)
    *   [Enable Push-to-Deploy](/products/kubernetes/how-to/deploy-using-github-actions/)
    *   [View Basic Metrics](/products/kubernetes/how-to/monitor-basic/)
    *   [Use Cilium Hubble](/products/kubernetes/how-to/use-cilium-hubble/)
    *   [Set Up Advanced Monitoring](/products/kubernetes/how-to/monitor-advanced/)
    *   [Forward Logs](/products/kubernetes/how-to/forward-logs/)
    *   [Upgrade Clusters](/products/kubernetes/how-to/upgrade-cluster/)
    *   [Add Control Plane Firewallsprivate](/products/kubernetes/how-to/add-control-plane-firewall/)
    *   [Set RoleBindings for Custom Roles](/products/kubernetes/how-to/set-up-custom-rolebindings/)
    *   [Set Up Horizontal Pod Autoscaling](/products/kubernetes/how-to/set-up-autoscaling/)
*   [Reference](/products/kubernetes/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Kubernetes)
    *   [CLI Reference](/reference/doctl/reference/kubernetes/cluster/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/kubernetes/concepts/)
    *   [Choosing a Plan](/products/kubernetes/concepts/choosing-a-plan/)
    *   [Best Practices](/products/kubernetes/concepts/best-practices/)
*   [Details](/products/kubernetes/details/)
    *   [Features](/products/kubernetes/details/features/)
    *   [Pricing](/products/kubernetes/details/pricing/)
    *   [Availability](/products/kubernetes/details/availability/)
    *   [Limits](/products/kubernetes/details/limits/)
    *   [Changelog](/products/kubernetes/details/changelog/)
    *   [Managed Kubernetes](/products/kubernetes/details/managed/)
    *   [GPU Worker Nodes](/products/kubernetes/details/supported-gpus/)
    *   [Security Information](/products/kubernetes/details/security/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/doks)
    *   [Supported Releases](/products/kubernetes/details/supported-releases/)
    *   [Volume Features](/products/kubernetes/details/volume-features/)
*   [Support](/products/kubernetes/support/)

*   [How-Tos](/products/kubernetes/how-to/) 
*   View Basic Metrics

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to View Basic Performance Metrics for Nodes in DigitalOcean Kubernetes Clusters

Validated on 17 May 2019 • Last edited on 10 Nov 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

DigitalOcean Kubernetes includes metrics visualizations to provide insight into the health of your Kubernetes clusters and deployments.

*   **[Basic metrics](/products/kubernetes/how-to/monitor-basic/#view-basic-performance-metrics)** include CPU usage, load averages, bandwidth, and disk I/O.
    
    Additional metrics, such as GPU utilization, memory, temperature, and power usage, are automatically available for AMD and NVIDIA GPU node pools on DOKS 1.33.1-do.5 or higher when using AI/ML Ready images.
    
    These GPU metrics appear in the **Insights** tab and provide the [same level of observability as GPU Droplets](/products/monitoring/concepts/metrics/).
    
    Basic metrics are useful for capacity planning and identifying unhealthy worker nodes. For example, you can [set up alerting for worker node metrics](/products/monitoring/how-to/manage-alerts/).
    
    Basic metrics are available by default for clusters, node pools, and worker nodes because all Kubernetes clusters come with the [DigitalOcean metrics agent](https://github.com/digitalocean/do-agent), a lightweight, open-source service that forwards metrics to the DigitalOcean’s Prometheus backend.
    
*   **[Advanced metrics](/products/kubernetes/how-to/monitor-advanced/)** include deployment status metrics, like DaemonSet pod scheduling and availability. Advanced metrics are useful for in-depth views into Kubernetes-specific metrics.
    
    To use advanced monitoring, you need to install [the sidecar agent `kube-state-metrics`](https://github.com/kubernetes/kube-state-metrics).
    

## View Basic Performance Metrics[](#view-basic-performance-metrics)

To view basic performance metrics, click the name of the cluster to go to its **Overview** page, then click the **Insights** tab.

![The Insights tab of a Kubernetes cluster](https://docs.digitalocean.com/screenshots/kubernetes/insights-tab.c696359cb8d78801cf11ffabd563ad84cdd5b3069c10ed63dfac5bab058d1fb0.png)

Use the **Select object** drop-down to switch between cluster, node pool, and worker node metrics views.

Use the **Select period** drop-down to change between metrics time frames, from 1 hour to 30 days. Each graph will display approximately 300 data points.

By default, the summary to the right shows the most recent metrics values. If you hover over a time point on one of the graphs, the summary will display the values from that time point instead.

If you recently created a cluster, node pool, or worker node, it may take a few minutes for the metrics data to finish processing before you see it on the **Insights** page.

## Kubernetes Basic Metrics Details[](#kubernetes-basic-metrics-details)

DigitalOcean’s basic Kubernetes monitoring includes the following metrics:

*   CPU usage
*   1-, 5-, and 15-minute load average
*   Memory usage
*   Disk usage
*   Disk I/O
*   Bandwidth (public and private)

For DOKS 1.33.1-do.5 and later, Insights displays the following GPU-level metrics for AMD and NVIDIA GPU node pools created using AI/ML Ready images:

*   GPU utilization
*   GPU memory utilization
*   GPU temperature
*   GPU power usage

Note

Kubernetes sets aside CPU and memory for system processes, which may be greater than the CPU and memory that is actually in use. See the [advanced metrics guidance](/products/kubernetes/how-to/monitor-advanced/) for details on how to visualize reserved CPU and memory.

Basic metrics are available for clusters, node pools, and worker nodes. For clusters and node pools, metrics are rolled up across all worker nodes and summary metrics are reported.

### CPU Usage[](#cpu-usage)

For worker nodes, the CPU usage plot displays the amount of processing power being consumed across all cores. For clusters and node pools, it displays the minimum, maximum, and average percentage of processing power being used across all worker nodes and cores.

![CPU usage across the cluster](https://docs.digitalocean.com/screenshots/kubernetes/metrics/cpu-usage.84b73b2f8a9c15fcb6690684f4ab0f7badafbf26c4490a46754e1ae8f4d251eb.png)

Learn more about [CPU usage in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#cpu).

### Load Average[](#load-average)

The load average plot displays 1-, 5-, and 15-minute load averages, averaged across all worker nodes for cluster and node pool views. Load average measures the processes that are either being handled by the processor or are waiting for processor time.

![Load average across the cluster](https://docs.digitalocean.com/screenshots/kubernetes/metrics/load-avg.1342af651dc517560faf99a382fc99f894747a306f9bf473ca94f15ff88c2162.png)

The three time-based load average metrics are calculated as an exponentially weighted moving average over the past 1, 5, and 15 minutes. This metric does not adjust for multiple cores. Learn more about [load averages in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#load-average).

### Memory Usage[](#memory-usage)

For worker nodes, the memory usage plot displays the percentage of memory in use. For clusters and node pool, it displays the minimum, maximum, and average percentage of memory consumption across all worker nodes. Because cached memory can be released on demand, it is not considered in use.

![Memory usage across the cluster](https://docs.digitalocean.com/screenshots/kubernetes/metrics/memory-usage.cbad8d5fb7ee133ca5ce405551460010c852142ce05f941474d0385b5b521a96.png)

Learn more about [memory usage in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#memory).

### Disk Usage[](#disk-usage)

The disk usage plot displays the percentage of disk used on a worker node. For clusters and node pools, the plot displays the minimum, maximum, and average percentage of disk consumed across all worker nodes.

![Disk usage across the cluster](https://docs.digitalocean.com/screenshots/kubernetes/metrics/disk-usage.97cb6e523c8b159c0749cd0c78a96e28d511bc9b7323c6d6a0fcb234da2fe45d.png)

Learn more about [disk usage in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#disk-usage).

### Disk I/O[](#disk-io)

For worker nodes, the disk I/O plot displays the rate at which data is read and written to disk. For clusters and node pools, it presents the maximum and average rate that data is being read and written across all worker nodes in the cluster or node pool. The rate is expressed in megabytes per second.

![Disk input and output across the cluster](https://docs.digitalocean.com/screenshots/kubernetes/metrics/disk-io.321a643e9ae0bada3065e32ff119329d34c4144c099089161afe560eb6f5697a.png)

Learn more about [disk I/O in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#disk-i-o).

### Bandwidth[](#bandwidth)

For worker nodes, the bandwidth plots display the average rate at which data moves between the worker nodes in the cluster or node pool and other resources. For clusters and node pools, they display the average and maximum incoming and outgoing bandwidth across all worker nodes.

![Bandwidth across the cluster](https://docs.digitalocean.com/screenshots/kubernetes/metrics/bandwidth.c39517c515ff6d904ec1d3cec48c7a59da135ad84f26b137c4a5bdb6818b32a6.png)

There are separate plots for public and private network bandwidth with lines for both incoming and outgoing bandwidth. The rate is expressed in megabits per second.

Learn more about [bandwidth in the Droplet metrics definitions](/products/monitoring/concepts/metrics/#bandwidth).

In this article...

*   [View Basic Performance Metrics](#view-basic-performance-metrics)
*   [Kubernetes Basic Metrics Details](#kubernetes-basic-metrics-details)
    *   [CPU Usage](#cpu-usage)
    *   [Load Average](#load-average)
    *   [Memory Usage](#memory-usage)
    *   [Disk Usage](#disk-usage)
    *   [Disk I/O](#disk-io)
    *   [Bandwidth](#bandwidth)

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
