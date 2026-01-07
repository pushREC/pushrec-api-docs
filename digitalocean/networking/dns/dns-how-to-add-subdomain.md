---
source: '[unknown - dns-how-to-add-subdomain.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Add a Subdomain to Your Domain | DigitalOcean Documentation

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
*   Add Subdomains

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Add a Subdomain to Your Domain

Validated on 12 Aug 2025 • Last edited on 2 Sep 2025

Adding a domain you own to your DigitalOcean account lets you manage the domain’s DNS records with the control panel and API. Domains you manage on DigitalOcean integrate with DigitalOcean Load Balancers and Spaces to streamline automatic SSL certificate management.

A subdomain is an additional hostname of a domain. Subdomains can point traffic to a specific IP address or other parts of a website. For example, a company could use the domain `example.com` to direct traffic to their website’s home page and use the hostname `support.example.com` to send traffic specifically to their support portal that resides on another service or server.

If you are setting up a new hostname that points to a different web directory on the same Droplet as your current domain name, follow this document’s instructions to set up your DNS record and then review these community tutorials for configuring your web server:

*   [How To Set Up Apache Virtual Hosts on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-20-04)
*   [How To Set Up Apache Virtual Hosts on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-centos-7)

## Create a New Hostname with an A Record[](#create-a-new-hostname-with-an-a-record)

To add the hostname from the control panel, click **Networking** in the main menu. In the **Domains** tab, click the domain name you want to add the new hostname to.

Click **Create a record**, then under **Record Type** select the type of record you want to add.

Enter the new hostname into the **Hostname** field. The characters entered into the **Hostname** field append to your domain name and a preview of the hostname’s full address appears below the **Hostname** field. If your hostname contains non-ASCII characters (such as accents or other Unicode characters), you must [convert it to Punycode](https://www.punycoder.com/) before adding it.

Enter the applicable data into the **Will direct to** field. Depending on the type of record, this can be an IP address, a Droplet, a mail server address, or other DNS record data. Set the **TTL** (time to live) value to your preferred value in seconds. We recommend a value between `3600` (1 hour) and `86400` (24 hours) for most records because this allows for caching while still refreshing records regularly.

Click **Create Record**. This creates the record at the new hostname.

You can verify the record was added by looking up the new hostname with DigitalOcean’s [DNS Lookup tool](https://www.digitalocean.com/community/tools/dns). Enter your new hostname into the search field, then click **Search**. The DNS Lookup tool returns the DNS records that reside at the new hostname.

It may take up to 48 hours for the new hostname to propagate across the internet.

You can also use BIND’s `dig` tool to look up the records for the new hostname from the command line:

    dig @ns1.digitalocean.com <your new hostname>`

`dig` returns DNS record information about your hostname. The newly created record is displayed in the **ANSWER SECTION**.

    ;; ANSWER SECTION:
    sub.example.com.		297	IN	A	203.0.113.83

In this article...

*   [Create a New Hostname with an A Record](#create-a-new-hostname-with-an-a-record)

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