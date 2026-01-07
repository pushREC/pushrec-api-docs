---
source: '[unknown - load-balancers-support.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               Load Balancer Support | DigitalOcean Documentation

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

*   Support

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Load Balancer Support

Generated on 6 Jan 2026

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

[](/support/how-to-troubleshoot-load-balancer-health-check-issues/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How to Troubleshoot Load Balancer Health Check Issues

Health checks often fail due to firewalls or misconfigured backend server software.

[](/support/how-do-i-enable-proxy-protocol-when-my-load-balancer-sends-requests-to-the-nginx-ingress-controller/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I enable PROXY protocol when my load balancer sends requests to the NGINX Ingress Controller?

Edit the ConfigMap which nginx uses to enable PROXY protocol.

[](/support/why-does-my-load-balancer-respond-with-a-504-gateway-timeout-error/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why does my load balancer respond with a 504 Gateway Timeout error?

By default, load balancers time out after the connection has been idle for 60 seconds. You can customize the timeout duration.

[](/support/why-does-my-load-balancer-respond-with-an-http-503-error/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why does my load balancer respond with an HTTP 503 error?

Load balancers return 503 errors when there are either no Droplets assigned to them or all of the assigned Droplets are unhealthy.

[](/support/i-cant-reach-a-droplet-through-my-digitalocean-load-balancer/)

![](https://docs.digitalocean.com/images/icons/support.svg)

I can't reach a Droplet through my DigitalOcean Load Balancer

Your load balancer may be down or not directing traffic to the target Droplet.

[](/support/why-do-my-doks-load-balancer-settings-keep-reverting/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why do my DOKS load balancer settings keep reverting?

You can configure load balancers that are provisioned by DOKS using Kubernetes service annotations.

[](/support/why-do-my-load-balancers-kubernetes-nodes-have-the-no-traffic-status/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why do my load balancer's Kubernetes node(s) have the No Traffic status?

Kubernetes service ’externaltrafficpolicy’ field controls how nodes respond to health checks.

[](/support/why-did-all-of-my-backend-droplets-become-unhealthy-when-i-enabled-proxy-protocol-on-my-load-balancer/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why did all of my backend Droplets become unhealthy when I enabled PROXY protocol on my load balancer?

Enable PROXY protocol support on your Droplets.

In this article...

[Load Balancer Support](https://docs.digitalocean.com/products/networking/load-balancers/support/)

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

Try using different keywords or simplifying your search t