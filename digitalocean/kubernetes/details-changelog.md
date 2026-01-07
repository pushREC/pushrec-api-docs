---
source: https://docs.digitalocean.com/products/kubernetes/details/changelog/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                DigitalOcean Kubernetes Changelog | DigitalOcean Documentation

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
*   Changelog

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DigitalOcean Kubernetes Changelog

Validated on 7 Sep 2022 • Last edited on 19 Nov 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

We offer the latest version of Kubernetes and earlier patch levels of the latest minor version. See [Supported Releases](/products/kubernetes/details/supported-releases/) to learn more about the release lifecycle.

This page lists notable changes for each available version of Kubernetes below, as well as archives of changes for [unavailable versions](#unavailable-versions). For updates on DOKS’s latest features and integrations, see the [DOKS release notes](/release-notes/kubernetes/) instead.

The system component versions specified below are valid at the time of the respective DOKS version release. Post-release, components are updated continuously as long as a DOKS version is supported. Patch versions of components, such as [Cilium](https://github.com/cilium/cilium) and [DO CSI](https://github.com/digitalocean/csi-digitalocean), are upgraded regularly for any supported DOKS version.

This page lists the following:

*   Notable changes for each available version of Kubernetes
    
*   Archives of changes for [unavailable versions](#unavailable-versions)
    
*   Updates to components that do not change for a given DOKS version, such as the Linux kernel and `containerd`
    
*   Updates to components for which we typically only update the major or minor version when releasing a DOKS version
    

For updates on DOKS’s latest features and integrations, see the [DOKS release notes](/release-notes/kubernetes/) instead.

## Available Versions[](#available-versions)

Version 1.34.x releases

### 1.34.1-do.2 (December 18, 2025)[](#1341-do2-december-18-2025)

*   Updates to system components:
    *   Changes to worker images:
        *   Prepare observability support with introduction of internal telemetry service.

### 1.34.1-do.1 (December 5, 2025)[](#1341-do1-december-5-2025)

*   Updates to system components:
    *   Changes to AMD GPU worker images:
        *   Added Pollara drivers [1.117.5-a-38](https://docs.amd.com/r/en-US/ug1801-ai-nic-pollara-400-ops-guide/AMD-AI-NIC-Pollara-400-Series-Introduction) for Mi350x multi-node support
        *   Downgraded `doca-roce` to version [2.9.3](https://docs.nvidia.com/doca/archive/2-9-3/index.html) (LTS) for compatibility with Pollara drivers

### 1.34.1-do.0 (November 19, 2025)[](#1341-do0-november-19-2025)

*   First 1.34.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.34.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.34.md#v1341)
    *   Updated to [Cilium 1.18](https://github.com/cilium/cilium/releases/tag/v1.18.3)
        *   Gateway API: Changed the `externalTrafficPolicy` for the underlying Kubernetes LoadBalancer service from `Local` to `Cluster`. See the [Cilium documentation](https://docs.cilium.io/en/v1.18/network/servicemesh/gateway-api/gateway-api/#externaltrafficpolicy-for-loadbalancer-or-nodeport-services) for details about this change.
    *   Updated to [DO CSI v4.15](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.15.0)
    *   Updated to [DO CCM v0.1.64](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.64)
    *   Updated worker node base image to [Debian GNU/Linux 13.1 (trixie)](https://www.debian.org/releases/trixie/) with kernel 6.12
    *   Updated to [ROCm 7.0.2](https://rocm.docs.amd.com/en/docs-7.0.2/about/release-notes.html)
    *   Updated to [AMD GPU Driver 30.10.2](https://instinct.docs.amd.com/projects/amdgpu-docs/en/latest/documentation/release-notes.html)

Version 1.33.x releases

### 1.33.6-do.2 (December 18, 2025)[](#1336-do2-december-18-2025)

*   Updates to system components:
    *   Changes to worker images:
        *   Prepare observability support with introduction of internal telemetry service.

### 1.33.6-do.1 (December 5, 2025)[](#1336-do1-december-5-2025)

*   Updates to system components:
    *   Changes to AMD GPU worker images:
        *   Downgraded `doca-roce` to version [2.9.3](https://docs.nvidia.com/doca/archive/2-9-3/index.html) (LTS) for consistency between DOKS versions (see [1.34.1-do.1 changelog](/products/kubernetes/details/changelog/1.34.1.do-1/))

### 1.33.6-do.0 (November 19, 2025)[](#1336-do0-november-19-2025)

*   Updates to system components:
    *   Updated to [Kubernetes v1.33.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1336).

### 1.33.1-do.5 (October 14, 2025)[](#1331-do5-october-14-2025)

*   Updates to system components:
    *   Updates to NVIDIA CUDA drivers, NVIDIA CUDA toolkit and added packages for multi-node support and metrics collection for NVIDIA GPU worker nodes:
        *   Updated `cuda-drivers` to [575.57.08-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-575-57-08/index.html)
        *   Updated `cuda-toolkit` to [13.0.1-1](https://developer.nvidia.com/cuda-toolkit-archive)
        *   Added `doca-roce` [3.1.0](https://docs.nvidia.com/doca/sdk/doca+release+notes/index.html) to enable high-performance internode communication for multi-node support
        *   Added `datacenter-gpu-manager` [4.4.1](https://docs.nvidia.com/datacenter/dcgm/latest/release-notes/changelog.html) to enable GPU metrics collection
    *   Added package for multi-node support for AMD GPU worker nodes:
        *   Added `doca-roce` [3.1.0](https://docs.nvidia.com/doca/sdk/doca+release+notes/index.html) to enable high-performance internode communication for multi-node support

### 1.33.1-do.4 (September 25, 2025)[](#1331-do4-september-25-2025)

*   Updates to system components:
    *   Integrate NVIDIA GPU device plugin [v0.17.3](https://github.com/NVIDIA/k8s-device-plugin/tree/v0.17.3) .
    *   Internal updates to the AMD GPU base image to improve resiliency of node bootstrapping.

### 1.33.1-do.3 (August 8, 2025)[](#1331-do3-august-8-2025)

*   Updates to system components:
    *   Updated ROCm to version [6.4.2](https://rocm.docs.amd.com/en/docs-6.4.2/about/release-notes.html)

### 1.33.1-do.2 (July 23, 2025)[](#1331-do2-july-23-2025)

*   Updates to system components:
    *   Updated nvidia-container-toolkit to [1.17.8-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)

### 1.33.1-do.1 (July 8, 2025)[](#1331-do1-july-8-2025)

*   Optimized Kubernetes worker images to reduce size and improve provisioning speed.
*   Updated resource constraints in preparation for new node sizes.

### 1.33.1-do.0 (June 16, 2025)[](#1331-do0-june-16-2025)

*   First 1.33.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.33.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1331)
    *   Updated to [Cilium 1.17](https://github.com/cilium/cilium/releases/tag/v1.17.4)
    *   Updated to [DO CSI v4.14](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.14.0)
    *   Updated to [DO CCM v0.1.61](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.61)
        *   Load balancer services now default to network load balancers (NLB) instead of regional load balancers. Use the `service.beta.kubernetes.io/do-loadbalancer-type` annotation with a value of `REGIONAL` or `REGIONAL_NETWORK` to change the load balancer type.
*   For [VPC-native networking](/products/kubernetes/details/features/#vpc-native-networking) only:
    *   Enabled the [Gateway API](https://gateway-api.sigs.k8s.io/) by default. This feature is in [public preview](/platform/product-lifecycle/#public-preview).

Version 1.32.x releases

### 1.32.10-do.2 (December 18, 2025)[](#13210-do2-december-18-2025)

*   Updates to system components:
    *   Changes to worker images:
        *   Prepare observability support with introduction of internal telemetry service.

### 1.32.10-do.1 (December 5, 2025)[](#13210-do1-december-5-2025)

*   Updates to system components:
    *   Changes to AMD GPU worker images:
        *   Downgraded `doca-roce` to version [2.9.3](https://docs.nvidia.com/doca/archive/2-9-3/index.html) (LTS) for consistency between DOKS versions (see [1.34.1-do.1 changelog](/products/kubernetes/details/changelog/1.34.1.do-1/))

### 1.32.10-do.0 (November 19, 2025)[](#13210-do0-november-19-2025)

*   Updates to system components:
    *   Updated to [Kubernetes v1.32.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v13210).

### 1.32.5-do.5 (October 14, 2025)[](#1325-do5-october-14-2025)

*   Updates to system components:
    *   Updates to NVIDIA CUDA drivers, NVIDIA CUDA toolkit and added packages for multi-node support and metrics collection for NVIDIA GPU worker nodes:
        *   Updated `cuda-drivers` to [575.57.08-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-575-57-08/index.html)
        *   Updated `cuda-toolkit` to [13.0.1-1](https://developer.nvidia.com/cuda-toolkit-archive)
        *   Added `doca-roce` [3.1.0](https://docs.nvidia.com/doca/sdk/doca+release+notes/index.html) to enable high-performance internode communication for multi-node support
        *   Added `datacenter-gpu-manager` [4.4.1](https://docs.nvidia.com/datacenter/dcgm/latest/release-notes/changelog.html) to enable GPU metrics collection
    *   Added package for multi-node support for AMD GPU worker nodes:
        *   Added `doca-roce` [3.1.0](https://docs.nvidia.com/doca/sdk/doca+release+notes/index.html) to enable high-performance internode communication for multi-node support

### 1.32.5-do.4 (September 25, 2025)[](#1325-do4-september-25-2025)

*   Updates to system components:
    *   Integrate NVIDIA GPU device plugin [v0.17.3](https://github.com/NVIDIA/k8s-device-plugin/tree/v0.17.3).
    *   Internal updates to the AMD GPU base image to improve resiliency of node bootstrapping.

### 1.32.5-do.3 (August 8, 2025)[](#1325-do3-august-8-2025)

*   Updates to system components:
    *   Updated ROCm to version [6.4.2](https://rocm.docs.amd.com/en/docs-6.4.2/about/release-notes.html)

### 1.32.5-do.2 (July 23, 2025)[](#1325-do2-july-23-2025)

*   Updates to system components:
    *   Updated nvidia-container-toolkit to [1.17.8-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)

### 1.32.5-do.1 (July 8, 2025)[](#1325-do1-july-8-2025)

*   Optimized Kubernetes worker images to reduce size and improve provisioning speed.
*   Updated resource constraints in preparation for new node sizes.

### 1.32.5-do.0 (June 16, 2025)[](#1325-do0-june-16-2025)

*   Updates to system components:
    *   Updated to [Kubernetes v1.32.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1325).

### 1.32.2-do.3 (June 4, 2025)[](#1322-do3-june-4-2025)

*   Fix race condition to prevent anchor IP from appearing on multiple NICs.
*   Prepare worker image for upcoming AMD GPU droplets. Changes apply to upcoming AMD GPU droplets only.
    *   Install [amdgpu version 6.12.12](https://instinct.docs.amd.com/projects/amdgpu-docs/en/latest/index.html)
    *   Install [ROCm version 6.4.1](https://rocm.docs.amd.com/en/docs-6.4.1/about/release-notes.html)

### 1.32.2-do.2 (June 3, 2025)[](#1322-do2-june-3-2025)

*   Updated resource constraints in preparation for new node sizes.

### 1.32.2-do.1 (May 8, 2025)[](#1322-do1-may-8-2025)

*   Updates to system components:
    *   Updates to the routing-agent component including a broad toleration and bug fixes when used with network load balancers
    *   Updates to NVIDIA CUDA drivers, NVIDIA CUDA toolkit and NVIDIA container toolkit package versions for GPU worker nodes:
        *   Updated `cuda-drivers` to [550.163.01-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-163-01/index.html)
        *   Updated `cuda-toolkit` to [12.9.0-1](https://developer.nvidia.com/cuda-toolkit-archive)
        *   Updated `nvidia-container-toolkit` to [1.17.6-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)

### 1.32.2-do.0 (March 6, 2025)[](#1322-do0-march-6-2025)

*   Updates to system components:
    *   Internal updates to the base image to improve resiliency of node bootstrapping.
    *   Updated to [Kubernetes v1.32.2](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322).

### 1.32.1-do.0 (February 6, 2025)[](#1321-do0-february-6-2025)

*   First 1.32.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.32.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1321)
    *   Updated to [cluster-autoscaler v1.32](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.32.0)
    *   Updated to Linux kernel 6.1.123
    *   Updated to [Cilium 1.16](https://github.com/cilium/cilium/releases/tag/v1.16.6)
    *   Updated to [DO CSI v4.13](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.13.0)
    *   Updates to NVIDIA CUDA drivers and NVIDIA container toolkit package versions for GPU worker nodes:
        *   Updated `cuda-drivers` to [550.144.03-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-144-03/index.html)
        *   Updated `nvidia-container-toolkit` to [1.17.4-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)
*   Changes to system components:
    *   Create a separate network interface for the [anchor IP](https://docs.digitalocean.com/products/networking/reserved-ips/how-to/find-anchor-ips/) on worker nodes. If you have set up any custom routing with anchor IPs, test it with the new version before upgrading.
    *   For [VPC-native](https://docs.digitalocean.com/products/kubernetes/how-to/create-clusters/#create-a-cluster-with-vpc-native-networking) clusters only:
        *   Enable Cilium bandwidth manager and TCP [BBR (Bottleneck Bandwidth and Round-trip propagation time) congestion control algorithm](https://isovalent.com/blog/post/accelerate-network-performance-with-cilium-bbr/).
        *   Enable [Maglev’s consistent hashing algorithm](https://cilium.io/blog/2020/11/10/cilium-19/#maglev) for backend selection of load balancers.

## Unavailable Versions[](#unavailable-versions)

These versions are no longer available for creation.

Version 1.31.x releases

### 1.31.9-do.5 (October 14, 2025)[](#1319-do5-october-14-2025)

*   Updates to system components:
    *   Updates to NVIDIA CUDA drivers, NVIDIA CUDA toolkit and added packages for multi-node support and metrics collection for NVIDIA GPU worker nodes:
        *   Updated `cuda-drivers` to [575.57.08-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-575-57-08/index.html)
        *   Updated `cuda-toolkit` to [13.0.1-1](https://developer.nvidia.com/cuda-toolkit-archive)
        *   Added `doca-roce` [3.1.0](https://docs.nvidia.com/doca/sdk/doca+release+notes/index.html) to enable high-performance internode communication for multi-node support
        *   Added `datacenter-gpu-manager` [4.4.1](https://docs.nvidia.com/datacenter/dcgm/latest/release-notes/changelog.html) to enable GPU metrics collection
    *   Added package for multi-node support for AMD GPU worker nodes:
        *   Added `doca-roce` [3.1.0](https://docs.nvidia.com/doca/sdk/doca+release+notes/index.html) to enable high-performance internode communication for multi-node support

### 1.31.9-do.4 (September 25, 2025)[](#1319-do4-september-25-2025)

*   Updates to system components:
    *   Integrate NVIDIA GPU device plugin [v0.17.3](https://github.com/NVIDIA/k8s-device-plugin/tree/v0.17.3).
    *   Internal updates to the AMD GPU base image to improve resiliency of node bootstrapping.

### 1.31.9-do.3 (August 8, 2025)[](#1319-do3-august-8-2025)

*   Updates to system components:
    *   Updated ROCm to version [6.4.2](https://rocm.docs.amd.com/en/docs-6.4.2/about/release-notes.html)

### 1.31.9-do.2 (July 23, 2025)[](#1319-do2-july-23-2025)

*   Updates to system components:
    *   Updated nvidia-container-toolkit to [1.17.8-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)

### 1.31.9-do.1 (July 8, 2025)[](#1319-do1-july-8-2025)

*   Optimized Kubernetes worker images to reduce size and improve provisioning speed.
*   Updated resource constraints in preparation for new node sizes.

### 1.31.9-do.0 (June 16, 2025)[](#1319-do0-june-16-2025)

*   Updates to system components:
    *   Updated to [Kubernetes v1.31.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1319).

### 1.31.6-do.3 (June 4, 2025)[](#1316-do3-june-4-2025)

*   Fix race condition to prevent anchor IP from appearing on multiple NICs.
*   Prepare worker image for upcoming AMD GPU droplets. Changes apply to upcoming AMD GPU droplets only.
    *   Install [amdgpu version 6.12.12](https://instinct.docs.amd.com/projects/amdgpu-docs/en/latest/index.html)
    *   Install [ROCm version 6.4.1](https://rocm.docs.amd.com/en/docs-6.4.1/about/release-notes.html)

### 1.31.6-do.2 (June 3, 2025)[](#1316-do2-june-3-2025)

*   Updated resource constraints in preparation for new node sizes.

### 1.31.6-do.1 (May 8, 2025)[](#1316-do1-may-8-2025)

*   Updates to system components:
    *   Updates to the routing-agent component including a broad toleration and bug fixes when used with network load balancers
    *   Updates to NVIDIA CUDA drivers, NVIDIA CUDA toolkit and NVIDIA container toolkit package versions for GPU worker nodes:
        *   Updated `cuda-drivers` to [550.163.01-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-163-01/index.html)
        *   Updated `cuda-toolkit` to [12.9.0-1](https://developer.nvidia.com/cuda-toolkit-archive)
        *   Updated `nvidia-container-toolkit` to [1.17.6-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)

### 1.31.6-do.0 (March 6, 2025)[](#1316-do0-march-6-2025)

*   Updates to system components:
    *   Internal updates to the base image to improve resiliency of node bootstrapping.
    *   Updated to [Kubernetes v1.31.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316).

### 1.31.5-do.0 (February 6, 2025)[](#1315-do0-february-6-2025)

*   Updates to system components:
    *   Updated to [Kubernetes v1.31.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
    *   Updated to Linux kernel 6.1.123
    *   Updated to [Cilium 1.15.12](https://github.com/cilium/cilium/releases/tag/v1.15.12)
    *   Updates to NVIDIA CUDA drivers and NVIDIA container toolkit package versions for GPU worker nodes:
        *   Updated `cuda-drivers` to [550.144.03-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-144-03/index.html)
        *   Updated `nvidia-container-toolkit` to [1.17.4-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)

### 1.31.1-do.5 (November 21, 2024)[](#1311-do5-november-21-2024)

*   Internal updates to the base image.

### 1.31.1-do.4 (November 7, 2024)[](#1311-do4-november-7-2024)

*   Upgrades to NVIDIA CUDA drivers and NVIDIA CUDA toolkit package versions for GPU worker nodes:
    *   Updated `cuda-drivers` to [550.127.05-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-127-05/index.html)
    *   Updated `cuda-toolkit` to [12.6.2-1](https://developer.nvidia.com/cuda-12-6-2-download-archive)
    *   Updated `nvidia-container-toolkit` to [1.17.0-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html) to address [CVE-2024-0134](https://security-tracker.debian.org/tracker/CVE-2024-0134)

### 1.31.1-do.3 (October 10, 2024)[](#1311-do3-october-10-2024)

*   Addressed issue with `nvidia` driver installation on GPU worker nodes.

### 1.31.1-do.2 (October 7, 2024)[](#1311-do2-october-7-2024)

*   Internal updates to the base image.

### 1.31.1-do.1 (September 30, 2024)[](#1311-do1-september-30-2024)

*   Rebuilt the Debian base image for GPU worker nodes with `nvidia-container-toolkit` version 1.16.2-1 to address [CVE-2024-0132](https://security-tracker.debian.org/tracker/CVE-2024-0132).

### 1.31.1-do.0 (September 13, 2024)[](#1311-do0-september-13-2024)

*   First 1.31.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.31.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1311)
    *   Updated to [cluster-autoscaler v1.31](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.31.0)
    *   Updated to Linux kernel 6.1.106
    *   Updated to [Cilium 1.15](https://github.com/cilium/cilium/releases/tag/v1.15.8)
    *   Updated to [DO CSI v4.12](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.12.0)
*   Changes to system components:
    *   Removed Docker from the nodes. containerd replaced Docker as the runtime in [DigitalOcean Kubernetes 1.20](https://docs.digitalocean.com/products/kubernetes/details/changelog/#1-20-x), but remained installed on the worker nodes. It is no longer installed starting with DigitalOcean Kubernetes 1.31.

Version 1.30.x releases

### 1.30.13-do.0 (June 16, 2025)[](#13013-do0-june-16-2025)

*   Updates to system components:
    *   Updated to [Kubernetes v1.30.13](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13013).

### 1.30.10-do.3 (June 4, 2025)[](#13010-do3-june-4-2025)

*   Fix race condition to prevent anchor IP from appearing on multiple NICs.
*   Prepare worker image for upcoming AMD GPU droplets. Changes apply to upcoming AMD GPU droplets only.
    *   Install [AMDGPU driver version 6.12.12](https://instinct.docs.amd.com/projects/amdgpu-docs/en/latest/index.html)
    *   Install [ROCm version 6.4.1](https://rocm.docs.amd.com/en/docs-6.4.1/about/release-notes.html)

### 1.30.10-do.2 (June 3, 2025)[](#13010-do2-june-3-2025)

*   Updated resource constraints in preparation for new node sizes.

### 1.30.10-do.1 (May 8, 2025)[](#13010-do1-may-8-2025)

*   Updates to system components:
    *   Updates to the routing-agent component including a broad toleration and bug fixes when used with network load balancers
    *   Updates to NVIDIA CUDA drivers, NVIDIA CUDA toolkit and NVIDIA container toolkit package versions for GPU worker nodes:
        *   Updated `cuda-drivers` to [550.163.01-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-163-01/index.html)
        *   Updated `cuda-toolkit` to [12.9.0-1](https://developer.nvidia.com/cuda-toolkit-archive)
        *   Updated `nvidia-container-toolkit` to [1.17.6-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)

### 1.30.10-do.0 (March 6, 2025)[](#13010-do0-march-6-2025)

*   Updates to system components:
    *   Internal updates to the base image to improve resiliency of node bootstrapping.
    *   Updated to [Kubernetes v1.30.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010).

### 1.30.9-do.0 (February 6, 2025)[](#1309-do0-february-6-2025)

*   Updates to system components:
    *   Updated to [Kubernetes v1.30.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
    *   Updated to Linux kernel 6.1.123
    *   Updated to [Cilium 1.14.18](https://github.com/cilium/cilium/releases/tag/v1.14.18)
    *   Updates to NVIDIA CUDA drivers and NVIDIA container toolkit package versions for GPU worker nodes:
        *   Updated `cuda-drivers` to [550.144.03-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-144-03/index.html)
        *   Updated `nvidia-container-toolkit` to [1.17.4-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)

### 1.30.5-do.5 (November 21, 2024)[](#1305-do5-november-21-2024)

*   Internal updates to the base image.

### 1.30.5-do.4 (November 7, 2024)[](#1305-do4-november-7-2024)

*   Upgrades to NVIDIA CUDA drivers and NVIDIA CUDA toolkit package versions for GPU worker nodes:
    *   Updated `cuda-drivers` to [550.127.05-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-127-05/index.html)
    *   Updated `cuda-toolkit` to [12.6.2-1](https://developer.nvidia.com/cuda-12-6-2-download-archive)
    *   Updated `nvidia-container-toolkit` to [1.17.0-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html) to address [CVE-2024-0134](https://security-tracker.debian.org/tracker/CVE-2024-0134)

### 1.30.5-do.3 (October 10, 2024)[](#1305-do3-october-10-2024)

*   Addressed issue with `nvidia` driver installation on GPU worker nodes.

### 1.30.5-do.2 (October 7, 2024)[](#1305-do2-october-7-2024)

*   Internal updates to the base image.

### 1.30.5-do.1 (September 30, 2024)[](#1305-do1-september-30-2024)

*   Rebuilt the Debian base image for GPU worker nodes with `nvidia-container-toolkit` version 1.16.2-1 to address [CVE-2024-0132](https://security-tracker.debian.org/tracker/CVE-2024-0132).

### 1.30.5-do.0 (September 13, 2024)[](#1305-do0-september-13-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.30.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
    *   Updated to Linux kernel 6.1.106

### 1.30.4-do.0 (August 28, 2024)[](#1304-do0-august-28-2024)

*   Install [NVIDIA CUDA drivers version 550.90.07](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-90-07/index.html) and [NVIDIA CUDA toolkit version 12.4.1](https://developer.nvidia.com/cuda-12-4-1-download-archive) (applies to [GPU Droplets support](/products/kubernetes/details/supported-gpus/))
*   Updates to system components:
    *   Updated to [Kubernetes v1.30.4](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1304)
    *   Updated to Linux kernel 6.1.99

### 1.30.2-do.0 (July 10, 2024)[](#1302-do0-july-10-2024)

*   Rebuilt the Debian base image with OpenSSH version 1:9.2p1-2+deb12u3 to address the `openssh` vulnerabilities [CVE-2024-6387](https://security-tracker.debian.org/tracker/CVE-2024-6387)
*   Updates to system components:
    *   Updated to [Kubernetes v1.30.2](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
    *   Updated to Linux kernel 6.1.94

### 1.30.1-do.0 (May 21, 2024)[](#1301-do0-may-21-2024)

*   First 1.30.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.30.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1301)
    *   Updated to [cluster-autoscaler v1.30](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.30.0)
    *   Updated to [containerd 1.6.31](https://github.com/containerd/containerd/releases/tag/v1.6.31)
    *   Updated to Linux kernel 6.1.90
    *   Updated [kubelet authorization mode](https://kubernetes.io/docs/reference/access-authn-authz/kubelet-authn-authz/#kubelet-authorization) to `Webhook`

Version 1.29.x releases

### 1.29.13-do.0 (February 6, 2025)[](#12913-do0-february-6-2025)

*   Updates to system components:
    *   Updated to [Kubernetes v1.29.13](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
    *   Updated to Linux kernel 6.1.123
    *   Updated to [Cilium 1.14.18](https://github.com/cilium/cilium/releases/tag/v1.14.18)
    *   Updates to NVIDIA CUDA drivers and NVIDIA container toolkit package versions for GPU worker nodes:
        *   Updated `cuda-drivers` to [550.144.03-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-144-03/index.html)
        *   Updated `nvidia-container-toolkit` to [1.17.4-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html)

### 1.29.9-do.5 (November 21, 2024)[](#1299-do5-november-21-2024)

*   Internal updates to the base image.

### 1.29.9-do.4 (November 7, 2024)[](#1299-do4-november-7-2024)

*   Upgrades to NVIDIA CUDA drivers and NVIDIA CUDA toolkit package versions for GPU worker nodes:
    *   Updated `cuda-drivers` to [550.127.05-1](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-127-05/index.html)
    *   Updated `cuda-toolkit` to [12.6.2-1](https://developer.nvidia.com/cuda-12-6-2-download-archive)
    *   Updated `nvidia-container-toolkit` to [1.17.0-1](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/release-notes.html) to address [CVE-2024-0134](https://security-tracker.debian.org/tracker/CVE-2024-0134)

### 1.29.9-do.3 (October 10, 2024)[](#1299-do3-october-10-2024)

*   Addressed issue with `nvidia` driver installation on GPU worker nodes.

### 1.29.9-do.2 (October 7, 2024)[](#1299-do2-october-7-2024)

*   Internal updates to the base image.

### 1.29.9-do.1 (September 30, 2024)[](#1299-do1-september-30-2024)

*   Rebuilt the Debian base image for GPU worker nodes with `nvidia-container-toolkit` version 1.16.2-1 to address [CVE-2024-0132](https://security-tracker.debian.org/tracker/CVE-2024-0132).

### 1.29.9-do.0 (September 13, 2024)[](#1299-do0-september-13-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.29.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1299)
    *   Updated to Linux kernel 6.1.106

### 1.29.8-do.0 (August 28, 2024)[](#1298-do0-august-28-2024)

*   Install [NVIDIA CUDA drivers version 550.90.07](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-90-07/index.html) and [NVIDIA CUDA toolkit version 12.4.1](https://developer.nvidia.com/cuda-12-4-1-download-archive) (applies to [GPU Droplets support](/products/kubernetes/details/supported-gpus/))
*   Updates to system components:
    *   Updated to [Kubernetes v1.29.8](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1298)
    *   Updated to Linux kernel 6.1.99

### 1.29.6-do.0 (July 10, 2024)[](#1296-do0-july-10-2024)

*   Rebuilt the Debian base image with OpenSSH version 1:9.2p1-2+deb12u3 to address the `openssh` vulnerabilities [CVE-2024-6387](https://security-tracker.debian.org/tracker/CVE-2024-6387)
*   Updates to system components:
    *   Updated to [Kubernetes v1.29.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
    *   Updated to Linux kernel 6.1.94

### 1.29.5-do.0 (May 21, 2024)[](#1295-do0-may-21-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.29.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1295)
    *   Updated to Linux kernel 6.1.90
    *   Updated [kubelet authorization mode](https://kubernetes.io/docs/reference/access-authn-authz/kubelet-authn-authz/#kubelet-authorization) to `Webhook`

### 1.29.1-do.0 (February 6, 2024)[](#1291-do0-february-6-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.29.1](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1291)
    *   Updated to [containerd 1.6.28](https://github.com/containerd/containerd/releases/tag/v1.6.28) to address [Leaky Vessels](https://snyk.io/blog/leaky-vessels-docker-runc-container-breakout-vulnerabilities/) `runc` vulnerabilities, including container breakout [CVE-2024-21626](https://github.com/advisories/GHSA-xr7r-f8xq-vfvv)

### 1.29.0-do.0 (January 17, 2024)[](#1290-do0-january-17-2024)

> **Deprecated APIs scheduled for removal in 1.29 are no longer served**. Make sure to read the [Urgent Upgrade Notes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#urgent-upgrade-notes) and adjust your manifests accordingly.

*   First 1.29.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.29.0](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1290)
    *   Updated to [Cilium v1.14.5](https://github.com/cilium/cilium/releases/tag/v1.14.5)
        *   Dropped support for CNP (CiliumNodePolicy) status updates
        *   Dropped support for SCTP
    *   Updated to [etcd v3.5.11](https://github.com/etcd-io/etcd/releases/tag/v3.5.11)
    *   Updated to [do-agent 3.16.7](https://github.com/digitalocean/do-agent/releases/tag/3.16.7)
    *   Updated to [DO CSI v4.8.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.8.0)
        *   Updated to [external-provisioner v3.6.3](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v3.6.3)
        *   Updated to [external-attacher v4.4.3](https://github.com/kubernetes-csi/external-attacher/releases/tag/v4.4.3)
        *   Updated to [external-snapshotter 6.3.3](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v6.3.3)
        *   Updated to [external-resizer v1.9.3](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.9.3)
        *   Updated to [node-driver-registrar v2.9.3](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.9.3)
    *   Updated to [cluster-autoscaler-1.29.0](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.29.0)
    *   Updated to [core-dns v1.11.1](https://github.com/coredns/coredns/releases/tag/v1.11.1)
    *   Updated to Linux kernel 6.1.69

Version 1.28.x releases

### 1.28.14-do.3 (October 10, 2024)[](#12814-do3-october-10-2024)

*   Addressed issue with `nvidia` driver installation on GPU worker nodes.

### 1.28.14-do.2 (October 7, 2024)[](#12814-do2-october-7-2024)

*   Internal updates to the base image.

### 1.28.14-do.1 (September 30, 2024)[](#12814-do1-september-30-2024)

*   Rebuilt the Debian base image for GPU worker nodes with `nvidia-container-toolkit` version 1.16.2-1 to address [CVE-2024-0132](https://security-tracker.debian.org/tracker/CVE-2024-0132).

### 1.28.14-do.0 (September 13, 2024)[](#12814-do0-september-13-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.28.14](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12814)
    *   Updated to Linux kernel 6.1.106

### 1.28.13-do.0 (August 28, 2024)[](#12813-do0-august-28-2024)

*   Install [NVIDIA CUDA drivers version 550.90.07](https://docs.nvidia.com/datacenter/tesla/tesla-release-notes-550-90-07/index.html) and [NVIDIA CUDA toolkit version 12.4.1](https://developer.nvidia.com/cuda-12-4-1-download-archive) (applies to [GPU Droplets support](/products/kubernetes/details/supported-gpus/))
*   Updates to system components:
    *   Updated to [Kubernetes v1.28.13](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12813)
    *   Updated to Linux kernel 6.1.99

### 1.28.11-do.0 (July 10, 2024)[](#12811-do0-july-10-2024)

*   Rebuilt the Debian base image with OpenSSH version 1:9.2p1-2+deb12u3 to address the `openssh` vulnerabilities [CVE-2024-6387](https://security-tracker.debian.org/tracker/CVE-2024-6387)
*   Updates to system components:
    *   Updated to [Kubernetes v1.28.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
    *   Updated to Linux kernel 6.1.94

### 1.28.10-do.0 (May 21, 2024)[](#12810-do0-may-21-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.28.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12810)
    *   Updated to Linux kernel 6.1.90
    *   Updated [kubelet authorization mode](https://kubernetes.io/docs/reference/access-authn-authz/kubelet-authn-authz/#kubelet-authorization) to `Webhook`

### 1.28.6-do.0 (February 6, 2024)[](#1286-do0-february-6-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.28.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v1286)
    *   Updated to [cluster-autoscaler-1.28.2](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.28.2)
    *   Updated to [containerd 1.6.28](https://github.com/containerd/containerd/releases/tag/v1.6.28) to address [Leaky Vessels](https://snyk.io/blog/leaky-vessels-docker-runc-container-breakout-vulnerabilities/) `runc` vulnerabilities, including container breakout [CVE-2024-21626](https://github.com/advisories/GHSA-xr7r-f8xq-vfvv)

### 1.28.5-do.0 (January 17, 2024)[](#1285-do0-january-17-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.28.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v1285)
    *   Updated to [Cilium v1.14.5](https://github.com/cilium/cilium/releases/tag/v1.14.5)
        *   Added support for SCTP
    *   Updated to Linux kernel 6.1.69

### 1.28.2-do.0 (September 18, 2023)[](#1282-do0-september-18-2023)

> **Deprecated APIs scheduled for removal in 1.28 are no longer served**. Make sure to read the [Urgent Upgrade Notes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#urgent-upgrade-notes) and adjust your manifests accordingly.

*   First 1.28.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.28.2](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v1282)
    *   Updated to [Cilium v1.14.2](https://github.com/cilium/cilium/releases/tag/v1.14.2)
    *   Updated to [etcd v3.5.9](https://github.com/etcd-io/etcd/releases/tag/v3.5.9)
    *   Updated to [do-agent 3.16.4](https://github.com/digitalocean/do-agent/releases/tag/3.16.4)
    *   Updated to [DO CSI v4.7.1](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.7.1)
        *   Updated to [external-provisioner v3.5.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v3.5.0)
        *   Updated to [external-attacher v4.3.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v4.3.0)
        *   Updated to [external-resizer v1.8.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.8.0)
        *   Updated to [node-driver-registrar v2.8.0](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.8.0)
    *   Updated to [cluster-autoscaler-1.28.0](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.28.0)
    *   Updated to [core-dns v1.10.1](https://github.com/coredns/coredns/releases/tag/v1.10.1)
    *   Updated to Linux kernel 6.1.52

Version 1.27.x releases

### 1.27.14-do.0 (May 21, 2024)[](#12714-do0-may-21-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.27.14](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12714)
    *   Updated to Linux kernel 6.1.90
    *   Updated [kubelet authorization mode](https://kubernetes.io/docs/reference/access-authn-authz/kubelet-authn-authz/#kubelet-authorization) to `Webhook`

### 1.27.10-do.0 (February 6, 2024)[](#12710-do0-february-6-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.27.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12710)
    *   Updated to [containerd 1.6.28](https://github.com/containerd/containerd/releases/tag/v1.6.28) to address [Leaky Vessels](https://snyk.io/blog/leaky-vessels-docker-runc-container-breakout-vulnerabilities/) `runc` vulnerabilities, including container breakout [CVE-2024-21626](https://github.com/advisories/GHSA-xr7r-f8xq-vfvv)

### 1.27.9-do.0 (January 17, 2024)[](#1279-do0-january-17-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.27.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v1279)
    *   Updated to [Cilium v1.13.10](https://github.com/cilium/cilium/releases/tag/v1.13.10)
    *   Updated to Linux kernel 6.1.69

### 1.27.6-do.0 (September 18, 2023)[](#1276-do0-september-18-2023)

*   Updates to system components:
    *   Updated to [Kubernetes v1.27.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v1276)
    *   Updated to [Cilium v1.13.7](https://github.com/cilium/cilium/releases/tag/v1.13.7)
    *   Updated to [cluster-autoscaler 1.27.3](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.27.3)
    *   Updated to Linux kernel 6.1.52
    *   Fixed a bug resulting in duplicate nameserver entries on host-level /etc/resolv.conf causing the overall nameserver limit to be hit

### 1.27.4-do.0 (July 24, 2023)[](#1274-do0-july-24-2023)

*   Updates to system components:
    *   Updated to [Kubernetes v1.27.4](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v1274)
    *   Updated worker node base image to [Debian 12](https://www.debian.org/releases/bookworm/) and kernel 6.1.37 addressing the [StackRot](https://www.openwall.com/lists/oss-security/2023/07/05/1) vulnerability
    *   Updated to [Cilium v1.13.4](https://github.com/cilium/cilium/releases/tag/v1.13.4)
    *   Updated to [cluster-autoscaler 1.27.2](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.27.2)

### 1.27.2-do.0 (May 30, 2023)[](#1272-do0-may-30-2023)

> **Deprecated APIs scheduled for removal in 1.27 are no longer served**. Make sure to read the [Urgent Upgrade Notes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#urgent-upgrade-notes) and adjust your manifests accordingly.

*   First 1.27.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.27.2](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v1272)
    *   Updated to [Cilium v1.13.3](https://github.com/cilium/cilium/releases/tag/v1.13.3)
    *   Updated to [etcd v3.5.9](https://github.com/etcd-io/etcd/releases/tag/v3.5.9)
    *   Updated worker node base image to [Debian 11.6](https://www.debian.org/releases/bullseye/) with kernel 6.1
    *   Updated to [do-agent 3.16.2](https://github.com/digitalocean/do-agent/releases/tag/3.16.2)
    *   Updated to [DO CSI v4.6.1](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.6.1)
        *   Updated to [external-provisioner v3.5.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v3.5.0)
        *   Updated to [external-attacher v4.3.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v4.3.0)
        *   Updated to [external-resizer v1.8.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.8.0)
        *   Updated to [node-driver-registrar v2.8.0](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.8.0)
    *   Updated to [cluster-autoscaler-1.27.1](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.27.1)
    *   Updated to [core-dns v1.10.1](https://github.com/coredns/coredns/releases/tag/v1.10.1)

Version 1.26.x releases

### 1.26.13-do.0 (February 6, 2024)[](#12613-do0-february-6-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.26.13](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.26.md#v12613)
    *   Updated to [containerd 1.6.28](https://github.com/containerd/containerd/releases/tag/v1.6.28) to address [Leaky Vessels](https://snyk.io/blog/leaky-vessels-docker-runc-container-breakout-vulnerabilities/) `runc` vulnerabilities, including container breakout [CVE-2024-21626](https://github.com/advisories/GHSA-xr7r-f8xq-vfvv)

### 1.26.12-do.0 (January 17, 2024)[](#12612-do0-january-17-2024)

*   Updates to system components:
    *   Updated to [Kubernetes v1.26.12](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.26.md#v12612)
    *   Updated to [Cilium v1.12.17](https://github.com/cilium/cilium/releases/tag/v1.12.17)
    *   Updated to Linux kernel 6.1.55

### 1.26.9-do.0 (September 18, 2023)[](#1269-do0-september-18-2023)

*   Updates to system components:
    *   Updated to [Kubernetes v1.26.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.26.md#v1269)
    *   Updated to [Cilium v1.12.14](https://github.com/cilium/cilium/releases/tag/v1.12.14)
    *   Updated to [cluster-autoscaler 1.26.4](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.26.4)
    *   Updated to Linux kernel 6.1.38

### 1.26.7-do.0 (July 24, 2023)[](#1267-do0-july-24-2023)

*   Updates to system components:
    *   Updated to [Kubernetes v1.26.7](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.26.md#v1267)
    *   Updated to [Cilium v1.12.11](https://github.com/cilium/cilium/releases/tag/v1.12.11)
    *   Updated to [cluster-autoscaler 1.26.3](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.26.3)

### 1.26.5-do.0 (May 30, 2023)[](#1265-do0-may-30-2023)

*   Updates to system components:
    *   Updated to [Kubernetes v1.26.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.26.md#v1265)
    *   Updated to [Cilium v1.12.10](https://github.com/cilium/cilium/releases/tag/v1.12.10)
    *   Updated to [etcd v3.5.9](https://github.com/etcd-io/etcd/releases/tag/v3.5.9)

### 1.26.3-do.0 (March 22, 2023)[](#1263-do0-march-22-2023)

> **Deprecated APIs scheduled for removal in 1.26 are no longer served**. Make sure to read the [Urgent Upgrade Notes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.26.md#urgent-upgrade-notes) and adjust your manifests accordingly.

*   First 1.26.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.26.3](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.26.md#v1263)
    *   Updated to [cluster-autoscaler 1.26.1](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.26.1)
    *   Updated to [Cilium v1.12.8](https://github.com/cilium/cilium/releases/tag/v1.12.8)
    *   Updated worker node base image to [Debian 11.6](https://www.debian.org/releases/bullseye/) with kernel 6.0
    *   Updated to [do-agent 3.15.5](https://github.com/digitalocean/do-agent/releases/tag/3.15.5)
    *   Updated to [digital-ocean-cloud-controller-manager v0.1.42](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.42)
    *   Updated to [do-operator v0.1.6](https://github.com/digitalocean/do-operator/releases/tag/v0.1.6)
    *   Updated to [DO CSI v4.5.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.5.0)
        *   Updated to [external-provisioner v3.4.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v3.4.0)
        *   Updated to [external-attacher v4.1.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v4.1.0)
        *   Updated to [external-snapshotter, snapshot-controller, and snapshot validation webhook v6.2.1](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v6.2.1)
        *   Updated to [external-resizer v1.7.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.7.0)
        *   Updated to [node-driver-registrar v2.7.0](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.7.0)
    *   Updated to [cluster-autoscaler v1.26.1](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.26.1)
    *   Updated to [core-dns v1.9.4](https://github.com/coredns/coredns/releases/tag/v1.9.4)

Version 1.25.x releases

### 1.25.14-do.0 (September 18, 2023)[](#12514-do0-september-18-2023)

> Note: If your cluster was originally created on 1.24 or older and has not been upgraded since December 2022, it may undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   Updates to system components:
    *   Updated to [Kubernetes v1.25.14](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.25.md#v12514)
    *   Updated to [Cilium v1.11.20](https://github.com/cilium/cilium/releases/tag/v1.11.20)
    *   Updated to Linux kernel 6.1.38

### 1.25.12-do.0 (July 24, 2023)[](#12512-do0-july-24-2023)

> Note: If your cluster was originally created on 1.24 or older and had not been upgraded since December 2022, it may undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   Updates to system components:
    *   Updated to [Kubernetes v1.25.12](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.25.md#v12512)
    *   Updated to [Cilium v1.11.18](https://github.com/cilium/cilium/releases/tag/v1.11.18)

### 1.25.10-do.0 (May 30, 2023)[](#12510-do0-may-30-2023)

> Note: If your cluster was originally created on 1.24 or older and had not been upgraded since December 2022, it may undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   Updates to system components:
    *   Updated to [Kubernetes v1.25.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.25.md#v12510)
    *   Updated to [Cilium v1.11.17](https://github.com/cilium/cilium/releases/tag/v1.11.17)
    *   Updated to [etcd v3.5.9](https://github.com/etcd-io/etcd/releases/tag/v3.5.9)
    *   Updated to [DO CSI v4.5.1](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.5.1)
        *   Updated to [external-provisioner v3.3.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v3.3.0)
        *   Updated to [external-attacher v4.0.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v4.0.0)
        *   Updated to [external-snapshotter, snapshot-controller, and snapshot validation webhook v6.1.0](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v6.1.0)
        *   Updated to [external-resizer v1.6.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.6.0)
        *   Updated to [node-driver-registrar v2.6.0](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.6.0)

### 1.25.8-do.0 (March 22, 2023)[](#1258-do0-march-22-2023)

> Note: If your cluster was originally created on 1.24 or older and had not been upgraded since December 2022, it may undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   Updates to system components:
    *   Updated to [Kubernetes v1.25.8](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.25.md#v1258)
    *   Updated to [Cilium v1.11.15](https://github.com/cilium/cilium/releases/tag/v1.11.15)

### 1.25.4-do.0 (December 6, 2022)[](#1254-do0-december-6-2022)

> **Deprecated APIs scheduled for removal in 1.25 are no longer served**. Make sure to read the [Urgent Upgrade Notes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.25.md#urgent-upgrade-notes) and adjust your manifests accordingly.

> Note: If your cluster was originally created on 1.24 or older and had not been upgraded since December 2022, it may undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   First 1.25.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.25.4](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.25.md#v1254)
        *   The feature-gate: `LegacyServiceAccountTokenNoAutoGeneration` is now enabled.
            *   More information about the impact of this change and service account credentials can be found [here](https://kubernetes.io/docs/concepts/configuration/secret/#service-account-token-secrets)
    *   Updated to [cluster-autoscaler 1.25.0](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.25.0)
    *   Updated to [Cilium 1.11.11](https://github.com/cilium/cilium/releases/tag/v1.11.11)
    *   Update worker node base image to [Debian 11.4](https://www.debian.org/releases/bullseye/) with kernel 5.18
*   Changes to system components:
    *   Added LBaaS HTTP/3 support in [CCM](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/v0.1.40/CHANGELOG.md#v0140-beta---november-15-2022)
        *   This enables HTTP/3 forwarding rule support for the Load Balancer

Version 1.24.x releases

### 1.24.16-do.0 (July 24, 2023)[](#12416-do0-july-24-2023)

> Note: If your cluster was originally created on 1.24 or older and had not been upgraded since December 2022, it may undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   Updates to system components:
    *   Updated to [Kubernetes v1.24.16](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.24.md#v12416)
    *   Updated to [cluster-autoscaler 1.24.2](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.24.2)

### 1.24.13-do.0 (May 30, 2023)[](#12413-do0-may-30-2023)

> Note: If your cluster was originally created on 1.24 or older and had not been upgraded since December 2022, it may undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   Updates to system components:
    *   Updated to [Kubernetes v1.24.13](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.24.md#v12413)
    *   Updated to [Cilium v1.10.20](https://github.com/cilium/cilium/releases/tag/v1.10.20)
        *   **IMPORTANT**: The update applies only for clusters on the new control plane.
    *   Updated to [etcd v3.5.9](https://github.com/etcd-io/etcd/releases/tag/v3.5.9)

### 1.24.12-do.0 (March 22, 2023)[](#12412-do0-march-22-2023)

> Note: If your cluster was originally created on 1.24 or older and had not been upgraded since December 2022, it may undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   Updates to system components:
    *   Updated to [Kubernetes v1.24.12](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.24.md#v12412)
    *   Updated to [Cilium v1.10.20](https://github.com/cilium/cilium/releases/tag/v1.10.20)
        *   **IMPORTANT**: The update applies only for clusters on the new control plane.

### 1.24.8-do.0 (December 6, 2022)[](#1248-do0-december-6-2022)

> Note: If your cluster was originally created on 1.24 or older and had not been upgraded since December 2022, it may undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   Updates to system components:
    *   Updated to [Kubernetes v1.24.8](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.24.md#v1248)
    *   Updated to [etcd 3.5.6](https://github.com/etcd-io/etcd/blob/main/CHANGELOG/CHANGELOG-3.5.md#v356-2022-11-21)
    *   Updated to [DO CCM v0.1.40](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.40)
    *   Updated to [DO CSI v4.4.1](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.4.1)
        *   Updated to [external-provisioner v3.3.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v3.3.0)
        *   Updated to [external-attacher v4.0.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v4.0.0)
        *   Updated to [external-snapshotter, snapshot-controller, and snapshot validation webhook v6.1.0](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v6.1.0)
        *   Updated to [external-resizer v1.6.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.6.0)
        *   Updated to [node-driver-registrar v2.6.0](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.6.0)
    *   Updated to [kernel 5.10.0-0.deb10.17-amd64](https://packages.debian.org/buster-backports/linux-image-amd64)
*   Changes to system components:
    *   Enable support for UDP LBs
    *   Increased arp records cache to prevent network connection drops in larger clusters
    *   Added LBaaS HTTP/3 support in [CCM](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/v0.1.40/CHANGELOG.md#v0140-beta---november-15-2022)
        *   This enables HTTP/3 forwarding rule support for the Load Balancer

### 1.24.4-do.0 (August 30, 2022)[](#1244-do0-august-30-2022)

*   First 1.24.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.24.4](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.24.md#v1244)
    *   The feature-gate: `LegacyServiceAccountTokenNoAutoGeneration` is disabled. This feature was moved to Beta in Kubernetes 1.24.
        *   More information can be found about the impact of this change and service account credentials [here](https://kubernetes.io/docs/concepts/configuration/secret/#service-account-token-secrets)
    *   Updated to [DO CSI v4.3.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.3.0)
    *   Updated to [DO CCM v0.1.39](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.39)
    *   Updated to [cluster-autoscaler 1.24.0](https://github.com/kubernetes/autoscaler/releases/tag/cluster-autoscaler-1.24.0)

Version 1.23.x releases

### 1.23.14-do.0 (December 6, 2022)[](#12314-do0-december-6-2022)

> Note: If your cluster was originally created with version 1.20 or older your cluster might undergo a [control plane migration](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).

*   Updates to system components:
    *   Updated to [Kubernetes v1.23.14](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.23.md#v12314)
    *   Updated to [etcd 3.5.6](https://github.com/etcd-io/etcd/blob/main/CHANGELOG/CHANGELOG-3.5.md#v356-2022-11-21)
    *   Updated to [DO CCM v0.1.40](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.40)
    *   Updated to [DO CSI v4.4.1](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.4.1)
        *   Updated to [external-provisioner v3.3.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v3.3.0)
        *   Updated to [external-attacher v4.0.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v4.0.0)
        *   Updated to [external-snapshotter, snapshot-controller, and snapshot validation webhook v6.1.0](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v6.1.0)
        *   Updated to [external-resizer v1.6.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.6.0)
        *   Updated to [node-driver-registrar v2.6.0](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.6.0)
    *   Updated to [kernel 5.10.0-0.deb10.17-amd64](https://packages.debian.org/buster-backports/linux-image-amd64)
*   Changes to system components:
    *   Enable support for UDP LBs
    *   Increased arp records cache to prevent network connection drops in larger clusters
    *   Added LBaaS HTTP/3 support in [CCM](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/v0.1.40/CHANGELOG.md#v0140-beta---november-15-2022)
        *   This enables HTTP/3 forwarding rule support for the Load Balancer

### 1.23.10-do.0 (August 31, 2022)[](#12310-do0-august-31-2022)

*   Updates to system components:
    *   Updated to [Kubernetes v1.23.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.23.md#v12310)

### 1.23.9-do.0 (July 26, 2022)[](#1239-do0-july-26-2022)

*   First 1.23.x release
*   Updates to system components:
    *   Updated to [Kubernetes v1.23.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.23.md#v1239)
*   Changes to system components:
    *   Updated to [DO CSI v4.2.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.2.0)
        *   Updated to [external-provisioner v3.2.1](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v3.2.1)
        *   Updated to [external-attacher v3.5.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.5.0)
        *   Updated to [external-snapshotter, snapshot-controller, and snapshot validation webhook v6.0.1](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v6.0.1)
        *   Updated to [external-resizer v1.5.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.5.0)
        *   Updated to [node-driver-registrar v2.5.1](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.5.1)

* * *

**Note** Starting with this minor version release, the snapshot API is upgraded from `v1beta1` to `v1`. Invalid `v1beta1` snapshots upgraded to `v1` may not be usable anymore.

Cluster upgrades attempted through the cloud control panel will cause [clusterlint](/support/clusterlint-error-fixes/) to scan for invalid snapshots and prevent upgrades accordingly. For more information on how to correct invalid snapshots, see [Invalid CSI Volume Snapshots](/support/clusterlint-error-fixes/#invalid-csi-volume-snapshots).

* * *

Version 1.22.x releases

### 1.22.13-do.0 (August 31, 2022)[](#12213-do0-august-31-2022)

*   Updated to [Kubernetes v1.22.13](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.22.md#v12213)

### 1.22.12-do.0 (July 26, 2022)[](#12212-do0-july-26-2022)

*   Updates to system components:
    *   Updated to [Kubernetes v1.22.12](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.22.md#v12212)
    *   Updated to [etcd v3.4.19](https://github.com/etcd-io/etcd/releases/tag/v3.4.19)
    *   Updated to [DO CSI v3.1.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v3.1.0)
        *   Updated to [external-provisioner v2.2.2](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.2.2)
        *   Updated to [external-attacher v3.5.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.5.0)
        *   Updated to [external-snapshotter, snapshot-controller, and snapshot validation webhook v3.0.3](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.3)
        *   Updated to [external-resizer v1.5.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.5.0)
        *   Updated to [node-driver-registrar v2.5.1](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.5.1)
*   Automatically detect and remove v1 snapshot installations which are not supported in this minor version

### 1.22.11-do.0 (July 5, 2022)[](#12211-do0-july-5-2022)

*   Updates to system components:
    
    *   Updated kernel to [Linux 5.10.120](https://packages.debian.org/buster-backports/linux-image-5.10.0-0.bpo.15-amd64-unsigned).
    *   Updated to [Kubernetes v1.22.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.22.md#v12211)
    *   Updated to [etcd v3.5.4](https://github.com/etcd-io/etcd/releases/tag/v3.5.4)
*   Changes to system components:
    
*   Disabled Cilium’s eBPF-based NodePort handling in favor of `kube-proxy` as it does not support graceful termination properly in v1.10. This also disables the eBPF implementations for features depending on NodePort handling in Cilium in favor of `kube-proxy`, namely host IP and external IP processing.
    

### 1.22.8-do.1 (April 18, 2022)[](#1228-do1-april-18-2022)

*   Upgrades to system components:
    *   Updated to [DO CCM v0.1.37](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.37)
    *   Updated to [etcd v3.5.3](https://github.com/etcd-io/etcd/releases/tag/v3.5.3)

### 1.22.8-do.0 (April 7, 2022)[](#1228-do0-april-7-2022)

* * *

**IMPORTANT** Please upgrade as soon as possible as this version contains an important security update for containerd.

* * *

*   Upgrades to system components:
    *   Updated to [containerd v1.4.13](https://github.com/containerd/containerd/releases/tag/v1.4.13). Fixes [CVE-2022-23648](https://github.com/containerd/containerd/security/advisories/GHSA-crp2-qrr5-8pq7).
    *   Cilium: Guarantee correct pod IP allocations by waiting on node IP addresses to be fully provided at startup time

### 1.22.7-do.0 (March 3, 2022)[](#1227-do0-march-3-2022)

*   First 1.22.x release
*   Upgrades to system components:
    *   Updated to [Kubernetes v1.22.7](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.22.md#v1227)
        *   **IMPORTANT** The following deprecated upstream beta APIs have been removed in 1.22 in favor of the GA version of those APIs:
            *   [APIService](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#apiservice-v122)
            *   [CertificateSigningRequest](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#certificatesigningrequest-v122)
            *   [CustomResourceDefinition](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#customresourcedefinition-v122)
            *   [Ingress](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#ingress-v122)
            *   [IngressClass](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#ingressclass-v122)
            *   [Lease](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#lease-v122)
            *   [PriorityClass](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#priorityclass-v122)
            *   [RBAC](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#rbac-resources-v122)
            *   [Storage](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#storage-resources-v122)
            *   [SubjectAccessReview](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#subjectaccessreview-resources-v122)
            *   [TokenReview](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#tokenreview-v122)
            *   [ValidatingWebhookConfiguration & MutatingWebhookConfiguration](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#webhook-resources-v122)
        *   Fix `--enable-admission-plugins` flag to `kube-apiserver`.
    *   Updated to [etcd v3.5.0](https://github.com/etcd-io/etcd/releases/tag/v3.5.0)
    *   Updated to [cluster-autoscaler v1.22.2](https://github.com/kubernetes/autoscaler/tree/cluster-autoscaler-1.22.2/cluster-autoscaler)
    *   Updated to [DO CCM v0.1.36](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.36)
    *   Updated to [DO CSI v4.0.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v4.0.0)
    *   Updated to kernel to [linux-image-5.10.0-0.bpo.9-amd64](https://packages.debian.org/buster-backports/linux-image-5.10.0-0.bpo.9-amd64).

Version 1.21.x releases

### 1.21.14-do.0 (July 5, 2022)[](#12114-do0-july-5-2022)

*   Updates to system components:
    
    *   Updated to kernel to [Linux 5.10.120](https://packages.debian.org/buster-backports/linux-image-5.10.0-0.bpo.15-amd64-unsigned).
        *   This is an upgrade from Linux 4.19 on earlier DOKS 1.21 patch versions. This upgrade is necessary to address a limitation in BPF program size on kernels prior to Linux 5.1 that can lead to degraded cluster state where worker nodes are unable to provision new network namespaces for pods.
    *   Updated to [Kubernetes v1.21.14](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.21.md#v12114)
*   Changes to system components:
    
    *   Disabled Cilium’s eBPF-based NodePort handling in favor of kube-proxy’s as it does not support graceful termination properly in v1.10. (This also disables the eBPF implementations for features depending on NodePort handling in Cilium in favor of kube-proxy, namely host IP and external IP processing.)

### 1.21.11-do.1 (April 18, 2022)[](#12111-do1-april-18-2022)

*   Upgrades to system components:
    *   Updated to [DO CCM v0.1.37](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.37)

### 1.21.11-do.0 (April 7, 2022)[](#12111-do0-april-7-2022)

* * *

**IMPORTANT** Please upgrade as soon as possible as this version contains an important security update for containerd.

* * *

*   Upgrades to system components:
    *   Updated to [containerd v1.4.13](https://github.com/containerd/containerd/releases/tag/v1.4.13). Fixes [CVE-2022-23648](https://github.com/containerd/containerd/security/advisories/GHSA-crp2-qrr5-8pq7).
    *   Cilium: Guarantee correct pod IP allocations by waiting on node IP addresses to be fully provided at startup time

### 1.21.10-do.0 (March 3, 2022)[](#12110-do0-march-3-2022)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.21.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.21.md#v12110)
    *   Upgraded Docker to [20.10.12](https://github.com/moby/moby/releases/tag/v20.10.12).
    *   Reverted back to [Linux kernel-image-4.19.0-17-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-17-amd64-di), after unintentional implicit upgrade to [Linux kernel-image-4.19.0-18-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-18-amd64-di) which contains regressions impacting Cilium.

### 1.21.9-do.0 (January 26, 2022)[](#1219-do0-january-26-2022)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.21.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.21.md#v1219)
    *   Updated to [Cilium 1.10.4](https://github.com/cilium/cilium/releases/tag/v1.10.4)
        *   Improved configuration to prevent a number of connectivity issues
    *   Added arp-flusher sidecar to the cilium agent which periodically clears potentially stale ARP records
    *   Updated to [DO CSI v3.0.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v3.0.0)
        *   Supports volume growth on XFS
        *   Updated to [external-provisioner v2.2.2](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.2.2)
        *   Updated to [external-attacher v3.3.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.3.0)
        *   Updated to [external-resizer v1.3.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.3.0)
        *   Updated to [node-driver-registrar v2.4.0](https://github.com/kubernetes-csi/node-driver-registrar/releases/tag/v2.4.0)
    *   Updated to [containerd v1.4.12](https://github.com/containerd/containerd/releases/tag/v1.4.12)
    *   Updated to [cluster-autoscaler v1.21.2](https://github.com/kubernetes/autoscaler/tree/cluster-autoscaler-1.21.2/cluster-autoscaler)
    *   Added missing cluster-autoscaler RBAC permissions for CSIDriver and CSIStorageCapacity resources
    *   Updated do-agent to v3.11 and increased memory limit

### 1.21.5-do.0 (October 21, 2021)[](#1215-do0-october-21-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.21.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.21.md#v1215)
    *   Updated to [DO CCM v0.1.35](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.35)
        *   Supports specifying the number of nodes to create a Load Balancer with

### 1.21.3-do.0 (August 31, 2021)[](#1213-do0-august-31-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.21.3](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.21.md#v1213)
    *   Updated to [DO CCM v0.1.34](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.34)
    *   Updated to [DO CSI v2.1.2](https://github.com/digitalocean/csi-digitalocean/releases/tag/v2.1.2)
    *   Updated to [containerd v1.4.9](https://github.com/containerd/containerd/releases/tag/v1.4.9)
*   Disabled the Cilium `enabled-bpf-masquerade` option to address Cilium error on clusters using `hostNetwork`
*   Ensured that ARP cache entries marked as `PERMANENT` are cleared by Cilium before establishing connections with a new control plane Droplet

### 1.21.2-do.2 (July 2, 2021)[](#1212-do2-july-2-2021)

*   Changes to system components:
    *   Disabled the Cilium `enable-egress-gateway` option to address Cilium startup error on clusters using VXLAN tunneling

### 1.21.2-do.1 (July 1, 2021)[](#1212-do1-july-1-2021)

*   Changes to system components:
    *   Disabled Cilium [full kube-proxy replacement](https://docs.cilium.io/en/v1.10/gettingstarted/kubeproxy-free/#kubeproxy-free) and restored [partial mode](https://docs.cilium.io/en/v1.10/gettingstarted/kubeproxy-free/#kube-proxy-hybrid-modes) to address failing Istio sidecar injection

### 1.21.2-do.0 (June 29, 2021)[](#1212-do0-june-29-2021)

*   First 1.21.x release
*   Upgrades to system components:
    *   Updated to [Cilium 1.10.1](https://github.com/cilium/cilium/releases/tag/v1.10.1)
        *   Enabled [full kube-proxy replacement](https://docs.cilium.io/en/v1.10/gettingstarted/kubeproxy-free/#kubeproxy-free)
        *   Enabled the `enable-egress-gateway` and `enable-bpf-masquerade` options to allow use of Cilium’s [egress gateway](https://docs.cilium.io/en/v1.10/gettingstarted/egress-gateway/) feature
    *   Updated to [CoreDNS v1.8.4](https://github.com/coredns/coredns/releases/tag/v1.8.4)
    *   Updated CSI driver sidecars:
        *   Updated to [external-provisioner v2.2.1](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.2.1)
        *   Updated to [external-attacher v3.2.1](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.2.1)
        *   Updated to [external-snapshotter v3.0.3](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.3)
        *   Updated to [external-resizer v1.2.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.2.0)
    *   Updated to [DO CCM v0.1.33](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.33)
    *   Updated to [Linux kernel-image-4.19.0-17-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-17-amd64-di), which includes the `target_core_mod` module that was missing from previous releases
*   Configured [graceful node shutdown](https://kubernetes.io/blog/2021/04/21/graceful-node-shutdown-beta/) parameters on the Kubelet to allow graceful workload termination when worker nodes are powered off
*   Removed kube-proxy, since Cilium is now configured for full kube-proxy replacement mode. Clusters created on 1.20 and previous releases will have kube-proxy deleted during upgrade.
*   Raised `pid_max` to 4194304 to help avoid PID exhaustion on large workers
*   Configured [PID and CPU reservations](https://kubernetes.io/docs/tasks/administer-cluster/reserve-compute-resources/#kube-reserved) for system components to improve node stability
*   Renamed the managed `kube-state-metrics` ServiceAccount to avoid conflicts with customer installations of kube-state-metrics. Upgraded clusters will retain the `kube-state-metrics` ServiceAccount, but it can be safely removed.

Version 1.20.x releases

### 1.20.15-do.1 (March 3, 2022)[](#12015-do1-march-3-2022)

*   Fixes to system components:
    *   Reverted back to [Linux kernel-image-4.19.0-17-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-17-amd64-di), after unintentional implicit upgrade to [Linux kernel-image-4.19.0-18-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-18-amd64-di) which contains eBPF regressions with respect to Cilium.

### 1.20.15-do.0 (January 26, 2022)[](#12015-do0-january-26-2022)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.20.15](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.20.md#v12015)
    *   Updated to [Cilium 1.9.10](https://github.com/cilium/cilium/releases/tag/v1.9.10)
        *   Improved configuration to prevent a number of connectivity issues
    *   Added arp-flusher sidecar to the cilium agent which periodically clears potentially stale ARP records
    *   Updated to [containerd v1.4.12](https://github.com/containerd/containerd/releases/tag/v1.4.12)
    *   Updated to [cluster-autoscaler v1.20.2](https://github.com/kubernetes/autoscaler/tree/cluster-autoscaler-1.20.2/cluster-autoscaler)
    *   Added missing cluster-autoscaler RBAC permissions for CSIDriver resource
    *   Updated do-agent to v3.11 and increased memory limit

### 1.20.11-do.0 (October 21, 2021)[](#12011-do0-october-21-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.20.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.20.md#v12011)
    *   Updated to [DO CCM v0.1.35](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.35)
        *   Supports specifying the number of nodes to create a Load Balancer with

### 1.20.9-do.0 (August 31, 2021)[](#1209-do0-august-31-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.20.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.20.md#v1209)
    *   Updated to [DO CCM v0.1.34](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.34)
    *   Updated to [DO CSI v2.1.2](https://github.com/digitalocean/csi-digitalocean/releases/tag/v2.1.2)
    *   Updated to [containerd v1.4.9](https://github.com/containerd/containerd/releases/tag/v1.4.9)

### 1.20.8-do.0 (June 29, 2021)[](#1208-do0-june-29-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.20.8](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.20.md#v1208)
    *   Updated to [CoreDNS v1.8.4](https://github.com/coredns/coredns/releases/tag/v1.8.4)
    *   Updated CSI driver sidecars:
        *   Updated to [external-provisioner v2.2.1](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.2.1)
        *   Updated to [external-attacher v3.2.1](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.2.1)
        *   Updated to [external-snapshotter v3.0.3](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.3)
        *   Updated to [external-resizer v1.2.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.2.0)
    *   Updated to [DO CCM v0.1.33](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.33)
    *   Updated to [Linux kernel-image-4.19.0-17-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-17-amd64-di), which includes the `target_core_mod` module that was missing from previous releases
*   Raised `pid_max` to 4194304 to help avoid PID exhaustion on large workers
*   Configured [PID and CPU reservations](https://kubernetes.io/docs/tasks/administer-cluster/reserve-compute-resources/#kube-reserved) for system components to improve node stability
*   Renamed the managed `kube-state-metrics` ServiceAccount to avoid conflicts with customer installations of kube-state-metrics. Upgraded clusters will retain the `kube-state-metrics` ServiceAccount, but it can be safely removed.

### 1.20.7-do.0 (June 7, 2021)[](#1207-do0-june-7-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.20.7](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.20.md#v1207)
        *   Fixes [CVE-2021-25735](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.20.md#cve-2021-25735-validating-admission-webhook-does-not-observe-some-previous-fields)
    *   Updated to [Cilium v1.9.8](https://github.com/cilium/cilium/releases/tag/v1.9.8)
        *   Fixes [CVE-2021-29492](https://github.com/cilium/cilium/releases/tag/v1.9.7)
        *   Fixes [CVE-2021-28682, CVE-2021-28683 and CVE-2021-29258](https://github.com/cilium/cilium/releases/tag/v1.9.6)
    *   Updated to [containerd v1.4.6-1](https://github.com/containerd/containerd/releases/tag/v1.4.6)
        *   Fixes [CVE-2021-30465](https://github.com/opencontainers/runc/security/advisories/GHSA-c3xm-pvg7-gh7r)
    *   Updated to [Linux kernel-image-4.19.0-14-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-14-amd64-di)
    *   Updated to [DO CCM v0.1.32](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/CHANGELOG.md#v0132-beta---march-21-2021)
*   Increased [`--max-endpoints-per-slice`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/) on kube-controller-manager to 250 endpoints.

### 1.20.2-do.0 (February 2, 2021)[](#1202-do0-february-2-2021)

* * *

Starting with DigitalOcean Kubernetes 1.20, containerd is used as the container runtime. Previous releases used Docker. This change reflects the upstream [deprecation of dockershim](https://kubernetes.io/blog/2020/12/02/dockershim-faq/) and [deprecation of Docker as a container runtime](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.20.md#deprecation) in Kubernetes 1.20. Docker is still installed on worker nodes, so as not to impact any user workloads (for example, image building) that depend on it.

* * *

*   First 1.20.x release
*   Upgrades to system components:
    *   Updated to [Cilium 1.9.1](https://github.com/cilium/cilium/releases/tag/v1.9.1)
        *   Enabled the [`remote-node-identity`](https://docs.cilium.io/en/v1.9/concepts/terminology/#special-identities) feature of Cilium, to aid in migration away from VXLAN
        *   Switched to the `cluster-pool` IPAM mode from the deprecated `hostpool-legacy` mode
    *   Updated to [CoreDNS v1.8.0](https://github.com/coredns/coredns/releases/tag/v1.8.0)
    *   Updated CSI driver sidecars:
        *   Updated to [external-provisioner v2.1.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.1.0)
        *   Updated to [external-attacher v3.1.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.1.0)
        *   Updated to [external-snapshotter v3.0.3](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.3)
        *   Updated to [external-resizer v1.1.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.1.0)
    *   Updated to [DO CCM v0.1.31](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.31)

Version 1.19.x releases

### 1.19.15-do.0 (October 21, 2021)[](#11915-do0-october-21-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.19.15](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.19.md#v11915)
    *   Updated to [DO CCM v0.1.35](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.35)
        *   Supports specifying the number of nodes to create a Load Balancer with

### 1.19.13-do.0 (August 31, 2021)[](#11913-do0-august-31-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.19.13](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.19.md#v11913)
    *   Updated to [DO CCM v0.1.34](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.34)
    *   Updated to [DO CSI v2.1.2](https://github.com/digitalocean/csi-digitalocean/releases/tag/v2.1.2)

### 1.19.12-do.0 (June 29, 2021)[](#11912-do0-june-29-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.19.12](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.19.md#v11912)
    *   Updated to [CoreDNS v1.8.4](https://github.com/coredns/coredns/releases/tag/v1.8.4)
    *   Updated CSI driver sidecars:
        *   Updated to [external-provisioner v2.2.1](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.2.1)
        *   Updated to [external-attacher v3.2.1](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.2.1)
        *   Updated to [external-snapshotter v3.0.3](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.3)
        *   Updated to [external-resizer v1.2.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.2.0)
    *   Updated to [DO CCM v0.1.33](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.33)
    *   Updated to [Linux kernel-image-4.19.0-17-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-17-amd64-di), which includes the `target_core_mod` module that was missing from previous releases
*   Raised `pid_max` to 4194304 to help avoid PID exhaustion on large workers
*   Configured [CPU reservations](https://kubernetes.io/docs/tasks/administer-cluster/reserve-compute-resources/#kube-reserved) for system components to improve node stability

### 1.19.11-do.0 (June 7, 2021)[](#11911-do0-june-7-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes v1.19.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.19.md#v11911)
        *   Fixes [CVE-2021-25735](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.19.md#cve-2021-25735-validating-admission-webhook-does-not-observe-some-previous-fields)
        *   Fixes [CVE-2021-3121](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.19.md#api-change-1)
    *   Updated to [Cilium v1.9.8](https://github.com/cilium/cilium/releases/tag/v1.9.8)
        *   Fixes [CVE-2021-29492](https://github.com/cilium/cilium/releases/tag/v1.9.7)
        *   Fixes [CVE-2021-28682, CVE-2021-28683 and CVE-2021-29258](https://github.com/cilium/cilium/releases/tag/v1.9.6)
    *   Updated to [Linux kernel-image-4.19.0-14-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-14-amd64-di)
    *   Updated to [DO CCM v0.1.32](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/CHANGELOG.md#v0132-beta---march-21-2021)
*   Increased [`--max-endpoints-per-slice`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/) on kube-controller-manager to 250 endpoints.

### 1.19.6-do.0 (February 2, 2021)[](#1196-do0-february-2-2021)

*   Upgrades to system components:
    *   Updated to [Cilium 1.9.1](https://github.com/cilium/cilium/releases/tag/v1.9.1)
        *   Enabled the [`remote-node-identity`](https://docs.cilium.io/en/v1.9/concepts/terminology/#special-identities) feature of Cilium, to aid in migration away from VXLAN
        *   Switched to the `cluster-pool` IPAM mode from the deprecated `hostpool-legacy` mode
    *   Updated to [CoreDNS v1.8.0](https://github.com/coredns/coredns/releases/tag/v1.8.0)
    *   Updated CSI driver sidecars:
        *   Updated to [external-provisioner v2.1.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.1.0)
        *   Updated to [external-attacher v3.1.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.1.0)
        *   Updated to [external-snapshotter v3.0.3](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.3)
        *   Updated to [external-resizer v1.1.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.1.0)
    *   Updated to [DO CCM v0.1.31](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.31)

### 1.19.3-do.3 (January 6, 2021)[](#1193-do3-january-6-2021)

*   Upgrades to system components:
    *   Updated to [external-provisioner v2.0.4](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.0.4)
    *   Updated to [external-attacher v3.0.2](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.0.2)
    *   Mitigated [CVE-2020-8569](https://github.com/kubernetes-csi/external-snapshotter/issues/421) by updating to [external-snapshotter v3.0.2](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.2)
    *   Updated to [external-resizer v1.0.1](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.0.1)
*   Cilium will configure new clusters (initially created with 1.19.3-do.3 and later) to route pod-to-pod and pod-to-service traffic directly. Clusters upgraded to 1.19.3-do.3 will continue to route this traffic via a VXLAN overlay network.
*   Mitigated a potential kernel deadlock by disabling frame buffer mode for the video console.

### 1.19.3-do.2 (November 5, 2020)[](#1193-do2-november-5-2020)

*   Upgrades to system components:
    *   Fix resizer misconfiguration on CSI driver v2.1.1
*   Upgraded Docker to 19.03 to address [upstream metrics-server issue](https://github.com/kubernetes/kubernetes/issues/94281)

### 1.19.3-do.1 (November 2, 2020)[](#1193-do1-november-2-2020)

*   Upgrades to system components:
    *   Updated to [CSI driver v2.1.1](https://github.com/digitalocean/csi-digitalocean/releases/tag/v2.1.1)
        *   Added `--default-fstype=ext4` to csi-provisioner fixing `fsGroup` bug
    *   Updated to [Cilium 1.8.5](https://github.com/cilium/cilium/releases/tag/v1.8.5)
        *   Dropped parameters `bpf-ct-global-tcp-max` and `bpf-ct-global-any-max` to address [Cilium issue #13843](https://github.com/cilium/cilium/issues/13843)
    *   Updated to [DO CCM v0.1.30](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.30)
        *   Added support for specifying load balancer size (available in closed beta at the time of this release)

### 1.19.3-do.0 (October 27, 2020)[](#1193-do0-october-27-2020)

* * *

Starting with DigitalOcean Kubernetes 1.19, the NodePort range 30000-32767 is not open by default anymore. Instead, a new controller automatically manages access through the firewall based on the Services of type `NodePort` currently defined in the cluster.

Consult the [worker node firewalls](/products/kubernetes/details/managed/#worker-node-firewalls) documentation for details.

* * *

*   First 1.19.x release
*   Upgrades to system components:
    *   Updated to [Cilium 1.8.4](https://github.com/cilium/cilium/releases/tag/v1.8.4)
        *   Enabled HA mode in cilium-operator
    *   Updated to [DO CCM v0.1.29](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.29)
    *   Updated to [CoreDNS v1.7.1](https://github.com/coredns/coredns/releases/tag/v1.7.1)
    *   Updated to [CSI driver v2.1.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v2.1.0)
        *   Added support for Kubernetes 1.19
        *   Updated to [external-provisioner v2.0.2](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.0.2)
        *   Updated to [external-attacher v3.0.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.0.0)
        *   Updated to [external-snapshotter v3.0.0](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.0)
        *   Updated to [external-resizer v1.0.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.0.0)
*   Reduced [`--terminated-pod-gc-threshold`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/) on kube-controller-manager to 100 pods

Version 1.18.x releases

### 1.18.19-do.0 (June 7, 2021)[](#11819-do0-june-7-2021)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.18.19](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.18.md#v11819)
        *   Fixes [CVE-2021-25735](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.18.md#cve-2021-25735-validating-admission-webhook-does-not-observe-some-previous-fields)
        *   Fixes [CVE-2021-3121](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.18.md#api-change-1)
    *   Updated to [Cilium 1.7.16](https://github.com/cilium/cilium/releases/tag/v1.7.16)
        *   Fixes [CVE-2021-28682, CVE-2021-28683 and CVE-2021-29258](https://github.com/cilium/cilium/releases/tag/v1.7.16)
    *   Updated to [Linux kernel-image-4.19.0-14-amd64](https://packages.debian.org/buster/kernel-image-4.19.0-14-amd64-di)
    *   Updated to [DO CCM v0.1.32](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/CHANGELOG.md#v0132-beta---march-21-2021)
*   Increased [`--max-endpoints-per-slice`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/) on kube-controller-manager to 250 endpoints.

### 1.18.14-do.0 (February 2, 2021)[](#11814-do0-february-2-2021)

*   Upgrades to system components:
    *   Updated CSI driver sidecars:
        *   Updated to [external-provisioner v2.1.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.1.0)
        *   Updated to [external-attacher v3.1.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.1.0)
        *   Updated to [external-snapshotter v3.0.3](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.3)
        *   Updated to [external-resizer v1.1.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.1.0)
    *   Updated to [DO CCM v0.1.31](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.31)

### 1.18.10-do.3 (January 6, 2021)[](#11810-do3-january-6-2021)

*   Upgrades to system components:
    *   Updated to [external-provisioner v2.0.4](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.0.4)
    *   Updated to [external-attacher v3.0.2](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.0.2)
    *   Mitigated CVE-2020-8569 by updating to [external-snapshotter v3.0.2](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.2)
    *   Updated to [external-resizer v1.0.1](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.0.1)
*   Mitigated a potential kernel deadlock by disabling frame buffer mode for the video console.

### 1.18.10-do.2 (November 5, 2020)[](#11810-do2-november-5-2020)

*   Upgrades to system components:
    *   Fix resizer misconfiguration on CSI driver v2.1.1

### 1.18.10-do.1 (November 2, 2020)[](#11810-do1-november-2-2020)

*   Upgrades to system components:
    *   Updated to [CSI driver v2.1.1](https://github.com/digitalocean/csi-digitalocean/releases/tag/v2.1.1)
        *   Added `--default-fstype=ext4` to csi-provisioner fixing `fsGroup` bug
    *   Updated to [Cilium 1.7.11](https://github.com/cilium/cilium/releases/tag/v1.7.11)
    *   Updated to [DO CCM v0.1.30](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.30)
        *   Added support for specifying load balancer size (available in closed beta at the time of this release)

### 1.18.10-do.0 (October 27, 2020)[](#11810-do0-october-27-2020)

*   Upgrades to system components:
    *   Updated to [DO CCM v0.1.29](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.29)
    *   Updated to [CSI driver v2.1.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v2.1.0)
        *   Added support for Kubernetes 1.19
        *   Updated to [external-provisioner v2.0.2](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v2.0.2)
        *   Updated to [external-attacher v3.0.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v3.0.0)
        *   Updated to [external-snapshotter v3.0.0](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v3.0.0)
        *   Updated to [external-resizer v1.0.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v1.0.0)
*   Reduced [`--terminated-pod-gc-threshold`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/) on kube-controller-manager to 100 pods

### 1.18.8-do.1 (September 30, 2020)[](#1188-do1-september-30-2020)

*   Upgrades to system components:
    *   Updated to [Cilium 1.7.9](https://github.com/cilium/cilium/releases/tag/v1.7.9)
*   Updated Linux kernel to 4.19.0-11
    *   Addresses [CVE-2020-14386](https://security-tracker.debian.org/tracker/CVE-2020-14386)
*   Fixed issue with kernel module availability that affected StorageOS and other storage solutions

### 1.18.8-do.0 (August 31, 2020)[](#1188-do0-august-31-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.18.8](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.18.md#changelog-since-v1187)
    *   Updated to [Cilium v1.7.7](https://github.com/cilium/cilium/releases/tag/v1.7.7)
    *   Updated to [CoreDNS v1.6.9](https://github.com/coredns/coredns/releases/tag/v1.6.9)
*   Changes to our node images:
    *   Updated base operating system to Debian 10.
    *   Stopped using the deprecated `hyperkube` container to run Kubernetes components.

### 1.18.6-do.0 (July 20, 2020)[](#1186-do0-july-20-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.18.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.18.md#changelog-since-v1186)
        *   Fixes [CVE-2020-8557](https://github.com/kubernetes/kubernetes/issues/93032)
        *   Fixes [CVE-2020-8559](https://github.com/kubernetes/kubernetes/issues/92914)

### 1.18.3-do.0 (June 22, 2020)[](#1183-do0-june-22-2020)

* * *

**Important Upgrade Notes For Volume Snapshot Users**

Starting with DigitalOcean Kubernetes 1.18, alpha versions of [volume snapshots](https://kubernetes.io/docs/concepts/storage/volume-snapshots/) are no longer supported. If existing volume snapshots meet the upgrade requirements, they will be converted automatically to the beta version of a volume snapshot when upgrading a cluster to 1.18.

Alpha versions of volume snapshots can continue to be used with versions prior to 1.18.

Consult the [volume snapshots migration notes](/products/kubernetes/details/volume-features/#volume-snapshots-migration-from-alpha-to-beta) before upgrading.

* * *

*   First 1.18.x release
*   Upgrades to system components:
    *   Updated to [etcd v3.4.9](https://github.com/etcd-io/etcd/releases/tag/v3.4.9)
    *   Updated to [Cilium v1.7.5](https://github.com/cilium/cilium/releases/tag/v1.7.5)
    *   Updated to [DO CCM v0.1.26](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.26)
*   Added support for migrating load balancers across clusters (see [the guide](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/examples/README.md#changing-ownership-of-a-load-balancer-for-migration-purposes) for details)
    *   Updated to [DO CSI v2.0.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v2.0.0)
        *   Removed support for alpha snapshots
        *   Added support for beta snapshots (consult the volume snapshot migration notes for details)
    *   Updated to [DOKS Cluster Autoscaler 1.18.3-do.0](https://github.com/digitalocean/autoscaler/)
    *   Exposed kube-proxy Prometheus metrics endpoint on `:10249/metrics`

Version 1.17.x releases

### 1.17.16-do.0 (February 2, 2021)[](#11716-do0-february-2-2021)

*   Updated to [DO CCM v0.1.31](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.31)

### 1.17.13-do.3 (January 6, 2021)[](#11713-do3-january-6-2021)

*   Mitigated a potential kernel deadlock by disabling frame buffer mode for the video console.

### 1.17.13-do.2 (November 5, 2020)[](#11713-do2-november-5-2020)

*   Internal build process optimization.

### 1.17.13-do.1 (November 2, 2020)[](#11713-do1-november-2-2020)

*   Upgrades to system components:
    *   Updated to [Cilium 1.7.11](https://github.com/cilium/cilium/releases/tag/v1.7.11)
    *   Updated to [DO CCM v0.1.30](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.30)
        *   Added support for specifying load balancer size (available in closed beta at the time of this release)

### 1.17.13-do.0 (October 27, 2020)[](#11713-do0-october-27-2020)

*   Upgrades to system components:
    *   Updated to [DO CCM v0.1.29](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.29)
*   Reduced [`--terminated-pod-gc-threshold`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/) on kube-controller-manager to 100 pods

### 1.17.11-do.1 (September 30, 2020)[](#11711-do1-september-30-2020)

*   Upgrades to system components:
    *   Updated to [Cilium 1.7.9](https://github.com/cilium/cilium/releases/tag/v1.7.9)
*   Updated Linux kernel to 4.19.0-11
    *   Addresses [CVE-2020-14386](https://security-tracker.debian.org/tracker/CVE-2020-14386)
*   Fixed issue with kernel module availability that affected StorageOS and other storage solutions

### 1.17.11-do.0 (August 31, 2020)[](#11711-do0-august-31-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.17.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.17.md#changelog-since-v11710)
    *   Updated to [Cilium v1.7.7](https://github.com/cilium/cilium/releases/tag/v1.7.7)
    *   Updated to [CoreDNS v1.6.9](https://github.com/coredns/coredns/releases/tag/v1.6.9)
*   Changes to our node images:
    *   Updated base operating system to Debian 10.
    *   Stopped using the deprecated `hyperkube` container to run Kubernetes components.

### 1.17.9-do.0 (July 20, 2020)[](#1179-do0-july-20-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.17.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.17.md#changelog-since-v1179)
        *   Fixes [CVE-2020-8557](https://github.com/kubernetes/kubernetes/issues/93032)
        *   Fixes [CVE-2020-8559](https://github.com/kubernetes/kubernetes/issues/92914)

### 1.17.6-do.0 (June 22, 2020)[](#1176-do0-june-22-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.17.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.17.md#changelog-since-v1176)
    *   Updated to [etcd v3.4.9](https://github.com/etcd-io/etcd/releases/tag/v3.4.9)
    *   Updated to [Cilium v1.7.5](https://github.com/cilium/cilium/releases/tag/v1.7.5)
    *   Updated to [DO CCM v0.1.26](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.26)
        *   Added support for migrating load balancers across clusters (see [the guide](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/examples/README.md#changing-ownership-of-a-load-balancer-for-migration-purposes) for details)
    *   Updated to [DOKS Cluster Autoscaler v1.17.6-do.0](https://github.com/digitalocean/autoscaler/)
*   Fixed issue with worker nodes occasionally not finishing to provision
*   Moved kubelet-rubber-stamp application from in-cluster to the control plane
*   Exposed kube-proxy Prometheus metrics endpoint on `:10249/metrics`

### 1.17.5-do.0 (May 7, 2020)[](#1175-do0-may-7-2020)

*   First 1.17.x release
    
*   Upgrades to system components:
    
    *   Updated to [Cilium v1.7.3](https://github.com/cilium/cilium/releases/tag/v1.7.3)
    *   Updated to [DO CCM 0.1.24](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.24)
    *   Updated to [DO CSI 1.3.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.3.0)
    *   Updated to [DOKS Cluster Autoscaler 1.17.5-do.0](https://github.com/digitalocean/autoscaler/)
        *   Addresses [bug where we rejected downscaling to the minimum size](https://github.com/digitalocean/autoscaler/pull/5)

Version 1.16.x releases

### 1.16.15-do.2 (February 2, 2021)[](#11615-do2-february-2-2021)

*   Internal build process optimization.

### 1.16.15-do.1 (November 2, 2020)[](#11615-do1-november-2-2020)

*   Internal build process optimization.

### 1.16.15-do.0 (October 27, 2020)[](#11615-do0-october-27-2020)

*   Upgrades to system components:
    *   Updated to [DO CCM v0.1.29](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.29)

### 1.16.14-do.1 (September 30, 2020)[](#11614-do1-september-30-2020)

*   Upgrades to system components:
    *   Updated to [Cilium 1.7.9](https://github.com/cilium/cilium/releases/tag/v1.7.9)
*   Updated Linux kernel to 4.19.0-11
    *   Addresses [CVE-2020-14386](https://security-tracker.debian.org/tracker/CVE-2020-14386)
*   Fixed issue with kernel module availability that affected StorageOS and other storage solutions

### 1.16.14-do.0 (August 31, 2020)[](#11614-do0-august-31-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.16.14](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.16.md#changelog-since-v11613)
    *   Updated to [Cilium v1.7.7](https://github.com/cilium/cilium/releases/tag/v1.7.7)
    *   Updated to [CoreDNS v1.6.9](https://github.com/coredns/coredns/releases/tag/v1.6.9)
*   Changes to our node images:
    *   Updated base operating system to Debian 10.
    *   Stopped using the deprecated `hyperkube` container to run Kubernetes components.

### 1.16.13-do.0 (July 20, 2020)[](#11613-do0-july-20-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.16.13](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.16.md#changelog-since-v11613)
        *   Fixes [CVE-2020-8557](https://github.com/kubernetes/kubernetes/issues/93032)
        *   Fixes [CVE-2020-8559](https://github.com/kubernetes/kubernetes/issues/92914)

### 1.16.10-do.0 (June 22, 2020)[](#11610-do0-june-22-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.16.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.16.md#changelog-since-v1169)
    *   Updated to [etcd v3.3.22](https://github.com/etcd-io/etcd/releases/tag/v3.3.22)
    *   Updated to [Cilium v1.7.5](https://github.com/cilium/cilium/releases/tag/v1.7.5)
    *   Updated to [DO CCM v0.1.26](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.26)
        *   Added support for migrating load balancers across clusters (see [the guide](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/examples/README.md#changing-ownership-of-a-load-balancer-for-migration-purposes) for details)
    *   Updated to [DOKS Cluster Autoscaler v1.16.10-do.0](https://github.com/digitalocean/autoscaler/)
        *   Fixed a bug about extra pods being scheduled unnecessarily during a rolling upgrade ([kubernetes/kubernetes#72775](https://github.com/kubernetes/kubernetes/issues/72775))
*   Fixed Cilium crashes when upgrading Cilium 1.6 to 1.7
*   Fixed issue with worker nodes occasionally not finishing to provision
*   Moved kubelet-rubber-stamp application from in-cluster to the control plane
*   Exposed kube-proxy Prometheus metrics endpoint on `:10249/metrics`

### 1.16.8-do.0 (May 7, 2020)[](#1168-do0-may-7-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.16.8](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.16.md#changelog-since-v1168)
    *   Updated to [Cilium v1.7.3](https://github.com/cilium/cilium/releases/tag/v1.7.3)
    *   Updated to [DO CCM 0.1.24](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.24)
    *   Updated to [DO CSI 1.3.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.3.0)
    *   Updated to [DOKS Cluster Autoscaler 1.16.8-do.0](https://github.com/digitalocean/autoscaler/)
        *   Addresses [bug where we rejected downscaling to the minimum size](https://github.com/digitalocean/autoscaler/pull/5)

### 1.16.6-do.2 (March 17, 2020)[](#1166-do2-march-17-2020)

*   Downgrades to system components:
    *   Downgraded to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
        *   The upgrade to v1.6.7 in the previous release caused `cilium-operator` to crash loop.

### 1.16.6-do.1 (March 13, 2020)[](#1166-do1-march-13-2020)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.7](https://github.com/cilium/cilium/releases/tag/v1.6.7)

### 1.16.6-do.0 (February 6, 2020)[](#1166-do0-february-6-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.16.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.16.md#changelog-since-v1165)
    *   Updated to [DO CCM v0.1.23](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.23)
        *   Added `service.beta.kubernetes.io/do-loadbalancer-healthcheck-port` annotation to customize DO LB health-check port
        *   Fixed bug for maintaining default protocol when secure protocol override is applied

### 1.16.2-do.3 (January 22, 2020)[](#1162-do3-january-22-2020)

*   Upgrades to system components:
    *   Updated to [CSI driver v1.2.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.2.0)
        *   Added support for volume expansion
        *   Added support for raw block volumes
        *   Added support for volume statistics
        *   Various improvements and bug fixes
        *   Updated to [external-provisioner v1.4.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v1.4.0)
        *   Updated to [external-attacher v2.0.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v2.0.0)
        *   Installed [external-resizer v0.3.0](https://github.com/kubernetes-csi/external-resizer/releases/tag/v0.3.0)
    *   Updated to [DO CCM v0.1.22](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.22)
*   Added `PodDisruptionBudget`s for managed kube-system applications to [avoid blocking the cluster autoscaler (CA)](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-to-set-pdbs-to-enable-ca-to-move-kube-system-pods)

### 1.16.2-do.2 (January 10, 2020)[](#1162-do2-january-10-2020)

*   Fix a regression in 1.16.x versions that could result in a worker node initializing with incorrect cluster networking configuration.

### 1.16.2-do.1 (December 9, 2019)[](#1162-do1-december-9-2019)

*   Set eviction threshold for `imagefs.inodesFree` to [ensure Kubelet cleans up unused images before inodes are exhausted completely](https://kubernetes.io/docs/tasks/administer-cluster/out-of-resource/#with-imagefs).
*   Retain customer-configured reclaim policy for the `do-block-storage` StorageClass across upgrades
*   Upgrades to system components:
    *   Updated to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
    *   Updated CSI driver sidecars to fix [CVE-2019-11255](https://github.com/kubernetes/kubernetes/issues/85233)
        *   Updated to [external-provisioner v1.3.1](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v1.3.1)
        *   Updated to [external-snapshotter v1.2.2](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v1.2.2)

### 1.16.2-do.0 (November 5, 2019)[](#1162-do0-november-5-2019)

*   First 1.16.x release
    
*   Upgrades to system components:
    
    *   Updated to [Cilium v1.6.3](https://github.com/cilium/cilium/releases/tag/v1.6.3)
    *   Updated to [DO CCM 0.1.21](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.21)
*   Disabled Istio sidecar injection for kube-system namespace
    

Version 1.15.x releases

### 1.15.12-do.6 (February 2, 2021)[](#11512-do6-february-2-2021)

*   Internal build process optimization.

### 1.15.12-do.5 (November 2, 2020)[](#11512-do5-november-2-2020)

*   Internal build process optimization.

### 1.15.12-do.4 (October 27, 2020)[](#11512-do4-october-27-2020)

*   Updated Linux kernel to 4.19.0-11

### 1.15.12-do.1 (September 30, 2020)[](#11512-do1-september-30-2020)

*   Internal build process optimization.

### 1.15.12-do.0 (June 22, 2020)[](#11512-do0-june-22-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.15.12](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.15.md#changelog-since-v11511)
    *   Updated to [etcd v3.3.22](https://github.com/etcd-io/etcd/releases/tag/v3.3.22)
    *   Updated to [Cilium v1.7.5](https://github.com/cilium/cilium/releases/tag/v1.7.5)
    *   Updated to [DO CCM v0.1.26](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.26)
        *   Added support for migrating load balancers across clusters (see [the guide](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/examples/README.md#changing-ownership-of-a-load-balancer-for-migration-purposes) for details)
    *   Updated to [DOKS Cluster Autoscaler v1.15.12-do.0](https://github.com/digitalocean/autoscaler/)
        *   Fixed a bug about extra pods being scheduled unnecessarily during a rolling upgrade ([kubernetes/kubernetes#72775](https://github.com/kubernetes/kubernetes/issues/72775))
*   Fixed Cilium crashes when upgrading Cilium 1.6 to 1.7
*   Fixed issue with worker nodes occasionally not finishing to provision
*   Moved kubelet-rubber-stamp application from in-cluster to the control plane
*   Exposed kube-proxy Prometheus metrics endpoint on `:10249/metrics`

### 1.15.11-do.0 (May 7, 2020)[](#11511-do0-may-7-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.15.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.15.md#changelog-since-v11511)
    *   Updated to [Cilium v1.7.3](https://github.com/cilium/cilium/releases/tag/v1.7.3)
    *   Updated to [DO CCM 0.1.24](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.24)
    *   Updated to [DO CSI 1.3.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.3.0)
    *   Updated to [DOKS Cluster Autoscaler 1.16.8-do.0](https://github.com/digitalocean/autoscaler/)
        *   Addresses [bug where we rejected downscaling to the minimum size](https://github.com/digitalocean/autoscaler/pull/5)

### 1.15.9-do.2 (March 17, 2020)[](#1159-do2-march-17-2020)

*   Downgrades to system components:
    *   Downgraded to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
        *   The upgrade to v1.6.7 in the previous release caused `cilium-operator` to crash loop.

### 1.15.9-do.1 (March 13, 2020)[](#1159-do1-march-13-2020)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.7](https://github.com/cilium/cilium/releases/tag/v1.6.7)

### 1.15.9-do.0 (February 6, 2020)[](#1159-do0-february-6-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.15.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.15.md#changelog-since-v1158)
    *   Updated to [DO CCM v0.1.23](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.23)
        *   Added `service.beta.kubernetes.io/do-loadbalancer-healthcheck-port` annotation to customize DO LB health-check port
        *   Fixed bug for maintaining default protocol when secure protocol override is applied

### 1.15.5-do.3 (January 22, 2020)[](#1155-do3-january-22-2020)

*   Upgrades to system components:
    *   Updated to [CSI driver v1.2.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.2.0)
        *   Added support for raw block volumes
        *   Added support for volume statistics
        *   Various improvements and bug fixes
        *   Updated to [external-provisioner v1.4.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v1.4.0)
        *   Updated to [external-attacher v2.0.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v2.0.0)
    *   Updated to [DO CCM v0.1.22](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.22)
*   Added `PodDisruptionBudget`s for managed kube-system applications to [avoid blocking the cluster autoscaler (CA)](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-to-set-pdbs-to-enable-ca-to-move-kube-system-pods)

### 1.15.5-do.2 (December 9, 2019)[](#1155-do2-december-9-2019)

*   Set eviction threshold for `imagefs.inodesFree` to [ensure Kubelet cleans up unused images before inodes are exhausted completely](https://kubernetes.io/docs/tasks/administer-cluster/out-of-resource/#with-imagefs).
*   Retain customer-configured reclaim policy for the `do-block-storage` StorageClass across upgrades
*   Upgrades to system components:
    *   Updated to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
    *   Updated CSI driver sidecars to fix [CVE-2019-11255](https://github.com/kubernetes/kubernetes/issues/85233)
        *   Updated to [external-provisioner v1.3.1](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v1.3.1)
        *   Updated to [external-snapshotter v1.2.2](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v1.2.2)

### 1.15.5-do.1 (November 5, 2019)[](#1155-do1-november-5-2019)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.3](https://github.com/cilium/cilium/releases/tag/v1.6.3)
    *   Updated to [DO CCM 0.1.21](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.21)
*   Disabled Istio sidecar injection for kube-system namespace

### 1.15.5-do.0 (October 21, 2019)[](#1155-do0-october-21-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.15.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.15.md#changelog-since-v1154)
        *   Fix for [CVE-2019-11253](https://nvd.nist.gov/vuln/detail/CVE-2019-11253)

### 1.15.4-do.0 (October 7, 2019)[](#1154-do0-october-7-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.15.4](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.15.md#changelog-since-v1153)
    *   Added support to kubelets for [OpenEBS](https://openebs.io) via ISCSI

### 1.15.3-do.3 (September 24, 2019)[](#1153-do3-september-24-2019)

*   Upgrades to system components:
    *   Updated to [Cilium v1.5.8](https://github.com/cilium/cilium/releases/tag/v1.5.8)
    *   Updated to [DO CSI 1.1.2](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.1.2)
    *   Added [Cluster Autoscaler](https://github.com/digitalocean/autoscaler) support to DOKS
        *   Enables DOKS clusters to scale worker node pools up or down according to load within minimum and maximum limits specified by users.

### 1.15.3-do.2 (September 10, 2019)[](#1153-do2-september-10-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.20](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.20)
        *   Fix load balancer bug related to handling of DigitalOcean Let’s Encrypt certificates that have been automatically rotated by DigitalOcean’s LBaaS.
        *   Fix an issue around load balancers being deleted manually that was introduced in v0.1.17.
        *   Reduce API interactions around LB tag synchronization.
    *   Added [kubelet-rubber-stamp v0.1.1](https://github.com/digitalocean/kubelet-rubber-stamp/releases/tag/v0.1.1)
        *   Enables Kubelets on worker nodes to serve TLS from node IPs, which [improves integration with add-ons and integrations that require it](https://github.com/digitalocean/DOKS/issues/6).

### 1.15.3-do.1 (August 27, 2019)[](#1153-do1-august-27-2019)

*   Upgrades to system components:
    *   Updated to [Cilium 1.5.7](https://github.com/cilium/cilium/releases/tag/v1.5.7)

### 1.15.3-do.0 (August 21, 2019)[](#1153-do0-august-21-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.15.3](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.15.md#changelog-since-v1152)
        *   Update golang/x/net dependency to bring in fixes for CVE-2019-9512, CVE-2019-9514
    *   Updated to [Cilium 1.5.6](https://github.com/cilium/cilium/releases/tag/v1.5.6)
    *   Updated do-agent to use the wildcard toleration.

### 1.15.2-do.0 (August 12, 2019)[](#1152-do0-august-12-2019)

*   First 1.15.x release

Version 1.14.x releases

### 1.14.10-do.9 (February 2, 2021)[](#11410-do9-february-2-2021)

*   Internal build process optimization.

### 1.14.10-do.8 (October 27, 2020)[](#11410-do8-october-27-2020)

*   Updated Linux kernel to 4.19.0-11

### 1.14.10-do.5 (September 30, 2020)[](#11410-do5-september-30-2020)

*   Internal build process optimization.

### 1.14.10-do.4 (June 22, 2020)[](#11410-do4-june-22-2020)

*   Upgrades to system components:
    *   Updated to [etcd v3.3.22](https://github.com/etcd-io/etcd/releases/tag/v3.3.22)
    *   Updated to [Cilium v1.7.5](https://github.com/cilium/cilium/releases/tag/v1.7.5)
    *   Updated to [DO CCM v0.1.26](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.26)
        *   Added support for migrating load balancers across clusters (see [the guide](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/examples/README.md#changing-ownership-of-a-load-balancer-for-migration-purposes) for details)
    *   Updated to [DOKS Cluster Autoscaler v1.14.10-do.3](https://github.com/digitalocean/autoscaler/)
        *   Fixed a bug about extra pods being scheduled unnecessarily during a rolling upgrade ([kubernetes/kubernetes#72775](https://github.com/kubernetes/kubernetes/issues/72775))
*   Fixed Cilium crashes when upgrading Cilium 1.6 to 1.7
*   Fixed issue with worker nodes occasionally not finishing to provision
*   Moved kubelet-rubber-stamp application from in-cluster to the control plane

### 1.14.10-do.3 (May 7, 2020)[](#11410-do3-may-7-2020)

*   Upgrades to system components:
    *   Updated to [Cilium v1.7.3](https://github.com/cilium/cilium/releases/tag/v1.7.3)
    *   Updated to [DO CCM 0.1.24](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.24)
    *   Updated to [DO CSI 1.3.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.3.0)
    *   Updated to [DOKS Cluster Autoscaler 1.16.8-do.0](https://github.com/digitalocean/autoscaler/)
        *   Addresses [bug where we rejected downscaling to the minimum size](https://github.com/digitalocean/autoscaler/pull/5)

### 1.14.10-do.2 (March 17, 2020)[](#11410-do2-march-17-2020)

*   Downgrades to system components:
    *   Downgraded to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
        *   The upgrade to v1.6.7 in the previous release caused `cilium-operator` to crash loop.

### 1.14.10-do.1 (March 13, 2020)[](#11410-do1-march-13-2020)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.7](https://github.com/cilium/cilium/releases/tag/v1.6.7)

### 1.14.10-do.0 (February 6, 2020)[](#11410-do0-february-6-2020)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.14.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.14.md#changelog-since-v1149)
    *   Updated to [DO CCM v0.1.23](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.23)
        *   Added `service.beta.kubernetes.io/do-loadbalancer-healthcheck-port` annotation to customize DO LB health-check port
        *   Fixed bug for maintaining default protocol when secure protocol override is applied

### 1.14.8-do.3 (January 22, 2020)[](#1148-do3-january-22-2020)

*   Upgrades to system components:
    *   Updated to [CSI driver v1.2.0](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.2.0)
        *   Added support for raw block volumes
        *   Added support for volume statistics
        *   Various improvements and bug fixes
        *   Updated to [external-provisioner v1.4.0](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v1.4.0)
        *   Updated to [external-attacher v2.0.0](https://github.com/kubernetes-csi/external-attacher/releases/tag/v2.0.0)
    *   Updated to [DO CCM v0.1.22](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.22)
*   Added `PodDisruptionBudget`s for managed kube-system applications to [avoid blocking the cluster autoscaler (CA)](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-to-set-pdbs-to-enable-ca-to-move-kube-system-pods)

### 1.14.8-do.2 (December 9, 2019)[](#1148-do2-december-9-2019)

*   Set eviction threshold for `imagefs.inodesFree` to [ensure Kubelet cleans up unused images before inodes are exhausted completely](https://kubernetes.io/docs/tasks/administer-cluster/out-of-resource/#with-imagefs).
*   Retain customer-configured reclaim policy for the `do-block-storage` StorageClass across upgrades
*   Upgrades to system components:
    *   Updated to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
    *   Updated CSI driver sidecars to fix [CVE-2019-11255](https://github.com/kubernetes/kubernetes/issues/85233)
        *   Updated to [external-provisioner v1.2.2](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v1.2.2)
        *   Updated to [external-snapshotter v1.2.2](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v1.2.2)

### 1.14.8-do.1 (November 5, 2019)[](#1148-do1-november-5-2019)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.3](https://github.com/cilium/cilium/releases/tag/v1.6.3)
    *   Updated to [DO CCM 0.1.21](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.21)
*   Disabled Istio sidecar injection for kube-system namespace

### 1.14.8-do.0 (October 21, 2019)[](#1148-do0-october-21-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.14.8](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.14.md#changelog-since-v1147)

### 1.14.7-do.0 (October 7, 2019)[](#1147-do0-october-7-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.14.7](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.14.md#changelog-since-v1146)
    *   Added support to kubelets for [OpenEBS](https://openebs.io) via ISCSI

### 1.14.6-do.3 (September 24, 2019)[](#1146-do3-september-24-2019)

*   Upgrades to system components:
    *   Updated to [Cilium v1.5.8](https://github.com/cilium/cilium/releases/tag/v1.5.8)
    *   Updated to [DO CSI 1.1.2](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.1.2)
    *   Added [Cluster Autoscaler](https://github.com/digitalocean/autoscaler) support to DOKS
        *   Enables DOKS clusters to scale worker node pools up or down according to load within minimum and maximum limits specified by users.

### 1.14.6-do.2 (September 10, 2019)[](#1146-do2-september-10-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.20](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.20)
        *   Fix load balancer bug related to handling of DigitalOcean Let’s Encrypt certificates that have been automatically rotated by DigitalOcean’s LBaaS.
        *   Fix an issue around load balancers being deleted manually that was introduced in v0.1.17.
        *   Reduce API interactions around LB tag synchronization.
    *   Added [kubelet-rubber-stamp v0.1.1](https://github.com/digitalocean/kubelet-rubber-stamp/releases/tag/v0.1.1)
        *   Enables Kubelets on worker nodes to serve TLS from node IPs, which [improves integration with add-ons and integrations that require it](https://github.com/digitalocean/DOKS/issues/6).

### 1.14.6-do.1 (August 27, 2019)[](#1146-do1-august-27-2019)

*   Upgrades to system components:
    *   Updated to [Cilium 1.5.7](https://github.com/cilium/cilium/releases/tag/v1.5.7)
        *   Fix for [CVE-2019-11253](https://nvd.nist.gov/vuln/detail/CVE-2019-11253)

### 1.14.6-do.0 (August 21, 2019)[](#1146-do0-august-21-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.14.6](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.14.md#changelog-since-v1145)
        *   Update golang/x/net dependency to bring in fixes for CVE-2019-9512, CVE-2019-9514
    *   Updated to [Cilium 1.5.6](https://github.com/cilium/cilium/releases/tag/v1.5.6)
    *   Updated do-agent to use the wildcard toleration.

### 1.14.5-do.0 (August 7, 2019)[](#1145-do0-august-7-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.17](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.17)
    *   Updated to [Kubernetes 1.14.5](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.14.md#v1145)

### 1.14.4-do.1 (July 29, 2019)[](#1144-do1-july-29-2019)

*   Fix for Cilium-related upgrade path bug.

### 1.14.4-do.0 (July 18, 2019)[](#1144-do0-july-18-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.16](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.16)
    *   Updated to [Kubernetes 1.14.4](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.14.md#v1144)
    *   Updated to [Cilium 1.5.4](https://github.com/cilium/cilium/releases/tag/v1.5.4)
        *   See also: [Cilium 1.5 Release Blog/Highlights](https://cilium.io/blog/2019/04/24/cilium-15/#15Highlights)
    *   Enable hostPort via Cilium CNI portmap config.

### 1.14.3-do.0 (July 3, 2019)[](#1143-do0-july-3-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.14.3](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.14.md#v1143)
    *   Updated to [DO CSI 1.1.1](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.1.1)
    *   Updated to [DO CCM 0.1.15](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.15)
*   Improvements to security of the master node.
*   Updated kernel to address security recent TCP related CVEs:
    *   [CVE-2019-11477](https://security-tracker.debian.org/tracker/CVE-2019-11477)
    *   [CVE-2019-11478](https://security-tracker.debian.org/tracker/CVE-2019-11478)
    *   [CVE-2019-5599](https://security-tracker.debian.org/tracker/CVE-2019-5599)
    *   [CVE-2019-11479](https://security-tracker.debian.org/tracker/CVE-2019-11479)
*   Improvements to cluster reliability:
    *   Add NoSchedule, NoExecute, CritialAddonsOnly tolerations and priorityClassName system-node-critical to worker kube-system components.
    *   Use k8s api public IP address instead of kube-proxy to reduce time to ready for nodes.
*   Fix kube-proxy container name (previously incorrectly named “kube-controller-manager”).

### 1.14.1-do.4 (June 6, 2019)[](#1141-do4-june-6-2019)

*   Improvements to security and reliability of the master node

### 1.14.1-do.3 (May 31, 2019)[](#1141-do3-may-31-2019)

*   Downgraded Kubernetes to 1.14.1 to address ([CVE-2019-11245](https://github.com/kubernetes/kubernetes/issues/78308))

### 1.14.2-do.1 (May 29, 2019)[](#1142-do1-may-29-2019)

*   Updated kernel to include mitigations for MDS / Zombie Load (CVE-2018-12130) vulnerability.

### 1.14.2-do.0 (May 17, 2019)[](#1142-do0-may-17-2019)

*   Updated Kubernetes to 1.14.2.

### 1.14.1-do.2 (May 3, 2019)[](#1141-do2-may-3-2019)

*   Fixed a Cilium startup race condition that results in node connectivity issues with in cluster networking

### 1.14.1-do.1 (May 1, 2019)[](#1141-do1-may-1-2019)

Should have been named `1.14.1-do.0`.

*   First 1.14.x release
*   Updated CSI to support Kubernetes 1.14
*   Includes all the changes from [`1.13.5-do.2`](#1-13-5-do-2)

Version 1.13.x releases

### 1.13.12-do.13 (February 2, 2021)[](#11312-do13-february-2-2021)

*   Internal build process optimization.

### 1.13.12-do.12 (October 27, 2020)[](#11312-do12-october-27-2020)

*   Updated Linux kernel to 4.19.0-11

### 1.13.12-do.9 (September 30, 2020)[](#11312-do9-september-30-2020)

*   Internal build process optimization.

### 1.13.12-do.8 (June 22, 2020)[](#11312-do8-june-22-2020)

*   Fixed Cilium crashes when upgrading Cilium 1.6 to 1.7
*   Fixed issue with worker nodes occasionally not finishing to provision
*   Moved kubelet-rubber-stamp application from in-cluster to the control plane

### 1.13.12-do.7 (May 7, 2020)[](#11312-do7-may-7-2020)

*   Upgrades to system components:
    *   Updated to [Cilium v1.7.3](https://github.com/cilium/cilium/releases/tag/v1.7.3)

### 1.13.12-do.6 (March 17, 2020)[](#11312-do6-march-17-2020)

*   Downgrades to system components:
    *   Downgraded to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
        *   The upgrade to v1.6.7 in the previous release caused `cilium-operator` to crash loop.

### 1.13.12-do.5 (March 13, 2020)[](#11312-do5-march-13-2020)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.7](https://github.com/cilium/cilium/releases/tag/v1.6.7)

### 1.13.12-do.4 (February 6, 2020)[](#11312-do4-february-6-2020)

*   Upgrades to system components:
    *   Updated to [DO CCM v0.1.23](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.23)
        *   Added `service.beta.kubernetes.io/do-loadbalancer-healthcheck-port` annotation to customize DO LB health-check port
        *   Fixed bug for maintaining default protocol when secure protocol override is applied

### 1.13.12-do.3 (January 22, 2020)[](#11312-do3-january-22-2020)

*   Upgrades to system components:
    *   Updated to [CSI driver v1.0.4](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.0.4)
        *   Various improvements and bug fixes
    *   Updated to [DO CCM v0.1.22](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.22)
*   Added `PodDisruptionBudget`s for managed kube-system applications to [avoid blocking the cluster autoscaler (CA)](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-to-set-pdbs-to-enable-ca-to-move-kube-system-pods)

### 1.13.12-do.2 (December 9, 2019)[](#11312-do2-december-9-2019)

*   Retain customer-configured reclaim policy for the `do-block-storage` StorageClass across upgrades
*   Upgrades to system components:
    *   Updated to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
    *   Updated CSI driver sidecars to fix [CVE-2019-11255](https://github.com/kubernetes/kubernetes/issues/85233)
        *   Updated to [external-provisioner v1.0.2](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v1.0.2)
        *   Updated to [external-snapshotter v1.0.2](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v1.0.2)

### 1.13.12-do.0 (October 21, 2019)[](#11312-do0-october-21-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.13.12](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.13.md#changelog-since-v11311)
        *   Fix for [CVE-2019-11253](https://nvd.nist.gov/vuln/detail/CVE-2019-11253)

### 1.13.11-do.0 (October 7, 2019)[](#11311-do0-october-7-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.13.11](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.13.md#changelog-since-v11310)
    *   Added support to kubelets for [OpenEBS](https://openebs.io) via ISCSI

### 1.13.10-do.3 (September 24, 2019)[](#11310-do3-september-24-2019)

*   Upgrades to system components:
    *   Updated to [Cilium v1.5.8](https://github.com/cilium/cilium/releases/tag/v1.5.8)
    *   Updated to [DO CSI 1.0.3](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.0.3)
    *   Added [Cluster Autoscaler](https://github.com/digitalocean/autoscaler) support to DOKS
        *   Enables DOKS clusters to scale worker node pools up or down according to load within minimum and maximum limits specified by users.

### 1.13.10-do.2 (September 10, 2019)[](#11310-do2-september-10-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.20](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.20)
        *   Fix load balancer bug related to handling of DigitalOcean Let’s Encrypt certificates that have been automatically rotated by DigitalOcean’s LBaaS.
        *   Fix an issue around load balancers being deleted manually that was introduced in v0.1.17.
        *   Reduce API interactions around LB tag synchronization.
    *   Added [kubelet-rubber-stamp v0.1.1](https://github.com/digitalocean/kubelet-rubber-stamp/releases/tag/v0.1.1)
        *   Enables Kubelets on worker nodes to serve TLS from node IPs, which [improves integration with add-ons and integrations that require it](https://github.com/digitalocean/DOKS/issues/6).

### 1.13.10-do.1 (August 27, 2019)[](#11310-do1-august-27-2019)

*   Upgrades to system components:
    *   Updated to [Cilium 1.5.7](https://github.com/cilium/cilium/releases/tag/v1.5.7)

### 1.13.10-do.0 (August 21, 2019)[](#11310-do0-august-21-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.13.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.13.md#changelog-since-v1139)
        *   Update golang/x/net dependency to bring in fixes for CVE-2019-9512, CVE-2019-9514
    *   Updated to [Cilium 1.5.6](https://github.com/cilium/cilium/releases/tag/v1.5.6)
    *   Updated do-agent to use the wildcard toleration.

### 1.13.9-do.0 (August 7, 2019)[](#1139-do0-august-7-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.17](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.17)
    *   Updated to [Kubernetes 1.13.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.13.md#v1139)

### 1.13.8-do.1 (July 29, 2019)[](#1138-do1-july-29-2019)

*   Fix for Cilium-related upgrade path bug.

### 1.13.8-do.0 (July 18, 2019)[](#1138-do0-july-18-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.16](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.16)
    *   Updated to [Kubernetes 1.13.8](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.13.md#v1138)
    *   Updated to [Cilium 1.5.4](https://github.com/cilium/cilium/releases/tag/v1.5.4)
        *   See also: [Cilium 1.5 Release Blog/Highlights](https://cilium.io/blog/2019/04/24/cilium-15/#15Highlights)

### 1.13.7-do.0 (July 3, 2019)[](#1137-do0-july-3-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.13.7](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.13.md#v1137)
    *   Updated to [DO CSI 1.0.2](https://github.com/digitalocean/csi-digitalocean/releases/tag/v1.0.2)
    *   Updated to [DO CCM 0.1.15](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.15)
*   Improvements to security of the master node.
*   Updated kernel to address security recent TCP related CVEs:
    *   [CVE-2019-11477](https://security-tracker.debian.org/tracker/CVE-2019-11477)
    *   [CVE-2019-11478](https://security-tracker.debian.org/tracker/CVE-2019-11478)
    *   [CVE-2019-5599](https://security-tracker.debian.org/tracker/CVE-2019-5599)
    *   [CVE-2019-11479](https://security-tracker.debian.org/tracker/CVE-2019-11479)
*   Improvements to cluster reliability:
    *   Add NoSchedule, NoExecute, CritialAddonsOnly tolerations and priorityClassName system-node-critical to worker kube-system components.
    *   Use k8s api public IP address instead of kube-proxy to reduce time to ready for nodes.
*   Fix kube-proxy container name (previously incorrectly named “kube-controller-manager”).
*   Enable hostPort via Cilium CNI portmap config.

### 1.13.5-do.5 (June 6, 2019)[](#1135-do5-june-6-2019)

*   Improvements to security and reliability of the master node

### 1.13.5-do.4 (May 31, 2019)[](#1135-do4-may-31-2019)

*   Downgraded Kubernetes to 1.13.5 to address ([CVE-2019-11245](https://github.com/kubernetes/kubernetes/issues/78308))

### 1.13.6-do.1 (May 29, 2019)[](#1136-do1-may-29-2019)

*   Updated kernel to include mitigations for MDS / Zombie Load (CVE-2018-12130) vulnerability.

### 1.13.6-do.0 (May 17, 2019)[](#1136-do0-may-17-2019)

*   Updated Kubernetes to 1.13.6.

### 1.13.5-do.3 (May 3, 2019)[](#1135-do3-may-3-2019)

*   Fixed a Cilium startup race condition that results in node connectivity issues with in cluster networking

### 1.13.5-do.2 (April 29, 2019)[](#1135-do2-april-29-2019)

*   Fixed a race condition with CRD resource initialization
*   Updated to DO CSI 1.0.1
*   Updated to DO CCM 0.1.14
*   Updated to Cilium 1.4.4

### 1.13.5-do.1 (April 3, 2019)[](#1135-do1-april-3-2019)

*   Fixed an issue where cluster subnet for a node can conflict
*   \[Limited Availability\] Support for custom VPC

### 1.13.5-do.0 (March 27, 2019)[](#1135-do0-march-27-2019)

*   First 1.13.x release

Version 1.12.x releases

### 1.12.10-do.18 (October 27, 2020)[](#11210-do18-october-27-2020)

*   Updated Linux kernel to 4.19.0-11

### 1.12.10-do.14 (September 30, 2020)[](#11210-do14-september-30-2020)

*   Internal build process optimization.

### 1.12.10-do.13 (May 7, 2020)[](#11210-do13-may-7-2020)

*   Internal build process optimization.

### 1.12.10-do.12 (March 17, 2020)[](#11210-do12-march-17-2020)

*   Downgrades to system components:
    *   Downgraded to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
        *   The upgrade to v1.6.5 in the previous release caused `cilium-operator` to crash loop.

### 1.12.10-do.11 (March 13, 2020)[](#11210-do11-march-13-2020)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.5](https://github.com/cilium/cilium/releases/tag/v1.6.5)

### 1.12.10-do.10 (February 6, 2020)[](#11210-do10-february-6-2020)

*   Upgrades to system components:
    *   Updated to [DO CCM v0.1.23](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.23)
        *   Added `service.beta.kubernetes.io/do-loadbalancer-healthcheck-port` annotation to customize DO LB health-check port
        *   Fixed bug for maintaining default protocol when secure protocol override is applied

### 1.12.10-do.9 (January 22, 2020)[](#11210-do9-january-22-2020)

*   Upgrades to system components:
    *   Updated to [CSI driver v0.4.4](https://github.com/digitalocean/csi-digitalocean/releases/tag/v0.4.4)
        *   Various improvements and bug fixes
    *   Updated to [DO CCM v0.1.22](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.22)
*   Added `PodDisruptionBudget`s for managed kube-system applications to [avoid blocking the cluster autoscaler (CA)](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-to-set-pdbs-to-enable-ca-to-move-kube-system-pods)

### 1.12.10-do.8 (December 9, 2019)[](#11210-do8-december-9-2019)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
    *   Updated CSI driver sidecars to fix [CVE-2019-11255](https://github.com/kubernetes/kubernetes/issues/85233)
        *   Updated to [external-provisioner v0.4.3](https://github.com/kubernetes-csi/external-provisioner/releases/tag/v0.4.3)
        *   Updated to [external-snapshotter v0.4.2](https://github.com/kubernetes-csi/external-snapshotter/releases/tag/v0.4.2)

### 1.12.10-do.6 (September 24, 2019)[](#11210-do6-september-24-2019)

*   Upgrades to system components:
    *   Updated to [Cilium v1.5.8](https://github.com/cilium/cilium/releases/tag/v1.5.8)
    *   Updated to [DO CSI 0.4.3](https://github.com/digitalocean/csi-digitalocean/releases/tag/v0.4.3)

### 1.12.10-do.5 (September 10, 2019)[](#11210-do5-september-10-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.20](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.20)
        *   Fix load balancer bug related to handling of DigitalOcean Let’s Encrypt certificates that have been automatically rotated by DigitalOcean’s LBaaS.
        *   Fix an issue around load balancers being deleted manually that was introduced in v0.1.17.
        *   Reduce API interactions around LB tag synchronization.

### 1.12.10-do.4 (August 27, 2019)[](#11210-do4-august-27-2019)

*   Upgrades to system components:
    *   Updated to [Cilium 1.5.7](https://github.com/cilium/cilium/releases/tag/v1.5.7)

### 1.12.10-do.3 (August 21, 2019)[](#11210-do3-august-21-2019)

*   Upgrades to system components:
    *   Updated to [Cilium 1.5.6](https://github.com/cilium/cilium/releases/tag/v1.5.6)
    *   Updated do-agent to use the wildcard toleration.

### 1.12.10-do.2 (August 7, 2019)[](#11210-do2-august-7-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.17](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.17)

### 1.12.10-do.1 (July 29, 2019)[](#11210-do1-july-29-2019)

*   Fix for Cilium-related upgrade path bug.

### 1.12.10-do.0 (July 18, 2019)[](#11210-do0-july-18-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.16](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.16)
    *   Updated to [Kubernetes 1.12.10](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.12.md#v11210)
    *   Updated to [Cilium 1.5.4](https://github.com/cilium/cilium/releases/tag/v1.5.4)
        *   See also: [Cilium 1.5 Release Blog/Highlights](https://cilium.io/blog/2019/04/24/cilium-15/#15Highlights)

### 1.12.9-do.0 (July 3, 2019)[](#1129-do0-july-3-2019)

*   Upgrades to system components:
    *   Updated to [Kubernetes 1.12.9](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.12.md#v1129)
    *   Updated to [DO CSI 0.4.2](https://github.com/digitalocean/csi-digitalocean/releases/tag/v0.4.2)
    *   Updated to [DO CCM 0.1.15](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.15)
*   Improvements to security of the master node.
*   Updated kernel to address security recent TCP related CVEs:
    *   [CVE-2019-11477](https://security-tracker.debian.org/tracker/CVE-2019-11477)
    *   [CVE-2019-11478](https://security-tracker.debian.org/tracker/CVE-2019-11478)
    *   [CVE-2019-5599](https://security-tracker.debian.org/tracker/CVE-2019-5599)
    *   [CVE-2019-11479](https://security-tracker.debian.org/tracker/CVE-2019-11479)
*   Improvements to cluster reliability:
    *   Add NoSchedule, NoExecute, CritialAddonsOnly tolerations and priorityClassName system-node-critical to worker kube-system components.
    *   Use k8s api public IP address instead of kube-proxy to reduce time to ready for nodes.
*   Fix kube-proxy container name (previously incorrectly named “kube-controller-manager”).
*   Enable hostPort via Cilium CNI portmap config.

### 1.12.8-do.4 (June 6, 2019)[](#1128-do4-june-6-2019)

*   Improvements to security and reliability of the master node

### 1.12.8-do.3 (May 29, 2019)[](#1128-do3-may-29-2019)

*   Updated kernel to include mitigations for MDS / Zombie Load (CVE-2018-12130) vulnerability.

### 1.12.8-do.1 (May 3, 2019)[](#1128-do1-may-3-2019)

*   Fixed a Cilium startup race condition that results in node connectivity issues with in cluster networking

### 1.12.8-do.0 (April 29, 2019)[](#1128-do0-april-29-2019)

*   First 1.12.x release
*   Fixed a race condition with CRD resource initialization
*   Updated to DO CSI 0.4.1
*   Updated to DO CCM 0.1.14
*   Updated to Cilium 1.4.4

Version 1.11.x releases

### 1.11.10-do.18 (October 27, 2020)[](#11110-do18-october-27-2020)

*   Updated Linux kernel to 4.19.0-11

### 1.11.10-do.14 (September 30, 2020)[](#11110-do14-september-30-2020)

*   Internal build process optimization.

### 1.11.10-do.13 (May 7, 2020)[](#11110-do13-may-7-2020)

*   Internal build process optimization.

### 1.11.10-do.12 (March 17, 2020)[](#11110-do12-march-17-2020)

*   Downgrades to system components:
    *   Downgraded to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)
        *   The upgrade to v1.6.5 in the previous release caused `cilium-operator` to crash loop.

### 1.11.10-do.11 (March 13, 2020)[](#11110-do11-march-13-2020)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.5](https://github.com/cilium/cilium/releases/tag/v1.6.5)

### 1.11.10-do.10 (December 9, 2019)[](#11110-do10-december-9-2019)

*   Upgrades to system components:
    *   Updated to [Cilium v1.6.4](https://github.com/cilium/cilium/releases/tag/v1.6.4)

### 1.11.10-do.8 (September 24, 2019)[](#11110-do8-september-24-2019)

*   Upgrades to system components:
    *   Updated to [Cilium v1.5.8](https://github.com/cilium/cilium/releases/tag/v1.5.8)
    *   Updated to [DO CSI 0.4.3](https://github.com/digitalocean/csi-digitalocean/releases/tag/v0.4.3)

### 1.11.10-do.7 (September 10, 2019)[](#11110-do7-september-10-2019)

*   Upgrades to system components:
    *   Updated to [DO CCM 0.1.20](https://github.com/digitalocean/digitalocean-cloud-controller-manager/releases/tag/v0.1.20)
        *   Fix load balancer bug related to handling of DigitalOcean Let’s Encrypt certificates that have been automatically rotated by DigitalOcean’s LBaaS.
        *   Fix an issue around load balancers being deleted manually that was introduced in v0.1.17.
        *   Reduce API interactions around LB tag synchronization.

### 1.11.10-do.6 (August 27, 2019)[](#11110-do6-august-27-2019)

*   Upgrades to system components:
    *   Updated to [Cilium 1.5.7](https://github.com/cilium/cilium/releases/tag/v1.5.7)

### 1.11.10-do.5 (August 21, 2019)[](#11110-do5-august-21-2019)

*   Upgrades to system components:
    *   Updated to [Cilium 1.5.6](https://github.com/cilium/cilium/releases/tag/v1.5.6)
    *   Updated do-agent to use the wildcard toleration.

### 1.11.9-do.3 (May 3, 2019)[](#1119-do3-may-3-2019)

Last creatable version.

*   Fixed a Cilium startup race condition that results in node connectivity issues with in cluster networking

### 1.11.9-do.2 (April 29, 2019)[](#1119-do2-april-29-2019)

*   Fixed a race condition with CRD resource initialization
*   Updated to DO CCM 0.1.14
*   Updated to ciium 1.4.4

### 1.11.9-do.1 (April 3, 2019)[](#1119-do1-april-3-2019)

*   Fixed an issue where cluster subnet for a node can conflict

### 1.11.9-do.0 (March 27, 2019)[](#1119-do0-march-27-2019)

*   First 1.19.x release

In this article...

*   [Available Versions](#available-versions)
*   [Unavailable Versions](#unavailable-versions)

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

Try u
