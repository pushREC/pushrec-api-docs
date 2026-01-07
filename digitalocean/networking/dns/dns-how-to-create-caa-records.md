---
source: '[unknown - dns-how-to-create-caa-records.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Manage CAA Records | DigitalOcean Documentation

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
*   Manage CAA Records

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Manage CAA Records

Validated on 12 Aug 2025 • Last edited on 18 Dec 2025

Adding a domain you own to your DigitalOcean account lets you manage the domain’s DNS records with the control panel and API. Domains you manage on DigitalOcean integrate with DigitalOcean Load Balancers and Spaces to streamline automatic SSL certificate management.

Certificate Authority Authorization (CAA) is a standard designed to prevent bad actors from creating unauthorized SSL/TLS certificates. CAA records specify which Certificate Authorities (CAs) can issue certificates for your domain.

Like other types of DNS records, CAA records can apply to an entire domain (like `example.com`) or to specific subdomains (like `assets.example.com`).

To allow multiple CAs to issue certificates, each requires its own record.

## Create a CAA Record[](#create-a-caa-record)

To create a CAA record from the [control panel](https://cloud.digitalocean.com), in the left menu, click **Networking** and then click the **Domains** tab. From the **Domains** tab, click the domain you want to add the record to. From the domain’s page click **Create a record** then under **Record Type** select **CAA**. The window updates with the fields you need to add CAA records.

In the **Hostname** field, enter the hostname you want the record to apply to, such as the root domain (`@`) or a subdomain like `www.example.com`. In the **TTL** field, enter the number of seconds that you would like DNS resolvers to cache the record for. We recommend a value between 3600 (1 hour) and 86400 (24 hours) for most records as this allows for caching while still refreshing records regularly.

Once you’ve entered those values, review the following sections to input values for the **Authority granted for**, **Tag**, and \*_Flags_ fields.

### Tags[](#tags)

Tags define the type of CAA record you are creating. There are three types of CAA records:

*   `issue` authorizes a single CA to issue any type of certificate for a specific hostname.
*   `issuewild` authorizes a single CA to issue wildcard certificates for a hostname. For example, if you set this tag for the hostname `example.com`, your CA can issue certificates for `example.com` and any potential subdomains, such as `support.example.com`.
*   `iodef` defines a URL or `mailto` URI where a CA can report policy violations. Each contact URL requires its own record.

Select a CAA record type from the **Tag** field. The tag value determines what value you can enter in to the **Authority granted for** field.

### Authority Granted For[](#authority-granted-for)

The **Authority granted for** field defines the CA or contact URL that corresponds to the selected tag value.

If you selected the `issue` or `issuewild` tag, enter the domain name of the CA you want to authorize, such as `letsencrypt.org`. If you selected the `iodef` tag, enter a URL or `mailto` URI to define where CAs should report policy violations, such as `mailto:[[email protected]](/cdn-cgi/l/email-protection)`.

### Flags[](#flags)

Flags are unsigned integers between 0 and 255. Currently this field is used to set an issuer critical flag, which specifies how a CA should behave when it encounters a tag it doesn’t understand. The default flag is `0`, which indicates that the record is non-critical and doesn’t require any special processing by CAs. However, if the flag is set to `128`, it indicates that the CAA record’s tag is critical, and any CA that does not understand the tag should not issue a certificate.

For most CAA records, this field can be set to `0`.

Once you’ve filled out all the fields, click **Create Record** to add the CAA record to your domain’s DNS configuration.

Note

DigitalOcean DNS does not support the following CAA standard features:

*   Blocking anyone from issuing certificates by sending a semicolon (`;`) as the value
*   Allowing name-value tags after the CA name, for example: `letsencrypt.org; abc=cde`

In this article...

*   [Create a CAA Record](#create-a-caa-record)
    *   [Tags](#tags)
    *   [Authority Granted For](#authority-granted-for)
    *   [Flags](#flags)

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

Try using different keywords or simplifyin