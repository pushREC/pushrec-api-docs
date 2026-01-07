---
source: https://docs.digitalocean.com/products/kubernetes/getting-started/quickstart/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                Kubernetes Quickstart | DigitalOcean Documentation

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

*   [Getting Started](/products/kubernetes/getting-started/) 
*   Quickstart

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Kubernetes Quickstart

Validated on 12 Apr 2023 • Last edited on 30 Jul 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

## Create Clusters[](#create-clusters)

To create a Kubernetes cluster:

1.  From the **Create** menu in the [control panel](https://cloud.digitalocean.com), click **Kubernetes**.
2.  Select a Kubernetes version. The latest version is selected by default and is the best choice if you have no specific need for an earlier version.
3.  Choose a [datacenter region](/products/kubernetes/details/availability/).
4.  Choose a VPC network you’ve created or use your default network for the datacenter region.
5.  New clusters use [VPC-native cluster networking](/products/kubernetes/details/features/#vpc-native-networking). Choose **Size network subnets for me** to use the default `/16` (512 nodes) pod network and `/19` (8192 services) service network. To customize the pod and service network sizes, choose **Configure my own network subnet sizes**.
6.  Customize the default node pool, choose the machine type and node pool names, and add additional node pools. Specify whether the node pool should [autoscale](/products/kubernetes/how-to/autoscale/) and set the minimum and maximum number of nodes.
7.  Optionally, enable [high availability](/products/kubernetes/details/managed/#managed-elements-of-the-control-plane) to increase the uptime of your cluster.
8.  Name the cluster, select the project you want the cluster to belong to, and optionally add a tag. Any tags you choose are applied to the cluster and its worker nodes.
9.  Click **Create Kubernetes cluster**. Provisioning the cluster takes several minutes.
10.  Download the cluster configuration file by clicking **Actions**, then **Download Config** from the cluster home page.

Once the cluster is created, [use `kubectl` to manage it](/products/kubernetes/how-to/connect-to-cluster/).

To get started with DigitalOcean Kubernetes, see our [Build and Deploy Your First Image to Your First Cluster](/products/kubernetes/getting-started/deploy-image-to-cluster/) tutorial.

## Install a 1-Click App to a New or Existing Kubernetes Cluster[](#install-a-1-click-app-to-a-new-or-existing-kubernetes-cluster)

You can add a variety of preconfigured apps and stacks to a new or existing Kubernetes cluster.

1.  Navigate to the **Marketplace** tab of your cluster in [the Kubernetes section of the control panel](https://cloud.digitalocean.com/kubernetes/clusters).
2.  Click **Install** in the **Install Kubernetes 1-Click Apps** section to install one of the recommended apps or search for an app in the search field.

Alternatively, locate the app you want to install in [the DigitalOcean Marketplace](https://marketplace.digitalocean.com/category/kubernetes) and click **Install App** on the upper right. Select whether to install the app on a new or existing cluster.

For more details about the 1-Click Apps, see [Manage 1-Click Applications](/products/kubernetes/how-to/manage-1click-apps/).

## Use the Kubernetes Dashboard for Your Cluster[](#kubernetes-dashboard)

The Kubernetes Dashboard provides a web-based user interface where you can deploy containerized applications, troubleshoot your application, manage your cluster resources (such as Deployments, Jobs, DaemonSets, etc), get an overview of applications running on your cluster, initiate a rolling update, restart a pod, and more.

1.  Navigate to the **Marketplace** tab of your cluster in [the Kubernetes section of the control panel](https://cloud.digitalocean.com/kubernetes/clusters).
2.  Search for the [Kubernetes Dashboard 1-Click App](/products/marketplace/catalog/kubernetes-dashboard/) and install it.
3.  Download the kubeconfig file for the cluster from the [control panel](https://cloud.digitalocean.com). In the **Configuration** section of the **Overview** tab of the cluster, click **Download Config File**. The kubeconfig file is required for authenticating access to the dashboard.
4.  Port-forward the Kubernetes Dashboard to your local machine:
    
        export POD_NAME=$(kubectl get pods -n kubernetes-dashboard -l "app.kubernetes.io/name=kubernetes-dashboard,app.kubernetes.io/instance=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
        kubectl -n kubernetes-dashboard port-forward $POD_NAME 8443:8443
    
5.  Log in to the dashboard. In your local web browser, access `https://127.0.0.1:8443/` and provide your Kubernetes cluster credentials.

You can explore your cluster’s resources, view pod details, manage deployments, and monitor the health of your cluster using the dashboard. For more details, see [Web UI (Dashboard) in the Kubernetes documentation](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/).

## Edit Nodes and Node Pools for an Existing Cluster[](#edit-nodes-and-node-pools-for-an-existing-cluster)

You can create additional node pools and add and remove nodes from a node pool at any time.

To edit the size of an existing node pool:

1.  Open the cluster’s **More** menu and select **View Nodes**.
2.  Next to the node pool which you’d like to resize, click the **…** button, then click **Resize or Autoscale**.
3.  Use the + and - controls to adjust the size of the pool, then click the **Update Node Count** to confirm.

To add additional node pools:

1.  Open the cluster’s **More** menu and select **View Nodes**.
2.  Click **Add Node Pool**.
3.  Select the name, type, size, and number of Droplets in the pool. Click **Add Node Pool(s)** to add additional node pools.
4.  Click **Save** to save your changes and provision your new nodes.

## Recycle Nodes[](#recycle-nodes)

If a worker node isn’t functioning properly, you can destroy and replace it with a new node of the same type with the **Recycle** option.

1.  Open the cluster’s **…** menu and select **View Nodes**.
    
2.  Click the name of the node pool with the problem node.
    
3.  Open the **…** menu next to the problem node and select **Recycle**.
    
4.  Optionally, if you want to skip draining the node before removing it, uncheck the **Drain node when replacing** checkbox.
    
    By default, the workloads are drained from the node before the node is removed. Skipping node draining is useful when you know that a drain will fail because the workload is broken or cannot gracefully terminate.
    
5.  Click **Recycle** to confirm the action.
    

Recycling a worker node replaces the underlying Droplet with a newly provisioned one. Attached volumes are detached and reattached to the new Droplet, but any data stored locally on the original Droplet’s disk will be lost.

## Destroy Clusters[](#destroy-clusters)

To delete an entire cluster:

1.  Open the cluster’s **More** menu and select **Destroy**.
2.  Click **Destroy**.
3.  Select the associated volumes and load balancers to delete.
4.  Enter the name of the cluster, then click **Destroy** to confirm.

Destroying a cluster does not delete DigitalOcean Load Balancers or volumes associated with the cluster.

In this article...

*   [Create Clusters](#create-clusters)
*   [Install a 1-Click App to a New or Existing Kubernetes Cluster](#install-a-1-click-app-to-a-new-or-existing-kubernetes-cluster)
*   [Use the Kubernetes Dashboard for Your Cluster](#kubernetes-dashboard)
*   [Edit Nodes and Node Pools for an Existing Cluster](#edit-nodes-and-node-pools-for-an-existing-cluster)
*   [Recycle Nodes](#recycle-nodes)
*   [Destroy Clusters](#destroy-clusters)

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

Try using different keywords or s
