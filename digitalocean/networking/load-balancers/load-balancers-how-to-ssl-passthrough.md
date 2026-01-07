---
source: '[unknown - load-balancers-how-to-ssl-passthrough.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Configure SSL Passthrough | DigitalOcean Documentation

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
*   Configure SSL Passthrough

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Configure SSL Passthrough

Validated on 28 Oct 2019 • Last edited on 17 Jun 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

Note

This guide applies to regional load balancers for Droplets. To configure SSL passthrough for a load balancer for Kubernetes nodes, see our [reference on configuring DigitalOcean Kubernetes load balancers](/products/kubernetes/how-to/configure-load-balancers/#ssl-certificates).

When load balancing encrypted web traffic, there are two main configuration choices:

*   **[SSL termination](/products/networking/load-balancers/how-to/ssl-termination/)**, which decrypts SSL requests at the load balancer and sends them unencrypted to the backend via the Droplets’ private IP addresses.
    
    SSL termination places the slower and more CPU-intensive work of decryption on the load balancer and simplifies certificate management. Traffic between the load balancer and its Droplets is secured by routing over the [VPC network](/products/networking/vpc/). However, if you host multiple customer applications in a single account or team, data could be readable by others on the private network. We recommend separating customers by team or using SSL passthrough instead.
    
*   **[SSL passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/)**, which sends encrypted SSL requests directly to the backend, via the Droplets’ private IP addresses. This secures the traffic between the load balancers and the backend servers.
    
    SSL passthrough distributes the decryption load across the backend servers, but every server must have the certificate information. You also can’t add or modify HTTP headers, so you may lose the client’s IP address, port, and other information contained in the `X-forwarded-*` headers.
    

Warning

Sticky sessions do not work with SSL passthrough (port 443 to 443).

## Backend Configuration for SSL Passthrough[](#backend-configuration-for-ssl-passthrough)

Before you configure SSL passthrough on your load balancer, you need:

1.  **A registered domain name** that you own. You can use any domain name registrar (for example, Namecheap or Omnis).
    
2.  **DNS records** pointing from your domain to the load balancer. You can use [DigitalOcean’s free DNS hosting service](/products/networking/dns/) or another service of your choice.
    
3.  **One or more backend Droplets** running an application configured for SSL. There are several options on how to create an SSL certificate and configure the backend application to decrypt HTTPS or HTTP/2 requests depending on the software you prefer to use. Here are some resources:
    
    *   [Certbot’s Getting certificates](https://certbot.eff.org/docs/using.html#getting-certificates-and-choosing-plugins)
    *   [nginx’s Configuring HTTPS servers](https://nginx.org/en/docs/http/configuring_https_servers.html)
    *   [Apache’s SSL/TLS Strong Encryption: How-To](https://httpd.apache.org/docs/2.4/ssl/ssl_howto.html)
    *   [Caddy’s Automatic HTTPS](https://caddyserver.com/docs/automatic-https)

All of the Droplets you use with your load balancer need to have the same SSL certificate. After your setup works with one backend server, you can [create an image of the first Droplet](/products/snapshots/how-to/snapshot-droplets/) to use to [create additional instances](/products/snapshots/how-to/create-and-restore-droplets/). Alternatively, you can use `scp` or `rsync` to copy the certificate files from one server to the next.

Once your domain, DNS records, SSL certificate, and backend Droplets are ready, you can add the passthrough forwarding rule to the load balancer.

## Add the Load Balancer SSL Passthrough Rule[](#add-the-load-balancer-ssl-passthrough-rule)

From the [control panel](https://cloud.digitalocean.com), click **Networking** in the main menu, then choose the **Load Balancers**. Click the load balancer you want to modify, then click **Settings** to go to its settings page.

![Load Balancer Settings page](https://docs.digitalocean.com/screenshots/load-balancers/settings.fddc0d8f993d1996c627c8af847a85c91ef7fb5a58d4704a234b5b2068641ecd.png)

In the **Forwarding Rules** section, click **Edit**. You see any existing forwarding rules and an option to add additional rules.

Select the protocol and port the load balancer receives traffic on, and then select the protocol and port the Droplet receives traffic on.

![Load Balancer settings forwarding rules for HTTPS with Passthrough selected](https://docs.digitalocean.com/screenshots/load-balancers/forwarding-rules-passthrough.702e18460777bd53dd214a6744c872dcb25819d4e8b63c2c019628d4a66183d2.png)

After you click **Save**, you can test the SSL passthrough by visiting content on your domain in a browser using HTTPS.

## Force SSL Traffic[](#force-ssl-traffic)

If you would like to force visitors to connect over HTTPS for data integrity and security purposes, you can optionally redirect HTTP traffic to HTTPS. To redirect traffic, you need to [set up at least one HTTP forwarding rule and one HTTPS forwarding rule](/products/networking/load-balancers/how-to/manage/#forwarding-rules). Any insecure connections made to the load balancer are redirected to use the certificate you loaded.

On the load balancer’s **Settings** page, find the **SSL** section and click **Edit**.

![Load Balancer SSL settings open](https://docs.digitalocean.com/screenshots/load-balancers/settings-ssl.4ed379d4bfdda54f030b3abd9e61af21896f8180c79772df6fb79af636254184.png)

In the options that open, check the **Redirect HTTP to HTTPS** checkbox, then click **Save**.

In this article...

*   [Backend Configuration for SSL Passthrough](#backend-configuration-for-ssl-passthrough)
*   [Add the Load Balancer SSL Passthrough Rule](#add-the-load-balancer-ssl-passthrough-rule)
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

Try using different keywords or simplif