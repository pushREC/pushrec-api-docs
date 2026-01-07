---
source: https://docs.digitalocean.com/products/kubernetes/how-to/add-control-plane-firewall/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Add a Control Plane Firewall | DigitalOcean Documentation

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
*   Add Control Plane Firewalls

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Add a Control Plane Firewallprivate

Validated on 27 Jun 2024 • Last edited on 2 May 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

Note

Control plane firewalls are in [private preview](/platform/product-lifecycle/).

Control plane firewalls improve security and traffic for your cluster. Once enabled, only configured IP addresses, cluster worker nodes and workloads, and internal systems that manage the cluster (such as cluster upgrades) can access the control plane.

The first time you enable the control plane firewall, you may see the following ephemeral effects:

*   Requests to the control plane may be disrupted.
*   Access rules may not be fully enforced.
*   Existing open connections continue to work until terminate. This includes `WATCH` requests that are forcefully terminated by the API server after a maximum period of 30 minutes.

## Add a Control Plane Firewall Using the DigitalOcean CLI[](#add-a-control-plane-firewall-using-the-digitalocean-cli)

To add a control plane firewall when creating a cluster with `doctl kubernetes cluster create`, set the `--enable-control-plane-firewall` flag to `true` and specify the IP addresses in the `--control-plane-firewall-allowed-addresses` flag.

The following example creates a cluster named `example-cluster` in the `nyc1` region with a node pool using Kubernetes version `1.30.1-do.0` with a firewall added to the control plane.

    doctl kubernetes cluster create example-cluster --region nyc1 --version 1.30.1-do.0` --enable-control-plane-firewall=true --control-plane-firewall-allowed-addresses="1.2.3.4/32, 1.1.0.0/16"

To add a control plane firewall to an existing cluster, use the `doctl kubernetes cluster update` command. Set the `--enable-control-plane-firewall` flag set to `true` and specify the IP addresses in the `--control-plane-firewall-allowed-addresses` flag. For example:

    doctl kubernetes cluster update example-cluster --enable-control-plane-firewall=true --control-plane-firewall-allowed-addresses="1.2.3.4/32, 1.1.0.0/16"

You may experience a brief disruption to the API server as your cluster reconfigures to use the firewall.

## Remove a Control Plane Firewall Using the DigitalOcean CLI[](#remove-a-control-plane-firewall-using-the-digitalocean-cli)

To remove an existing control plane firewall, use the `doctl kubernetes cluster update` command with the `--enable-control-plane-firewall` flag set to `false`. For example:

    doctl kubernetes cluster update example-cluster --enable-control-plane-firewall=false

## Add a Control Plane Firewall Using the DigitalOcean API[](#add-a-control-plane-firewall-using-the-digitalocean-api)

Add a control plane firewall to a cluster using the DigitalOcean API with cURL or Go.

 cURL

To add a control plane firewall when creating a cluster, send a `POST` request to `https://api.digitalocean.com/v2/kubernetes/clusters` with the following request body:

    curl --location 'https://api.digitalocean.com/v2/kubernetes/clusters' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer $DIGITALOCEAN_TOKEN' \
    --data '{
        "name": "fw-create-test-1",
        "region": "syd1",
        "version": "1.30.1-do.0",
        "node_pools": [
            {
                "size": "s-1vcpu-2gb",
                "count": 3,
                "name": "worker-pool"
            }
        ],
        "control_plane_firewall": {
            "enabled": true,
            "allowed_addresses": [
                "1.2.3.4/32",
                "4.3.2.1"
            ]
        }
    }'

To add a control plane firewall to an existing cluster, send a `PUT` request to `https://api.digitalocean.com/v2/kubernetes/clusters` with the following request body:

    curl --location --request PUT 'https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer $DIGITALOCEAN_TOKEN' \
    --data '{
        "control_plane_firewall": {
            "enabled": true,
            "allowed_addresses": [
                "1.2.3.4"
            ]
        }
    }'

 Go

Go developers can use [Godo](https://github.com/digitalocean/godo), the official DigitalOcean V2 API client for Go. To add a control plane firewall when creating a Kubernetes cluster with Godo, use the following code:

    package main
    
    import (
    	"context"
    
    	"github.com/digitalocean/godo"
    )
    
    func main() {
    	client := godo.NewFromToken("your-digitalocean-token")
    
    	enabled := true
    	_, _, _ = client.Kubernetes.Create(context.Background(), &godo.KubernetesClusterCreateRequest{
    		Name:        "control-plane-firewall-godo",
    		RegionSlug:  "nyc1",
    		VersionSlug: "1.30.1-do.0",
    		NodePools: []*godo.KubernetesNodePoolCreateRequest{
    			{
    				Name:  "worker-pool",
    				Count: 3,
    				Size:  "s-1vcpu-2gb",
    			},
    		},
    		ControlPlaneFirewall: &godo.KubernetesControlPlaneFirewall{
    			Enabled: &enabled,
    			AllowedAddresses: []string{
    				"1.2.3.4/32",
    				"4.3.2.1",
    			},
    		},
    	})
    }

To add a control plane firewall to an existing cluster with Godo, use the following code:

    package main
    
    import (
    	"context"
    	"fmt"
    
    	"github.com/digitalocean/godo"
    )
    
    func main() {
    	client := godo.NewFromToken("your-digitalocean-token")
    
    	enabled := true
    	_, _, _ = client.Kubernetes.Update(context.Background(), "your-cluster-id", &godo.KubernetesClusterUpdateRequest{
    		ControlPlaneFirewall: &godo.KubernetesControlPlaneFirewall{
    			Enabled: &enabled,
    			AllowedAddresses: []string{
    				"1.2.3.4/32",
    			},
    		},
    	})
    }

## Remove a Control Plane Firewall Using the DigitalOcean API[](#remove-a-control-plane-firewall-using-the-digitalocean-api)

To remove a control plane firewall, set the `enabled` flag to `false`. For example, use the following code with Godo:

    package main
    
    import (
    	"context"
    	"fmt"
    
    	"github.com/digitalocean/godo"
    )
    
    func main() {
    	client := godo.NewFromToken("your-digitalocean-token")
    
    	enabled := false
    	_, _, _ = client.Kubernetes.Update(context.Background(), "your-cluster-id", &godo.KubernetesClusterUpdateRequest{
    		ControlPlaneFirewall: &godo.KubernetesControlPlaneFirewall{
    			Enabled: &enabled,
    			AllowedAddresses: []string{
    				"1.2.3.4/32",
    			},
    		},
    	})
    }

In this article...

*   [Add a Control Plane Firewall Using the DigitalOcean CLI](#add-a-control-plane-firewall-using-the-digitalocean-cli)
*   [Remove a Control Plane Firewall Using the DigitalOcean CLI](#remove-a-control-plane-firewall-using-the-digitalocean-cli)
*   [Add a Control Plane Firewall Using the DigitalOcean API](#add-a-control-plane-firewall-using-the-digitalocean-api)
*   [Remove a Control Plane Firewall Using the DigitalOcean API](#remove-a-control-plane-firewall-using-the-digitalocean-api)

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

Try using different keywords or simplifying your search t
