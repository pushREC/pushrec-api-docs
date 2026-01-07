---
source: https://docs.digitalocean.com/products/droplets/getting-started/recommended-gpu-setup/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
oad Balancers | DigitalOcean Documentation

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

*   Load Balancers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Load Balancers

Generated on 6 Jan 2026

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

Most Viewed Load Balancers Articles

1.  [How to Manage Regional Load Balancers](/products/networking/load-balancers/how-to/manage/ "View and modify a load balancer's backend Droplet pool, view graphs of traffic patterns and infrastructure health, and customize the load balancer's forwarding rules, sticky sessions, health checks, SSL forwarding, and PROXY protocol.")
2.  [How to Configure SSL Termination](/products/networking/load-balancers/how-to/ssl-termination/ "Set up SSL termination to decrypt SSL requests at the load balancer and send them unencrypted to the backend Droplet pool via the private network.")
3.  [I can't reach a Droplet through my DigitalOcean Load Balancer](/support/i-cant-reach-a-droplet-through-my-digitalocean-load-balancer/ "Your load balancer may be down or not directing traffic to the target Droplet.")
4.  [How to Work with DigitalOcean Load Balancers Using doctl](/products/networking/load-balancers/getting-started/with-doctl/ "Use the official command-line client for DigitalOcean’s API to create and configure a load balancer for multiple backend web servers.")
5.  [Load Balancers Features](/products/networking/load-balancers/details/features/)
6.  [How to Create Regional Load Balancers](/products/networking/load-balancers/how-to/create/ "Create a load balancer and choose its backend Droplets to improve the availability and flexibility of your infrastructure.")
7.  [Load Balancers Limits](/products/networking/load-balancers/details/limits/ "Limits and known issues for load balancers.")
8.  [How to Troubleshoot Load Balancer Health Check Issues](/support/how-to-troubleshoot-load-balancer-health-check-issues/ "Health checks often fail due to firewalls or misconfigured backend server software.")
9.  [How do I enable PROXY protocol when my load balancer sends requests to the NGINX Ingress Controller?](/support/how-do-i-enable-proxy-protocol-when-my-load-balancer-sends-requests-to-the-nginx-ingress-controller/ "Edit the ConfigMap which nginx uses to enable PROXY protocol.")
10.  [How to Create and Set Up Global Load Balancers](/products/networking/load-balancers/how-to/create-global-load-balancer/ "Create a global load balancer, choose its backend resources, and connect a domain to it.")

[](/products/networking/load-balancers/getting-started/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/networking/load-balancers/how-to/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/networking/load-balancers/reference/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

Reference

API and CLI reference documentation for managing Load Balancers, including example requests and available parameters.

[](/products/networking/load-balancers/concepts/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

Concepts

Explanations and definitions of core concepts in Load Balancers.

[](/products/networking/load-balancers/details/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

[](/products/networking/load-balancers/support/)

![](https://docs.digitalocean.com/images/icons/load-balancers.svg)

Support

Get help with technical support and answers to frequently asked questions.

## Latest Updates[](#latest-updates)

### 27 March 2025[](#27-march-2025)

*   Network load balancers are now in [general availability](/platform/product-lifecycle/#general-availability). Network load balancers are regional load balancers that route traffic at the TCP/UDP transport level. Read [How to Create Regional Load Balancers](/products/networking/load-balancers/how-to/create/) to get started.
    

### 28 February 2025[](#28-february-2025)

*   Network load balancers are now in [public preview](https://cloud.digitalocean.com/account/feature-preview/). Network load balancers are regional load balancers that route traffic at the TCP/UDP transport level. You must opt-in to the [public preview](https://cloud.digitalocean.com/account/feature-preview/) to create network load balancers.
    
*   IPv6 support for regional external load balancers is now in [general availability](/platform/product-lifecycle/#general-availability). You may now choose between IPv4-only or dual-stack IPv4 and IPv6 networking when you [create standalone load balancers](/products/networking/load-balancers/how-to/create/). All [DOKS regional HTTPS load balancers](/products/kubernetes/how-to/add-load-balancers/) created after 28 February 2025 are dual-stack. Network load balancers on DOKS do not support IPv6.
    

### 12 December 2024[](#12-december-2024)

*   Internal-only [regional load balancers](/products/networking/load-balancers/details/features/#regional-load-balancers) are now in [general availability](/platform/product-lifecycle/#general-availability). Internal load balancers have no public IP address and are only accessible to resources in the same [VPC](/products/networking/vpc/) network. Read [How to Create Regional Load Balancers](/products/networking/load-balancers/how-to/create/) for more details. To learn how to add internal load balancers to DOKS clusters, see [Configure Load Balancers](/products/kubernetes/how-to/configure-load-balancers/#internal-load-balancer) in the DOKS documentation.
    

For more information, see [all Load Balancers release notes](https://docs.digitalocean.com/release-notes/load-balancers/).

In this article...

[Load Balancers](https://docs.digitalocean.com/products/networking/load-balancers/)

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

Try using different keywords or simplifying your search ter
