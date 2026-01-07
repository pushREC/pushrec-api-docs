---
source: https://docs.digitalocean.com/products/droplets/how-to/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
omains and DNS | DigitalOcean Documentation

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

*   Domains and DNS

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Domains and DNS

Generated on 6 Jan 2026

Adding a domain you own to your DigitalOcean account lets you manage the domain’s DNS records with the control panel and API. Domains you manage on DigitalOcean integrate with DigitalOcean Load Balancers and Spaces to streamline automatic SSL certificate management.

Most Viewed Domains and DNS Articles

1.  [Point to DigitalOcean Name Servers From Common Domain Registrars](/products/networking/dns/getting-started/dns-registrars/ "Instructions on how to set up DNS records with various registrars.")
2.  [How to Add Domains](/products/networking/dns/how-to/add-domains/ "Add a domain to your DigitalOcean account to manage its DNS records from the control panel and API.")
3.  [How to Create, Edit, and Delete DNS Records](/products/networking/dns/how-to/manage-records/ "Create and configure DNS records for domains managed on DigitalOcean.")
4.  [How to Add a Subdomain to Your Domain](/products/networking/dns/how-to/add-subdomain/ "A guide to setting up additional hostnames and verifying them using the Community DNS Lookup tool")
5.  [DNS Pricing](/products/networking/dns/details/pricing/)
6.  [DNS Quickstart](/products/networking/dns/getting-started/quickstart/ "Just the essentials to go from zero to working in a few minutes.")
7.  [How do I debug my Droplet's network configuration?](/support/how-do-i-debug-my-droplets-network-configuration/ "To debug your network configuration, verify the Droplet's network interfaces and check its network configuration file.")
8.  [Why does my domain fail to resolve?](/support/why-does-my-domain-fail-to-resolve/ "A domain could fail to resolve because the name server changes did not completely propagate, `DNSSEC` or the domain registrar needs verification, the DigitalOcean name servers are not configured at your registrar, or there are different name server providers active.")
9.  [I can't delete my domain because of an associated Let's Encrypt certificate](/support/i-cant-delete-my-domain-because-of-an-associated-lets-encrypt-certificate/ "Delete the Let's Encrypt certificate associated with the domain in your account's Settings section.")
10.  [How to Delete Domains](/products/networking/dns/how-to/delete-domains/ "Remove domains and their records from your account to stop managing their DNS records on DigitalOcean.")

[](/products/networking/dns/getting-started/)

![](https://docs.digitalocean.com/images/icons/dns.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/networking/dns/how-to/)

![](https://docs.digitalocean.com/images/icons/dns.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/networking/dns/reference/)

![](https://docs.digitalocean.com/images/icons/dns.svg)

Reference

API and CLI reference documentation for the domains and DNS, including example requests and available parameters, and other DNS tools.

[](/products/networking/dns/concepts/)

![](https://docs.digitalocean.com/images/icons/dns.svg)

Concepts

Explanations and definitions of core concepts in DNS.

[](/products/networking/dns/details/)

![](https://docs.digitalocean.com/images/icons/dns.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

[](/products/networking/dns/support/)

![](https://docs.digitalocean.com/images/icons/dns.svg)

Support

Get help with technical support and answers to frequently asked questions.

## Latest Updates[](#latest-updates)

### 5 June 2023[](#5-june-2023)

*   The [Domains and DNS management service](/products/networking/dns/) now only allows you to add domains with known top-level domains (TLDs) [publicly recognized by ICANN](https://publicsuffix.org/list/public_suffix_list.dat).
    

For more information, see [all Domains and DNS release notes](https://docs.digitalocean.com/release-notes/dns/).

In this article...

[Domains and DNS](https://docs.digitalocean.com/products/networking/dns/)

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
