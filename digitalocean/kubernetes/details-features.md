---
source: https://docs.digitalocean.com/products/kubernetes/details/features/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                Kubernetes Features | DigitalOcean Documentation

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
*   Features

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Kubernetes Features

Validated on 11 Dec 2024 • Last edited on 10 Nov 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

[Kubernetes](https://kubernetes.io/) is an open-source system for managing containerized applications in a clustered environment. Its focus is to improve how you manage related, distributed components and services across varied infrastructure.

DigitalOcean Kubernetes is a managed Kubernetes service lets you deploy scalable and secure Kubernetes clusters without the complexities of administrating the [control plane](https://kubernetes.io/docs/concepts/overview/components/). We manage the Kubernetes control plane and the underlying containerized infrastructure.

[](/products/kubernetes/details/managed/)

![](https://docs.digitalocean.com/images/icons/kubernetes.svg)

The Managed Elements of DigitalOcean Kubernetes

DigitalOcean Kubernetes provides administrator access to the cluster and full access to the Kubernetes API with no restrictions on which API objects you can create. We manage key services and settings on your behalf that you cannot or should not modify.

You retain full access to the cluster with existing toolchains. You have cluster-level administrative rights to create and delete any Kubernetes API objects through the [DigitalOcean API](https://developers.digitalocean.com/documentation/v2/#kubernetes) and [doctl](https://github.com/digitalocean/doctl#doctl---).

There are no restrictions on the API objects you can create as long as the underlying Kubernetes version supports them. We offer the latest version of Kubernetes as well as earlier patch levels of the latest minor version for special use cases. You can also install popular tools like Helm, metrics-server, and Istio.

We only support features that are in a beta and general availability stage in upstream Kubernetes. See the [Kubernetes documentation](https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/) to check which feature is in the alpha, beta or general availability stage.

For updates on DOKS’s latest features and integrations, see the [DOKS release notes](/release-notes/kubernetes/). For a full list of changes for each available version of Kubernetes, including updates to the backend, API, and system components, see the [DOKS changelog](/products/kubernetes/details/changelog/).

## GPU Observability in DOKS[](#gpu-observability-in-doks)

Note

GPU observability in DOKS is supported on Kubernetes 1.33.1-do.5 or higher and is available for GPU node pools created with AI/ML Ready images.

GPU observability in DOKS provides the same metric coverage as GPU Droplets and supports all GPU models that offer GPU observability in Droplets, including NVIDIA H100, NVIDIA H200, AMD MI300, and AMD MI325.

GPU Observability extends DigitalOcean Insights to display GPU-level metrics for DOKS clusters that include GPU node pools created with AI/ML Ready images for AMD and NVIDIA GPUs. It provides a monitoring experience for GPU workloads, so you can track utilization, temperature, memory usage, and performance directly in the **Insights** tab.

`do-agent` automatically detects the GPU type on each node and enables the correct exporter (`DCGM` for NVIDIA GPUs or `ROCm` for AMD GPUs). Metrics are collected locally on each GPU worker node.

GPU Observability is available on DOKS 1.33.1-do.5 or higher and is automatically enabled when you select **Improved metrics and monitoring** during cluster creation.

For security, GPU exporters listen only on `127.0.0.1` to prevent external access.

## Conformance Certification[](#conformance-certification)

DOKS conforms to [the Cloud Native Computing Foundation’s Kubernetes Software Conformance Certification program](https://github.com/cncf/k8s-conformance) and is proud to be a CNCF Certified Kubernetes product.

In addition, we run our own extended suite of end-to-end tests on every DOKS release to ensure stability, performance, and upgrade compatibility.

## Worker Nodes and Node Pools[](#worker-nodes-and-node-pools)

Worker nodes are built on Droplets and can be [shared or dedicated CPUs](/products/droplets/concepts/choosing-a-plan/#shared-vs-dedicated), and [GPUs](#gpu-worker-nodes). Unlike standalone Droplets, you manage worker nodes with the Kubernetes command-line client `kubectl` and cannot access them with SSH. On both the control plane and the worker nodes, DigitalOcean maintains the system updates, security patches, operating system configuration and installed packages.

All the worker nodes within a node pool have identical resources, but each node pool can have a different worker configuration. This lets you have different services on different node pools, where each pool has the RAM, CPU, and attached storage resources the service requires.

You can create and modify node pools at any time. Worker nodes are automatically deleted and recreated when needed, and you can manually recycle worker nodes. Nodes in the node pool inherit the node pool’s naming scheme when you first create a node pool, however, renaming a node pool does not rename the nodes. Nodes inherit the new naming scheme only when they are recycled or the node pool is resized, creating new nodes.

Kubernetes role-based access control (RBAC) is enabled by default. See [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) for details.

### Scale Up to 1000 Nodes Per Cluster[](#scale-up-to-1000-nodes-per-cluster)

For clusters with [VPC-native networking](#vpc-native-networking), you can scale up to 1000 worker nodes using the DigitalOcean API or CLI. To do this, use a custom pod overlay subnet with a `/15` network to support at least 1024 nodes. For more information, see [Create a Cluster with VPC-native Networking](/products/kubernetes/how-to/create-clusters/#create-a-cluster-with-vpc-native-networking).

## Persistent Data[](#persistent-data)

You can persist data in DigitalOcean Kubernetes clusters to [volumes](/products/kubernetes/how-to/add-volumes/) and [NFS shared storage](/products/kubernetes/how-to/use-nfs-storage/). We do not recommend using HostPath volumes because nodes are frequently replaced and all data stored on the nodes are lost.

You can also use DigitalOcean object storage by using the [Spaces API](/reference/api/#spaces) to interact with Spaces from within your application.

## Load Balancing[](#load-balancing)

The [DigitalOcean Kubernetes Cloud Controller](https://github.com/digitalocean/digitalocean-cloud-controller-manager) supports [provisioning DigitalOcean Load Balancers](/products/kubernetes/how-to/add-load-balancers/).

## VPC Networks[](#vpc-networks)

Clusters are added to a [VPC network](/products/networking/vpc/) for the datacenter region by default. This keeps traffic between clusters and other applicable resources from being routed outside the datacenter over the public internet.

[Cluster networking](https://kubernetes.io/docs/concepts/cluster-administration/networking/) is preconfigured with [Cilium](https://github.com/cilium/cilium/). Overlay networking is preconfigured with [Cilium](https://github.com/cilium/cilium) and supports [network policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/).

## VPC-Native Networking[](#vpc-native-networking)

VPC-native cluster networking allows you to route traffic directly between pods and other resources on [VPC networks](/products/networking/vpc/) such as Droplets and managed databases. You can also expose Kubernetes services to the VPC network using [internal load balancers](/products/kubernetes/how-to/configure-load-balancers/#internal-load-balancer).

We have enabled the [Gateway API](https://gateway-api.sigs.k8s.io/) by default on clusters with [VPC-native networking](/products/kubernetes/details/features/#vpc-native-networking) running on Kubernetes version 1.33 or higher. This feature is in [public preview](/platform/product-lifecycle/#public-preview).

VPC-native networking is available on Kubernetes version 1.31 and later, using Cilium’s full kube-proxy replacement based on eBPF. Cluster-internal services function the same as traditional clusters, but are fully managed by eBPF instead of kube-proxy.

In traditional DOKS clusters, nodes are added to a VPC network, but pods and services operate on a separate virtual network. As a result, pods and services cannot communicate directly with resources in the VPC or peered VPCs and require a network translation step that can introduce inefficiencies or inconvenience.

When creating VPC-native clusters, you provide two additional subnet ranges that are used for pod and service networking. These subnet ranges must not overlap with each other or with any VPCs or VPC-native clusters on the team. With these subnets, VPC-native clusters enable transparent communication between the pod network and other peered VPC networks, including the node VPC, without requiring network translation.

You cannot convert existing clusters to use VPC-native because Kubernetes does not support changing the networking stack of a running cluster.

## Tags[](#tags)

Clusters are automatically tagged with `k8s` and the specific cluster ID, like `k8s:EXAMPLEc-3515-4a0c-91a3-2452eEXAMPLE`. Worker nodes are additionally tagged with `k8s:worker`.

You can add custom tags to a cluster and its node pools. Any custom tags added to worker nodes in a node pool (for example, from the [Droplets page](https://cloud.digitalocean.com/droplets/)), are deleted to maintain consistency between the node pool and its worker nodes.

In this article...

*   [GPU Observability in DOKS](#gpu-observability-in-doks)
*   [Conformance Certification](#conformance-certification)
*   [Worker Nodes and Node Pools](#worker-nodes-and-node-pools)
    *   [Scale Up to 1000 Nodes Per Cluster](#scale-up-to-1000-nodes-per-cluster)
*   [Persistent Data](#persistent-data)
*   [Load Balancing](#load-balancing)
*   [VPC Networks](#vpc-networks)
*   [VPC-Native Networking](#vpc-native-networking)
*   [Tags](#tags)

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
