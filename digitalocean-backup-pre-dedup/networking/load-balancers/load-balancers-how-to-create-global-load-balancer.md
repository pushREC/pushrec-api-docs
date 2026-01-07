---
source: '[unknown - load-balancers-how-to-create-global-load-balancer.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Create and Set Up Global Load Balancers | DigitalOcean Documentation

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
*   Create Global Load Balancers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create and Set Up Global Load Balancers

Validated on 9 Sep 2024 • Last edited on 17 Apr 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

DigitalOcean’s Global Load Balancers allow you to distribute traffic to regional load balancers or Droplets in different regions for high availability (HA) and performance. Regional load balancers distribute traffic within a single region. Global load balancers span multiple regions and route users to the nearest available backend resource.

This document guides you through how to create a global load balancer and route a domain to it.

## Create a Global Load Balancer[](#create-a-global-load-balancer)

To create a global load balancer from the [DigitalOcean Control Panel](https://cloud.digitalocean.com/login), click the **Create** button and then from the drop-down menu, select the **Load Balancers** option. Alternatively, on the **Load Balancers** overview page, click the **Create load balancer** button.

On the **Create Load Balancer** page, select the **Global** option.

![The load balancer creation page with the Global option highlighted.](https://docs.digitalocean.com/screenshots/load-balancers/lbaas-options.615e8476dd0bcda7ad37dbb2b3c647938a251aa3a53e654b165b81eb27a3f6c4.png)

In the **CDN Caching** section, select whether or not you want to enable caching for your server responses. CDN caching improves performance by caching static assets on edge servers closer to users.

For more information on how to set up your server responses for caching, see [CDN Caching](/products/networking/load-balancers/how-to/manage-global-load-balancers/#cdn-caching).

### Connect Resources[](#connect-resources)

In the **Connect Resources** section, use the search bar to add Droplets, regional load balancers, or [groups of tagged Droplets](/products/droplets/how-to/tag/) to the load balancer’s backend pool. All the resources you add must be of the same type. For example, you cannot add a Droplet and a regional load balancer to the same pool. If you are creating this load balancer for DigitalOcean Kubernetes, you can skip this step.

![search box for finding and adding resources to a load balancer](https://docs.digitalocean.com/screenshots/load-balancers/glb-add-resources.919fdfda63d8c920b01cafdcd8fb6a8e54d6cf4afe4e51b4f6442397f7fae630.png)

You can [add or remove resources from the load balancer’s pool](/products/networking/load-balancers/how-to/manage/#droplets) at any time after creation.

### Configure Forwarding Rules[](#configure-forwarding-rules)

Unlike regional load balancers, global load balancers only allow you to configure one forwarding rule. This rule determines which protocol (`HTTP`, `HTTPS`, or `HTTP2`) and port (`80` or `443`) the load balancer uses to forward traffic to its backend resources.

The default route uses `HTTP` to send traffic to port `80` on your backend.

### Configure Advanced Settings[](#configure-advanced-settings)

In the **Advanced Settings** section, you can configure the following settings:

*   **Sticky sessions**: Sticky sessions send subsequent requests from the same client to the same backend by setting a cookie with a configurable name and TTL (Time-To-Live) duration. This is useful for applications that require a persistent connection.
    
*   **Health checks**: Health checks monitor the health of your backend resources. You can change the thresholds of what is considered an unhealthy resource in these settings.
    
*   **SSL**: The SSL option redirects HTTP requests on port 80 to HTTPS on port 443. When you enable this option, HTTP URLs are forwarded to HTTPS with a [307 redirect](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/307).
    
*   **HTTP Idle Timeout**: The HTTP idle timeout sets the amount of time that a connection can be idle before the load balancer closes it. The default is `60` seconds.
    

You can also modify these settings after you create the load balancer. For more information on load balancer settings, see [Modify Advanced Settings](/products/networking/load-balancers/how-to/manage-global-load-balancers/).

### Finalize and create[](#finalize-and-create)

In the **Finalize and create** section, you can choose a name for the load balancer, assign it to a project, and review the total monthly cost for the resource. Ensure load balancer names are unique and contain only alphanumeric characters, dashes, and periods. You can rename load balancers at any time after creation by clicking on the existing name on the load balancer page.

Once you have configured all the necessary options, click the **Create Load Balancer** button to provision the global load balancer.

## Connect a Domain[](#connect-a-domain)

Once you have created the global load balancer, you can connect a domain to it to begin routing traffic to your backend Droplets. Connecting a domain requires you to set up DNS records that direct traffic to the load balancer’s IP address. If your domain uses HTTPS, you also need to configure SSL/TLS certificates.

This part of the guide provides two different use cases for connecting a domain to a global load balancer:

*   Your [domain is new DigitalOcean manages its DNS](#do-dns).
*   You have an existing website hosted by DigitalOcean but [another provider manages the domain’s DNS](#external-dns) and you want to migrate your traffic to use the global load balancer.

### Connect a Domain that Uses DigitalOcean DNS[](#do-dns)

If you manage your domain’s DNS with [DigitalOcean DNS](/products/networking/dns/how-to/add-domains/), you can connect it to by going to the load balancer’s overview page, then clicking the **Settings** tab, then clicking the **Connect a Domain** button. In the **Getting Started** window, you can also add the domain after creating the load balancer.

On the **Connect a Domain** screen, enter your domain name into the search field. The field retrieves a list domains from your DigitalOcean account. Locate the domain you want to connect and then select it from the drop-down list.

In the **SSL certificate** section, select how you want to add SSL/TLS certificates. You can add certificates using two options:

*   **Generate a new SSL certificate**: DigitalOcean generates a new, free SSL certificate for your domain using Let’s Encrypt.
*   **Use an existing SSL certificate or bring your own**: You can select an [existing SSL certificate](/platform/teams/how-to/manage-certificates/) that you have uploaded to DigitalOcean or bring your own SSL certificate by uploading a private key and certificate bundle.

If you use the **Bring your own certificate** option, you must provide the following information:

*   **Name**: A unique name for the SSL certificate.
*   **Certificate**: The certificate’s public key.
*   **Private key**: The secret key associated with the public key.
*   **Certificate chain**: This is the full trust chain between the trusted certificate authority’s certificate and your domain’s certificate.

Select an SSL certificate option, fill out the additional configuration fields, and then click **Connect Domain**. This automatically creates the necessary DNS records (two A records and two AAAA records) in DigitalOcean DNS that route traffic from your domain to your load balancer. It may take several minutes to a few hours for the DNS changes to propagate across the internet.

Once you have added your domain and the DNS changes have propagated, you can begin routing traffic to the global load balancer.

### Connect a Domain using External DNS[](#external-dns)

If you manage your domain’s DNS using a third-party provider like Cloudflare or Namecheap, you can still connect your domain to the global load balancer by creating DNS records that direct traffic to the load balancer’s IP addresses.

If your domain is currently managing traffic, this may result in some downtime but you can take steps to minimize the downtime. To migrate traffic to the new load balancer, we recommend setting the TTL (Time To Live) values of your domain’s existing A and AAAA records to the lowest values that your provider allows, then create the new records. This allows existing clients to continue using the old records while new clients get directed to the new load balancer. Once you’ve set up the new records, wait for the TTL expire for the old records and then remove them to complete the migration.

To set up the new DNS records, on the load balancer’s page, click the **Actions** button, then select **Load Balancer IP Addresses**. This displays the load balancer’s IP addresses that you need to create the necessary A records and AAAA records at your DNS provider.

![The Actions menu opened with the Load Balancer IP Addresses option highlighted.](https://docs.digitalocean.com/screenshots/load-balancers/glb-ip-address.4488f52a3e2a5cfb1f94b1b703a4b9e50f8ce8a39b0d27056b9e63d7c7ccefab.png)

At your DNS provider, create a record for each IP address. This should add four new records to your domain: two A records and two AAAA records. See your DNS provider’s documentation to see how this is done.

Once you’ve added the DNS records at your DNS provider, it may take time for the changes to propagate across the internet. You can check that the migration was successful by viewing traffic in the load balancer Graphs tab or testing connectivity to the domain from different locations. To view the load balancer’s traffic statistics from the load balancer’s overview page, click the **Graphs** tabs.

In this article...

*   [Create a Global Load Balancer](#create-a-global-load-balancer)
    *   [Connect Resources](#connect-resources)
    *   [Configure Forwarding Rules](#configure-forwarding-rules)
    *   [Configure Advanced Settings](#configure-advanced-settings)
    *   [Finalize and create](#finalize-and-create)
*   [Connect a Domain](#connect-a-domain)
    *   [Connect a Domain that Uses DigitalOcean DNS](#do-dns)
    *   [Connect a Domain using External DNS](#external-dns)

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

Try using differe