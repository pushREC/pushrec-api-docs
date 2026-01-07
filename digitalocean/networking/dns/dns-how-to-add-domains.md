---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - dns
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/dns/how-to/add-domains/
domain: docs.digitalocean.com
---
                How to Add Domains | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/dns.cb34d0653affb99d6826d0a3c70bdb8311ae7f51ca44810ae41cb1deb2e03a71.svg)Domains and DNS](/products/networking/dns/)
*   [Getting Started](/products/networking/dns/getting-started/)
    *   [Quickstart](/products/networking/dns/getting-started/quickstart/)
    *   [Use DO Name Servers](/products/networking/dns/getting-started/dns-registrars/)
*   [How-Tos](/products/networking/dns/how-to/)
    *   [Add Domains](/products/networking/dns/how-to/add-domains/)
    *   [Manage DNS Records](/products/networking/dns/how-to/manage-records/)
    *   [Manage CAA Records](/products/networking/dns/how-to/create-caa-records/)
    *   [Delete Domains](/products/networking/dns/how-to/delete-domains/)
    *   [Add Subdomains](/products/networking/dns/how-to/add-subdomain/)
    *   [Download Zone Files](/products/networking/dns/how-to/download-zone-file/)
*   [Reference](/products/networking/dns/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Domains)
    *   [CLI Reference](/reference/doctl/reference/compute/domain/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/dns/concepts/)
*   [Details](/products/networking/dns/details/)
    *   [Features](/products/networking/dns/details/features/)
    *   [Pricing](/products/networking/dns/details/pricing/)
    *   [Availability](/products/networking/dns/details/availability/)
    *   [Limits](/products/networking/dns/details/limits/)
*   [Support](/products/networking/dns/support/)

*   [How-Tos](/products/networking/dns/how-to/) 
*   Add Domains

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Add Domains

Validated on 12 Aug 2024 • Last edited on 18 Dec 2025

Adding a domain you own to your DigitalOcean account lets you manage the domain’s DNS records with the control panel and API. Domains you manage on DigitalOcean integrate with DigitalOcean Load Balancers and Spaces to streamline automatic SSL certificate management.

Adding a domain to your project allows you to assign the domain to Droplets, load balancers, and other resources. You can only add domains with known top-level domains (TLDs) [publicly recognized by ICANN](https://publicsuffix.org/list/public_suffix_list.dat).

Before adding your domain to DigitalOcean, [delegate the domain to DigitalOcean’s name servers](/products/networking/dns/getting-started/dns-registrars/).

## Add a Domain Using Automation[](#add-a-domain-using-automation)

How to Add a Domain Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute domain create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/domain/create/) for more details:
    
        doctl compute domain create <domain> [flags]
    
    The following command creates a domain named example.com and adds an A record to the domain:
    
        doctl compute domain create example.com --ip-address 198.51.100.215
    

How to Add a Domain Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/domains`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/domains_create).

### cURL[](#add-a-domain-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name":"example.com","ip_address":"1.2.3.4"}' \
      "https://api.digitalocean.com/v2/domains"

### Go[](#add-a-domain-go)

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
    
      createRequest := &godo.DomainCreateRequest{
        Name:      "example.com",
        IPAddress: "1.2.3.4",
      }
    
      domain, _, err := client.Domains.Create(ctx, createRequest)
    
    }

### Ruby[](#add-a-domain-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    domain = DropletKit::Domain.new(
      name: 'example.com',
      ip_address: '1.2.3.4'
    )
    client.domains.create(domain)

### Python[](#add-a-domain-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "example.com"
    }
    
    resp = client.domains.create(body=req)

## Add a Domain Using the Control Panel[](#add-a-domain-using-the-control-panel)

To add a domain from the [control panel](https://cloud.digitalocean.com), open the **Create** menu and click **Domains/DNS**.

![Create menu](https://docs.digitalocean.com/screenshots/create.88f76a2e0fbab47d46467cfdb31a9a9396d289032523120cfbdf1b695f0aac34.png)

This brings you to the **Networking** section’s **Domains** tab. Click **Add a domain**, enter your domain into the **Domain** field, then click **Add Domain**. If your domain contains non-ASCII characters (such as accents or other Unicode characters), you must [convert it to Punycode](https://www.punycoder.com/) before adding it.

Note

DigitalOcean's terms of service prohibit adding country code top-level domains (ccTLDs) from OFAC-sanctioned countries. For more information, including a list of countries, see section 5.7 of our **Rules of Conduct** in [our terms of service](https://www.digitalocean.com/legal/terms-of-service-agreement/).

The system performs a DNS lookup to see if the domain has already been added to DigitalOcean. If it has, you receive a message that says **Data domain `example.com`: Name already exists**. If the domain has not been previously added to DigitalOcean’s DNS service, it is added to your team’s domains.

![Domain records page with example records.](https://docs.digitalocean.com/screenshots/dns/overview.05d1664bbd03e9a3cdc7b7088baf8c5d22ce25063015dd6e8ed1dc7e708d17ce.png)

Once you’ve added the domain the **Domain records** interface loads. On this page you can see existing records and [Create new records](/products/networking/dns/how-to/manage-records/). From here, you can add DNS records like A, AAAA, CNAME, MX, NS, SRV, and TXT records. For a complete list of supported records, see [Supported Record Types](/products/networking/dns/how-to/manage-records/#supported-record-types).

![Domains page under Networking with an example domain.](https://docs.digitalocean.com/screenshots/dns/domain-overview.48a57555dceb9ecb3859d16104aa41b041926807cefd18d09fbda3b7bdc0dbda.png)

In this article...

*   [Add a Domain Using Automation](#add-a-domain-using-automation)
*   [Add a Domain Using the Control Panel](#add-a-domain-using-the-control-panel)

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

Try using different keywords or simplifying you