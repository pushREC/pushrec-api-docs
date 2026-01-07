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
source_url: https://docs.digitalocean.com/products/networking/dns/getting-started/dns-registrars/
domain: docs.digitalocean.com
---
                Point to DigitalOcean Name Servers From Common Domain Registrars | DigitalOcean Documentation

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

*   [Getting Started](/products/networking/dns/getting-started/) 
*   Use DO Name Servers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Point to DigitalOcean Name Servers From Common Domain Registrars

Validated on 25 Apr 2024 • Last edited on 8 Jan 2025

Adding a domain you own to your DigitalOcean account lets you manage the domain’s DNS records with the control panel and API. Domains you manage on DigitalOcean integrate with DigitalOcean Load Balancers and Spaces to streamline automatic SSL certificate management.

To manage your domain’s DNS records using DigitalOcean’s DNS service, you must delegate the domain to use DigitalOcean’s name servers. You can do this by updating your domain’s delegation at its registrar (the website you purchased the domain from). DigitalOcean is not a domain registrar and doesn’t currently provide domain registration.

Services that allow you to purchase domains, such as [Namecheap](https://www.namecheap.com), are called _domain registrars_ and they offer the ability to manage your domain’s DNS records on their website or allow you manage your records other services, such as DigitalOcean. DNS records manage various functions of your domain but are most commonly used to map domains to servers that host websites. If you purchase a domain from a registrar and then set up a Droplet on DigitalOcean, you have two options on how to map the domain to the Droplet:

*   Manage the domain’s DNS records through the registrar’s web portal.
*   Delegate the domain to use DigitalOcean and then manage the domain’s records using DigitalOcean’s interfaces.

We recommend using DigitalOcean to manage your DNS records as this can make record management easier by consolidating your resources on a single platform where you can take advantage of DigitalOcean’s DNS configuration interface.

## Update Your Domain’s Delegation[](#update-your-domains-delegation)

If you decide to use DigitalOcean’s DNS service, you need to update which name servers your domain is using at your registrar. Name servers are the authoritative source of your domain’s records. This means that when someone types your domain into their web browser, the Domain Name System (DNS) queries your domain’s name servers for the latest DNS records. In this case, DigitalOcean’s name server’s become the authoritative source for your domain’s DNS records.

To update your domain’s delegation, you usually need to paste the following DigitalOcean name server addresses into a name server at the registrar:

*   `ns1.digitalocean.com`
*   `ns2.digitalocean.com`
*   `ns3.digitalocean.com`

While we cannot directly document this process at each registrar, we have collected a list of links to several popular registrar’s documentation on how to change your domain’s name servers. The process is similar across most registrars and is often called “using custom name servers”.

*   [Bluehost](https://www.bluehost.com/help/article/custom-nameservers#name-server)
*   [Domain.com](https://www.domain.com/help/article/domain-management-how-to-update-nameservers)
*   [DreamHost](https://help.dreamhost.com/hc/en-us/articles/360038897151-Changing-your-nameservers-at-DreamHost)
*   [Dynadot](https://www.dynadot.com/community/help/question/set-default-name-servers)
*   [Enom](https://help.enom.com/hc/en-us/articles/115000486451-Nameservers-NS)
*   [Gandi](https://docs.gandi.net/en/domain_names/common_operations/changing_nameservers.html)
*   [GoDaddy](https://www.godaddy.com/help/edit-my-domain-nameservers-664)
*   [HostGator](https://www.hostgator.com/help/article/how-do-i-change-my-dns-or-name-servers)
*   [Hover](https://help.hover.com/hc/en-us/articles/217282477--Changing-your-domain-nameservers)
*   [IONOS](https://www.ionos.com/help/domains/using-your-own-name-servers/using-your-own-name-servers-for-a-domain/)
*   [Name.com](https://www.name.com/support/articles/205934547-changing-nameservers-for-dns-management)
*   [Namecheap](https://www.namecheap.com/support/knowledgebase/article.aspx/767/10/how-to-change-dns-for-a-domain/)
*   [Porkbun](https://kb.porkbun.com/article/22-how-to-change-nameservers)
*   [Squarespace](https://support.squarespace.com/hc/en-us/articles/4404183898125-Nameservers-and-DNSSEC-for-Squarespace-managed-domains)

Once you have updated the domain’s name servers at your registrar, it may take between 30 minutes to several hours for the change to propagate across the internet. You can check to see if the changes have started taking effect by using our [DNS Lookup](https://www.digitalocean.com/community/tools/dns) tool. If your DNS has propagated correctly, the tool displays DigitalOcean’s name servers under the **NS Records** section.

Once your changes have propagated, you can begin [managing your domain’s records using DigitalOcean’s interface](/products/networking/dns/how-to/manage-records/).

In this article...

*   [Update Your Domain’s Delegation](#update-your-domains-delegation)

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

T