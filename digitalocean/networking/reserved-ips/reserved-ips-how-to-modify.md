---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - reserved-ips
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/reserved-ips/how-to/modify/
domain: docs.digitalocean.com
---
                How to Reassign or Unassign Reserved IPs | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/reserved-ips.c9c9b721d99d9592de022671f4dd4b27147dea7162dbfa52ee239edccf9d612f.svg)Reserved IPs](/products/networking/reserved-ips/)
*   [Getting Started](/products/networking/reserved-ips/getting-started/)
    *   [Quickstart](/products/networking/reserved-ips/getting-started/quickstart/)
*   [How-Tos](/products/networking/reserved-ips/how-to/)
    *   [Create Reserved IPs](/products/networking/reserved-ips/how-to/create/)
    *   [Delete Reserved IPs](/products/networking/reserved-ips/how-to/delete/)
    *   [Reassign Reserved IPs](/products/networking/reserved-ips/how-to/modify/)
    *   [Manually Enable Reserved IPs](/products/networking/reserved-ips/how-to/manually-enable/)
    *   [Find Droplet Anchor IPs](/products/networking/reserved-ips/how-to/find-anchor-ips/)
    *   [Send Outbound Traffic](/products/networking/reserved-ips/how-to/outbound-traffic/)
    *   [Provision BYOIP](/products/networking/reserved-ips/how-to/provision-byoip/)
    *   [Deprovision BYOIP](/products/networking/reserved-ips/how-to/deprovision-byoip/)
    *   [Manage BYOIP Advertisement](/products/networking/reserved-ips/how-to/pause-byoip/)
    *   [Assign BYOIP IPs](/products/networking/reserved-ips/how-to/assign-byoip-ip/)
    *   [Modify BYOIP IPs](/products/networking/reserved-ips/how-to/modify-byoip-ip/)
*   [Reference](/products/networking/reserved-ips/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Floating-IPs)
    *   [CLI Reference](/reference/doctl/reference/compute/reserved-ip/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/reserved-ips/concepts/)
    *   [Glossary](/glossary/reserved-ips/)
*   [Details](/products/networking/reserved-ips/details/)
    *   [Features](/products/networking/reserved-ips/details/features/)
    *   [Pricing](/products/networking/reserved-ips/details/pricing/)
    *   [Availability](/products/networking/reserved-ips/details/availability/)
    *   [Limits](/products/networking/reserved-ips/details/limits/)
*   [Support](/products/networking/reserved-ips/support/)

*   [How-Tos](/products/networking/reserved-ips/how-to/) 
*   Reassign Reserved IPs

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Reassign or Unassign Reserved IPs

Validated on 17 Jun 2025 • Last edited on 10 Dec 2025

DigitalOcean Reserved IPs are publicly-accessible static IPv4 and IPv6 addresses. Assign and reassign reserved IP addresses to Droplets as needed, or implement an automated failover mechanism with reserved IPs to build a high availability infrastructure.

You can reassign a reserved IP to point it at a different Droplet. You can also unassign it from a Droplet entirely.

Note

Assigned reserved IPv4 addresses are free, but unassigned reserved IPv4 addresses are not. [Learn more about reserved IP pricing](/products/networking/reserved-ips/details/pricing/).

## Reassign a Reserved IP Using Automation[](#reassign-a-reserved-ip-using-automation)

How to Reassign a Reserved IPv4 Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute reserved-ip-action assign`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/reserved-ip-action/assign/) for more details:
    
        doctl compute reserved-ip-action assign <reserved-ip> <droplet-id> [flags]
    
    The following example assigns the reserved IP address `203.0.113.25` to a Droplet with the ID `386734086`:
    
        doctl compute reserved-ip-action assign 203.0.113.25 386734086
    

How to Reassign a Reserved IPv4 Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/reserved_ips/{reserved_ip}/actions`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/reservedIPsActions_post).

### cURL[](#reassign-a-reserved-ipv4-curl)

Using cURL:

    # Assign a Reserved IP to a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"assign","droplet_id":8219222}' \
      "https://api.digitalocean.com/v2/reserved_ips/45.55.96.47/actions"
    
    # Unassign a Reserved IP
    # curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"unassign"}' \
      "https://api.digitalocean.com/v2/reserved_ips/45.55.96.47/actions"

### Go[](#reassign-a-reserved-ipv4-go)

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
    
      // Assign a Reserved IP to a Droplet
        action, _, err := client.ReservedIPActions.Assign(ctx, "45.55.96.47", 8219222)
    
      // Unassign a Reserved IP
      action, _, err := client.ReservedIPActions.Unassign(ctx, "45.55.96.47")  
    }

### Ruby[](#reassign-a-reserved-ipv4-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    # Assign a Reserved IP to a Droplet
    client.reserved_ip_actions.assign(ip: '45.55.96.47', droplet_id: 8219222)
    
    # Unassign a Reserved IP
    # client.reserved_ip_actions.unassign(ip: '45.55.96.47')

### Python[](#reassign-a-reserved-ipv4-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req={
      "type": "unassign"
    }
    
    resp = client.reserved_ips_actions.post(reserved_ip="49.32.13.21", body=req)

How to Reassign a Reserved IPv6 Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute reserved-ipv6 assign`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/reserved-ipv6/assign/) for more details:
    
        doctl compute reserved-ipv6 assign <reserved-ipv6> <droplet-id> [flags]
    
    The following example assigns the reserved IPv6 address `5a11:a:b0a7` to a Droplet with the ID `386734086`:
    
        doctl compute reserved-ipv6 assign 5a11:a:b0a7 386734086
    

How to Reassign a Reserved IPv6 Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/reserved_ipv6/{reserved_ip}/actions`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/%25!s\(%3Cnil%3E\)).

## Reassign a Reserved IP Using the Control Panel[](#reassign-a-reserved-ip-using-the-control-panel)

To reassign or unassign a reserved IP from the [control panel](https://cloud.digitalocean.com), click **Networking** in the main menu, then click **Reserved IPs**.

This page lists your reserved IPs and their assigned Droplets. Open the **More** menu of the reserved IP you want to reassign or unassign:

![Reserved IPs page listing IP addresses with associated Droplets and a More dropdown menu offering reassign, unassign, and delete options.](https://docs.digitalocean.com/screenshots/reserved-ips/assign-reserved-ip.e365e5a632472195d6c8a090d17fe4f959e2f0f21477a0a99574174560ffc3e0.png)

From the **More** menu, click **Unassign** to unassign the reserved IP entirely, or click **Reassign** and pick a new Droplet in the **Search for a Droplet** text box that opens. You can only reassign reserved IPs to Droplets in the same datacenter.

In this article...

*   [Reassign a Reserved IP Using Automation](#reassign-a-reserved-ip-using-automation)
*   [Reassign a Reserved IP Using the Control Panel](#reassign-a-reserved-ip-using-the-control-panel)

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

Try using different keywords or simplifying your search ter