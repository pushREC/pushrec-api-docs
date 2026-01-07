---
source: https://docs.digitalocean.com/products/kubernetes/how-to/monitor-advanced/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Monitor Advanced Metrics for Kubernetes Pod Deployment Progress and Availability | DigitalOcean Documentation

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
*   Set Up Advanced Monitoring

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Monitor Advanced Metrics for Kubernetes Pod Deployment Progress and Availability

Validated on 25 Nov 2019 • Last edited on 17 Jun 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

DigitalOcean Kubernetes includes metrics visualizations to provide insight into the health of your Kubernetes clusters and deployments.

*   **[Basic metrics](/products/kubernetes/how-to/monitor-basic/#view-basic-performance-metrics)** include CPU usage, load averages, bandwidth, and disk I/O.
    
    Additional metrics, such as GPU utilization, memory, temperature, and power usage, are automatically available for AMD and NVIDIA GPU node pools on DOKS 1.33.1-do.5 or higher when using AI/ML Ready images.
    
    These GPU metrics appear in the **Insights** tab and provide the [same level of observability as GPU Droplets](/products/monitoring/concepts/metrics/).
    
    Basic metrics are useful for capacity planning and identifying unhealthy worker nodes. For example, you can [set up alerting for worker node metrics](/products/monitoring/how-to/manage-alerts/).
    
    Basic metrics are available by default for clusters, node pools, and worker nodes because all Kubernetes clusters come with the [DigitalOcean metrics agent](https://github.com/digitalocean/do-agent), a lightweight, open-source service that forwards metrics to the DigitalOcean’s Prometheus backend.
    
*   **[Advanced metrics](/products/kubernetes/how-to/monitor-advanced/)** include deployment status metrics, like DaemonSet pod scheduling and availability. Advanced metrics are useful for in-depth views into Kubernetes-specific metrics.
    
    To use advanced monitoring, you need to install [the sidecar agent `kube-state-metrics`](https://github.com/kubernetes/kube-state-metrics).
    

## Set Up the `kube-state-metrics` Sidecar Agent[](#set-up-the-kube-state-metrics-sidecar-agent)

### Installation[](#installation)

To enable DigitalOcean’s optional Kubernetes deployment metrics, you need to install `kube-state-metrics`, a sidecar metrics agent that collects object state metrics from the Kubernetes API server.

From the command line, first clone [the `kube-state-metrics` repo](https://github.com/kubernetes/kube-state-metrics):

    git clone https://github.com/kubernetes/kube-state-metrics.git

Next, deploy `kube-state-metrics` to the `kube-system` namespace using [`kubectl`](/products/kubernetes/how-to/connect-to-cluster/):

    kubectl create -k kube-state-metrics/examples/standard/

Once `kube-state-metrics` is installed, the new metrics appear along with your [Kubernetes basic metrics](/products/kubernetes/how-to/monitor-basic/) for cluster-level views. It may take a few minutes for the graphs to populate.

Note

The advanced performance metrics populate in the **Insights** tab correctly only if the `kube-state-metrics` deployment is in the `kube-system` namespace.

### Removal[](#removal)

To remove `kube-state-metrics`, run the following `kubectl delete` command from the directory where you installed the repo.

    kubectl delete -k kube-state-metrics/examples/standard/

## View Advanced Kubernetes Metrics[](#view-advanced-kubernetes-metrics)

You can view advanced performance metrics after you install `kube-state-metrics`. Click the name of the cluster to go to its **Overview** page, then click the **Insights** tab.

![The Insights tab of a Kubernetes cluster](https://docs.digitalocean.com/screenshots/kubernetes/insights-tab.c696359cb8d78801cf11ffabd563ad84cdd5b3069c10ed63dfac5bab058d1fb0.png)

Use the **Select object** drop-down to choose a cluster.

Use the **Select period** drop-down to change between metrics time frames, from 1 hour to 30 days. Each graph displays approximately 300 data points.

By default, the summary to the right shows the most recent metrics values. If you hover over a time point on one of the graphs, the summary displays the values from that time point instead.

If you recently installed the sidecar agent, it may take a few minutes for the metrics data to finish processing before you see it on the **Insights** page.

## Kubernetes Advanced Metrics Details[](#kubernetes-advanced-metrics-details)

The Kubernetes deployment metrics include:

*   Pod deployment progress and availability
*   DaemonSet deployment progress and pod availability, if using DaemonSets

All advanced metrics plots represent metrics aggregated across the cluster.

### Pod Deployment Status[](#pod-deployment-status)

The pod deployment status plot displays the number of pods expected at deployment start, and the count of the pods that are available and unavailable after deployment.

![Pod deployment status across the cluster](https://docs.digitalocean.com/screenshots/kubernetes/metrics/pod-status.a81b9893de55c06cfc9047946bb2c90eebfd99cecff3b7715380a723eac599ec.png)

### DaemonSet Deployment Status[](#daemonset-deployment-status)

If you are using DaemonSets, the DaemonSet deployment status plot displays the number of nodes that should be running a daemon pod, the number of nodes that have been updated and have available daemon pods, and the number of nodes that have been updated but have unavailable daemon pods.

![DaemonSet deployment status across the cluster](https://docs.digitalocean.com/screenshots/kubernetes/metrics/daemonset-status.21164aef90e72770ce15c5e0ce154e3461faf56c343a16408b5adf6ea9fbb6f5.png)

In this article...

*   [Set Up the `kube-state-metrics` Sidecar Agent](#set-up-the-kube-state-metrics-sidecar-agent)
    *   [Installation](#installation)
    *   [Removal](#removal)
*   [View Advanced Kubernetes Metrics](#view-advanced-kubernetes-metrics)
*   [Kubernetes Advanced Metrics Details](#kubernetes-advanced-metrics-details)
    *   [Pod Deployment Status](#pod-deployment-status)
    *   [DaemonSet Deployment Status](#daemonset-deployment-status)

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
