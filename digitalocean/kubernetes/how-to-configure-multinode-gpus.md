---
source: https://docs.digitalocean.com/products/kubernetes/how-to/configure-multinode-gpus/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Configure Networking for Multi-Node GPU Worker Nodes | DigitalOcean Documentation

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
*   Configure Multi-Node GPU Nodes

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Configure Networking for Multi-Node GPU Worker Nodes

Validated on 7 Nov 2025 • Last edited on 5 Dec 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

Multi-node GPU clusters can only be created in multiples of 8 GPUs and are available [by contract only](https://www.digitalocean.com/company/contact/sales). For more information on supported GPUs, see [GPU Worker Nodes](/products/kubernetes/details/supported-gpus/).

In a multi-node configuration, 8-GPU configurations are connected via a dedicated high-speed networking fabric in the DOKS cluster. The networking fabric is exposed on worker nodes through eight network interface controllers (NICs) named `fabric0, fabric1, …, fabric7`, which exist alongside the regular `eth0` and `eth1` interfaces. The `eth0` interface provides public internet connectivity, and `eth1` provides private connectivity to other nodes in the same VPC network. The fabric NICs enable AI/ML workloads to exchange data with very low latency and high throughput. To achieve high networking performance, we recommend using the Remote Direct Memory Access (RDMA) networking protocol for communication between the GPU nodes through the fabric NICs, which completely bypasses the CPU and kernel of the operating system for data transfer.

Additional plugins are required to enable the high-speed fabric for multi-node GPU networking. This guide covers the additional required components and how to configure them.

## Required Plugins[](#required-plugins)

To use the high-speed fabric with container-based workloads, the following Kubernetes plugins must be available on clusters with AMD or NVIDIA GPUs:

*   [Mellanox k8s-rdma-shared-dev-plugin](https://github.com/Mellanox/k8s-rdma-shared-dev-plugin): This plugin is automatically installed in your DOKS cluster when you add a node pool with a fabric-connected slug. It exposes RDMA-related resources as Kubernetes resources, named `rdma/fabric0, rdma/fabric1, rdma/fabric2, …, rdma/fabric7`. You can [manage these resources using resource requests and limits](#manage-rdma-related-resources) in your manifests.
    
*   [Multus CNI plugin](https://github.com/k8snetworkplumbingwg/multus-cni): You must install this plugin manually. It moves the NICs `fabric0, fabric1,..., fabric7` into the container namespace via the `host-device` plugin. To install the plougin, run the following command:
    

    kubectl apply -f https://raw.githubusercontent.com/k8snetworkplumbingwg/multus-cni/master/deployments/multus-daemonset-thick.yml

Note

Regular public and private communication in the clusters via `eth0` and `eth1` are not affected by the installation of the Multus CNI and continue to use [Cilium](https://github.com/cilium/cilium/).

After installing the CNI plugin, create `NetworkAttachmentDefinition` resources for the fabric NICs as described in the [Configure Multus CNI Plugin](#configure-multus-cni-plugin) section below.

## Manage RDMA-Related Resources[](#manage-rdma-related-resources)

Expose the RDMA-related resources managed by the Mellanox k8s-rdma-shared-dev-plugin to your workloads. To do this for AMD GPU nodes, add the following [resource requests and limits](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) to your Pod or Deployment manifest:

    resources:
      requests:
        amd.com/gpu: 8
        rdma/fabric0: 1
        rdma/fabric1: 1
        rdma/fabric2: 1
        rdma/fabric3: 1
        rdma/fabric4: 1
        rdma/fabric5: 1
        rdma/fabric6: 1
        rdma/fabric7: 1
      limits:
        amd.com/gpu: 8
        rdma/fabric0: 1
        rdma/fabric1: 1
        rdma/fabric2: 1
        rdma/fabric3: 1
        rdma/fabric4: 1
        rdma/fabric5: 1
        rdma/fabric6: 1
        rdma/fabric7: 1

For NVIDIA GPU nodes, replace `amd.com/gpu: 8` with `nvidia.com/gpu: 8`.

## Configure Multus CNI Plugin[](#configure-multus-cni-plugin)

In addition to the RDMA-related resources, you must make the fabric NICs `fabric0, fabric1, ..., fabric7` available to your containers. To do this, configure a set of `NetworkAttachmentDefinition` resources that use the `host-device` CNI plugin to expose each NIC.

Create a config file that contains the following fabric NICs:

    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: roce-net-fabric0
    spec:
      config: '{
          "cniVersion": "0.3.1",
          "type": "host-device",
          "device": "fabric0"
        }'
    ---
    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: roce-net-fabric1
    spec:
      config: '{
          "cniVersion": "0.3.1",
          "type": "host-device",
          "device": "fabric1"
        }'
    ---
    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: roce-net-fabric2
    spec:
      config: '{
          "cniVersion": "0.3.1",
          "type": "host-device",
          "device": "fabric2"
        }'
    ---
    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: roce-net-fabric3
    spec:
      config: '{
          "cniVersion": "0.3.1",
          "type": "host-device",
          "device": "fabric3"
        }'
    ---
    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: roce-net-fabric4
    spec:
      config: '{
          "cniVersion": "0.3.1",
          "type": "host-device",
          "device": "fabric4"
        }'
    ---
    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: roce-net-fabric5
    spec:
      config: '{
          "cniVersion": "0.3.1",
          "type": "host-device",
          "device": "fabric5"
        }'
    ---
    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: roce-net-fabric6
    spec:
      config: '{
          "cniVersion": "0.3.1",
          "type": "host-device",
          "device": "fabric6"
        }'
    ---
    apiVersion: "k8s.cni.cncf.io/v1"
    kind: NetworkAttachmentDefinition
    metadata:
      name: roce-net-fabric7
    spec:
      config: '{
          "cniVersion": "0.3.1",
          "type": "host-device",
          "device": "fabric7"
        }'

Install the resources in your desired namespace using the following command:

    kubectl apply -f <your-manifest>.yaml --namespace=<your-namespace>

Next, make the fabric NICs available in your containers by adding an annotation to your Pod or Deployment manifest:

    metadata:
      annotations:
        k8s.v1.cni.cncf.io/networks: >-
          roce-net-fabric0@fabric0,
          roce-net-fabric1@fabric1,
          roce-net-fabric2@fabric2,
          roce-net-fabric3@fabric3,
          roce-net-fabric4@fabric4,
          roce-net-fabric5@fabric5,
          roce-net-fabric6@fabric6,
          roce-net-fabric7@fabric7

Use `kubectl apply` to apply the updates.

You can also reference `NetworkAttachmentDefinition` from another namespace by using the namespace resource name in the annotation (for example, `custom-namespace/roce-net-fabric0@fabric0`). Each fabric NIC can only be attached to a single container at a time.

Once the `fabric0, fabric1, ..., fabric7` NICs are available in the containers, high-speed networking using RDMA is enabled between the GPU nodes.

In this article...

*   [Required Plugins](#required-plugins)
*   [Manage RDMA-Related Resources](#manage-rdma-related-resources)
*   [Configure Multus CNI Plugin](#configure-multus-cni-plugin)

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
