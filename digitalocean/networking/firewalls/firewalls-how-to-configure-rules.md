---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - firewalls
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/firewalls/how-to/configure-rules/
domain: docs.digitalocean.com
---
                How to Configure Firewall Rules | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/firewalls.ae799a907969d743602c769c16fd2ad744471b683543c748c3cfb89494091454.svg)Cloud Firewalls](/products/networking/firewalls/)
*   [Getting Started](/products/networking/firewalls/getting-started/)
    *   [Quickstart](/products/networking/firewalls/getting-started/quickstart/)
*   [How-Tos](/products/networking/firewalls/how-to/)
    *   [Create Firewalls](/products/networking/firewalls/how-to/create/)
    *   [Configure Rules](/products/networking/firewalls/how-to/configure-rules/)
    *   [Apply Firewalls to Droplets](/products/networking/firewalls/how-to/manage-droplets/)
    *   [View Rules for Droplets](/products/networking/firewalls/how-to/view-rules-for-droplet/)
    *   [Destroy Firewalls](/products/networking/firewalls/how-to/destroy/)
*   [Reference](/products/networking/firewalls/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Firewalls)
    *   [CLI Reference](/reference/doctl/reference/compute/firewall/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/firewalls/concepts/)
    *   [Organize Firewalls](/products/networking/firewalls/concepts/organization/)
*   [Details](/products/networking/firewalls/details/)
    *   [Features](/products/networking/firewalls/details/features/)
    *   [Pricing](/products/networking/firewalls/details/pricing/)
    *   [Availability](/products/networking/firewalls/details/availability/)
    *   [Limits](/products/networking/firewalls/details/limits/)
*   [Support](/products/networking/firewalls/support/)

*   [How-Tos](/products/networking/firewalls/how-to/) 
*   Configure Rules

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Configure Firewall Rules

Validated on 1 Jun 2023 • Last edited on 17 Apr 2025

DigitalOcean Cloud Firewalls are a network-based, stateful firewall service for Droplets provided at no additional cost. Cloud firewalls block all traffic that isn’t expressly permitted by a rule.

Inbound firewall rules define the traffic allowed to the server on which ports and from which sources. If no inbound rules are configured, no incoming traffic is permitted.

Outbound firewall rules define the traffic allowed to leave the server on which ports and to which destinations. If no outbound rules are configured, no outbound traffic is permitted.

Note

The DigitalOcean Cloud Firewall service is a separate firewall from any firewall software running on a Droplet, such as UFW or IPFire. Any rules created using the Cloud Firewall service are not reflected in the firewall software of the Droplets it protects. Additionally, if you are using both the Cloud Firewall service and a Droplet-based firewall software to protect your Droplets, ensure that the rules between the two firewalls do not conflict.

## Add, Update, or Remove Rules from a Firewall Using the CLI[](#add-update-or-remove-rules-from-a-firewall-using-the-cli)

The firewall rule management commands require the firewall’s ID. To retrieve a list of firewalls and their IDs, use the `doctl compute firewall list` command.

How to Add a Rule to a Firewall Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute firewall add-rules`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/firewall/add-rules/) for more details:
    
        doctl compute firewall add-rules <firewall-id> [flags]
    
    The following example adds an inbound rule and an outbound rule to a cloud firewall with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`:
    
        doctl compute firewall add-rules f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --inbound-rules "protocol:tcp,ports:22,droplet_id:386734086" --outbound-rules "protocol:tcp,ports:22,address:0.0.0.0/0"
    

How to Update a Firewall’s Rules Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute firewall update`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/firewall/update/) for more details:
    
        doctl compute firewall update <firewall-id> [flags]
    
    The following example updates a cloud firewall named `example-firewall` that contains an inbound rule and an outbound rule and applies them to the specified Droplet:
    
        doctl compute firewall update f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --name "example-firewall" --inbound-rules "protocol:tcp,ports:22,droplet_id:386734086" --outbound-rules "protocol:tcp,ports:22,address:0.0.0.0/0" --droplet-ids "386734086,391669331"
    

How to Remove a Rule From a Firewall Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute firewall remove-rules`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/firewall/remove-rules/) for more details:
    
        doctl compute firewall remove-rules <firewall-id> [flags]
    
    The following example removes an inbound rule and an outbound rule from a cloud firewall with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`:
    
        doctl compute firewall remove-rules f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --inbound-rules "protocol:tcp,ports:22,droplet_id:386734086" --outbound-rules "protocol:tcp,ports:22,address:0.0.0.0/0"
    

## Add, Update, or Remove Rules from a Firewall Using the API[](#add-update-or-remove-rules-from-a-firewall-using-the-api)

The firewall rule management calls require the firewall’s ID. To retrieve a list of firewalls and their IDs, use the [`/v2/firewalls` firewalls endpoint](/reference/api/digitalocean/#operation/firewalls_list).

How to Add a Firewall Rule Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/firewalls/{firewall_id}/rules`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/firewalls_add_rules).

### cURL[](#add-a-firewall-rule-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"inbound_rules":[{"protocol":"tcp","ports":"3306","sources":{"droplet_ids":[49696269]}}],"outbound_rules":[{"protocol":"tcp","ports":"3306","destinations":{"droplet_ids":[49696269]}}]}' \
      "https://api.digitalocean.com/v2/firewalls/bb4b2611-3d72-467b-8602-280330ecd65c/rules" 

### Go[](#add-a-firewall-rule-go)

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
    
    ruleRequest := &godo.FirewallRulesRequest{
        InboundRules: []godo.InboundRule{
            {
                Protocol:      'tcp',
                PortRange:     '3306',
                Sources: &godo.Sources{
                    DropletIDs: []int{49696269},
                },
            },
        },
        OutboundRules: []godo.OutboundRule{
            {
                Protocol:      'tcp',
                PortRange:     '3306',
                Destinations: &godo.Destinations{
                    DropletIDs: []int{49696269},
                },
            },
        },
    }
    
    _, err := c.Firewalls.AddRules(ctx, 'bb4b2611-3d72-467b-8602-280330ecd65c', ruleRequest)
    }

### Ruby[](#add-a-firewall-rule-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    inbound_rule = DropletKit::FirewallInboundRule.new(
      protocol: 'tcp',
      ports: '3306',
      sources: {
        droplet_ids: [49696269]
      }
    )
    
    outbound_rule = DropletKit::FirewallOutboundRule.new(
      protocol: 'tcp',
      ports: '3306',
      destinations: {
        droplet_ids: [49696269]
      }
    )
    
    client.firewalls.add_rules(inbound_rules: [inbound_rule], outbound_rules: [outbound_rule], id: 'bb4b2611-3d72-467b-8602-280330ecd65c')

### Python[](#add-a-firewall-rule-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "inbound_rules": [
        {
          "protocol": "tcp",
          "ports": "3306",
          "sources": {
            "droplet_ids": [
              49696269
            ]
          }
        }
      ],
      "outbound_rules": [
        {
          "protocol": "tcp",
          "ports": "3306",
          "destinations": {
            "droplet_ids": [
              49696269
            ]
          }
        }
      ]
    }
    
    resp = client.firewalls.add_rules(firewall_id="39fa4gz", body=req)

How to Update a Firewall’s Rules Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/firewalls/{firewall_id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/firewalls_update).

### cURL[](#update-a-firewalls-rules-curl)

Using cURL:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name":"firewall","inbound_rules":[{"protocol":"tcp","ports":"8080","sources":{"load_balancer_uids": ["4de7ac8b-495b-4884-9a69-1050c6793cd6"]}},{"protocol": "tcp","ports": "22","sources":{"tags": ["gateway"],"addresses": ["18.0.0.0/8"]}}],"outbound_rules":[{"protocol":"tcp","ports":"8080","destinations":{"addresses":["0.0.0.0/0","::/0"]}}],"droplet_ids":[8043964],"tags":["frontend"]}' \
      "https://api.digitalocean.com/v2/firewalls/bb4b2611-3d72-467b-8602-280330ecd65c"

### Go[](#update-a-firewalls-rules-go)

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
    
        updateRequest := &godo.FirewallRequest{
            Name: 'firewall',
            InboundRules: []godo.InboundRule{
                {
                    Protocol: 'tcp',
                    PortRange: '8080',
                    Sources: &godo.Sources{
                        LoadBalancerUIDs: []string{'4de7ac8b-495b-4884-9a69-1050c6793cd6'},
                    },
                },
                {
                    Protocol:  'tcp',
                    PortRange: '22',
                    Sources: &godo.Sources{
                        Addresses: []string{'18.0.0.0/8'},
                        Tags: []string{'gateway'},
                    },
                },
            },
            OutboundRules: []godo.OutboundRule{
                {
                    Protocol: 'tcp',
                    PortRange: '8080',
                    Destinations: &godo.Destinations{
                        Addresses: []string{'0.0.0.0/0', '::/0'},
                    },
                },
            },
            DropletIDs: []int{8043964},
            Tags: []string{'frontend'}
        }
    
        firewall, req, err := client.Firewalls.Create(ctx, 'bb4b2611-3d72-467b-8602-280330ecd65c', updateRequest)
    }

### Ruby[](#update-a-firewalls-rules-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    firewall = DropletKit::Firewall.new(
      name: 'firewall',
      inbound_rules: [
        DropletKit::FirewallInboundRule.new(
          protocol: 'tcp',
          ports: '8080',
          sources: {
            load_balancer_uids: ['4de7ac8b-495b-4884-9a69-1050c6793cd6']
          }
        ),
        DropletKit::FirewallInboundRule.new(
          protocol: 'tcp',
          ports: '22',
          sources: {
            tags: ['gateway'],
            addresses: ['18.0.0.0/8']
          }
        )
      ],
      outbound_rules: [
        DropletKit::FirewallOutboundRule.new(
          protocol: 'tcp',
          ports: '8080',
          destinations: {
            addresses: ['0.0.0.0/0', '::/0'],
          }
        )
      ],
      droplet_ids: [8043964],
      tags: ['frontend']
    )
    
    client.firewalls.update(firewall, id: 'bb4b2611-3d72-467b-8602-280330ecd65c')

### Python[](#update-a-firewalls-rules-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "frontend-firewall",
      "inbound_rules": [
        {
          "protocol": "tcp",
          "ports": "8080",
          "sources": {
            "load_balancer_uids": [
              "4de7ac8b-495b-4884-9a69-1050c6793cd6"
            ]
          }
        },
        {
          "protocol": "tcp",
          "ports": "22",
          "sources": {
            "tags": [
              "gateway"
            ],
            "addresses": [
              "18.0.0.0/8"
            ]
          }
        }
      ],
      "outbound_rules": [
        {
          "protocol": "tcp",
          "ports": "8080",
          "destinations": {
            "addresses": [
              "0.0.0.0/0",
              "::/0"
            ]
          }
        }
      ],
      "droplet_ids": [
        8043964
      ],
      "tags": [
        "frontend"
      ]
    }
    
    resp = client.firewalls.update(firewall_id="3afda9", body=req)

How to Delete a Firewall Rule Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a DELETE request to [`https://api.digitalocean.com/v2/firewalls/{firewall_id}/rules`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/firewalls_delete_rules).

### cURL[](#delete-a-firewall-rule-curl)

Using cURL:

    curl -X DELETE \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"inbound_rules":[{"protocol":"tcp","ports":"3306","sources":{"droplet_ids":[49696269]}}],"outbound_rules":[{"protocol":"tcp","ports":"3306","destinations":{"droplet_ids":[49696269]}}]}' \
      "https://api.digitalocean.com/v2/firewalls/bb4b2611-3d72-467b-8602-280330ecd65c/rules"

### Go[](#delete-a-firewall-rule-go)

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
    
        ruleRequest := &godo.FirewallRulesRequest{
            InboundRules: []godo.InboundRule{
                {
                    Protocol:      'tcp',
                    PortRange:     '3306',
                    Sources: &godo.Sources{
                        DropletIDs: []int{49696269},
                    },
                },
            },
            OutboundRules: []godo.OutboundRule{
                {
                    Protocol:      'tcp',
                    PortRange:     '3306',
                    Destinations: &godo.Destinations{
                        DropletIDs: []int{49696269},
                    },
                },
            },
        }
    
        _, err := c.Firewalls.RemoveRules(ctx, 'bb4b2611-3d72-467b-8602-280330ecd65c', ruleRequest)
    
    }

### Ruby[](#delete-a-firewall-rule-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    inbound_rule = DropletKit::FirewallInboundRule.new(
      protocol: 'tcp',
      ports: '3306',
      sources: {
        droplet_ids: [49696269]
      }
    )
    
    outbound_rule = DropletKit::FirewallOutboundRule.new(
      protocol: 'tcp',
      ports: '3306',
      destinations: {
        droplet_ids: [49696269]
      }
    )
    
    client.firewalls.remove_rules(inbound_rules: [inbound_rule], outbound_rules: [outbound_rule], id: 'bb4b2611-3d72-467b-8602-280330ecd65c')

### Python[](#delete-a-firewall-rule-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "inbound_rules": [
        {
          "protocol": "tcp",
          "ports": "3306",
          "sources": {
            "droplet_ids": [
              49696269
            ]
          }
        }
      ],
      "outbound_rules": [
        {
          "protocol": "tcp",
          "ports": "3306",
          "destinations": {
            "droplet_ids": [
              49696269
            ]
          }
        }
      ]
    }
    
    resp = client.firewalls.delete_rules(firewall_id="39fa4gz", body=req)

## Add or Remove Rules from a Firewall Using the Control Panel[](#add-or-remove-rules-from-a-firewall-using-the-control-panel)

To manage a firewall’s rules, navigate from **Networking** to **Firewalls**. Click the firewall’s name to go to its **Rules** tab. From here, you can [create new rules](#create-new-rules) and [edit or delete existing rules](#edit-or-delete-rules).

Note

When more than one firewall is applied to a Droplet, the rules are additive and cannot be restricted again with other rules.

### Create New Rules[](#create-new-rules)

You can create new inbound and outbound rules by opening the **New rule** select list under **Inbound Rules** or **Outbound Rules**, respectively. You can use a preset protocol or create a custom rule.

Note

You can only define firewall rules to restrict traffic to and from ports based on connection types, sources, and destinations. You cannot define a rule to restrict traffic based on HTTP headers, such as `X-Forwarded-For`, `Content-Type`, or `User-Agent`.

### From Presets[](#from-presets)

There are several common protocols available which fills the **Protocol** and **Port Range** fields automatically. For example, selecting `HTTP` auto-fills the **Protocol** with `TCP` and the **Port Range** with HTTP’s default of port 80.

![Type drop-down list with the following options: SSH, HTTP, HTTPS, MySQL, DNS TCP, DNS UDP, All TCP, ALL UDP, ICMP, Custom](https://docs.digitalocean.com/screenshots/firewalls/inbound-rule-types.1b7ced2a47cca85756d9682546bf75a43ce4d4e5a59ff9c39133e8cfcd188bbd.png)

If one of these services is listening on a non-standard port, you can configure it by creating a custom rule.

### Custom Rules[](#custom-rules)

To add a custom rule, choose **Custom**, which allows you to define the protocol, port range, and source or destination.

![Custom rule with multiple inbound sources](https://docs.digitalocean.com/screenshots/firewalls/firewall-custom-rule.54addf92e2c1040a045b262ea6992f158b4edd40aa39978de03f3b6512827369.png)

For a custom rule, specify the:

*   **Protocol**. You can choose either TCP or UDP. Because ICMP has no port abstraction, to allow ICMP traffic, you select it directly from the **New rule** drop-down.
    
*   **Port Range**. For the TCP and UDP protocols, you can specify:
    
    *   A **single port**.
    *   A **range of ports** by entering the starting and ending ports separated by a dash `-` with no spaces, such as `3000-4000`. To open multiple non-sequential ports, create a separate rule for each.
    *   **All ports** by leaving the field blank.
*   **Sources** for inbound rules, which lets you restrict the source of incoming connections. You can restrict incoming connections to:
    
    *   **Resources or tags** by entering the name of the resource or tag. This includes Droplets, VPCs, Kubernetes clusters, [resource tags](/products/droplets/#tags), load balancers, and IPv4/IPv6 addresses.
    *   **IP addresses or IP ranges** by entering individual IP addresses or entering a CIDR. For example, enter the CIDR 10.128.0.0/16 to a rule allows incoming traffic from any IP address between the 10.128.0.0 and 10.128.255.255. The same properties applies to IPv6 addresses and CIDRs.
    *   **Types of IP addresses** by choosing **All IPv4** or **All IPv6** in the sources field. This allows all IP addresses of a specific type (either all IPv4 addresses or all IPv6 addresses) to connect to the Droplet. If you are [using the API](/reference/api/digitalocean/#operation/firewalls_add_rules), enter `0.0.0.0/0` (IPv4) or `::/0` (IPv6) into the `addresses` field of the `sources` object to allow incoming traffic from a specific type of IP address.
*   **Destinations** for outbound rules, which lets you restrict the destination of outgoing connections.
    
    You can limit the sources/destinations to:
    
    *   Droplets, chosen by name, IP address, or tag
    *   DigitalOcean Load Balancers, chosen by name, IP address, or tag
    *   DigitalOcean Kubernetes clusters, chosen by name, or tag
    *   Non-DigitalOcean servers by [IP addresses, subnets, or CIDR ranges](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking).

### Edit or Delete Rules[](#edit-or-delete-rules)

To edit or delete a rule, open the rule’s **More** menu:

![Firewall rule with more menu open and edit and delete rule options visible](https://docs.digitalocean.com/screenshots/firewalls/rule-more-menu.12d5eab0c9460194aca707646a3a715a9a0521fd731480f8c1b942dfd3cbcfe2.png)

Choose **Edit Rule** or **Delete Rule**. When you select **Delete Rule**, the rule is deleted immediately without an additional confirmation prompt.

In this article...

*   [Add, Update, or Remove Rules from a Firewall Using the CLI](#add-update-or-remove-rules-from-a-firewall-using-the-cli)
*   [Add, Update, or Remove Rules from a Firewall Using the API](#add-update-or-remove-rules-from-a-firewall-using-the-api)
*   [Add or Remove Rules from a Firewall Using the Control Panel](#add-or-remove-rules-from-a-firewall-using-the-control-panel)
    *   [Create New Rules](#create-new-rules)
    *   [From Presets](#from-presets)
    *   [Custom Rules](#custom-rules)
    *   [Edit or Delete Rules](#edit-or-delete-rules)

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

Try using different keywords or simpli