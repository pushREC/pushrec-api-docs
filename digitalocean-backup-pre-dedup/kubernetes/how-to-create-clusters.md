---
source: https://docs.digitalocean.com/products/kubernetes/how-to/create-clusters/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Create Kubernetes Clusters | DigitalOcean Documentation

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
*   Create Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create Kubernetes Clusters

Validated on 8 Jul 2025 • Last edited on 24 Sep 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

## Create a Cluster Using Automation[](#create-a-cluster-using-automation)

The API and CLI often require region, node size, and version values. Clusters run on Droplets and determine the node sizes available for the `size` field when creating a cluster. You can retrieve a list of available option values using the [`/v2/kubernetes/options` endpoint](/reference/api/digitalocean/#operation/kubernetes_list_options) or the [`doctl kubernetes options` command](/reference/doctl/reference/kubernetes/options/). For example, you can configure machine size using any slug returned by the `doctl kubernetes options sizes` command. You can also reference our [Droplet pricing page](/products/droplets/details/pricing/#droplet-sizes) for a full list of Droplet sizes and their slugs.

See the [region availability table](/platform/regional-availability/#available-datacenters) for a list of region slugs.

How to Create a Kubernetes Cluster Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl kubernetes cluster create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/kubernetes/cluster/create/) for more details:
    
        doctl kubernetes cluster create <name> [flags]
    
    The following example creates a cluster named `example-cluster` in the `nyc1` region with a node pool, using Kubernetes version `1.28.2-do.0`:
    
        doctl kubernetes cluster create example-cluster --region nyc1 --version 1.28.2-do.0 --maintenance-window saturday=02:00 --node-pool "name=example-pool;size=s-2vcpu-2gb;count=5;tag=web;tag=frontend;label=key1=value1;label=key2=label2;taint=key1=value1:NoSchedule;taint=key2:NoExecute"
    

How to Create a Kubernetes Cluster Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/kubernetes/clusters`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/kubernetes_create_cluster).

### cURL[](#create-a-kubernetes-cluster-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name": "prod-cluster-01","region": "nyc1","version": "1.14.1\
      -do.4","tags": ["production","web-team"],"node_pools": [{"size": "s-1vcpu-2gb","count": 3,"name": "frontend-pool","tags": ["frontend"],"labels": {"service": "frontend", "priority": "high"}},{"size": "c-4","count": 2,"name": "backend-pool"}]}' \
      "https://api.digitalocean.com/v2/kubernetes/clusters"

### Go[](#create-a-kubernetes-cluster-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "os"
    
        "github.com/digitalocean/godo"
    )
    
    func main() {
        token := os.Getenv("DIGITALOCEAN_TOKEN")
    
        client := godo.NewFromToken(token)
        ctx := context.TODO()
    
        createRequest := &godo.KubernetesClusterCreateRequest{
            Name:        "prod-cluster-01",
            RegionSlug:  "nyc1",
            VersionSlug: "1.14.1-do.4",
            Tags:        []string{"production", "web-team"},
            NodePools: []*godo.KubernetesNodePoolCreateRequest{
                &godo.KubernetesNodePoolCreateRequest{
                    Name:  "frontend-pool",
                    Size:  "s-2vcpu-2gb",
                    Count: 3,
                    Tags:  []string{"frontend"},
                    Labels:  map[string]string{"service": "frontend", "priority": "high"},
                },
                &godo.KubernetesNodePoolCreateRequest{
                    Name:  "backend-pool",
                    Size:  "c-4",
                    Count: 2,
                },
            },
        }
    
        cluster, _, err := client.Kubernetes.Create(ctx, createRequest)
    }

### Ruby[](#create-a-kubernetes-cluster-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    cluster = DropletKit::KubernetesCluster.new(
      name: 'prod-cluster-01',
      region: 'nyc1',
      version: '1.14.1-do.4',
      tags: ['production', 'web-team'],
      node_pools: [
        {
          name: 'frontend-pool',
          size: 's-2vcpu-2gb',
          count: 3,
          tags: ['frontend'],
          labels: {service: 'frontend', priority: 'high'}
        },
        {
          name: 'backend-pool',
          size: 'c-4',
          count: 2
        }
      ]
    )
    
    client.kubernetes_clusters.create(cluster)

### Python[](#create-a-kubernetes-cluster-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "prod-cluster-01",
      "region": "nyc1",
      "version": "1.18.6-do.0",
      "node_pools": [
        {
          "size": "s-1vcpu-2gb",
          "count": 3,
          "name": "worker-pool"
        }
      ]
    }
    
    resp = client.kubernetes.create_cluster(body=req)

You can [add additional node pools](/products/kubernetes/how-to/add-node-pools/) after cluster creation.

### Create a Cluster with GPU Node Pools[](#create-a-cluster-with-gpu-node-pools)

You can also create a new cluster with [GPU node pools](/products/kubernetes/details/supported-gpus/).

Note

A cluster must have at least one CPU node pool to be fully operational. This pool is needed to host essential DOKS managed workloads such as CoreDNS, preventing them from running on more expensive GPU nodes. For high availability of these workloads, we recommend a minimum of two CPU nodes.

How to Create a Cluster with a GPU Worker Node Using the DigitalOcean CLI

To create a cluster with a GPU worker node, run `doctl kubernetes cluster create` specifying the GPU machine type. The following example creates a cluster with an NVIDIA GPU worker node in single GPU configuration with 80 GB of memory and three node pools:

    doctl kubernetes cluster create gpu-cluster --region tor1 --version latest --node-pool "name=gpu-worker-pool;size=gpu-h100x1-80gb;count=3"

We automatically apply the `nvidia.com/gpu:NoSchedule` taint to all NVIDIA GPU nodes. You do not need to apply this taint manually.

How to Create a Cluster with a GPU Worker Node Using the DigitalOcean API

To create a cluster with a GPU worker node, send a `POST` request to `https://api.digitalocean.com/v2/kubernetes/clusters` with the following request body:

    curl --location 'https://api.digitalocean.com/v2/kubernetes/clusters' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer $DIGITALOCEAN_TOKEN' \
    --data '{
        "name": "gpu--cluster",
        "region": "tor1",
        "version": "latest",
        "node_pools": [
            {
                "size": "gpu-h100x1-80gb",
                "count": 3,
                "name": "gpu-worker-pool"
            }
        ]
    }'

This creates a cluster with an NVIDIA GPU worker node in single GPU configuration with 80 GB of memory and three node pools.

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

### Create a Cluster with VPC-native Networking[](#create-a-cluster-with-vpc-native-networking)

You can also create a new cluster with [VPC-native networking](/products/kubernetes/details/features/#vpc-native-networking). This feature is only available when you create new clusters using Kubernetes 1.31.x and later.

Creating a cluster with VPC-native networking requires two network subnets in CIDR notation (for example, `192.168.0.0/16`), one for the cluster and another for services running on the cluster. The subnets must follow [RFC 1918](https://datatracker.ietf.org/doc/html/rfc1918) guidelines and must not overlap with each other or with any VPCs or VPC-native clusters within the same team. With these subnets, VPC-native clusters enable transparent communication between the pod network and other peered VPC networks, including the node VPC, without requiring network translation.

When creating clusters in the control panel, suitable non-overlapping subnet ranges are suggested automatically.

How to Find a Suitable Unused Network Range For Custom Subnets

If you’d prefer to use `doctl` or API instead of the control panel, you must list all VPC and VPC-native DOKS cluster networks in use on your team, and then choose a non-overlapping RFC 1918 range.

To get this information using the control panel, visit the [VPC](https://cloud.digitalocean.com/networking/vpc) page, which lists the subnet ranges of all VPCs and VPC-native Kubernetes clusters in your team.

To use `doctl`, first print the network ranges of all existing VPCs on the team:

    doctl vpcs list

Next, list all clusters and their `cluster_subnet` and `service_subnet` ranges. This command requires installing the `jq` command:

    doctl kubernetes cluster list -o json | jq -r ".[] | [.id, .cluster_subnet, .service_subnet] | @tsv"

The RFC 1918 ranges returned look similar to the following:

    
    - 10.0.0.0 – 10.255.255.255
    - 172.16.0.0 – 172.31.255.255
    - 192.168.0.0 – 192.168.255.255

The subnet size you choose determines how many nodes can run in a cluster, and how many services you can create. You cannot extend the subnet size later. Every node is assigned a `/25` network out of the cluster subnet, and you can create one service for each IP address in the services subnet.

We recommend using `/16` for the cluster and `/19` for services to support up to 512 nodes and 8192 services. Avoid using smaller than `/20` for the cluster (64 nodes) and `/22` for services (1024 services). To scale up to 1000 nodes, use a custom pod overlay subnet with a `/15` network to support at least 1024 nodes. Choose any non-overlapping subnets in these ranges.

When you have determined your subnet ranges, use `doctl` or the API to create a cluster.

How to Create a Cluster with VPC-Native Networking Using the DigitalOcean CLI

To create a cluster with VPC-native networking, use `doctl` version `v1.115.0` or higher to run `doctl kubernetes cluster create`, specifying a Kubernetes `--version` of 1.31 or higher and the `--cluster-subnet` and `--service-subnet` in CIDR notation. The following example creates a VPC-native cluster:

    doctl kubernetes cluster create vpc-native-cluster --region nyc1 --version 1.31 --node-pool "name=example-pool;size=s-2vcpu-2gb;count=3" --cluster-subnet "192.168.0.0/16" --service-subnet "172.16.0.0/19" 

For more information, see the [`doctl kubernetes cluster create` reference](/reference/doctl/reference/kubernetes/cluster/create/).

How to Create a Cluster with VPC-Native Networking Using the DigitalOcean API

To create a cluster with VPC-native networking using the API, send a `POST` request to `https://api.digitalocean.com/v2/kubernetes/clusters` with the following request body:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name":"vpc-cluster-01","region":"nyc1","version": "1.31",
        "node_pools": [{"size": "s-1vcpu-2gb","count": 3,"name": "worker-pool"}],
        "cluster_subnet": "192.168.0.0/20",
        "service_subnet": "192.168.16.0/24"}' \
      "https://api.digitalocean.com/v2/kubernetes/clusters"

For more information, see the [API reference for creating DOKS clusters](/reference/api/digitalocean/#operation/kubernetes_create_cluster).

## Create a Cluster Using the Control Panel[](#create-a-cluster-using-the-control-panel)

You can create a DigitalOcean Kubernetes Cluster at any time from the [DigitalOcean Control Panel](https://cloud.digitalocean.com) by opening the **Create** menu in the top right.

![The create menu](https://docs.digitalocean.com/screenshots/create.88f76a2e0fbab47d46467cfdb31a9a9396d289032523120cfbdf1b695f0aac34.png)

In the **Create** menu, click **Kubernetes** to go to the **Create a cluster** page. On this page, you choose a Kubernetes version, datacenter region, and cluster capacity for your cluster and then create it.

### Select a Kubernetes version[](#select-a-kubernetes-version)

The latest patch version for the three most recent minor versions of Kubernetes are available for new cluster creation. The latest stable release is selected by default.

### Choose a datacenter region[](#choose-a-datacenter-region)

Choose the region for your cluster. Your cluster’s control plane and worker nodes are located in the same region.

If you plan to use [GPU worker nodes](/products/kubernetes/details/supported-gpus/) or [volumes](/products/kubernetes/how-to/add-volumes/) for persistent data storage, choose a region with [GPU worker nodes support](/products/kubernetes/details/availability/) or [volumes support](/products/volumes/details/availability/). If you add a [DigitalOcean Load Balancer](/products/kubernetes/how-to/add-load-balancers/) to your deployment, it is automatically placed in the same region as the cluster.

#### VPC Network[](#vpc-network)

In the **VPC Network** section, choose a VPC network for the cluster. You can choose one you’ve created or use your default network for the datacenter region. [VPC](/products/networking/vpc/) enables an additional networking interface that can only be accessed by other resources within the same VPC network. This keeps traffic between Droplets and other applicable resource from being routed outside the datacenter over the public internet.

#### Size pod and service networks[](#size-pod-and-service-networks)

As of 12 December 2024, new clusters created in the control panel using Kubernetes version 1.31 or higher use [VPC-native cluster networking](/products/kubernetes/details/features/#vpc-native-networking). VPC-native networking enables routing traffic directly between pods and services and other resources on VPC networks.

Creating a cluster with VPC-native networking requires two network subnets in CIDR notation (for example, `192.168.0.0/16`), one for the cluster and another for services running on the cluster. The subnets must follow [RFC 1918](https://datatracker.ietf.org/doc/html/rfc1918) guidelines and must not overlap with each other or with any VPCs or VPC-native clusters within the same team. With these subnets, VPC-native clusters enable transparent communication between the pod network and other peered VPC networks, including the node VPC, without requiring network translation. Non-overlapping network ranges are suggested automatically when using the control panel. Choose **Size network subnets for me** to use the default `/16` (512 nodes) pod network and `/19` (8192 services) service network.

To customize the pod and service network sizes, choose **Configure my own network subnet sizes**. The network prefixes are automatically populated from available network ranges in your team account.

### Choose cluster capacity[](#choose-cluster-capacity)

A DOKS cluster has one or more node pools. Each node pool consists of a group of identical worker nodes. Worker nodes are built on Droplets.

To create a cluster, specify the following for the node pool:

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
    
    Note
    
    One-node clusters are an inexpensive option to start learning Kubernetes or set up a development environment where resiliency isn’t important. However, [a stand-alone Droplet](/products/droplets/how-to/create/) with a container runtime or [`minikube`](https://github.com/kubernetes/minikube) usually performs better for the same cost.
    

To take advantage of different resource capacities, you can [add additional node pools](/products/kubernetes/how-to/add-node-pools/) with the **Add Additional Node Pool** button and [assign pods to the node pools with the appropriate scheduling constraints](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/).

### Maximize uptime for critical workloads[](#maximize-uptime-for-critical-workloads)

DigitalOcean Kubernetes provides a [high availability (HA)](/products/kubernetes/details/managed/#managed-elements-of-the-control-plane) option that increases uptime. Select the **Add high availability** checkbox to enable high availability for the control plane. Using this option creates multiple backup replicas of each control plane component and provides extra reliability for critical workloads.

![DOKS HA control plane](https://docs.digitalocean.com/screenshots/kubernetes/create-additional-options.e3439d6d6bcf23a40e3716e8c057631815fa981916f976c77edf5308d23e6e24.png)

Note

Once enabled, you cannot disable high availability.

### Finalize[](#finalize)

Finalize the cluster settings. You can specify a name, assign a project, and optionally add tags to the cluster.

#### Name[](#name)

By default, cluster names begin with `k8s`, followed by the version of Kubernetes, the datacenter region, and the cluster ID. You can customize the cluster name, which is also used in the tag.

#### Project[](#project)

The new cluster belongs to your default project. You can assign the cluster to a different project.

You can also change the project after you create the cluster. Go to the Kubernetes page in the [control panel](https://cloud.digitalocean.com). From the cluster’s **More** menu, select **Move to** and select the project you want to move the cluster to.

Associated resources, such as load balancers and volumes, also move when you move the cluster to a different project.

Due to a [known issue](/products/kubernetes/#known_issues), resources associated with a DOKS cluster – such as load balancers, volumes, and volume snapshots – belong to the default project upon creation, regardless of which project the cluster belongs to. You can associate resources to the correct project by reconciling the cluster or moving the cluster to a different project.

#### Tags[](#tags)

Clusters automatically have three [tags](/products/droplets/how-to/tag/):

*   `k8s`
*   The specific cluster ID, like `k8s:EXAMPLEc-3515-4a0c-91a3-2452eEXAMPLE`
*   The resource type, for example, `k8s:worker`

You can also add custom tags to a cluster and its node pools in the cluster’s **Overview** and **Resources** pages. Any custom tags you add to worker nodes in a node pool (for example, from the [Droplets page](https://cloud.digitalocean.com/droplets/)), are deleted to maintain consistency between the node pool and its worker nodes.

At the bottom of this section, you see the **Total monthly cost** for your cluster based on the resources you’ve chosen. When you create the cluster, billing begins for each resource (for example, worker nodes, volumes, load balancers) as it is created and ends as it is destroyed.

### Create Cluster[](#create-cluster)

When you have entered your settings, create the cluster by clicking the **Create Kubernetes cluster** button. It can take several minutes for cluster creation to finish.

Once your cluster is provisioned, you can view cluster information such as the cluster configuration, networking details, cost, cluster ID, reconciler checks, and control plane high availability indicator in the **Overview** tab.

![Overview tab](https://docs.digitalocean.com/screenshots/kubernetes/cluster-overview-tab.f45e155b09444bbc5e7e4bb595a054bc6bda489419116f47a15f729f551a0680.png)

To manage the cluster, use `kubectl`, the official Kubernetes command-line client. See [How to Connect to a DigitalOcean Kubernetes Cluster](/products/kubernetes/how-to/connect-to-cluster/) to get set up.

In this article...

*   [Create a Cluster Using Automation](#create-a-cluster-using-automation)
    *   [Create a Cluster with GPU Node Pools](#create-a-cluster-with-gpu-node-pools)
    *   [Create a Cluster with VPC-native Networking](#create-a-cluster-with-vpc-native-networking)
*   [Create a Cluster Using the Control Panel](#create-a-cluster-using-the-control-panel)
    *   [Select a Kubernetes version](#select-a-kubernetes-version)
    *   [Choose a datacenter region](#choose-a-datacenter-region)
        *   [VPC Network](#vpc-network)
        *   [Size pod and service networks](#size-pod-and-service-networks)
    *   [Choose cluster capacity](#choose-cluster-capacity)
    *   [Maximize uptime for critical workloads](#maximize-uptime-for-critical-workloads)
    *   [Finalize](#finalize)
        *   [Name](#name)
        *   [Project](#project)
        *   [Tags](#tags)
    *   [Create Cluster](#create-cluster)

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

Try using different keywords 
