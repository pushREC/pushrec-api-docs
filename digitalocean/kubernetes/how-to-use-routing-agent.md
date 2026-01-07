---
source: https://docs.digitalocean.com/products/kubernetes/how-to/use-routing-agent/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Use the Routing Agent in Kubernetes Clusters | DigitalOcean Documentation

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
*   Use Routing Agent

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Use the Routing Agent in Kubernetes Clusters

Validated on 10 Mar 2025 • Last edited on 14 Nov 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

The routing agent is a Kubernetes controller that manages IP routes on Kubernetes worker nodes. The controller is deployed as a DaemonSet and is available to DOKS customers at no additional cost. Using the routing agent, you can:

*   Manage IP routes using custom resources
    
*   [Define multiple gateways](#multiple-gateways) with automatic [equal-cost multi-path (ECMP)](https://en.wikipedia.org/wiki/Equal-cost_multi-path_routing) setup
    
*   [Override default routes](#override-default-route)
    
*   Enable precise control over network configurations by [applying routes to specific nodes](#add-routes-to-specific-nodes) using label selectors
    
*   [Route traffic through VPC NAT gateways](/products/networking/vpc/how-to/configure-doks-nat-gateway/).
    

These features are especially useful for setting up VPN and routing outbound traffic through [NAT gateways](/products/networking/vpc/how-to/create-nat-gateway/). For examples of various route definitions, see [Define Routes](#define-routes).

You can [enable](/products/kubernetes/how-to/use-routing-agent/#enable-the-routing-agent-using-the-digitalocean-api) or [disable](/products/kubernetes/how-to/use-routing-agent/#remove-the-routing-agent) the routing agent only using the DigitalOcean CLI or API.

## Enable the Routing Agent Using the DigitalOcean CLI[](#enable-the-routing-agent-using-the-digitalocean-cli)

To enable the routing agent when [creating a cluster](/reference/doctl/reference/kubernetes/cluster/create/), set the `--enable-routing-agent` flag to `true`.

The following example creates a cluster named `example-cluster` in the `nyc1` region with one node pool using the latest Kubernetes version and the routing agent enabled.

    doctl kubernetes cluster create example-cluster --region nyc1 --version latest --enable-routing-agent=true

To enable the agent for an existing cluster, [update the cluster](/reference/doctl/reference/kubernetes/cluster/update/) with the `--enable-routing-agent` flag to `true`. For example:

    doctl kubernetes cluster update example-cluster --enable-routing-agent=true

## Enable the Routing Agent Using the DigitalOcean API[](#enable-the-routing-agent-using-the-digitalocean-api)

Enable the routing agent for a cluster using the DigitalOcean API with cURL or Go.

 cURL

To enable the routing agent when creating a cluster, send a `POST` request to `https://api.digitalocean.com/v2/kubernetes/clusters` with a request body similar to the following:

    curl --location 'https://api.digitalocean.com/v2/kubernetes/clusters' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer $DIGITALOCEAN_TOKEN' \
    --data '{
        "name": "example-cluster",
        "region": "syd1",
        "version": "1.32.2-do.0",
        "node_pools": [
            {
                "size": "s-1vcpu-2gb",
                "count": 3,
                "name": "worker-pool"
            }
        ],
        "routing_agent": {
            "enabled": true
        }
    }'

To enable the routing agent for an existing cluster, send a `PUT` request to `https://api.digitalocean.com/v2/kubernetes/clusters` with a request body similar to the following:

    curl --location --request PUT 'https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer $DIGITALOCEAN_TOKEN' \
    --data '{
        "name": "example-cluster",
        "routing_agent": {
            "enabled": true
        }
    }'

 Go

Go developers can use [Godo](https://github.com/digitalocean/godo), the official DigitalOcean V2 API client for Go. To enable the routing agent when creating a Kubernetes cluster with Godo, use code similar to the following:

    package main
    
    import (
    	"context"
    	"fmt"
    	"os"
    
    	"github.com/digitalocean/godo"
    )
    
    func main() {
    	client := godo.NewFromToken("your-digitalocean-token")
    
    	cluster, _, err := client.Kubernetes.Create(context.Background(), &godo.KubernetesClusterCreateRequest{
    		Name:        "example-cluster",
    		RegionSlug:  "nyc1",
    		VersionSlug: "1.32.2-do.0",
    		NodePools: []*godo.KubernetesNodePoolCreateRequest{
    			{
    				Name:  "worker-pool",
    				Count: 3,
    				Size:  "s-1vcpu-2gb",
    			},
    		},
    		RoutingAgent: &godo.KubernetesRoutingAgent{
    			Enabled: godo.PtrTo(true),
    		},
    	})
    	if err != nil {
    		fmt.Printf("Error creating cluster: %s\n", err)
    		os.Exit(1)
    	}
    
    	isEnabled := *cluster.RoutingAgent.Enabled
    	fmt.Printf("Cluster creation successfully issued with routing agent enabled=%v\n", isEnabled)
    }

To enable the agent for an existing cluster with Godo, use code similar to the following:

    package main
    
    import (
    	"context"
    	"fmt"
    	"os"
    
    	"github.com/digitalocean/godo"
    )
    
    func main() {
    	client := godo.NewFromToken("your-digitalocean-token")
    
    	cluster, _, err := client.Kubernetes.Update(context.Background(), "your-cluster-id", &godo.KubernetesClusterUpdateRequest{
    		Name: "example-cluster",
    		RoutingAgent: &godo.KubernetesRoutingAgent{
    			Enabled: godo.PtrTo(true),
    		},
    	})
    
    	if err != nil {
    		fmt.Printf("Error updating cluster: %s\n", err)
    		os.Exit(1)
    	}
    
    	isEnabled := *cluster.RoutingAgent.Enabled
    	fmt.Printf("Cluster update successfully issued with routing agent enabled=%v\n", isEnabled)
    }

## Define Routes[](#define-routes)

When you enable the routing agent on your cluster, you can define routes for the worker nodes by adding [custom resources](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/#custom-resources) of `kind: Route`.

### Considerations Before Defining Routes[](#considerations-before-defining-routes)

*   The routing agent can add routes to a node only after the Linux kernel validates conditions such as the gateway IP address being reachable.
    
*   We recommend allowing [Internet Control Message Protocol (ICMP)](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol) traffic even when you have one gateway. Having ICMP allows a failed gateway to be put back into rotation if you subsequently [increase the number of gateways](#route-traffic-through-multiple-gateways) from one.
    
*   At start up, the routing agent creates a custom routing table and rule for the public IP address of the Droplet. The table has the following default values:
    
    *   Name: `eth0table`
    *   Number: `135`
    *   IP rule priority: `15135`
    
    Warning
    
    The default values overwrite or modify any existing routing tables or rules with overlapping name, number, or priority.
    
    The routing tables and rules are used to ensure symmetric routing on eth0 so that packets that enter via eth0 also leave via eth0. Symmetric routing is required for [overriding the default route](#override-default-route) when using network load balancers.
    

### Route Traffic Through a Gateway[](#route-traffic-through-a-gateway)

The following example defines a route named `basic` that routes traffic to the destination nodes IP ranges `1.2.3.4/5` through a gateway IP address `10.114.0.3`.

    apiVersion: networking.doks.digitalocean.com/v1alpha1
    kind: Route
    metadata:
      name: basic
    spec:
      destinations:
        - "1.2.3.4/5"
      gateways:
        - "10.114.0.3"

### Route Traffic Through Multiple Gateways[](#multiple-gateways)

When you specify multiple gateways, an IP route with multiple hops is created and equal-cost multi-path (ECMP) routing is applied to those routes. ECMP selects which gateway to route traffic to by computing a hash based on the source and destination IP addresses and port. Thus, traffic is split over multiple gateways, allowing for larger traffic volumes.

The following route configuration defines multiple gateways.

    apiVersion: networking.doks.digitalocean.com/v1alpha1
    kind: Route
    metadata:
      name: basic
    spec:
      destinations:
        - "1.2.3.4/5"
      gateways:
        - "10.114.0.3"
        - "10.114.0.4"

Note

You must allow [Internet Control Message Protocol (ICMP)](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol) on gateways for routes with multiple gateways as the routing agent uses ICMP probes (pings) to bring an unreachable gateway back into rotation. If one of the gateways becomes unreachable and fails to establish network flows repeatedly, traffic to that gateway stops. The routing agent sends ICMP probes (pings) to that gateway at regular intervals of 30 seconds. When the ping succeeds, the previously-failed gateway is put back into the rotation and sending traffic through it starts again.

### Override Default Route[](#override-default-route)

The routing agent lets you override the default route without impacting the overall cluster connectivity. You can use this feature with a [NAT gateway](/products/networking/vpc/how-to/create-nat-gateway/) to make the outgoing traffic from the Kubernetes cluster originate from one static egress IP address.

To ensure the connectivity between Kubernetes worker nodes and the Kubernetes API server, and prevent problems when the default route is being overridden, the routing agent creates `/32` routes for the control plane endpoint using the Droplet’s default gateway.

For example, the following route defines to override the default route and send all packets to `10.114.0.3` as the next hop.

    apiVersion: networking.doks.digitalocean.com/v1alpha1
    kind: Route
    metadata:
      name: basic
    spec:
      destinations:
        - "0.0.0.0/0" # default route on Linux
      gateways:
        - "10.114.0.3"

Note

*   For large clusters with multiple nodes provisioning at the same time, external services that enforce per-IP rate limits (such as DockerHub when pulling images) can significantly delay when nodes become ready and workloads start.
    
*   In DOKS clusters without VPC-native networking using Network Load Balancers (NLB) for ingress traffic, [overriding the default route with the routing agent](/products/kubernetes/how-to/use-routing-agent/#override-default-route) causes routing configuration issues. As a workaround, use a [VPC-native networking cluster](/products/kubernetes/how-to/create-clusters/#create-a-cluster-with-vpc-native-networking).
    
    If you cannot use a VPC-native cluster, you can run the ingress workloads on dedicated nodes and update the route definition with your default route override to exclude those nodes. This allows the NLB to operate correctly without conflicting with the routing configuration.
    

### Add Routes to Specific Nodes[](#add-routes-to-specific-nodes)

You can select routes to create on specific nodes using the `nodeSelector` field that matches the individual node labels. The `nodeSelector` is of `core/v1/NodeSelector` type. For example:

    apiVersion: networking.doks.digitalocean.com/v1alpha1
    kind: Route
    metadata:
      name: basic
    spec:
      destinations:
        - "1.2.3.4/5"
      gateways:
        - "10.114.0.3"
      nodeSelector:
        nodeSelectorTerms:
          - matchExpressions:
              - key: doks.digitalocean.com/node-pool
                operator: In
                values: ["worker-pool"]

The agent supports the following operators to match on node labels:

*   `In`: Value of label key needs to match any of values
    
*   `NotIn`: Value of label key must not match any of values
    
*   `Exists`: Label key must exist on node
    
*   `DoesNotExist`: Label key must not exist on node
    

Alternatively, you can directly select a node by its name using the `matchFields` field:

    apiVersion: networking.doks.digitalocean.com/v1alpha1
    kind: Route
    metadata:
      name: basic
    spec:
      destinations:
        - "1.2.3.4/5" # configures nets to be routed via GW
      gateways:
        - "10.114.0.3" # gateway IP
      nodeSelector:
        nodeSelectorTerms:
          - matchFields:
              - key: metadata.name
                operator: In
                values: ["worker-pool-y"]

## Remove the Routing Agent[](#remove-the-routing-agent)

To remove the agent, we recommend that you first [remove the route CRDs](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/#delete-a-customresourcedefinition). Deleting routes is protected by a finalizer on the agent and can take up to 15 seconds before succeeding.

Then, disable the agent using the CLI or API.

 CLI

To disable the agent, [update the cluster](/reference/doctl/reference/kubernetes/cluster/update/) with the `--enable-routing-agent` flag set to `false`. For example:

    doctl kubernetes cluster update example-cluster --enable-routing-agent=false

 API

To disable the agent, [update the cluster](/reference/api/digitalocean/#tag/Kubernetes/operation/kubernetes_update_cluster) with the `--enable-routing-agent` flag set to `false`. For example:

    curl --location --request PUT 'https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer $DIGITALOCEAN_TOKEN' \
    --data '{
        "name": "example-cluster",
        "routing_agent": {
            "enabled": false
        }
    }'

Disabling the agent stops reconciling the `routing-agent` DaemonSet. However, it doesn’t remove the DaemonSet from the cluster. You should remove the DaemonSet and the associated resources by removing all resources with the label `c3.doks.digitalocean.com/component=routing-agent`. For example:

    kubectl delete -n kube-system --selector c3.doks.digitalocean.com/component=routing-agent CustomResourceDefinition,ServiceAccount,Role,ClusterRole,RoleBinding,ClusterRoleBinding,DaemonSet

In this article...

*   [Enable the Routing Agent Using the DigitalOcean CLI](#enable-the-routing-agent-using-the-digitalocean-cli)
*   [Enable the Routing Agent Using the DigitalOcean API](#enable-the-routing-agent-using-the-digitalocean-api)
*   [Define Routes](#define-routes)
    *   [Considerations Before Defining Routes](#considerations-before-defining-routes)
    *   [Route Traffic Through a Gateway](#route-traffic-through-a-gateway)
    *   [Route Traffic Through Multiple Gateways](#multiple-gateways)
    *   [Override Default Route](#override-default-route)
    *   [Add Routes to Specific Nodes](#add-routes-to-specific-nodes)
*   [Remove the Routing Agent](#remove-the-routing-agent)

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
