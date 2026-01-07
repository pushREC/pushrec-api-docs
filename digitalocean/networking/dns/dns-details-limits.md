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
source_url: https://docs.digitalocean.com/products/networking/dns/details/limits/
domain: docs.digitalocean.com
---
                DNS Limits | DigitalOcean Documentation

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

*   [Details](/products/networking/dns/details/) 
*   Limits

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DNS Limits

Validated on 19 Jun 2018 • Last edited on 2 Sep 2025

Adding a domain you own to your DigitalOcean account lets you manage the domain’s DNS records with the control panel and API. Domains you manage on DigitalOcean integrate with DigitalOcean Load Balancers and Spaces to streamline automatic SSL certificate management.

*   DigitalOcean does not currently provide domain registration services. To use DigitalOcean DNS, you need to register a domain name with a registrar and [update your domain’s NS records to point to DigitalOcean’s name servers](https://www.digitalocean.com/community/tutorials/how-to-point-to-digitalocean-nameservers-from-common-domain-registrars).
    
*   The number of domains you can add to your account depends on the limits set for your account. We use dynamic resource limits to protect our platform against bad actors. Currently, you can’t check your resource limit for domains, but you can [contact support](https://cloudsupport.digitalocean.com) if you reach the limit and need to increase it. We are working on features that allow you to review this limit in the control panel.
    
*   All DNS records require a minimum TTL value of 30 seconds.
    
*   DigitalOcean DNS does not support the following CAA standard features:
    
*   Blocking anyone from issuing certificates by sending a semicolon (`;`) as the value
    
*   Allowing name-value tags after the CA name, for example: `letsencrypt.org; abc=cde`
    
*   Records created at a hostname covered by a wildcard record stop wildcard resolution for that hostname. For example, if you have an A wildcard record at `*.example.com`, and you add an MX record at the hostname `email.example.com`, the A wildcard record is no longer served at `email.example.com`. However, you can still add an explicit A record to the hostname `email.example.com` if your use case requires it.
    
*   DigitalOcean DNS does not support [tags](/products/droplets/how-to/tag/).
    
*   When adding domains or DNS records containing non-ASCII characters (such as accents or other Unicode characters), you must first [convert them to Punycode](https://www.punycoder.com/).
    
*   DigitalOcean's terms of service prohibit adding country code top-level domains (ccTLDs) from OFAC-sanctioned countries. For more information, including a list of countries, see section 5.7 of our **Rules of Conduct** in [our terms of service](https://www.digitalocean.com/legal/terms-of-service-agreement/).
    
*   DigitalOcean DNS does not support the [creation of DNSSEC (DS) records](/support/does-digitalocean-support-dnssec/).
    
*   DigitalOcean’s name servers do not support domains with DNSSEC enabled.
    

In this article...

[DNS Limits](https://docs.digitalocean.com/products/networking/dns/details/limits/)

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