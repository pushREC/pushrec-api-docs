---
source: '[unknown - dns-support.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               DNS Support | DigitalOcean Documentation

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

*   Support

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DNS Support

Generated on 6 Jan 2026

Adding a domain you own to your DigitalOcean account lets you manage the domain’s DNS records with the control panel and API. Domains you manage on DigitalOcean integrate with DigitalOcean Load Balancers and Spaces to streamline automatic SSL certificate management.

[](/support/how-do-i-fix-the-error-record-is-managed-by-an-app-on-this-account-and-cannot-be-deleted/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the error "Record is managed by an App on this account, and cannot be deleted"?

Use the app’s Settings tab to remove domains associated with App Platform apps.

[](/support/why-arent-my-vanity-dns-name-servers-resolving/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why aren't my vanity DNS name servers resolving?

If you use vanity or branded DNS nameservers that delegate to DigitalOcean’s nameservers, you must update to new IP addresses.

[](/support/how-do-i-fix-the-dns-error-primary-name-server-not-listed-at-parent/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the DNS error "Primary Name Server Not Listed at Parent"?

Update your registrar to use DigitalOcean’s name servers.

[](/support/how-do-i-add-an-a-record-to-my-app-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I add an A record to my app on App Platform?

Apps do not have static IP addresses so you cannot point an A record at an app.

[](/support/does-digitalocean-support-dnssec/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Does DigitalOcean support DNSSEC?

No, we do not support DNSSEC.

[](/support/can-i-import-a-dns-zone/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Can I import a DNS zone?

You cannot import a DNS zone, but you can add the domain and manually create the DNS records.

[](/support/why-does-my-domain-fail-to-resolve/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why does my domain fail to resolve?

A domain could fail to resolve because the name server changes did not completely propagate, `DNSSEC` or the domain registrar needs verification, the DigitalOcean name servers are not configured at your registrar, or there are different name server providers active.

[](/support/how-do-i-add-a-domain-that-contains-special-characters/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I add a domain that contains special characters?

Use Punycode to add a non-ASCII domain name to DigitalOcean.

[](/support/how-do-i-transfer-a-domain-between-teams/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I transfer a domain between teams?

We do not support directly transferring domain ownership from one team to another. Instead, you can download a zone file with all of the domain’s DNS information.

[](/support/i-cant-delete-my-domain-because-of-an-associated-lets-encrypt-certificate/)

![](https://docs.digitalocean.com/images/icons/support.svg)

I can't delete my domain because of an associated Let's Encrypt certificate

Delete the Let’s Encrypt certificate associated with the domain in your account’s Settings section.

[](/support/how-do-i-debug-my-droplets-network-configuration/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I debug my Droplet's network configuration?

To debug your network configuration, verify the Droplet’s network interfaces and check its network configuration file.

[](/support/why-is-my-droplet-receiving-authoritative-answer-flag-errors/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why is my Droplet receiving Authoritative Answer flag errors?

Our DNS recursive servers now require Authoritative Answer flags when resolving host names.

In this article...

[DNS Support](https://docs.digitalocean.com/products/networking/dns/support/)

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

Try using different keywords or simplifying y