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
source_url: https://docs.digitalocean.com/products/networking/firewalls/how-to/create/
domain: docs.digitalocean.com
---
                How to Create Firewalls | DigitalOcean Documentation

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
*   Create Firewalls

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create Firewalls

Validated on 1 Jun 2023 • Last edited on 17 Apr 2025

DigitalOcean Cloud Firewalls are a network-based, stateful firewall service for Droplets provided at no additional cost. Cloud firewalls block all traffic that isn’t expressly permitted by a rule.

## Create a Firewall Using the CLI[](#create-a-firewall-using-the-cli)

You can provide the `--droplet-ids` flag a list of Droplet IDs to automatically assign existing Droplets to a firewall during its creation. To retrieve a list of Droplets and their IDs, use the `doctl compute droplet list` command.

How to Create a Firewall Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute firewall create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/firewall/create/) for more details:
    
        doctl compute firewall create [flags]
    
    The following example creates a cloud firewall named `example-firewall` that contains an inbound rule and an outbound rule and applies them to the specified Droplets:
    
        doctl compute firewall create --name "example-firewall" --inbound-rules "protocol:tcp,ports:22,droplet_id:386734086" --outbound-rules "protocol:tcp,ports:22,address:0.0.0.0/0" --droplet-ids "386734086,391669331" --tag-names "frontend,backend,k8s:f81d4fae-7dec-11d0-a765-00a0c91e6bf6"
    

## Create a Firewall Using the API[](#create-a-firewall-using-the-api)

You can provide the `droplet_ids` field with an array of Droplet IDs to automatically assign existing Droplets to a firewall during its creation. To retrieve a list of Droplets and their IDs, use the [`/v2/droplets` endpoint](/reference/api/digitalocean/#operation/droplets_list).

How to Create a Firewall Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/firewalls`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/firewalls_create).

### cURL[](#create-a-firewall-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name":"firewall","inbound_rules":[{"protocol":"tcp","ports":"80","sources":{"load_balancer_uids": ["4de7ac8b-495b-4884-9a69-1050c6793cd6"]}},{"protocol": "tcp","ports": "22","sources":{"tags": ["gateway"],"addresses": ["18.0.0.0/8"]}}],"outbound_rules":[{"protocol":"tcp","ports":"80","destinations":{"addresses":["0.0.0.0/0","::/0"]}}],"droplet_ids":[8043964]}' \
      "https://api.digitalocean.com/v2/firewalls"

### Go[](#create-a-firewall-go)

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
    
        createRequest := &godo.FirewallRequest{
            Name: 'firewall',
            InboundRules: []godo.InboundRule{
                {
                    Protocol: 'tcp',
                    PortRange: '80',
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
                    PortRange: '80',
                    Destinations: &godo.Destinations{
                        Addresses: []string{'0.0.0.0/0', '::/0'},
                    },
                },
            },
            DropletIDs: []int{8043964},
        }
    
        firewall, req, err := client.Firewalls.Create(ctx, createRequest)
    }

### Ruby[](#create-a-firewall-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    firewall = DropletKit::Firewall.new(
      name: 'firewall',
      inbound_rules: [
        DropletKit::FirewallInboundRule.new(
          protocol: 'tcp',
          ports: '80',
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
          ports: '80',
          destinations: {
            addresses: ['0.0.0.0/0', '::/0'],
          }
        )
      ],
      droplet_ids: [8043964]
    )
    
    client.firewalls.create(firewall)

### Python[](#create-a-firewall-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "firewall",
      "inbound_rules": [
        {
          "protocol": "tcp",
          "ports": "80",
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
          "ports": "80",
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
      ]
    }
    
    resp = client.firewalls.create(body=req)

## Create a Firewall Using the Control Panel[](#create-a-firewall-using-the-control-panel)

You can create a firewall at any time from the [control panel](https://cloud.digitalocean.com) by opening the **Create** menu in the upper-right and choosing **Cloud Firewalls**.

![Create menu](https://docs.digitalocean.com/screenshots/create.88f76a2e0fbab47d46467cfdb31a9a9396d289032523120cfbdf1b695f0aac34.png)

On the creation form, choose a name for your firewall in the **Name** field and then define at least one rule.

When you first create a cloud firewall, there are four inbound and outbound rules defined by default that allow some fundamental traffic. You can [keep, modify, or delete these rules, and create new ones](/products/networking/firewalls/how-to/configure-rules/).

### Default Inbound Rule: SSH[](#default-inbound-rule-ssh)

Because the compromise of a server typically begins over an inbound connection, the default inbound connections remain entirely restricted with one exception. The suggested rule allows SSH connections on port 22 from anywhere so that users can to administer the server from a terminal.

![The inbound rules section of the cloud firewall create page](https://docs.digitalocean.com/screenshots/firewalls/create/inbound-rules.9fecadc141f7ce8315d597ea2bd66488fb21cb3ef7ea16085ffde5da6e0f53cb.png)

### Default Outbound Rules: Permit All Traffic[](#default-outbound-rules-permit-all-traffic)

Many fundamental services rely on outbound communication. Utilities like `ping` require outbound ICMP. DNS lookups, VoIP and NTP all rely on outbound UDP. Tasks like data synchronization, package list updates, web requests and email require outbound TCP connections.

Because of this, the suggested outbound rules permit all traffic to any destination on any port. These defaults make it easier to set up a new server without introducing restrictions that could block expected functionality.

![The outbound rules section of the cloud firewall create page](https://docs.digitalocean.com/screenshots/firewalls/create/outbound-rules.7e40056b0274d5df297fe2a6a9a5505d5735b0c7b61963dccdc7ee0c2f0b5d45.png)

### Apply to Droplets[](#apply-to-droplets)

After configuring the firewall’s rules, apply the firewall to the Droplets you want to secure using the **Apply to Droplets** field. You can also leave this field blank and assign Droplets later.

In the **Apply to Droplets** field, type the name of a Droplet or resource tag into the field. A drop-down populates with a applicable resources. Choose Droplets by name, tag, or a combination of both. You can also search for Droplets by IP address.

![The apply to Droplets section of the cloud firewall create page](https://docs.digitalocean.com/screenshots/firewalls/create/apply-to-droplets.e5ead2536d8342e20a23dfafac6aa27a8b86472be125f8ed90ba61c680245ff8.png)

There are [limits on the number of Droplets and tags that can be added to a firewall](/products/networking/firewalls/#limits), but there are no limits to the number of Droplets that can be associated with a tag. Using tags allows you to exceed the individual Droplet limit for firewalls. You can also tag a Droplet when you create it, which means you can apply firewall rules immediately.

Droplets can be protected by more than one cloud firewall. When they are, a union of the rules is applied. For example, if one rule allows TCP from any source and another allows TCP from a restricted range, the union of the two means that TCP traffic is allowed from anywhere.

### Create the Firewall[](#create-the-firewall)

Once you’ve defined the firewall’s rules and added Droplets to it, click **Create Firewall**.

After you’ve created a firewall, you can manage its rules and the resources that it protects from the **Firewalls** tab in the **Networking** section of the control panel.

In this article...

*   [Create a Firewall Using the CLI](#create-a-firewall-using-the-cli)
*   [Create a Firewall Using the API](#create-a-firewall-using-the-api)
*   [Create a Firewall Using the Control Panel](#create-a-firewall-using-the-control-panel)
    *   [Default Inbound Rule: SSH](#default-inbound-rule-ssh)
    *   [Default Outbound Rules: Permit All Traffic](#default-outbound-rules-permit-all-traffic)
    *   [Apply to Droplets](#apply-to-droplets)
    *   [Create the Firewall](#create-the-firewall)

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