---
source: '[unknown - load-balancers-how-to-create.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Create Regional Load Balancers | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/load-balancers.1b5f8a9d40bf92d2798a187032a28a29572afdd5e74855e5b1c1d30dfffc07ed.svg)Load Balancers](/products/networking/load-balancers/)
*   [Getting Started](/products/networking/load-balancers/getting-started/)
    *   [Quickstart](/products/networking/load-balancers/getting-started/quickstart/)
    *   [Manage Load Balancers with doctl](/products/networking/load-balancers/getting-started/with-doctl/)
*   [How-Tos](/products/networking/load-balancers/how-to/)
    *   [Create Regional Load Balancers](/products/networking/load-balancers/how-to/create/)
    *   [Create Global Load Balancers](/products/networking/load-balancers/how-to/create-global-load-balancer/)
    *   [Manage Regional Load Balancers](/products/networking/load-balancers/how-to/manage/)
    *   [Manage Global Load Balancers](/products/networking/load-balancers/how-to/manage-global-load-balancers/)
    *   [Scale Regional Load Balancers](/products/networking/load-balancers/how-to/scale/)
    *   [Configure SSL Passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/)
    *   [Balance TCP Traffic](/products/networking/load-balancers/how-to/tcp/)
    *   [Configure Backend Droplets](/products/networking/load-balancers/how-to/configure-droplets-for-nlb/)
    *   [Destroy Load Balancers](/products/networking/load-balancers/how-to/destroy/)
    *   [Configure SSL Termination](/products/networking/load-balancers/how-to/ssl-termination/)
*   [Reference](/products/networking/load-balancers/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Load-Balancers)
    *   [CLI Reference](/reference/doctl/reference/compute/load-balancer/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/load-balancers/concepts/)
    *   [Best Practices](/products/networking/load-balancers/concepts/best-practices/)
    *   [Load Balancer Status](/products/networking/load-balancers/concepts/load-balancer-status/)
*   [Details](/products/networking/load-balancers/details/)
    *   [Features](/products/networking/load-balancers/details/features/)
    *   [Pricing](/products/networking/load-balancers/details/pricing/)
    *   [Availability](/products/networking/load-balancers/details/availability/)
    *   [Limits](/products/networking/load-balancers/details/limits/)
*   [Support](/products/networking/load-balancers/support/)

*   [How-Tos](/products/networking/load-balancers/how-to/) 
*   Create Regional Load Balancers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create Regional Load Balancers

Validated on 27 Mar 2025 • Last edited on 17 Jun 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

Regional load balancers route traffic within a single datacenter. Setting up a regional load balancer is a two step process: creating the load balancer and then adding Droplets or Kubernetes nodes to its backend pool.

Note

You can create a new configuration file or modify your existing service config file to provision regional load balancers for a DigitalOcean Kubernetes cluster. Read [How to Add Load Balancers to Kubernetes Clusters](/products/kubernetes/how-to/add-load-balancers/) and [How to Configure Advanced Load Balancer Settings in Kubernetes Clusters](/products/kubernetes/how-to/configure-load-balancers/) for more information.

## Create a Load Balancer Using the CLI[](#create-a-load-balancer-using-the-cli)

You can only add firewall rules to a load balancer using the CLI or API. To add a firewall to a load balancer during its creation, use the `--allow-list` and `--deny-list` flags to define a list of IP addresses or CIDRs that the load balancer accepts or blocks connections from.

The load balancer creation command requires a value for the `--region` flag. Use the [`doctl compute region list` command](/reference/doctl/reference/compute/region/list/) to retrieve a list of available datacenter regions.

You can also automatically add Droplets to a load balancer during creation by providing a list of Droplet IDs for the `--droplet-ids` flag. Use the [`doctl compute droplet list`](/reference/doctl/reference/compute/droplet/list/) command to retrieve a list of Droplets and their ID’s.

To create an internal-only load balancer that has no public IP address and is only accessible by resources in its [VPC](/products/networking/vpc/), use the `--network INTERNAL` flag with `doctl` version `v1.108.0` or higher. You cannot switch load balancers between regular and internal after creation.

To create a load balancer with dual-stack IPv4 and IPv6 networking, use the `--network-stack DUALSTACK` flag with `doctl` version `v1.121.0` or higher. You cannot change the network stack configuration after creation.

To create a network load balancer that routes TCP and UDP traffic at the network layer, use the `--type REGIONAL_NETWORK` flag with `doctl` version `v1.108.0` or higher.

How to Create a Load Balancer Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute load-balancer create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/load-balancer/create/) for more details:
    
        doctl compute load-balancer create [flags]
    

## Create a Load Balancer Using the API[](#create-a-load-balancer-using-the-api)

You can only add firewall rules to a load balancer using the CLI or API. To add a firewall to a load balancer during its creation, use the `firewall` field to define a list of IP addresses and CIDRs the load balancer accepts or blocks connections from.

The load balancer creation call requires a value for the `region` field. Use the [`/v2/regions` endpoint](/reference/api/digitalocean/#operation/regions_list) to retrieve a list of available datacenter regions.

You can also automatically add Droplets to a load balancer during creation by providing an array of Droplet IDs in the `droplet_ids` field. Use the [`/v2/droplets` endpoint](/reference/api/digitalocean/#operation/droplets_list) to retrieve a list of Droplets and their IDs.

To create an internal-only load balancer that has no public IP address and is only accessible to resources in its [VPC](/products/networking/vpc/), specify the `network` field as `INTERNAL`. You cannot switch load balancers between regular and internal after creation.

To create a load balancer with dual-stack IPv4 and IPv6 networking, use the `network_stack` key with a value of `DUALSTACK`. You cannot change the network stack configuration after creation.

To create a network load balancer that routes TCP and UDP traffic at the network layer, set the `type` field to `REGIONAL_NETWORK`.

How to Create a Load Balancer Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/load_balancers`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/loadBalancers_create).

### cURL[](#create-a-load-balancer-curl)

Using cURL:

    # Create new load balancer
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name": "example-lb-01","size_unit": 1, "region": "nyc3", "forwarding_rules":[{"entry_protocol":"http","entry_port":80,"target_protocol":"http","target_port":80,"certificate_id":"","tls_passthrough":false}, {"entry_protocol": "https","entry_port": 444,"target_protocol": "https","target_port": 443,"tls_passthrough": true}], "health_check":{"protocol":"http","port":80,"path":"/","check_interval_seconds":10,"response_timeout_seconds":5,"healthy_threshold":5,"unhealthy_threshold":3}, "sticky_sessions":{"type":"none"}, "firewall":{"deny":["ip:1.2.3.4","cidr:2.3.4.0/24"],"allow":["cidr:1.2.0.0/16","ip:2.3.4.5"]}, "droplet_ids": [3164444, 3164445]}' \
      "https://api.digitalocean.com/v2/load_balancers"
    
    # Create new load balancer with Droplet tag
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name": "example-lb-01", "region": "nyc3", "size_unit": 1, "forwarding_rules":[{"entry_protocol":"http","entry_port":80,"target_protocol":"http","target_port":80,"certificate_id":"","tls_passthrough":false}, {"entry_protocol": "https","entry_port": 444,"target_protocol": "https","target_port": 443,"tls_passthrough": true}], "health_check":{"protocol":"http","port":80,"path":"/","check_interval_seconds":10,"response_timeout_seconds":5,"healthy_threshold":5,"unhealthy_threshold":3}, "sticky_sessions":{"type":"none"}, "firewall":{"deny":["ip:1.2.3.4", "cidr:2.3.4.0/24"],"allow":["cidr:1.2.0.0/16","ip:2.3.4.5"]}, "tag": "web:prod"}' \
      "https://api.digitalocean.com/v2/load_balancers"

### Go[](#create-a-load-balancer-go)

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
    
        createRequest := &godo.LoadBalancerRequest{
            Name:      "example-01",
            SizeUnit: "1",
            Algorithm: "round_robin",
            Region:    "nyc3",
            ForwardingRules: []godo.ForwardingRule{
                {
                    EntryProtocol:  "http",
                    EntryPort:      80,
                    TargetProtocol: "http",
                    TargetPort:     80,
                },
                {
                    EntryProtocol:  "https",
                    EntryPort:      443,
                    TargetProtocol: "https",
                    TargetPort:     443,
                    TlsPassthrough: true,
                },
            },
            HealthCheck: &godo.HealthCheck{
                Protocol:               "http",
                Port:                   80,
                Path:                   "/",
                CheckIntervalSeconds:   10,
                ResponseTimeoutSeconds: 5,
                HealthyThreshold:       5,
                UnhealthyThreshold:     3,
            },
            StickySessions: &godo.StickySessions{
                Type: "none",
            },
            DropletIDs:          []int{3164444, 3164445},
            RedirectHttpToHttps: false,
            Firewall:            &godo.LBFirewall{
                Deny: []string{"ip:1.2.3.4", "cidr:2.3.4.0/24"},
                Allow: []string{"cidr:1.2.0.0/16", "ip:2.3.4.5"},
            }
      // Create new load balancer with Droplet tag
      //     Tag:                 "web:prod",
      //     RedirectHttpToHttps: false,
        }
    
        lb, _, err := client.LoadBalancers.Create(ctx, createRequest)

### Ruby[](#create-a-load-balancer-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    load_balancer = DropletKit::LoadBalancer.new(
      name: 'example-lb-01',
      size_unit: '1',
      algorithm: 'round_robin',
    # Create new load balancer with Droplet tag
    # tag: 'web:prod',
      droplet_ids: [ 3164444, 3164445],
      redirect_http_to_https: true,
      region: 'nyc3',
      forwarding_rules: [
        DropletKit::ForwardingRule.new(
          entry_protocol: 'http',
          entry_port: 80,
          target_protocol: 'http',
          target_port: 80,
          certificate_id: '',
          tls_passthrough: false
        ),
        DropletKit::ForwardingRule.new(
          entry_protocol: 'https',
          entry_port: 443,
          target_protocol: 'https',
          target_port: 443,
          certificate_id: '',
          tls_passthrough: true
        )
      ],
      sticky_sessions: DropletKit::StickySession.new(
        type: 'cookies',
        cookie_name: 'DO-LB',
        cookie_ttl_seconds: 5
      ),
      health_check: DropletKit::HealthCheck.new(
        protocol: 'http',
        port: 80,
        path: '/',
        check_interval_seconds: 10,
        response_timeout_seconds: 5,
        healthy_threshold: 5,
        unhealthy_threshold: 3
      )
    )
    client.load_balancers.create(load_balancer)

### Python[](#create-a-load-balancer-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "example-lb-01",
      "region": "nyc3",
      "forwarding_rules": [
        {
          "entry_protocol": "http",
          "entry_port": 80,
          "target_protocol": "http",
          "target_port": 80
        },
        {
          "entry_protocol": "https",
          "entry_port": 443,
          "target_protocol": "https",
          "target_port": 443,
          "tls_passthrough": True
        }
      ],
      "droplet_ids": [
        3164444,
        3164445
      ],
      "project_id": "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30",
      "http_idle_timeout_seconds": 60,
      "firewall": {
        "deny": [
          "cidr:1.2.0.0/16",
          "ip:2.3.4.5"
        ],
        "allow": [
          "ip:1.2.3.4",
          "cidr:2.3.4.0/24"
        ]
      }
    }
    
    resp = client.load_balancers.create(body=req)

## Create a Load Balancer Using the Control Panel[](#create-a-load-balancer-using-the-control-panel)

Start by creating a load balancer using the **Create** button at the top of the [control panel](https://cloud.digitalocean.com). Alternatively, use the **Create load balancer** button on the **Load Balancers** overview page.

![Create menu](https://docs.digitalocean.com/screenshots/create.88f76a2e0fbab47d46467cfdb31a9a9396d289032523120cfbdf1b695f0aac34.png)

On the creation page, you:

1.  **Choose a Load Balancer type.** Choose **Regional** to create a regional load balancer. To create a **Global** load balancer, see [How to Create a Global Load Balancer](/products/networking/load-balancers/how-to/create-global-load-balancer/).
    
2.  **Choose a datacenter region.** Ensure your regional load balancer and its backend Droplets are in the same datacenter. If you have existing Droplets, select that datacenter.
    
3.  Select a **VPC Network** for the load balancer. You can choose one you have created or use your default network for the datacenter region. [VPC networking](/products/networking/vpc/) provides an additional networking interface accessible only to resources within the same VPC network. This keeps traffic between Droplets and other applicable resource from being routed outside the datacenter over the public internet.
    
4.  **Choose a traffic management type.** Select **HTTP** for most use cases needing general web traffic load balancing, where routing decisions are based on the content of the request (for example, HTTP headers and application protocols). Choose **Network** for high-performance TCP and UDP protocol-level routing with low latency.
    
5.  Set the **Network Visibility** of your regional load balancer. Choose **External** to create a load balancer that serves traffic publicly. Select **Internal** to create a private load balancer that is only accessible to resources on the same VPC network.
    
6.  Choose the load balancer’s **Scaling configuration.**
    

The load balancer’s scaling configuration allows you to adjust the load balancer’s number of nodes. The number of nodes determines:

*   How much traffic the load balancer can handle:
    *   For HTTP load balancers this is affects maximum requests per second and simultaneous connections
    *   For network load balancers the number of nodes determines overall ingress throughput
*   The load balancer’s overall monthly cost

The load balancer must have at least one node. You can add or remove nodes at any time to meet your traffic needs.

Note

The quantity and size of the load balancers you can have on your account depends on your account’s resource limits. We use dynamic resource limits to protect our platform against bad actors. Currently, you can’t check your resource limit for load balancers, but you can contact support if you reach the limit and need to increase it. We are working on features that allow you to review this limit in the control panel.

7.  **Connect Droplets** to the load balancer. If you are creating this load balancer for DigitalOcean Kubernetes, you can skip this step. Use the **Search for Droplet or a tag** search bar to add Droplets or [groups of tagged Droplets](/products/droplets/how-to/tag/) to the load balancer’s backend pool upon creation. You can [add or remove resources from the load balancer’s pool](/products/networking/load-balancers/how-to/manage/#droplets) at anytime after creation.
    
8.  **Add forwarding rules.** [Forwarding rules](/products/networking/load-balancers/how-to/manage/#forwarding-rules) define how traffic is routed from the load balancer to its backend Droplets. You need at least one rule.
    
    The default route is HTTP port 80 on the load balancer to HTTP port 80 on the backend Droplets. You can create new rules during creation with the **New Rule** drop-down. After creation, you can modify a load balancer’s rules at any time on its **Settings** page.
    
    If you create a [forwarding rule that requires a Let’s Encrypt certificate](/products/networking/load-balancers/how-to/ssl-termination/#add-an-ssl-certificate), you have the option to allow us to automatically create the necessary DNS record, at the apex of your domain, to support the certificate. The **Create DNS records for all the new Let’s Encrypt certificates** box is checked by default. If you want to [manage your own DNS records](/products/networking/dns/how-to/manage-records/) for your Let’S Encrypt certificate, uncheck the box to opt out of creating any records when creating the forwarding rule.
    
    You can update this selection when adding or updating forwarding rules at a later time. However, the updated selection applies only to the new rules going forward, existing DNS records are not updated.
    
9.  Select **Additional Networking Options**. Choose **Enable IPv6 Address** to add an IPv6 address to the load balancer, alongside the standard IPv4 address. IPv6 can not be enabled after the load balancer is created.
    
10.  **Set advanced settings.** [Advanced settings](/products/networking/load-balancers/how-to/manage/#settings) allow you to modify additional parameters for the load balancer, sticky sessions, health checks, SSL forwarding, and PROXY protocol. You can also modify these settings after you create the load balancer.
    
11.  **Finalize and create**, which includes **Choose a name** and **Select project**. Load balancer names must be unique and contain alphanumeric characters, dashes, and periods only. You can rename load balancers at any time after creation by clicking on the existing name on the load balancer page.
    

After you create the load balancer, you can add Droplets or Kubernetes nodes to the load balancer on its detail page. To add Kubernetes nodes, see our guide, How to [Add Load Balancers to Kubernetes Clusters](/products/kubernetes/how-to/add-load-balancers/). To add Droplets, click **Choose Droplets** to open the Add Droplets window.

![Add Droplets by tag window](https://docs.digitalocean.com/screenshots/load-balancers/add-droplets.a7b9f69d20710cf215acaee0fcf535aa354e308f63b721d3448403fbfa3efea8.png)

You can add individual Droplets or you can choose a tag. You can only choose Droplets that are in the same region as the load balancer, and if you use a tag, only tagged Droplets in the same region as the load balancer are part of its backend. You can use one tag per load balancer.

When you’ve selected the tag or Droplets, click **Add Droplets**. When you add Droplets to a load balancer, the Droplets start in a **DOWN** state and remain in a **DOWN** state until they pass the load balancer’s health check. Once the backends have passed the health check the required number of times, they are marked healthy and the load balancer begins forwarding requests to them.

Once you have at least one load balancer, you can view and manage them on the load balancer index page.

![The load balancer index page](https://docs.digitalocean.com/screenshots/load-balancers/index-page.4889e504051f28bd1f5938611b3eb60218117f751043ab0be682cdad501f62a3.png)

Clicking on a load balancer from the index page takes you to its detail page. On the detail page, you can [manage and customize the load balancer](/products/networking/load-balancers/how-to/manage/) by modifying its backend Droplet pool, viewing its performance graphs, and changing advanced settings.

In this article...

*   [Create a Load Balancer Using the CLI](#create-a-load-balancer-using-the-cli)
*   [Create a Load Balancer Using the API](#create-a-load-balancer-using-the-api)
*   [Create a Load Balancer Using the Control Panel](#create-a-load-balancer-using-the-control-panel)

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