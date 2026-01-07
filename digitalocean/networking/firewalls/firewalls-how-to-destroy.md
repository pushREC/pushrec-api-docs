---
source: '[unknown - firewalls-how-to-destroy.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Destroy Firewalls | DigitalOcean Documentation

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
*   Destroy Firewalls

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Destroy Firewalls

Validated on 1 Jun 2023 • Last edited on 17 Apr 2025

DigitalOcean Cloud Firewalls are a network-based, stateful firewall service for Droplets provided at no additional cost. Cloud firewalls block all traffic that isn’t expressly permitted by a rule.

## Destroy a Firewall Using the CLI[](#destroy-a-firewall-using-the-cli)

The destroy command requires the firewall’s ID to be destroyed. To retrieve a list of firewalls and their IDs, use the `doctl compute firewall list` command.

How to Destroy a Firewall Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute firewall delete`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/firewall/delete/) for more details:
    
        doctl compute firewall delete <firewall-id>... [flags]
    
    The following example deletes a cloud firewall with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`:
    
        doctl compute firewall delete f81d4fae-7dec-11d0-a765-00a0c91e6bf6
    

## Destroy a Firewall Using the API[](#destroy-a-firewall-using-the-api)

The destroy call requires the firewall’s ID to be destroyed. To retrieve a list of firewalls and their IDs, use the [`/v2/firewalls` firewalls endpoint](/reference/api/digitalocean/#operation/firewalls_list).

How to Destroy a Firewall Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a DELETE request to [`https://api.digitalocean.com/v2/firewalls/{firewall_id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/firewalls_delete).

### cURL[](#destroy-a-firewall-curl)

Using cURL:

    curl -X DELETE \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/firewalls/bb4b2611-3d72-467b-8602-280330ecd65c"

### Go[](#destroy-a-firewall-go)

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
    
        _, err := client.Firewalls.Delete(ctx, 'bb4b2611-3d72-467b-8602-280330ecd65c')
    }

### Ruby[](#destroy-a-firewall-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    client.firewalls.delete(id: 'bb4b2611-3d72-467b-8602-280330ecd65c')

### Python[](#destroy-a-firewall-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    resp = client.firewalls.delete(firewall_id= "as9di9d")

## Destroy a Firewall Using the Control Panel[](#destroy-a-firewall-using-the-control-panel)

To destroy a firewall, from the **Networking** section of the [control panel](https://cloud.digitalocean.com), click the **Firewalls** tab. Open the **More** menu of the firewall you want to destroy and click **Destroy**.

![Firewall with more menu open and Destroy option visible](https://docs.digitalocean.com/screenshots/firewalls/more-menu.7e3f86a7b7cd46500183d5d46b8f5bb7499b7a847c7f3085862ccf416ce155d3.png)

In the **Destroy Firewall** window that opens, click **Confirm** to destroy the firewall. Destroying a firewall does not destroy the Droplets that were associated with it.

In this article...

*   [Destroy a Firewall Using the CLI](#destroy-a-firewall-using-the-cli)
*   [Destroy a Firewall Using the API](#destroy-a-firewall-using-the-api)
*   [Destroy a Firewall Using the Control Panel](#destroy-a-firewall-using-the-control-panel)

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