---
source: '[unknown - load-balancers-how-to.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               Load Balancer How-Tos | DigitalOcean Documentation

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

*   How-Tos

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Load Balancer How-Tos

Generated on 6 Jan 2026

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

## Getting Started[](#getting-started)

[](/products/networking/load-balancers/how-to/create/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Create Regional Load Balancers

Create a load balancer and choose its backend Droplets to improve the availability and flexibility of your infrastructure.

[](/products/networking/load-balancers/how-to/create-global-load-balancer/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Create and Set Up Global Load Balancers

Create a global load balancer, choose its backend resources, and connect a domain to it.

[](/products/networking/load-balancers/how-to/manage/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Manage Regional Load Balancers

View and modify a load balancer’s backend Droplet pool, view graphs of traffic patterns and infrastructure health, and customize the load balancer’s forwarding rules, sticky sessions, health checks, SSL forwarding, and PROXY protocol.

[](/products/networking/load-balancers/how-to/manage-global-load-balancers/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Manage Global Load Balancers

View and modify the global load balancer’s domains, sticky sessions, health checks, and other settings.

## Load Balancer Management[](#load-balancer-management)

[](/products/networking/load-balancers/how-to/scale/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Scale Regional Load Balancers

Scale a load balancer to better match its performance to its workload.

[](/products/networking/load-balancers/how-to/ssl-passthrough/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Configure SSL Passthrough

Set up SSL passthrough to send encrypted SSL requests directly to the backend Droplet pool via the VPC network. This secures the traffic between the load balancers and the backend Droplets.

[](/products/networking/load-balancers/how-to/configure-droplets-for-nlb/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Configure Backend Droplets for Network Load Balancers

Configure backend Droplets to work with network load balancers.

[](/products/networking/load-balancers/how-to/destroy/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Destroy Load Balancers

Destroy a load balancer to permanently and irreversibly remove it from your account.

[](/products/networking/load-balancers/how-to/tcp/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Balance TCP Traffic

Use TCP load balancing for applications that don’t speak HTTP.

[](/products/networking/load-balancers/how-to/ssl-termination/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How to Configure SSL Termination

Set up SSL termination to decrypt SSL requests at the load balancer and send them unencrypted to the backend Droplet pool via the private network.

In this article...

[Load Balancer How-Tos](https://docs.digitalocean.com/products/networking/load-balancers/how-to/)

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

Try using different keywords or simplifying your sear