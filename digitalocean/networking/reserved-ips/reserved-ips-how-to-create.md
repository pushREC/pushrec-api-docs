---
source: '[unknown - reserved-ips-how-to-create.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Create Reserved IPs | DigitalOcean Documentation

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
*   Create Reserved IPs

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create Reserved IPs

Validated on 17 Jun 2025 • Last edited on 10 Dec 2025

DigitalOcean Reserved IPs are publicly-accessible static IPv4 and IPv6 addresses. Assign and reassign reserved IP addresses to Droplets as needed, or implement an automated failover mechanism with reserved IPs to build a high availability infrastructure.

## Create a Reserved IP Using the CLI[](#create-a-reserved-ip-using-the-cli)

The Reserved IP creation command requires you to assign the IP address to a Droplet upon creation using the Droplet’s ID. You can retrieve a list of Droplets and their IDs using the `doctl compute droplet list` command.

How to Create a Reserved IPv4 Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute reserved-ip create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/reserved-ip/create/) for more details:
    
        doctl compute reserved-ip create [flags]
    
    The following example creates a reserved IP address in the `nyc1` region and assigns it to a Droplet with the ID `386734086`:
    
        doctl compute reserved-ip create --region nyc1 --droplet-id 386734086
    

How to Create a Reserved IPv6 Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute reserved-ipv6 create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/reserved-ipv6/create/) for more details:
    
        doctl compute reserved-ipv6 create [flags]
    
    The following example creates a reserved IPv6 address in the `nyc1` region:
    
        doctl compute reserved-ipv6 create --region nyc1
    

## Create a Reserved IP Using the API[](#create-a-reserved-ip-using-the-api)

The Reserved IP creation call requires you to assign the IP address to a Droplet upon creation using the Droplet’s ID. You can retrieve a list of Droplets and their IDs using the [`/v2/droplets` endpoint](/reference/api/digitalocean/#operation/droplets_list).

How to Create a Reserved IPv4 Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/reserved_ips`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/reservedIPs_create).

### cURL[](#create-a-reserved-ipv4-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"droplet_id": 123456}' \
      "https://api.digitalocean.com/v2/reserved_ips" 

### Go[](#create-a-reserved-ipv4-go)

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
    
      createRequest := &godo.ReservedIPCreateRequest{
          DropletID: 123456,
          Region:    "nyc3",
          ProjectID: "1234a77a-12cd-11ed-909f-43c99lbf6030",
      }
    
      reservedIP, _, err := client.ReservedIPs.Create(ctx, createRequest)
    }

### Ruby[](#create-a-reserved-ipv4-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    reserved_ip = DropletKit::ReservedIp.new(droplet_id: 123456)
    client.reserved_ips.create(reserved_ip) 

### Python[](#create-a-reserved-ipv4-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "droplet_id": 2457247
    }
    
    resp = client.reserved_ips.create(body=req)

How to Create a Reserved IPv6 Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/reserved_ipv6`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/reservedIPv6_create).

### cURL[](#create-a-reserved-ipv6-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"region_slug": "nyc3"}' \
      "https://api.digitalocean.com/v2/reserved_ipv6" 

### Go[](#create-a-reserved-ipv6-go)

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
    
        createRequest := &godo.ReservedIPV6CreateRequest{
            RegionSlug: "nyc3",
        }
    
        reservedIPV6, _, err := client.ReservedIPV6s.Create(ctx, createRequest)
    }

### Python[](#create-a-reserved-ipv6-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "region_slug": nyc3
    }
    
    resp = client.reserved_ipv6s.create(body=req)

## Create a Reserved IP Using the Control Panel[](#create-a-reserved-ip-using-the-control-panel)

To create a reserved IP from the [control panel](https://cloud.digitalocean.com), click **Create** in the top right, then click **Reserved IPs**.

![Create menu](https://docs.digitalocean.com/screenshots/create.88f76a2e0fbab47d46467cfdb31a9a9396d289032523120cfbdf1b695f0aac34.png)

This takes you to the **Reserved IPs** page. Click **Add a Reserved IP** to create one.

![Add Reserved IP window with options to choose IPv4 or IPv6, assign to a Droplet or reserve in a region, and a Droplet dropdown menu for selection.](https://docs.digitalocean.com/screenshots/reserved-ips/add-reserved-ip.ea6cfd95c1273371443d5c169099c803754d0c313ff4b0f2ccf4cd7af739da9f.png)

Select the IP address version to reserve, either IPv4 or IPv6.

Then, select where you would like to add the reserved IP address. You may either assign it to an existing Droplet, or reserve it for later use within a single datacenter region.

To assign a reserved IP to one of your Droplets, choose **Assign to Droplet**, then select the Droplet using the **Search for a Droplet** search box. Click **Add a Reserved IP to this Droplet** to finish.

To reserve an IP in a datacenter region, choose **Reserve in Datacenter Region**. Select the datacenter and project name, then click **Add an Unassigned Reserved IP**.

Note

When you assign a reserved IPv4 to a Droplet created before 20 October 2015, a window opens with instructions on [how to enable reserved IPs on older Droplets](/products/networking/reserved-ips/how-to/manually-enable/).

For reserved IPv6 addresses, all Droplets require manual configuration after the IPv6 address is assigned. See [Enable Reserved IPv6](/products/networking/reserved-ips/how-to/manually-enable/#enable-reserved-ipv6) for instructions.

In this article...

*   [Create a Reserved IP Using the CLI](#create-a-reserved-ip-using-the-cli)
*   [Create a Reserved IP Using the API](#create-a-reserved-ip-using-the-api)
*   [Create a Reserved IP Using the Control Panel](#create-a-reserved-ip-using-the-control-panel)

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

Try using different keywords or simplifying your search