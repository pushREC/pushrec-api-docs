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
source_url: https://docs.digitalocean.com/products/networking/dns/reference/
domain: docs.digitalocean.com
---
                DNS Reference | DigitalOcean Documentation

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

*   Reference

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DNS Reference

Validated on 19 Jun 2018 • Last edited on 11 Dec 2025

Adding a domain you own to your DigitalOcean account lets you manage the domain’s DNS records with the control panel and API. Domains you manage on DigitalOcean integrate with DigitalOcean Load Balancers and Spaces to streamline automatic SSL certificate management.

The [DigitalOcean API](/reference/) lets you manage resources programmatically with standard HTTP requests. All actions available in the control panel are also available through the API.

[`doctl`](https://github.com/digitalocean/doctl) is the command-line interface for the DigitalOcean API. It supports most of the same actions available in the API and DigitalOcean Control Panel.

The [DigitalOcean Model Context Protocol (MCP) server](/reference/mcp/) lets you use natural language prompts to interact with DigitalOcean Networking services to manage resources. All operations use argument-based input, and no resource URIs are used. These tools enable full automation and management of networking resources and configurations.

[`doctl`](https://github.com/digitalocean/doctl) supports managing domains and DNS records from the command line. See the [`doctl` documentation](/reference/doctl/reference/compute/domain/) or use `doctl compute domain --help` for more information.

[](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Domains)

![](https://docs.digitalocean.com/images/icons/default.svg)

DigitalOcean DNS API Reference

Use the DigitalOcean API to create, configure, list, and delete VPCs.

[](/reference/doctl/reference/compute/domain/)

![](https://docs.digitalocean.com/images/icons/default.svg)

doctl compute domain

Use the subcommands of `doctl compute domain` to manage domains you have purchased from a domain name registrar that you are managing through the DigitalOcean DNS interface.

[](/reference/mcp/)

![](https://docs.digitalocean.com/images/icons/mcp.svg)

DigitalOcean MCP Servers

MCP tools for managing DigitalOcean networking features.

## Other DigitalOcean Tools[](#other-digitalocean-tools)

[](https://www.digitalocean.com/community/tools/dns)

![](https://docs.digitalocean.com/images/icons/community.svg)

DNS Lookup

A simple browser-based tool to perform DNS lookups. Type a domain, search, and instantly get results.

digitalocean.com/community

[](https://www.digitalocean.com/community/tools/spf)

![](https://docs.digitalocean.com/images/icons/community.svg)

SPF Explainer

A tool that explains a domain’s SPF records. Search a domain and either explore its records or evaluate an IP for mail sending.

digitalocean.com/community

In this article...

*   [Other DigitalOcean Tools](#other-digitalocean-tools)

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