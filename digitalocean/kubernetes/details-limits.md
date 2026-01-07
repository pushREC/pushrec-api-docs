---
source: https://docs.digitalocean.com/products/kubernetes/details/limits/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               Kubernetes Limits | DigitalOcean Documentation

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
*   Limits

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Kubernetes Limits

Validated on 1 Oct 2018 • Last edited on 3 Dec 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

## Limits[](#limits)

*   GPU observability is available only on DOKS 1.33.1-do.5 or higher.
    
*   Any [GPU observability limits for Droplets](/products/monitoring/details/limits/#gpu-observability-limits) also apply to DOKS GPU node pools.
    
*   GPU observability in DOKS is supported on Kubernetes 1.33.1-do.5 or higher and is available for GPU node pools created with AI/ML Ready images.
    

GPU observability in DOKS provides the same metric coverage as GPU Droplets and supports all GPU models that offer GPU observability in Droplets, including NVIDIA H100, NVIDIA H200, AMD MI300, and AMD MI325.

*   The control plane configuration is managed by DigitalOcean. You cannot modify the control plane files, feature gates, or admission controllers. See [The Managed Elements of DigitalOcean Kubernetes](/products/kubernetes/details/managed/) for more specifics.
    
*   The number of Kubernetes clusters you can create is determined by your account’s Droplet limit. If you reach the Droplet limit when creating a new cluster, you can request to increase the limit in the [DigitalOcean Control Panel](https://cloud.digitalocean.com/account/profile).
    
*   The control plane is not highly available and may be temporarily unavailable during upgrades or maintenance. This does not affect running clusters and does not make the cluster workers or workloads unavailable. To reduce downtime, you can enable the [high-availability (HA) control plane](/products/kubernetes/how-to/create-clusters/) setting when creating clusters on DOKS versions beginning with 1.21.3-do.0.
    
    Note
    
    For clusters managed by multiple control plane nodes, a `cpc-bridge-proxy` service reserved port 443 on a worker node’s internal network interface. To minimize the potential for port conflict, the service now reserves port 16443 in certain clusters.
    
*   Worker nodes are subject to [Droplet limits](/products/droplets/#limits). Similarly, the following managed resources are subject to their respective limits:
    
    *   [Volumes](/products/volumes/details/limits/)
        
    *   [Load balancers](/products/networking/load-balancers/details/limits/)
        
    *   [Snapshots](/products/snapshots/details/limits/)
        
    *   [Firewalls](/products/networking/firewalls/details/limits/)
        
*   The number of open ports allowed in a Kubernetes service is limited to 250.
    
*   You cannot manually resize DOKS nodes by using the control panel to edit the Droplets. The reconciler views this as aberrant and revert such changes. To resize DOKS nodes, [create a node pool](/products/kubernetes/getting-started/quickstart/#edit-nodes-and-node-pools-for-an-existing-cluster) of the desired size, and once it is fully provisioned, remove the old one.
    
*   The manual deletion of nodes using `kubectl delete` is not supported, and puts your cluster in an unpredictable state. Instead, resize the node pool to the desired number of nodes, or use [`doctl kubernetes cluster node-pool delete node`](/reference/doctl/reference/kubernetes/cluster/node-pool/delete-node/).
    
*   DigitalOcean support team has read-only access to your Kubernetes clusters when troubleshooting and cannot see your secret objects.
    
*   The SCTP protocol enabled in DOKS 1.28 only works if the target and source pod communicating via SCTP are hosted on the same worker node. SCTP has been disabled in DOKS versions 1.29 or higher.
    
*   DOKS does not support IPv6 on nodes or clusters, only on DigitalOcean Load Balancers provisioned for DOKS clusters.
    
*   Service objects sharing the same host port with different L4 protocols is not supported (ex. Service A (using TCP) and Service B (using UDP) cannot share port 9090).
    
*   Log forwarding does not support sending logs to managed OpenSearch clusters with trusted sources enabled. To send logs to a managed OpenSearch cluster, disable trusted sources.
    
*   For multi-node 8-GPU configuration GPUs:
    
    *   We do not support mixing different types of multi-node slugs in one cluster.
        
    *   The maximum amount of nodes for a multi-node slug in one cluster is 64.
        

### Resource Limits[](#resource-limits)

*   Clusters can have up to 512 nodes.
    
*   A single worker node can have up to 110 pods.
    
*   All worker nodes for a cluster are provisioned in the same datacenter region.
    
*   Network throughput is capped at 10 Gbps for CPU-Optimized worker nodes with Premium CPUs. For all other node types, the network throughput is capped at 2 Gbps per worker node.
    

For general information on the upper limits of Kubernetes cluster sizes and how large cluster sizes affect scaling behavior, see the official Kubernetes documentation on [building large clusters](https://kubernetes.io/docs/setup/best-practices/cluster-large/) and [scalability validation of the release](https://github.com/kubernetes/community/blob/master/sig-scalability/processes/scalability-validation.md)

### Allocatable Memory[](#allocatable-memory)

The size of DOKS nodes determines the maximum amount of memory you can allocate to Pods. Because of this, we recommend using nodes with less than 2 GB of allocatable memory only for development purposes and not production. These distinctions are visible during the cluster creation process.

The following table describes the maximum allocatable memory that is available for scheduling pods.

Size Slugs

Node Memory (GiB)

Maximum Pod Allocatable Memory

`s-1vcpu-2gb`, `s-2vcpu-2gb`

2

1 GiB

`s-1vcpu-3gb`

3

1.66 GiB

`s-2vcpu-4gb`, `c-2`

4

2.5 GiB

`s-4vcpu-8gb`, `g-2vcpu-8gb`, `gd-2vcpu-8gb`, `c-4`

8

6 GiB

`s-6vcpu-16gb`, `g-4vcpu-16gb`, `gd-4vcpu-16gb`, `c-8`

16

13 GiB

`s-8vcpu-32gb`, `g-8vcpu-32gb`, `gd-8vcpu-32gb`, `c-16`

32

28 GiB

`s-12vcpu-48gb`

48

43 GiB

`s-16vcpu-64gb`, `g-16vcpu-64gb`, `gd-16vcpu-64gb`, `c-32`

64

58 GiB

`s-20vcpu-96gb`

96

88.5 GiB

`s-24vcpu-128gb`, `g-32vcpu-128gb`, `gd-32vcpu-128gb`

128

119.5 GiB

`g-40vcpu-160gb`, `gd-40vcpu-160gb`

160

151 GiB

`s-32vcpu-192gb`

192

182 GiB

This memory reservation is due to the following processes and workloads that are running on DOKS nodes:

*   `kubelet`
*   `containerd`
*   `kube-proxy`
*   `cilium`
*   `coredns`
*   `do-node-agent`
*   `csi-do-node`
*   `konnectivity-agent`
*   `cpc-bridge-proxy`
*   The OS

The allocatable memory is encoded in the “Kube Reserved” and “System Reserved” values in kubelet. For more information, see [Reserve Compute Resources for System Daemons in the Kubernetes Documentation](https://kubernetes.io/docs/tasks/administer-cluster/reserve-compute-resources/#kube-reserved).

### Names and Tags[](#names-and-tags)

*   At creation time, the `k8s` prefix is reserved for system tags and cannot be used at the beginning of custom tags.
    
*   You cannot tag load balancers or volumes.
    
*   Although it’s currently possible, we do not support tagging individual worker nodes in the future.
    

### Feature Support[](#feature-support)

*   We do not currently support automatic creation of Let’s Encrypt certificates for DigitalOcean Load Balancers. Instead, you must [generate certificates yourself](/products/kubernetes/how-to/configure-load-balancers/#ssl-annotation).
    
*   DigitalOcean Kubernetes only supports features that are in beta and general availability [feature gates](https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/) in upstream Kubernetes.
    

## Known Issues[](#known-issues)

*   In addition to the cluster’s **Resources** tab, cluster resources (worker nodes, load balancers, and volumes) are also listed outside the Kubernetes page in the DigitalOcean Control Panel. If you rename or otherwise modify these resources in the control panel, you may render them unusable to the cluster or cause the reconciler to provision replacement resources. To avoid this, manage your cluster resources exclusively with `kubectl` or from the control panel’s Kubernetes page.
    
*   The new control plane architecture does not support using a Kubernetes `NetworkPolicy` to selectively allow access to the API server when a `NetworkPolicy` restricts it. You can instead use `CiliumNetworkPolicies`, as described in [Upgrading to the New Control Plane](/products/kubernetes/how-to/upgrade-cluster/#new-control-plane).
    
*   Installing webhooks targeted at services within the cluster can cause Kubernetes version upgrades to fail because internal services may not be accessible during an upgrade.
    
*   The certificate authority, client certificate, and client key data in the `kubeconfig.yaml` file displayed in the control panel expire every seven days after download. If you use this file, you need to download a new certificate every week. To avoid this, we strongly recommend using [`doctl`](https://github.com/digitalocean/doctl).
    
*   [Kubernetes 1-Click Apps](https://marketplace.digitalocean.com/category/kubernetes) can be installed multiple times to a cluster and is installed in the same namespace each time. This means that subsequent installations of a given 1-Click App overwrites the previous instance of that 1-Click App, as well as the data that was associated with it.
    
*   If a Kubernetes 1-Click App is currently installing and a subsequent install request for the same App is made, the subsequent request is not processed. Only once the 1st request is completed (Done or Failed) may a subsequent request be made to install the same Kubernetes 1-Click App on the same cluster.
    
*   Kubernetes 1-Click Apps that are deleted from a cluster still appear in the history of installed 1-Click Apps on the cluster’s **Overview** page. If a 1-Click App was installed on a cluster multiple times, it is listed as installed multiple times regardless of whether the 1-Click App is currently present on the cluster.
    
*   Resources associated with a DOKS cluster such as load balancers, volumes, and volume snapshots, belong to the default project upon creation, regardless of which project the cluster belongs to. Resources get associated with the correct project when a cluster gets reconciled or is moved between projects.
    
*   Resources associated with a DOKS cluster are not visible within a project through the control panel or the public [API](/reference/api/digitalocean/#tag/Kubernetes) despite belonging to that project.
    
*   When you renew a Let’s Encrypt certificate, DOKS gives it a new UUID and automatically updates all annotations in the certificate’s cluster to use the new UUID. However, you must manually update any external configuration files and tools that reference the UUID.
    
*   In DOKS clusters without VPC-native networking using Network Load Balancers (NLB) for ingress traffic, [overriding the default route with the routing agent](/products/kubernetes/how-to/use-routing-agent/#override-default-route) causes routing configuration issues. As a workaround, use a [VPC-native networking cluster](/products/kubernetes/how-to/create-clusters/#create-a-cluster-with-vpc-native-networking).
    
    If you cannot use a VPC-native cluster, you can run the ingress workloads on dedicated nodes and update the route definition with your default route override to exclude those nodes. This allows the NLB to operate correctly without conflicting with the routing configuration.
    

In this article...

*   [Limits](#limits)
    *   [Resource Limits](#resource-limits)
    *   [Allocatable Memory](#allocatable-memory)
    *   [Names and Tags](#names-and-tags)
    *   [Feature Support](#feature-support)
*   [Known Issues](#known-issues)

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

Try using different keywords or
