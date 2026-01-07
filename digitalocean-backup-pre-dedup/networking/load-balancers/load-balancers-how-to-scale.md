---
source: '[unknown - load-balancers-how-to-scale.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Scale Regional Load Balancers | DigitalOcean Documentation

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
*   Scale Regional Load Balancers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Scale Regional Load Balancers

Validated on 9 Nov 2021 • Last edited on 17 Jun 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

Scaling a regional load balancer adjusts its performance to its workload by changing the number of nodes the load balancer contains. You can scale regional load balancers up or down at anytime to meet your traffic needs. You cannot scale global load balancers.

You can scale a load balancer to adjust its performance to its workload. Scaling changes the number of nodes the load balancer contains. You can scale load balancers up or down at anytime to meet your traffic needs.

Each additional node increases the load balancer’s maximum:

*   Requests per second, up to 10,000
*   Simultaneous connections, up to 10,000
*   New SSL connections per second by 250 (or 50 for certificates using 4096-bit RSA keys)

You can add up to 200 nodes to a load balancer if your account limits allow it. To request a limit increase, [contact support](https://cloudsupport.digitalocean.com).

Note

When scaling a load balancer down, each node is given one minute to drain the remaining connections. Any connections that remain after one minute are closed. This may cause a brief disruption in traffic to the load balancer. Make any appropriate changes to your network before scaling to avoid disruptions in your production traffic.

### Scale a Load Balancer Using the CLI[](#scale-a-load-balancer-using-the-cli)

Use the `--size-unit` flag to set the new number of nodes for the load balancer.

How to Scale a Load Balancer Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute load-balancer update`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/load-balancer/update/) for more details:
    
        doctl compute load-balancer update <load-balancer-id> [flags]
    

### Scale a Load Balancer Using the API[](#scale-a-load-balancer-using-the-api)

Use the `size_unit` field to set the new number of nodes for the load balancer.

How to Scale a Load Balancer Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/load_balancers/{lb_id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/loadBalancers_update).

### cURL[](#scale-a-load-balancer-curl)

Using cURL:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name":"example-lb-01","size_unit":"2","region":"nyc3","algorithm":"least_connections","forwarding_rules":[{"entry_protocol":"http","entry_port":80,"target_protocol":"http","target_port":80},{"entry_protocol":"https","entry_port":444,"target_protocol":"https","target_port":443,"tls_passthrough":true}],"health_check":{"protocol":"http","port":80,"path":"/","check_interval_seconds":10,"response_timeout_seconds":5,"healthy_threshold":5,"unhealthy_threshold":3},"sticky_sessions":{"type":"cookies", "cookie_name": "DO_LB", "cookie_ttl_seconds": 300}, "firewall":{"deny":["ip:1.2.3.4","cidr:2.3.4.0/24"], "allow":["cidr:1.2.0.0/16","ip:2.3.4.5"]}, "droplet_ids": [3164444, 3164445]}' \
      "https://api.digitalocean.com/v2/load_balancers/4de7ac8b-495b-4884-9a69-1050c6793cd6"

### Go[](#scale-a-load-balancer-go)

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
    
        updateRequest := &godo.LoadBalancerRequest{
            Name:      "example-01",
            SizeUnit: "2",
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
                Type:             "cookies",
                CookieName:       "DO_LB",
                CookieTtlSeconds: 300,
            },
            DropletIDs:          []int{3164444, 3164445},
            RedirectHttpToHttps: false,
            Firewall:            &godo.LBFirewall{
                Deny: []string{"ip:1.2.3.4", "cidr:2.3.4.0/24"},
                Allow: []string{"cidr:1.2.0.0/16", "ip:2.3.4.5"},
            }
        }
    
        lb, _, err := c.LoadBalancers.Update(ctx, "c2c97ca7-6f63-4e23-8909-906fd86efb5e", updateRequest)
    }

### Ruby[](#scale-a-load-balancer-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    load_balancer = DropletKit::LoadBalancer.new(
      name: 'example-lb-01',
      size_unit: '2',
      algorithm: 'round_robin',
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
        cookie_name: 'DO-LB-COOKIE',
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
    client.load_balancers.update(load_balancer, id: '4de7ac8b-495b-4884-9a69-1050c6793cd6')

### Python[](#scale-a-load-balancer-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "updated-example-lb-01",
      "region": "nyc3",
      "droplet_ids": [
        3164444,
        3164445
      ],
      "algorithm": "round_robin",
      "forwarding_rules": [
        {
          "entry_protocol": "http",
          "entry_port": 80,
          "target_protocol": "http",
          "target_port": 80,
          "certificate_id": "",
          "tls_passthrough": false
        },
        {
          "entry_protocol": "https",
          "entry_port": 443,
          "target_protocol": "https",
          "target_port": 443,
          "certificate_id": "",
          "tls_passthrough": true
        }
      ],
      "health_check": {
        "protocol": "http",
        "port": 80,
        "path": "/",
        "check_interval_seconds": 10,
        "response_timeout_seconds": 5,
        "healthy_threshold": 5,
        "unhealthy_threshold": 3
      },
      "sticky_sessions": {
        "type": "none"
      },
      "redirect_http_to_https": False,
      "enable_proxy_protocol": True,
      "enable_backend_keepalive": True,
      "vpc_uuid": "c33931f2-a26a-4e61-b85c-4e95a2ec431b",
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
    resp = client.load_balancers.update(lb_id="fda9fda", body=req)

### Scale a Load Balancer Using the Control Panel[](#scale-a-load-balancer-using-the-control-panel)

To scale a load balancer from the [DigitalOcean Control Panel](https://cloud.digitalocean.com), click **Networking**, then click **Load Balancers** to go to the load balancer overview page. Click the name of the load balancer you want to scale, then click the **Settings** tab.

![Load balancer Settings menu with Scaling Configuration Resize button highlighted](https://docs.digitalocean.com/screenshots/load-balancers/resize.dffefd15c3f74e5e45ba20151f83a1a125ce246cc8cb1c69a55727909dfb1ea8.png)

In the **Scaling Configuration** section, click **Resize**. In the **Number of nodes** field, select the new amount of nodes you would like the load balancer to scale to. As you change the amount of nodes, the load balancer’s connection specifications and price update to give you an overview of the load balancer’s overall capabilities and [monthly cost](/products/networking/load-balancers/details/pricing/).

![Load balancer Settings section with Scaling Configuration open](https://docs.digitalocean.com/screenshots/load-balancers/scale-config.202490860360ca76e8cbe34b31c020da780267c3d873ac156932db0cf786ca4d.png)

Once you’ve selected the new number of nodes, click **Update Node Count**. The load balancer drops all open connections and then scales.

Once the load balancer has scaled, the **Scaling Configuration** section of the **Settings** page reflects the load balancer’s new amount of nodes.

In this article...

*   *   [Scale a Load Balancer Using the CLI](#scale-a-load-balancer-using-the-cli)
    *   [Scale a Load Balancer Using the API](#scale-a-load-balancer-using-the-api)
    *   [Scale a Load Balancer Using the Control Panel](#scale-a-load-balancer-using-the-control-panel)

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