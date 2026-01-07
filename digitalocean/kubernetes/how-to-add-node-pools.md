---
source: https://docs.digitalocean.com/products/kubernetes/how-to/add-node-pools/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Add Node Pools to a Cluster | DigitalOcean Documentation

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
*   Add Node Pools

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Add Node Pools to a Cluster

Validated on 26 Mar 2025 • Last edited on 25 Aug 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

A node pool is a group of nodes in a DOKS cluster with the same configuration.

All the worker nodes within a node pool have identical resources, but each node pool can have a different worker configuration. This lets you have different services on different node pools, where each pool has the RAM, CPU, and attached storage resources the service requires.

You can create and modify node pools at any time. Worker nodes are automatically deleted and recreated when needed, and you can manually recycle worker nodes. Nodes in the node pool inherit the node pool’s naming scheme when you first create a node pool, however, renaming a node pool does not rename the nodes. Nodes inherit the new naming scheme when recycled or when resizing the node pool which creates new nodes.

Note

You can scale a fixed node pool down to 0 nodes as long as you have another fixed node pool with at least 1 node or a GPU node pool with 0 nodes.

You can add custom tags to a cluster and its node pools. DOKS deletes any custom tags you added to worker nodes in a node pool (for example, from the [Droplets page](https://cloud.digitalocean.com/droplets/)) to maintain consistency between the node pool and its worker nodes.

## Add a Node Pool to a Cluster Using Automation[](#add-a-node-pool-to-a-cluster-using-automation)

How to Add a Node Pool to a Kubernetes Cluster Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl kubernetes cluster node-pool create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/kubernetes/cluster/node-pool/create/) for more details:
    
        doctl kubernetes cluster node-pool create <cluster-id|cluster-name> [flags]
    
    The following example creates a node pool named `example-pool` in a cluster named `example-cluster`:
    
        doctl kubernetes cluster node-pool create example-cluster --name example-pool --size s-1vcpu-2gb --count 3 --taint "key1=value1:NoSchedule" --taint "key2:NoExecute"
    

How to Add a Node Pool to a Kubernetes Cluster Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/kubernetes/clusters/$K8S_CLUSTER_ID/node_pools create`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/%25!s\(%3Cnil%3E\)).

### Add a GPU Worker Node to a Cluster[](#add-a-gpu-worker-node-to-a-cluster)

You can also add a [GPU node pool](/products/kubernetes/details/supported-gpus/) to an existing cluster on versions 1.30.4-do.0, 1.29.8-do.0, 1.28.13-do.0, and later.

Note

In rare cases, it can take several hours for a GPU Droplet to provision. If you have an unusually long creation time, [open a support ticket](https://cloudsupport.digitalocean.com).

How to Add a GPU Worker Node to a Cluster Using the DigitalOcean CLI

To add a GPU worker node to an existing cluster, run `doctl kubernetes cluster node-pool create` specifying the GPU machine type. The following example adds an NVIDIA GPU worker node in single GPU configuration with 80 GB of memory and four node pools to a cluster named `gpu-cluster`:

    doctl kubernetes cluster node-pool create gpu-cluster --name gpu-worker-pool-1 --size gpu-h100x1-80gb --count 4

We automatically apply the `nvidia.com/gpu:NoSchedule` taint to all NVIDIA GPU nodes. You do not need to apply this taint manually.

How to Add a GPU Worker Node to a Cluster Using the DigitalOcean API

To add a GPU worker node to an existing cluster, send a `POST` request to `https://api.digitalocean.com/v2/kubernetes/clusters`. The following example adds an NVIDIA GPU worker node in single GPU configuration with 80 GB of memory and four node pools to an existing cluster specified by its cluster ID `cluster_id`. :

    curl --location --request POST 'https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/node_pools' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer $DIGITALOCEAN_TOKEN' \
    --data '{
        "node_pools": [
            {
                "size": "gpu-h100x1-80gb",
                "count": 4,
                "name": "new-gpu-worker-pool"
            }
    }',

We automatically apply the `nvidia.com/gpu:NoSchedule` taint to all NVIDIA GPU nodes. You do not need to apply this taint manually.

To run GPU workloads after you create a cluster, use the [GPU nodes-specific labels and taint](/products/kubernetes/details/managed/#automatic-application-of-labels-and-taints-to-nodes) in your [workload](https://kubernetes.io/docs/concepts/workloads/) specifications to schedule pods that match. You can use a configuration spec, similar to the pod spec shown below, for your actual workloads:

`cuda-pod.yaml`

    apiVersion: v1
    kind: Pod
    metadata:
      name: gpu-workload
    spec:
      restartPolicy: Never
      nodeSelector:
        doks.digitalocean.com/gpu-brand: nvidia
      containers:
        - name: cuda-container
          image: nvcr.io/nvidia/k8s/cuda-sample:vectoradd-cuda10.2
      tolerations:
        - key: nvidia.com/gpu
          operator: Exists
          effect: NoSchedule

The above spec shows how to create a pod that runs NVIDIA’s CUDA image and uses the labels and taint for GPU worker nodes.

You can use the [cluster autoscaler](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#basics) to automatically scale the GPU node pool down to zero, or use the DigitalOcean CLI or API to manually scale the node pool down to zero. For example:

      doctl kubernetes cluster node-pool update <your-cluster-id> <your-nodepool-id> --count 0 

## Add a Node Pool to a Cluster Using the Control Panel[](#add-a-node-pool-to-a-cluster-using-the-control-panel)

To add additional node pools to an existing cluster, open the cluster’s **More** menu and select **View Nodes**. Click **Add Node Pool**. On the **Add node pool(s)** page, specify the following for the node pool:

*   **Node pool name**: Choose a name for the node pool when it’s created. Nodes inside this pool inherit this naming scheme when they are created. If you rename the node pool later, the nodes only inherit the new naming scheme when they are recreated (when you recycle the nodes or resize the node pool).
    
*   Choose the machine type:
    
    *   **Shared CPUs** are built on Basic Droplet plans.
        
    *   **Dedicated CPUs** are built on General Purpose, CPU-Optimized (Regular Intel CPU or Premium Intel CPU), or Memory-Optimized Droplet plans.
        
    *   **GPUs** are built on GPU Droplets which are powered by AMD and NVIDIA GPUs and can be in a single GPU or 8 GPU configuration.
        
        Note
        
              A cluster must have at least one CPU node pool to be fully operational. This pool is needed to host essential DOKS managed workloads such as CoreDNS, preventing them from running on more expensive GPU nodes. For high availability of these workloads, we recommend a minimum of two CPU nodes.
            
        
    
    All machine types, except the Basic nodes, are [dedicated CPU Droplets](/products/droplets/concepts/choosing-a-plan/#shared-vs-dedicated).
    
    Select the node type from the **Machine type (Droplet)** drop-down list. Choosing the right Kubernetes plan highly depends on your workload. See [Choosing the Right Kubernetes Plan](/products/kubernetes/concepts/choosing-a-plan/) for more information.
    
*   **Node plan**: Choose the specific plan you want for your worker nodes. Each of the workers in a node pool has identical resources.
    
    Some high-tier node plans are locked. To request access to those plans, click **Submit a request**. In the **Request access to more nodes or higher-tier plans**, specify the reason for the request and number of nodes you are requesting and click **Submit**.
    
    ![Submit request for high-tier plans](https://docs.digitalocean.com/screenshots/kubernetes/high-tier-plans-submit-request.2f34973f195ca9bb75e3868125d3d71353711edd3fb4b1186abf858406d0889e.png)
*   Select the **Set node pool to autoscale** option to enable autoscaling.
    
*   **Nodes**: For a fixed-size cluster, choose how many nodes to include in the node pool. By default, three worker nodes are selected.
    
*   **Minimum nodes** and **Maximum nodes**: For an autoscaling-enabled cluster, choose the minimum and maximum number of nodes for when the load decreases or increases.
    

Click **Add Node Pool(s)** to add additional node pools.

Click **Save** to apply your changes and provision your new nodes.

In this article...

*   [Add a Node Pool to a Cluster Using Automation](#add-a-node-pool-to-a-cluster-using-automation)
    *   [Add a GPU Worker Node to a Cluster](#add-a-gpu-worker-node-to-a-cluster)
*   [Add a Node Pool to a Cluster Using the Control Panel](#add-a-node-pool-to-a-cluster-using-the-control-panel)

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
