---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - load-balancers
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/load-balancers/how-to/manage/
domain: docs.digitalocean.com
---
                How to Manage Regional Load Balancers | DigitalOcean Documentation

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
*   Manage Regional Load Balancers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Manage Regional Load Balancers

Validated on 9 Nov 2021 • Last edited on 17 Jun 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

After you [create a load balancer and add nodes to it](/products/networking/load-balancers/how-to/create/), you can manage and modify it on its detail page.

First, click **Networking** in the main menu, and then click **Load Balancers** to go to the load balancer index page. Click an individual load balancer’s name to go to its detail page, which has three tabs:

*   **[Nodes](#nodes)**, where you can view the nodes currently attached to the load balancer and modify the backend node pool.
    
*   **[Graphs](#graphs)**, where you can view graphs of traffic patterns and infrastructure health.
    
*   **[Settings](#settings)**, where you can set or customize the forwarding rules, sticky sessions, health checks, SSL forwarding, and PROXY protocol.
    

## Point Hostname at Load Balancer[](#point-hostname-at-load-balancer)

To start sending traffic from your hostname to your load balancer, you need to create an [A record](/products/networking/dns/how-to/manage-records/#a-records) on your DNS provider that points your hostname at the load balancer’s IP address.

If your DNS provider is DigitalOcean, reference [Create and Delete DNS Records](/products/networking/dns/how-to/manage-records/#create-and-delete-records) to see how to do this. If you do not use DigitalOcean as a DNS provider, reference your current provider’s documentation to see how this is done.

## Droplet Connectivity[](#droplet-connectivity)

Load balancers automatically connect to Droplets that reside in the same [VPC network](/products/networking/vpc/) as the load balancer.

To validate that private networking has been enabled on a Droplet from the control panel, click **Droplets** in the main menu, then click the Droplet you want to check from the list of Droplets.

From the Droplet’s page, click **Networking** in the left menu. If the private network interface is enabled, the **Private Network** section populates with the Droplet’s private IPv4 address and VPC network name. If the private network interface has not been enabled, a “Turn off” button is displayed.

![Private networking enabled](https://docs.digitalocean.com/screenshots/droplets/droplet-private-networking-enabled.56a8bad0bf31886ebdab7acbe49f9f73c0d9f2493e2ea3e8fc4f5303be859b79.png)

## Manage the Backend Nodes[](#nodes)

### Add Droplets to a Load Balancer Using the CLI[](#add-droplets-to-a-load-balancer-using-the-cli)

The following command requires the Droplet’s ID number. Use the [`doctl compute droplet list`](/reference/doctl/reference/compute/droplet/list/) command to retrieve a list of Droplets and their ID’s.

How to Add Droplets to a Load Balancer Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute load-balancer add-droplets`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/load-balancer/add-droplets/) for more details:
    
        doctl compute load-balancer add-droplets <load-balancer-id> [flags]
    

### Add Droplets to a Load Balancer Using the API[](#add-droplets-to-a-load-balancer-using-the-api)

The following call requires the Droplet’s ID number. Use the [`/v2/droplets` endpoint](/reference/api/digitalocean/#operation/droplets_list) to retrieve a list of Droplets and their IDs.

How to Add Droplets to a Load Balancer Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/load_balancers/{lb_id}/droplets`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/loadBalancers_add_droplets).

### cURL[](#add-droplets-to-a-load-balancer-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"droplet_ids": [3164446, 3164447]}' \
      "https://api.digitalocean.com/v2/load_balancers/4de7ac8b-495b-4884-9a69-1050c6793cd6/droplets"

### Go[](#add-droplets-to-a-load-balancer-go)

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
    
        droplets := []int{3164446, 3164447}
        _, err := client.LoadBalancers.AddDroplets(ctx, "4de7ac8b-495b-4884-9a69-1050c6793cd6", droplets...)
    }

### Ruby[](#add-droplets-to-a-load-balancer-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    client.load_balancers.add_droplets([3164446, 3164447], id: '4de7ac8b-495b-4884-9a69-1050c6793cd6')

### Python[](#add-droplets-to-a-load-balancer-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "droplet_ids": [
        3164444,
        3164445
      ]
    }
    
    resp = client.load_balancers.add_droplets(lb_id="1fd32a", body=req)

### Add Droplets to a Load Balancer Using the Control Panel[](#add-droplets-to-a-load-balancer-using-the-control-panel)

In the **Droplets** tab, you can view and modify the load balancer’s backend node pool.

![The load balancer detail page on the Droplets tab](https://docs.digitalocean.com/screenshots/load-balancers/droplets-tab.f05c4b1457db2ac5ec4c9f5177b37a07f0e776595df6884d8a01cf388d465ba6.png)

This page displays information about the status of each node and its other health metrics. Clicking on a node name takes you to the node’s detail page.

If you are managing backend Droplets by name, you can add additional Droplets by clicking the **Add Droplets** button on this page. If you are managing by tag, you instead have an **Edit Tag** button.

When you add Droplets to a load balancer, the Droplets start in a **DOWN** state and remain in a **DOWN** state until they pass the load balancer’s health check. Once the backends have passed the health check the required number of times, they are marked healthy and the load balancer begins forwarding requests to them.

## View Graphs[](#graphs)

Click the **Graphs** tab to get a visual representation of traffic patterns and infrastructure health. The metrics in this section change depending on whether the load balancer is for a Droplet or for Kubernetes nodes.

![The load balancer detail page on the Graphs tab](https://docs.digitalocean.com/screenshots/load-balancers/graphs-tab.6dbd62c5373b318bfe2cfe7d40364b57447745acaf5d965716880a5df6d8c6c9.png)

The **Frontend** section displays graphs related to requests to the load balancer itself:

*   HTTP Requests Per Second
*   Connections
*   HTTP Responses
*   Traffic Received/Sent

The **Droplets** section displays graphs related to the backend Droplet pool:

*   HTTP Total Session Duration
*   HTTP Average Response Time
*   Queue size
*   HTTP responses
*   Downtime
*   Health checks
*   Number of connections

The **Kubernetes** section displays graphs related to the backend Kubernetes nodes:

*   HTTP Total Session Duration
*   HTTP Average Response Time
*   HTTP responses
*   Number of connections

## Modify Advanced Settings[](#settings)

Click the **Settings** tab to modify the way that the load balancer functions.

![The load balancer settings screen](https://docs.digitalocean.com/screenshots/load-balancers/settings.fddc0d8f993d1996c627c8af847a85c91ef7fb5a58d4704a234b5b2068641ecd.png)

### Scaling Configuration[](#scaling-configuration)

The load balancer’s scaling configuration allows you to adjust the load balancer’s number of nodes. The number of nodes determines:

*   How much traffic the load balancer can handle:
    *   For HTTP load balancers this is affects maximum requests per second and simultaneous connections
    *   For network load balancers the number of nodes determines overall ingress throughput
*   The load balancer’s overall monthly cost

The load balancer must have at least one node. You can add or remove nodes at any time to meet your traffic needs.

Note

The quantity and size of the load balancers you can have on your account depends on your account’s resource limits. We use dynamic resource limits to protect our platform against bad actors. Currently, you can’t check your resource limit for load balancers, but you can contact support if you reach the limit and need to increase it. We are working on features that allow you to review this limit in the control panel.

### Forwarding Rules[](#forwarding-rules)

Forwarding rules define how traffic is routed from the load balancer to its backend nodes. The left side of each rule defines the listening port and protocol on the load balancer itself, and the right side defines where and how the requests are routed to the backends.

You can [change the protocols](/products/networking/load-balancers/details/features/#protocol-support) using the drop-down menus. If you use HTTPS or HTTP2, you need an [an SSL certificate](/platform/teams/how-to/manage-certificates/) or to [use SSL passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/).

Note

DigitalOcean Kubernetes automatically manages its load balancers’ forwarding rules, based on the ports you expose for a given service on your worker nodes. You can also manually [update your protocol or SSL options](/products/kubernetes/how-to/configure-load-balancers/#protocol).

#### Add or Remove Forwarding Rules Using the CLI[](#add-or-remove-forwarding-rules-using-the-cli)

How to Add a Forwarding Rule Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute load-balancer add-forwarding-rules`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/load-balancer/add-forwarding-rules/) for more details:
    
        doctl compute load-balancer add-forwarding-rules <load-balancer-id> [flags]
    

How to Remove a Forwarding Rule Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute load-balancer remove-forwarding-rules`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/load-balancer/remove-forwarding-rules/) for more details:
    
        doctl compute load-balancer remove-forwarding-rules <load-balancer-id> [flags]
    

#### Add or Remove Forwarding Rules Using the API[](#add-or-remove-forwarding-rules-using-the-api)

How to Add a Forwarding Rule Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/load_balancers/{lb_id}/forwarding_rules`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/loadBalancers_add_forwardingRules).

### cURL[](#add-a-forwarding-rule-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"forwarding_rules": [{"entry_protocol": "tcp","entry_port": 3306,"target_protocol": "tcp","target_port": 3306}]}' \
      "https://api.digitalocean.com/v2/load_balancers/4de7ac8b-495b-4884-9a69-1050c6793cd6/forwarding_rules"

### Go[](#add-a-forwarding-rule-go)

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
    
        forwardingRule := []godo.ForwardingRule{
            {
                EntryProtocol:  "tcp",
                EntryPort:      3306,
                TargetProtocol: "tcp",
                TargetPort:     3306,
            },
        }
    }

### Ruby[](#add-a-forwarding-rule-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    rule = DropletKit::ForwardingRule.new(
      entry_protocol: 'tcp',
      entry_port: 3306,
      target_protocol: 'tcp',
      target_port: 3306,
      certificate_id: '',
      tls_passthrough: false
    )
    client.load_balancers.add_forwarding_rules([rule], id: '4de7ac8b-495b-4884-9a69-1050c6793cd6')

### Python[](#add-a-forwarding-rule-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "forwarding_rules": [
        {
          "entry_protocol": "https",
          "entry_port": 443,
          "target_protocol": "http",
          "target_port": 80,
          "certificate_id": "892071a0-bb95-49bc-8021-3afd67a210bf",
          "tls_passthrough": False
        }
      ]
    }
    
    resp = client.load_balancers.add_forwarding_rules(lb_id="1fd32a", body=req)

How to Remove a Forwarding Rule Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a DELETE request to [`https://api.digitalocean.com/v2/load_balancers/{lb_id}/forwarding_rules`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/loadBalancers_remove_forwardingRules).

### cURL[](#remove-a-forwarding-rule-curl)

Using cURL:

    curl -X DELETE \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"forwarding_rules": [{"entry_protocol": "tcp","entry_port": 3306,"target_protocol": "tcp","target_port": 3306}]}' \
      "https://api.digitalocean.com/v2/load_balancers/4de7ac8b-495b-4884-9a69-1050c6793cd6/forwarding_rules"

### Go[](#remove-a-forwarding-rule-go)

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
    
        forwardingRule := []godo.ForwardingRule{
            {
                EntryProtocol:  "tcp",
                EntryPort:      3306,
                TargetProtocol: "tcp",
                TargetPort:     3306,
            },
        }
    
        _, err := client.LoadBalancers.RemoveForwardingRules(ctx, "4de7ac8b-495b-4884-9a69-1050c6793cd6", forwardingRule...)
    }

### Ruby[](#remove-a-forwarding-rule-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    rule = DropletKit::ForwardingRule.new(
      entry_protocol: 'tcp',
      entry_port: 3306,
      target_protocol: 'tcp',
      target_port: 3306,
      certificate_id: '',
      tls_passthrough: false
    )
    client.load_balancers.remove_forwarding_rules([rule], id: '4de7ac8b-495b-4884-9a69-1050c6793cd6')

### Python[](#remove-a-forwarding-rule-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "forwarding_rules": [
        {
          "entry_protocol": "https",
          "entry_port": 443,
          "target_protocol": "http",
          "target_port": 80,
          "certificate_id": "892071a0-bb95-49bc-8021-3afd67a210bf",
          "tls_passthrough": False
        }
      ]
    }
    
    resp = client.load_balancers.remove_forwarding_rules(lb_id="fda9fda", body=req)

#### Add or Remove Forwarding Rules Using the Control Panel[](#add-or-remove-forwarding-rules-using-the-control-panel)

To add a forwarding rule from the [control panel](https://cloud.digitalocean.com), click **Networking** in the main menu, then choose the **Load Balancers**. Click the load balancer you want to modify, then click **Settings** to go to its settings page. In the **Forwarding rules** section, click the **Edit**. button. A new menu appears with any existing rules.

To create a new rule, click the **New rule** drop-down menu and then select the protocol of the traffic the load balancer receives. This opens additional rule configuration options. Select the port the load balancer receives traffic on, and then select the protocol and port the Droplet receives traffic on. Once you have configured the rule, click **Save**. The rule is applied to the load balancer.

To remove a forwarding rule, click the **Delete** button beside the forwarding rule you want to remove.

### Health Checks[](#health-checks)

Health checks verify that your Droplets are online and meet any customized health criteria. Load balancers only forward requests to Droplets that pass health checks. If your load balancer uses UDP in its forwarding rules, the load balancer requires that you set up a health check with a port that uses TCP, HTTP, or HTTPS to work properly.

In the **Target** section, you choose the **Protocol** (HTTP, HTTPS, or TCP), **Port** (80 by default), and **Path** (`/` by default) that nodes should respond on.

In the **Additional Settings** section, you choose:

*   The **Check Interval**, which is how many seconds the load balancer waits between health checks.
*   The **Response Timeout**, which is how many seconds the load balancer waits between responses.
*   The **Unhealthy Threshold**, which is how many consecutive times a node must fail a health check before the load balancer stops forwarding traffic to it.
*   The **Healthy Threshold**, which is how many consecutive times a node must pass a health check before the load balancer forwards traffic to it.

The success criteria for HTTP and HTTPS health checks is a status code response in the range 200 - 399. The success criteria for TCP health checks is completing a TCP handshake to connect.

Note

HTTP and HTTPS health checks may fail with Droplets running Apache on Rocky Linux because the default Apache page returns a 403 Forbidden HTTP response code. To fix this, either change the health check from HTTP/HTTPS to TCP or configure Apache to return a 200 OK response code by creating an HTML page in Apache’s root directory.

### Sticky Sessions[](#sticky-sessions)

Sticky sessions send subsequent requests from the same client to the same Droplet by setting a cookie with a configurable name and TTL (Time-To-Live) duration. The TTL parameter defines the duration the cookie remains valid in the client's browser. This option is useful for application sessions that rely on connecting to the same Droplet for each request.

### SSL[](#ssl)

The SSL option redirects HTTP requests on port 80 to HTTPS on port 443. When you enable this option, HTTP URLs are forwarded to HTTPS with a [307 redirect](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/307).

To redirect traffic, you need to [set up at least one HTTP forwarding rule and one HTTPS forwarding rule](/products/networking/load-balancers/how-to/manage/#forwarding-rules).

### Proxy Protocol[](#proxy-protocol)

Enabling the PROXY protocol allows the load balancer to forward client connection information (such as client IP addresses) to your Droplets. The software running on the Droplets must be properly configured to accept the connection information from the load balancer.

[Backend services need to accept PROXY protocol headers](/support/why-did-all-of-my-backend-droplets-become-unhealthy-when-i-enabled-proxy-protocol-on-my-load-balancer/) or the nodes fail the load balancer’s health checks.

### Backend Keep-Alive[](#backend-keep-alive)

By default, DigitalOcean Load Balancers ignore the `Connection: keep-alive` header of HTTP responses from Droplets to load balancers and close the connection upon completion. When you enable backend keepalive, the load balancer honors the `Connection: keep-alive` header and keeps the connection open for reuse. This allows the load balancer to use fewer active TCP connections to send and to receive HTTP requests between the load balancer and your target Droplets.

Enabling this option generally improves performance (requests per second and latency) and is more resource efficient. For many use cases, such as serving web sites and APIs, this can improve the performance the client experiences. However, it is not guaranteed to improve performance in all situations, and can increase latency in certain scenarios.

The option applies to all forwarding rules where the target protocol is HTTP or HTTPS. It does not apply to forwarding rules that use TCP, HTTPS, or HTTP/2 passthrough.

There are no hard limits to the number of connections between the load balancer and each server. However, if the target servers are undersized, they may not be able to handle incoming traffic and may lose packets. See [Best Practices for Performance on DigitalOcean Load Balancers](/products/networking/load-balancers/concepts/best-practices/).

### HTTP Idle Timeout[](#http-idle-timeout)

By default, load balancer connections time out after being idle for 60 seconds. You can increase or decrease this amount of time to fit your application’s needs. You can set it for a minimum of 30 seconds and a maximum 600 seconds (10 minutes).

### Add or Remove Firewall Rules From a Load Balancer[](#add-or-remove-firewall-rules-from-a-load-balancer)

Currently, you can only add firewall rules to a load balancer using the CLI or API.

To add or remove firewall rules from an existing load balancer using the CLI, use the `--allow-list` and `--deny-list` flags with the [update command](/reference/doctl/reference/compute/load-balancer/update/) to define a list of IP addresses and CIDRs that the load balancer accepts or blocks incoming connections from.

How to Add or Remove Firewall Rules Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute load-balancer update`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/load-balancer/update/) for more details:
    
        doctl compute load-balancer update <load-balancer-id> [flags]
    

To add or remove firewall rules from an existing load balancer using the API, use the [update endpoint](/reference/api/digitalocean/#operation/loadBalancers_update) with the `firewall` field to define a list of IP addresses and CIDRs the load balancer accepts or blocks connections from.

How to Add or Remove Firewall Rules Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/load_balancers/{lb_id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/loadBalancers_update).

### cURL[](#add-or-remove-firewall-rules-curl)

Using cURL:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name":"example-lb-01","size_unit":"2","region":"nyc3","algorithm":"least_connections","forwarding_rules":[{"entry_protocol":"http","entry_port":80,"target_protocol":"http","target_port":80},{"entry_protocol":"https","entry_port":444,"target_protocol":"https","target_port":443,"tls_passthrough":true}],"health_check":{"protocol":"http","port":80,"path":"/","check_interval_seconds":10,"response_timeout_seconds":5,"healthy_threshold":5,"unhealthy_threshold":3},"sticky_sessions":{"type":"cookies", "cookie_name": "DO_LB", "cookie_ttl_seconds": 300}, "firewall":{"deny":["ip:1.2.3.4","cidr:2.3.4.0/24"], "allow":["cidr:1.2.0.0/16","ip:2.3.4.5"]}, "droplet_ids": [3164444, 3164445]}' \
      "https://api.digitalocean.com/v2/load_balancers/4de7ac8b-495b-4884-9a69-1050c6793cd6"

### Go[](#add-or-remove-firewall-rules-go)

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

### Ruby[](#add-or-remove-firewall-rules-ruby)

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

### Python[](#add-or-remove-firewall-rules-python)

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

In this article...

*   [Point Hostname at Load Balancer](#point-hostname-at-load-balancer)
*   [Droplet Connectivity](#droplet-connectivity)
*   [Manage the Backend Nodes](#nodes)
    *   [Add Droplets to a Load Balancer Using the CLI](#add-droplets-to-a-load-balancer-using-the-cli)
    *   [Add Droplets to a Load Balancer Using the API](#add-droplets-to-a-load-balancer-using-the-api)
    *   [Add Droplets to a Load Balancer Using the Control Panel](#add-droplets-to-a-load-balancer-using-the-control-panel)
*   [View Graphs](#graphs)
*   [Modify Advanced Settings](#settings)
    *   [Scaling Configuration](#scaling-configuration)
    *   [Forwarding Rules](#forwarding-rules)
        *   [Add or Remove Forwarding Rules Using the CLI](#add-or-remove-forwarding-rules-using-the-cli)
        *   [Add or Remove Forwarding Rules Using the API](#add-or-remove-forwarding-rules-using-the-api)
        *   [Add or Remove Forwarding Rules Using the Control Panel](#add-or-remove-forwarding-rules-using-the-control-panel)
    *   [Health Checks](#health-checks)
    *   [Sticky Sessions](#sticky-sessions)
    *   [SSL](#ssl)
    *   [Proxy Protocol](#proxy-protocol)
    *   [Backend Keep-Alive](#backend-keep-alive)
    *   [HTTP Idle Timeout](#http-idle-timeout)
    *   [Add or Remove Firewall Rules From a Load Balancer](#add-or-remove-firewall-rules-from-a-load-balancer)

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

Try using diffe