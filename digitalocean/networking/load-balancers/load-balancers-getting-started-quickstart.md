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
source_url: https://docs.digitalocean.com/products/networking/load-balancers/getting-started/quickstart/
domain: docs.digitalocean.com
---
                Load Balancer Quickstart | DigitalOcean Documentation

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

*   [Getting Started](/products/networking/load-balancers/getting-started/) 
*   Quickstart

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Load Balancer Quickstart

Validated on 27 Feb 2025 • Last edited on 28 Feb 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

## Create Load Balancers[](#create-load-balancers)

1.  From the [control panel](https://cloud.digitalocean.com), click **Create** in the top right, and then **Load Balancers**.
2.  Choose a [load balancer size](/products/networking/load-balancers/details/pricing/), type, visibility, network stack, name, datacenter region, and forwarding rules. Make sure you choose the same datacenter region as any existing Droplets you want use in the backend.
3.  Click **Create Load Balancer**. This takes you to the detail page of the new load balancer.

## Add and Remove Droplets[](#add-and-remove-droplets)

All backend Droplets must be in the same region as the load balancer.

To add Droplets:

1.  From the load balancer’s detail page, click **Choose Droplets**.
2.  Select the Droplets or tag you want to use, then click **Add Droplets**. You can choose the Droplets for the backend in two ways: manually or by [using a tag](/products/droplets/how-to/tag/).

To remove Droplets:

1.  From the load balancer’s detail page, click **More** next to the Droplet you’d like to remove.
2.  In the **More** drop-down, click **Remove**.

## Use SSL Certificates[](#use-ssl-certificates)

Existing certificates, both Let’s Encrypt and custom, appear in the **Certificate** drop-down list when creating your load balancer and in the **Forwarding Rules** section of the **Settings** tab after creation. You can assign any existing certificates in the HTTPS and HTTP/2 forwarding rules.

To delete an existing certificate:

1.  Open the **Security** menu.
2.  In the **Certificates** section, open the **More** menu of the certificate you’d like to delete.
3.  Click **Delete** and confirm the deletion.

You cannot delete certificates that are still in use. You can delete the forwarding rule or edit it so that it no longer uses the certificate, then return to the **Certificates** tab and delete it.

## Delete Load Balancers[](#delete-load-balancers)

1.  From load balancer’s detail page, click the **Settings** tab.
2.  Click the red **Destroy** button, then the red **Confirm** button.

The Droplets associated with your load balancer stop receiving distributed traffic, but the Droplets themselves are not destroyed.

In this article...

*   [Create Load Balancers](#create-load-balancers)
*   [Add and Remove Droplets](#add-and-remove-droplets)
*   [Use SSL Certificates](#use-ssl-certificates)
*   [Delete Load Balancers](#delete-load-balancers)

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