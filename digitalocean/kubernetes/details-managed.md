---
source: https://docs.digitalocean.com/products/kubernetes/details/managed/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                The Managed Elements of DigitalOcean Kubernetes | DigitalOcean Documentation

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
*   Managed Kubernetes

[Give Feedback](https://ideas.digitalocean.com/documentation)

# The Managed Elements of DigitalOcean Kubernetes

Validated on 26 Aug 2020 • Last edited on 25 Aug 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

DigitalOcean’s Managed Kubernetes provides users with administrator access to the cluster and full access to the Kubernetes API through `kubectl` and `doctl`. There are no restrictions on the API objects users can create as long as the underlying Kubernetes version supports the object(s).

We simplify the Kubernetes experience by managing key services and settings on your behalf that you cannot or should not modify.

Warning

Besides the methods in [this guide](/products/kubernetes/how-to/customize-coredns/), do not modify any managed components pre-installed in your DigitalOcean Kubernetes cluster, such as workloads, policies, Cilium, and CoreDNS. Modifying these services can cause your cluster’s operations to temporarily or permanently fail, and we may revert these changes at any time to maintain the functionality of your cluster.

## Managed Elements of the Worker Nodes[](#managed-elements-of-the-worker-nodes)

### Worker Node Configuration[](#worker-node-configuration)

You can add more workers and recycle them in the control panel by using the API or `doctl`. Once you’ve added them, we manage their configuration, including the:

*   Operating system
*   Installed packages
*   File system
*   Local storage
*   Container daemon configuration
*   Machine size

While it _is_ technically possible to access and alter the worker nodes at this time, your changes are overwritten by the reconciler and do not persist. In the future, you may not be able to change them at all.

### Automatic Application of Labels and Taints to Nodes[](#automatic-application-of-labels-and-taints-to-nodes)

DigitalOcean applies the following [labels](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/) to nodes, and their presence is enforced by the reconciler:

    doks.digitalocean.com/node-pool
    doks.digitalocean.com/node-id
    doks.digitalocean.com/node-pool-id
    doks.digitalocean.com/version

For GPU worker nodes, DigitalOcean applies additional labels to the nodes:

GPU

Labels

AMD MI300x

*   `doks.digitalocean.com/gpu-brand: amd`
*   `doks.digitalocean.com/gpu-model: mi300x`

NVIDIA H100

*   `doks.digitalocean.com/gpu-brand: nvidia`
*   `doks.digitalocean.com/gpu-model: h100`

You can set custom node pool labels using the [DigitalOcean API](https://developers.digitalocean.com/documentation/v2/#kubernetes).

For GPU worker nodes, DigitalOcean applies the following [taint](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/):

GPU

Taint

AMD

`amd.com/gpu:NoSchedule`

NVIDIA

`nvidia.com/gpu:NoSchedule`

### Worker Node Firewalls[](#worker-node-firewalls)

When you create a cluster, we automatically provision two cloud firewalls for the cluster and manage the opening and closing of their NodePorts (ports 30000-32767) as services are added and removed from the cluster. One firewall manages the connections between resources in [your VPC network](/products/networking/vpc/) and worker nodes, while the other manages connections between worker nodes and the public internet. Cluster firewalls are named `k8s-` concatenated with the cluster name.

Defining a `NodePort` service in your service spec automatically opens the specified ports on the firewall. When you remove services from the cluster, the ports on the firewall close automatically.

You cannot delete the cluster’s default firewalls or manually change their configuration in the control panel. Any changes made to the default firewalls through the control panel do not persist and are reverted. If you need to open ports outside of the NodePort range, such as port 80, manually [create a new DigitalOcean Cloud Firewall](/products/networking/firewalls/how-to/create/) and associate it with the cluster.

In some cases, firewall management for a particular service may not be desirable, such as when you want a NodePort to be only accessible using the VPC network. To selectively exclude a service from firewall management, use the `kubernetes.digitalocean.com/firewall-managed` annotation and set it to `false`. When set to `false`, this disables public access to the NodePort and no inbound rules are created.

Load balancers access the cluster using the cluster’s private network interface and don’t need a port explicitly provisioned for them.

## Worker Node Maintenance[](#worker-node-maintenance)

Nodes and control plane components in your Kubernetes cluster require routine maintenance, which usually takes place during your cluster’s weekly 4-hour maintenance window. For example, automatic and required upgrades take place during the window; however, you can still manually upgrade your clusters at any time.

As a managed Kubernetes service, we may run potentially disruptive jobs on your cluster during this maintenance window. Additionally, if your cluster is in a critical state, we may conduct necessary maintenance outside the window, resulting in potential API unavailability.

We recommend you [reschedule your cluster’s maintenance window](/products/kubernetes/how-to/upgrade-cluster/#automatically) to the time of least activity for your workload.

### DigitalOcean Infrastructure Components[](#digitalocean-infrastructure-components)

Some DigitalOcean products integrate natively with Kubernetes clusters directly from the Kubernetes manifest files, and we manage their integration with the cluster:

*   You can add [DigitalOcean Volumes Block Storage](/products/kubernetes/how-to/add-volumes/) by creating a PersistentVolumeClaim as part of your deployment.
    
*   You can add a [DigitalOcean Load Balancer](/products/kubernetes/how-to/add-load-balancers/) by adding a `LoadBalancer` service type to your deployment.
    

You should not manage these DigitalOcean resources through the control panel or API because any changes you make to Kubernetes clusters outside the cluster’s configuration are overwritten by the DOKS reconciler. For example, if you manually delete a volume or load balancer in a Kubernetes cluster from the control panel, it gets recreated during the next reconciliation process and you still get billed.

## Managed Elements of the Control Plane[](#managed-elements-of-the-control-plane)

Kubernetes control plane is fully managed and is included in the price of the worker nodes. The default control plane runs a [single replica of each component](https://kubernetes.io/docs/concepts/overview/components/); some downtime can occur during unexpected failures as components are restarted. If you [enable high availability](/products/kubernetes/how-to/enable-high-availability/) for a cluster, multiple replicas of each control plane component are created, ensuring that a redundant replica is available when a failure occurs. This results in additional increased uptime for control planes when high availability enabled.

You cannot modify:

*   The API server arguments
*   Control plane configuration files
*   [Feature gates](https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/)
*   [Admission controllers](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)

The default admission controllers may differ between versions. See the [Kubernetes documentation](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#what-does-each-admission-controller-do) for details on the available admission controllers.

In this article...

*   [Managed Elements of the Worker Nodes](#managed-elements-of-the-worker-nodes)
    *   [Worker Node Configuration](#worker-node-configuration)
    *   [Automatic Application of Labels and Taints to Nodes](#automatic-application-of-labels-and-taints-to-nodes)
    *   [Worker Node Firewalls](#worker-node-firewalls)
*   [Worker Node Maintenance](#worker-node-maintenance)
    *   [DigitalOcean Infrastructure Components](#digitalocean-infrastructure-components)
*   [Managed Elements of the Control Plane](#managed-elements-of-the-control-plane)

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

Try using different keywords or simplif
