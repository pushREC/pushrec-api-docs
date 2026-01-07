---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - load-balancers
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/load-balancers/how-to/ssl-termination/
domain: docs.digitalocean.com
---
                How to Configure SSL Termination | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/load-balancers.1b5f8a9d40bf92d2798a187032a28a29572afdd5e74855e5b1c1d30dfffc07ed.svg)Load Balancers](/products/networking/load-balancers/)
*   [Getting Started](/products/networking/load-balancers/getting-started/)
    *   [Quickstart](/products/networking/load-balancers/getting-started/quickstart/)
    *   [Manage Load Balancers with doctl](/products/networking/load-balancers/getting-started/with-doctl/)
*   [How-Tos](/products/networking/load-balancers/how-to/)
    *   [Create Regional Load Balancers](/products/networking/load-balancers/how-to/create/)
    *   [Create Global Load Balancers](/products/networking/load-balancers/how-to/create-global-load-balancer/)
    *   [Manage Regional Load Balancers](/products/networking/load-balancers/how-to/manage/)
    *   [Manage Global Load Balancers](/products/networking/load-balancers/how-to/manage-global-load-balancers/)
    *   [Scale Regional Load Balancers](/products/networking/load-balancers/how-to/scale/)
    *   [Configure SSL Passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/)
    *   [Balance TCP Traffic](/products/networking/load-balancers/how-to/tcp/)
    *   [Configure Backend Droplets](/products/networking/load-balancers/how-to/configure-droplets-for-nlb/)
    *   [Destroy Load Balancers](/products/networking/load-balancers/how-to/destroy/)
    *   [Configure SSL Termination](/products/networking/load-balancers/how-to/ssl-termination/)
*   [Reference](/products/networking/load-balancers/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Load-Balancers)
    *   [CLI Reference](/reference/doctl/reference/compute/load-balancer/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/load-balancers/concepts/)
    *   [Best Practices](/products/networking/load-balancers/concepts/best-practices/)
    *   [Load Balancer Status](/products/networking/load-balancers/concepts/load-balancer-status/)
*   [Details](/products/networking/load-balancers/details/)
    *   [Features](/products/networking/load-balancers/details/features/)
    *   [Pricing](/products/networking/load-balancers/details/pricing/)
    *   [Availability](/products/networking/load-balancers/details/availability/)
    *   [Limits](/products/networking/load-balancers/details/limits/)
*   [Support](/products/networking/load-balancers/support/)

*   [How-Tos](/products/networking/load-balancers/how-to/) 
*   Configure SSL Termination

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Configure SSL Termination

Validated on 28 Oct 2019 • Last edited on 17 Jun 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

Note

This guide applies to regional load balancers for Droplets. To configure SSL termination for a load balancer for Kubernetes nodes, see our [reference on configuring DigitalOcean Kubernetes load balancers](/products/kubernetes/how-to/configure-load-balancers/#ssl-certificates).

When load balancing encrypted web traffic, there are two main configuration choices:

*   **[SSL termination](/products/networking/load-balancers/how-to/ssl-termination/)**, which decrypts SSL requests at the load balancer and sends them unencrypted to the backend via the Droplets’ private IP addresses.
    
    SSL termination places the slower and more CPU-intensive work of decryption on the load balancer and simplifies certificate management. Traffic between the load balancer and its Droplets is secured by routing over the [VPC network](/products/networking/vpc/). However, if you host multiple customer applications in a single account or team, data could be readable by others on the private network. We recommend separating customers by team or using SSL passthrough instead.
    
*   **[SSL passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/)**, which sends encrypted SSL requests directly to the backend, via the Droplets’ private IP addresses. This secures the traffic between the load balancers and the backend servers.
    
    SSL passthrough distributes the decryption load across the backend servers, but every server must have the certificate information. You also can’t add or modify HTTP headers, so you may lose the client’s IP address, port, and other information contained in the `X-forwarded-*` headers.
    

To configure SSL termination, you need to add an SSL termination rule and choose or create an SSL certificate to use.

If you [added your domain to DigitalOcean](/products/networking/dns/), you can use our Let’s Encrypt integration to create a fully managed SSL certificate. You can also manually upload a certificate if you don’t use DigitalOcean to manage your DNS, want to generate your own certificate, or have an existing certificate you want to upload.

Note

DigitalOcean Load Balancers only support TLS 1.2 and TLS 1.3 for incoming connections, and do not support downgrading incoming connections to TLS 1.0 or 1.1. The same limits apply to connections from load balancers to Droplets.

## Add the SSL Termination Rule[](#add-the-ssl-termination-rule)

From the [control panel](https://cloud.digitalocean.com), click **Networking** in the main menu, then click **Load Balancers**. Click the load balancer you want to modify, then click the **Settings** tab to go to its settings page.

![Load Balancer Settings page](https://docs.digitalocean.com/screenshots/load-balancers/settings.fddc0d8f993d1996c627c8af847a85c91ef7fb5a58d4704a234b5b2068641ecd.png)

In the **Forwarding Rules** section, click **Edit**. You see any existing forwarding rules and an option to add additional rules.

From the **New rule** drop-down, select **HTTPS** or **HTTP2**, which opens a new row of options. Fill in the fields to forward **HTTPS** or **HTTP2** traffic on port 443 on the load balancers to **HTTP** port 80 on the Droplets.

## Add an SSL Certificate[](#add-an-ssl-certificate)

Next, you need to add an SSL certificate. In the **Forwarding Rules** section, where you’re filling in the new rule, the **Certificate** drop-down displays any SSL certificates already uploaded to your account.

![The Certificate drop-down menu with two uploaded SSL certificates and the New Certificate option highlighted](https://docs.digitalocean.com/screenshots/load-balancers/forwarding-rules-new-certificate.ba5dbf9ea0cf66a47bc8d561a1e0bcf6fe9f97a4c3b35636dd67c2e7fd71a76f.png)

If you want to use one of these certificates, select it from the menu and then click **Save**. We automatically create a new DNS A record for the apex domain pointing to the load balancer.

If you don’t have a certificate uploaded that you want to use, select the **\+ New Certificate** option. This opens a **New Certificate** window to guide you through either creating a new certificate with Let’s Encrypt and DigitalOcean DNS or uploading your own certificate manually.

If you create a [forwarding rule that requires a Let’s Encrypt certificate](/products/networking/load-balancers/how-to/ssl-termination/#add-an-ssl-certificate), you have the option to allow us to automatically create the necessary DNS record, at the apex of your domain, to support the certificate. The **Create DNS records for all the new Let’s Encrypt certificates** box is checked by default. If you want to [manage your own DNS records](/products/networking/dns/how-to/manage-records/) for your Let’S Encrypt certificate, uncheck the box to opt out of creating any records when creating the forwarding rule.

You can update this selection when adding or updating forwarding rules at a later time. However, the updated selection applies only to the new rules going forward, existing DNS records are not updated.

 Use Let's Encrypt

### Use an Existing Domain[](#use-an-existing-domain)

If you [manage your domain with DigitalOcean DNS](/products/networking/dns/), you can choose the **Let’s Encrypt** option to create a new, fully-managed SSL certificate. We create and automatically renew this certificate for you.

Select the domain you want to use, then select a subdomain option:

*   **All subdomains (wildcard)**: Create a wildcard certificate that secures the domain’s apex and any subdomains that do not have an existing DNS records defined.
    
*   **Select an existing subdomain**: Create a certificate that secures the domain’s apex and only selected subdomains.
    

We do not create or change DNS records for subdomains. If your subdomains do not already point at the load balancer, you need to [add DNS records](/products/networking/dns/how-to/manage-records/#a-records) for that.

![Creating a new Let's Encrypt SSL certificate with an existing domain on DigitalOcean](https://docs.digitalocean.com/screenshots/load-balancers/certificate-le-existing-domain.a262789b191f4dede8eb76b02d2798b6293a4853ba08c6af0599ce566b3a0e5f.png)

Enter a name for the certificate, then click **Generate Certificate**. You see a pending status until the certificate has been issued, which typically takes a few seconds, after which you can click **Save**. As soon as the rule is saved, it’s active and you can begin testing.

### Add a New Domain[](#add-a-new-domain)

If you want to start managing a new domain with DigitalOcean DNS to use, select the **\+ Add new domain** option to automatically import your domain to the control panel, add DNS records, and create the certificate.

When you do, an **Additional steps required** window opens to tell you that you need to update your name server records with your domain registrar.

Warning

We strongly recommend adding your domain to DigitalOcean before changing name servers with your registrar. This minimizes service disruptions by creating matching records on DigitalOcean before you make the name server change, which can take up to 48 hours to take effect.

After you click **Yes, continue**, you return to the **New certificate** window with the **Add New Domain** options.

![Creating a new Let's Encrypt SSL certificate while adding a new domain to DigitalOcean](https://docs.digitalocean.com/screenshots/load-balancers/certificate-le-new-domain.f6fd59bd5bc8ea66186518bc08b6da797e3b3fe891b2e312961b1da669b639da.png)

In the **Add New Domain** section, enter a domain you own. When you generate the certificate, this domain is imported into the control panel. We automatically create an A record pointing to the load balancer’s IP address.

Next, select any subdomains you want to use. We automatically create CNAME records that reference the A record of the apex domain.

Enter a name for the certificate, then click **Generate Certificate**. You see a pending status until the certificate has been issued, which typically takes a few seconds, after which you can click **Save**. As soon as the rule is saved, it’s active and you can begin testing.

 Bring Your Own Certificate

In the **Bring Your Own Certificate** tab, you can manually enter the details of an existing certificate.

![Uploading an existing SSL certificate](https://docs.digitalocean.com/screenshots/load-balancers/certificate-bring-your-own.70847eb5b79f1bb3a45202d5e29e95db683d1310547057ee98d5f8a747ca6693.png)

You need to fill in four fields:

*   **Name**. This is a name you choose to identify the certificate in the DigitalOcean interface. It can only contain letters, numbers, periods, and dashes.
    
*   **Public key**. This is the actual SSL public key or certificate file.
    
*   **Private key**. This is the secret key associated with the certificate.
    
*   **Certificate Chain**. This is the full trust chain between the trusted certificate authority’s certificate and your domain’s certificate.
    

Click the **Save SSL Certificate** button, then click **Save** to implement the new forwarding rule. As soon as the rule is saved, it’s active and you can begin testing.

Note

Keep track of when manually-managed certificates expire to avoid service interruptions. You need to update the certificate your load balancer uses when you generate a new certificate. Once you upload the renewed certificate to your account, you can edit the load balancer’s HTTPS rule and select the new certificate.

You can manage all of your account’s SSL certificates in the **Settings** section of the main menu, in the **Security** tab. [Learn more in our certificate management documentation](/platform/teams/how-to/manage-certificates/).

## Force SSL Traffic[](#force-ssl-traffic)

If you would like to force visitors to connect over HTTPS for data integrity and security purposes, you can optionally redirect HTTP traffic to HTTPS. Any insecure connections made to the load balancer are redirected to use the certificate you loaded.

To do this, click the **Edit** button associated with the **SSL** row in the settings. Inside, select the **Redirect HTTP to HTTPS** checkbox:

![Load Balancer Settings SSL redirection open](https://docs.digitalocean.com/screenshots/load-balancers/settings-ssl.4ed379d4bfdda54f030b3abd9e61af21896f8180c79772df6fb79af636254184.png)

Click **Save** to implement the change.

In this article...

*   [Add the SSL Termination Rule](#add-the-ssl-termination-rule)
*   [Add an SSL Certificate](#add-an-ssl-certificate)
*   [Force SSL Traffic](#force-ssl-traffic)

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

Try using dif