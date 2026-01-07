---
source: https://docs.digitalocean.com/products/kubernetes/concepts/choosing-a-plan/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                Choosing the Right Kubernetes Plan | DigitalOcean Documentation

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

*   [Concepts](/products/kubernetes/concepts/) 
*   Choosing a Plan

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Choosing the Right Kubernetes Plan

Validated on 1 Jun 2022 • Last edited on 22 Jul 2024

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

Choosing the right Kubernetes plan highly depends on your workload. An oversized cluster underuses its resources and costs more, but an undersized cluster running at full CPU or memory suffers from degraded performance or errors.

This guide covers the following topics:

*   How to select node [machine type](#select-machine-type)
*   How to select node [size and count](#select-node-size-and-count)
*   How to [make a data-driven decision](#make-a-data-driven-decision)

After creation, you can always [resize a Kubernetes cluster](/products/kubernetes/getting-started/quickstart/#edit-nodes-and-node-pools-for-an-existing-cluster) to a different plan. For a full list of plans and prices, see [the cluster pricing page](https://www.digitalocean.com/pricing/kubernetes).

If this is your first time testing out Kubernetes, see our [Build and Deploy Your First Image to Your First Cluster](/products/kubernetes/getting-started/deploy-image-to-cluster/) tutorial.

## Select Machine Type[](#select-machine-type)

Nodes are built on Droplets. You can choose from among the following Droplet plans for your node’s machine type:

Machine Type

CPU

vCPUs

Memory

Common Uses

_Basic (Regular and Premium)_

Shared

1 - 8

1 - 16 GB RAM

Testing, Low-Traffic Servers

_General Purpose_

Dedicated

2 - 40

8 - 160 GB RAM  
4 GB RAM / vCPU

Medium to High-Traffic Servers

_CPU-Optimized_

Dedicated

2 - 48

4 - 96 GB  
2 GB RAM / vCPU

CI/CD, Video Encoding, Batch Processing

_Memory-Optimized_

Dedicated

2 - 32

16 - 256 GB RAM  
8 GB RAM / vCPU

High-Performing Databases, Caches, Indexing

_Storage-Optimized_

Dedicated

2 - 32

16 - 256 GB RAM  
8 GB RAM / vCPU  
150 - 225 GB SSD / vCPU

Data Storage, Monitoring, Analytics

All machine types, except the Basic nodes, are [dedicated CPU Droplets](/products/droplets/concepts/choosing-a-plan/#shared-vs-dedicated). For more details on these machine types and their compatibility with your workload, see the [respective Droplet plans](/products/droplets/concepts/choosing-a-plan/#droplet-plans).

## Select Node Size and Count[](#select-node-size-and-count)

Node size and count determine the overall CPU, RAM, and storage of your cluster. The better hardware a node has, the more pods can operate effectively within it before needing another node.

Node size determines the maximum amount of memory you can allocate to pods within it. For a full breakdown of memory available per pod, see the [allocatable memory table](/products/kubernetes/#allocatable-memory).

Because of this, we recommend using nodes with less than 2GB of allocatable memory only for development purposes and not production. For production clusters, we recommend sizing nodes large enough (2.5 GB or more) to absorb the workload of a down node.

Larger nodes are easier to manage, are more cost efficient, and can run more demanding applications; however, they also require more pod management and cause a larger impact if they fail. If you later [enable autoscaling](/products/kubernetes/how-to/autoscale/) for a node pool, DigitalOcean only adds and removes nodes of the chosen size, which results in larger spikes of both performance and cost.

## Make a Data-Driven Decision[](#make-a-data-driven-decision)

After creating a cluster, we recommend benchmarking and load testing your workload to see how it performs under simulated load. For bursty apps or batch jobs, look at resource usage when load is at its expected peak, especially when using shared CPU Basic nodes. If you notice that your app’s performance is too variable for your production needs, consider a machine type with dedicated vCPUs.

### CPU and RAM[](#cpu-and-ram)

Using [Kubernetes metrics](/products/kubernetes/how-to/monitor-basic/), you can get more information on your cluster’s CPU load and memory usage:

*   If your cluster has high CPU usage most of the time and also significant memory usage, consider scaling both vCPUs and memory and using balanced General Purpose nodes.
    
*   If your cluster has high CPU usage most of the time but very low memory usage, you might be able to save money with CPU-Optimized nodes.
    
*   If your cluster has high memory usage most of the time (potentially maxing out and swapping to disk) but low or moderate CPU usage, consider scaling memory and using Memory-Optimized nodes.
    
*   If your cluster has low to moderate CPU or memory usage most of the time but sometimes bursts up and hits resource limits, consider shared CPU Basic nodes and scale the limiting resource accordingly.
    

Note

While a Kubernetes cluster’s RAM tends to remain constant, its CPU tends to spike with high bursts of activity. For this reason, we recommend sizing your CPU to accommodate these spikes in your workload.

### Network[](#network)

Nodes include unlimited free inbound data transfer and some amount of free outbound data transfer, depending on the Droplet instance type and size. Depending on your workload type and bandwidth usage, you could scale your nodes to take advantage of additional free outbound data transfer. For example, streaming and video applications require more bandwidth and network capabilities.

### Disk[](#disk)

If you need additional storage, you can use network-attached [block storage](/products/kubernetes/how-to/add-volumes/) to attach additional volumes to a cluster.

In this article...

*   [Select Machine Type](#select-machine-type)
*   [Select Node Size and Count](#select-node-size-and-count)
*   [Make a Data-Driven Decision](#make-a-data-driven-decision)
    *   [CPU and RAM](#cpu-and-ram)
    *   [Network](#network)
    *   [Disk](#disk)

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
