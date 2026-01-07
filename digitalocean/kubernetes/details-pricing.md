---
source: https://docs.digitalocean.com/products/kubernetes/details/pricing/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               Kubernetes Pricing | DigitalOcean Documentation

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

*   [Details](/products/kubernetes/details/) 
*   Pricing

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Kubernetes Pricing

Validated on 2 Mar 2023 • Last edited on 20 Oct 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

## Node Pools[](#node-pools)

The total cost of a DOKS cluster depends on the configuration and usage of its node pools throughout the month. Node pools can have a variable number of nodes over the course of a month due to auto-scaling or manual changes.

Worker nodes are built on Droplets and are charged per second at the [same price as Droplets](/products/droplets/details/#pricing). Billing starts when the node in the node pool is ready, even if it is unhealthy. We do not charge for created nodes that do not join the cluster.

At minimum, we charge node pools for 60 seconds of usage or $0.01 per node in the pool, whichever is greater. At most, we charge for 28 days of usage per month. If there are more than 28 days in the month, we charge for the 28 days (672 hours) with the highest usage, and don’t charge for any additional usage.

Click for more details and examples of node pool pricing.

*   **Worker nodes are charged per second**.
    
    For example, consider a cluster with:
    
    *   Three worker nodes that cost $100/month ($0.00004134/second)
    *   No autoscaling
    *   27 days, 1 hour, and 20 seconds (2,336,420 seconds) of usage
    
    The total cost would be 3 \* $0.00004134/second \* 2,336,420 seconds = $289.73.
    
*   **At minimum, we charge node pools for 60 seconds of usage or $0.01 per node in the pool, whichever is greater.** For node pools with varying number of nodes with different time spans, we aggregate the usage first.
    
    For example, if a worker pool has 3 nodes with 20 seconds of usage each earlier in the month, then 15 seconds of usage later in the month, the aggregate usage is 35 seconds. For billing, we round this usage up to 60 seconds. If that results in a bill of less than $0.03 ($0.01 per node), we round the bill up to $0.03.
    
*   **At most, we charge node pools for 28 days of usage per month**. If there are more than 28 days in the month, we charge for the 28 days (672 hours) with the highest usage, and don’t charge for any additional usage.
    
    For example, consider a cluster that:
    
    *   Runs continuously through a month with 31 days (744 hours)
        
    *   Has a node pool that varies between 10 and 25 nodes
        
    *   Uses worker nodes that cost $100/month ($0.00004134/second)
        
    
    A node pool’s fixed size over a time is called a _span_. To calculate the total cost, we aggregate node pool spans with the same number of nodes over the month, and sort in descending order:
    
    Number of Nodes
    
    Node Span (Hours)
    
    Span Cost
    
    25
    
    100
    
    $0.00004134 \* 25 \* 100 \* 3600 seconds = $372.06
    
    20
    
    100
    
    $0.00004134 \* 20 \* 100 \* 3600 seconds = $297.65
    
    15
    
    100
    
    $0.00004134 \* 15 \* 100 \* 3600 seconds = $223.24
    
    15
    
    100
    
    $0.00004134 \* 15 \* 100 \* 3600 seconds = $223.24
    
    15
    
    100
    
    $0.00004134 \* 15 \* 100 \* 3600 seconds = $223.24
    
    10
    
    100
    
    $0.00004134 \* 10 \* 100 \* 3600 seconds = $148.82
    
    10
    
    100
    
    $0.00004134 \* 10 \* 72 \* 3600 seconds = $107.15  
    _Reached billing cap of 672 hours. No billing for 28 hours in span._
    
    10
    
    44
    
    _No billing for 44 hours in span._
    
    The 672 hours billing cap is reached in the second span with 10 nodes. While the usage is for a total of 744 hours (31 days), we bill you only for 672 hours (28 days). Thus, the total node pool cost is $372.06 + $297.65 + $223.20 + $223.24 + $223.24 + $148.82 + $107.15 = $1595.28.
    

### GPU Worker Nodes[](#gpu-worker-nodes)

[GPU worker nodes](/products/kubernetes/details/supported-gpus/) are priced per second at the same price as the GPU Droplets. To reserve H100 GPUs or get contract pricing, contact your sales representative or Customer Success Manager, or request using the [H100 GPU Worker Nodes form](https://anchor.digitalocean.com/H100WorkerNodes_DOKS.html).

## Control Plane and High Availability[](#control-plane-and-high-availability)

The control plane is fully managed by DigitalOcean and included at no cost.

[High availability (HA) for the control plane](/products/kubernetes/how-to/create-clusters/#choose-cluster-capacity) costs $40.00 per month, prorated hourly.

## Surge Upgrades[](#surge-upgrades)

[Surge upgrades](/products/kubernetes/how-to/upgrade-cluster/#surge-upgrades), which create duplicate nodes during upgrades, are available at no additional cost.

## Integration with Other DigitalOcean Products[](#integration-with-other-digitalocean-products)

[Integration with DigitalOcean Load Balancers](/products/kubernetes/how-to/add-load-balancers/) is charged at [the same rate as DigitalOcean Load Balancers](/products/networking/load-balancers/details/pricing/).

[Integration with volumes](/products/kubernetes/how-to/add-volumes/) is charged at [the same rate as volumes](/products/volumes/details/pricing/).

[Integration with NFS shared storage](/products/kubernetes/how-to/use-nfs-storage/) is charged at [the same rate as DigitalOcean NFS](/products/nfs/details/pricing/).

## Bandwidth[](#bandwidth)

DOKS clusters accrue free bandwidth based on the worker pool’s largest sizes within 28 days of usage.

For example, if your worker pool has Droplets with a monthly bandwidth quota of 5TB, then you accrue free bandwidth at the rate of `5TiB/(24*28) * worker_pool_size = 7.44 GiB/hr * worker_pool_size`. For autoscaling clusters, the size of the worker pools vary.

In this article...

*   [Node Pools](#node-pools)
    *   [GPU Worker Nodes](#gpu-worker-nodes)
*   [Control Plane and High Availability](#control-plane-and-high-availability)
*   [Surge Upgrades](#surge-upgrades)
*   [Integration with Other DigitalOcean Products](#integration-with-other-digitalocean-products)
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

Try using different keywords or simplifying your 
