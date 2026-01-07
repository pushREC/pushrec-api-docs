---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - reserved-ips
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/reserved-ips/details/limits/
domain: docs.digitalocean.com
---
                Reserved IP Limits | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/reserved-ips.c9c9b721d99d9592de022671f4dd4b27147dea7162dbfa52ee239edccf9d612f.svg)Reserved IPs](/products/networking/reserved-ips/)
*   [Getting Started](/products/networking/reserved-ips/getting-started/)
    *   [Quickstart](/products/networking/reserved-ips/getting-started/quickstart/)
*   [How-Tos](/products/networking/reserved-ips/how-to/)
    *   [Create Reserved IPs](/products/networking/reserved-ips/how-to/create/)
    *   [Delete Reserved IPs](/products/networking/reserved-ips/how-to/delete/)
    *   [Reassign Reserved IPs](/products/networking/reserved-ips/how-to/modify/)
    *   [Manually Enable Reserved IPs](/products/networking/reserved-ips/how-to/manually-enable/)
    *   [Find Droplet Anchor IPs](/products/networking/reserved-ips/how-to/find-anchor-ips/)
    *   [Send Outbound Traffic](/products/networking/reserved-ips/how-to/outbound-traffic/)
    *   [Provision BYOIP](/products/networking/reserved-ips/how-to/provision-byoip/)
    *   [Deprovision BYOIP](/products/networking/reserved-ips/how-to/deprovision-byoip/)
    *   [Manage BYOIP Advertisement](/products/networking/reserved-ips/how-to/pause-byoip/)
    *   [Assign BYOIP IPs](/products/networking/reserved-ips/how-to/assign-byoip-ip/)
    *   [Modify BYOIP IPs](/products/networking/reserved-ips/how-to/modify-byoip-ip/)
*   [Reference](/products/networking/reserved-ips/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Floating-IPs)
    *   [CLI Reference](/reference/doctl/reference/compute/reserved-ip/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/reserved-ips/concepts/)
    *   [Glossary](/glossary/reserved-ips/)
*   [Details](/products/networking/reserved-ips/details/)
    *   [Features](/products/networking/reserved-ips/details/features/)
    *   [Pricing](/products/networking/reserved-ips/details/pricing/)
    *   [Availability](/products/networking/reserved-ips/details/availability/)
    *   [Limits](/products/networking/reserved-ips/details/limits/)
*   [Support](/products/networking/reserved-ips/support/)

*   [Details](/products/networking/reserved-ips/details/) 
*   Limits

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Reserved IP Limits

Validated on 18 Sep 2025 • Last edited on 18 Sep 2025

DigitalOcean Reserved IPs are publicly-accessible static IPv4 and IPv6 addresses. Assign and reassign reserved IP addresses to Droplets as needed, or implement an automated failover mechanism with reserved IPs to build a high availability infrastructure.

## Reserved IPs[](#reserved-ips)

*   By default, you can reserve three reserved IPs per account. If you reach this limit, you can request more through the control panel.
    
*   You cannot assign a reserved IP to more than one Droplet at a time.
    
*   You cannot assign reserved IPs to DigitalOcean Load Balancers.
    
*   Droplets cannot have more than one reserved IP address or BYOIP address assigned to them at a time.
    
*   Reserved IPs do not support PTR (rDNS) records.
    
*   We do not support reserved IPs for DigitalOcean Kubernetes worker nodes.
    
*   A Droplet must have an anchor IP before you can assign a reserved IPv4 to it. Droplets created after 20 October 2015 automatically have an anchor IP, and you can [create an anchor IP on older Droplets](/products/networking/reserved-ips/how-to/manually-enable/).
    
*   Droplets created from a [custom image](/products/custom-images/) do not receive an [anchor IP address](/products/networking/reserved-ips/how-to/find-anchor-ips/) and do not require one to use a [reserved IP](/products/networking/reserved-ips/). When you assign a reserved IP address to a Droplet created from a custom image, the reserved IP is automatically mapped to the Droplet’s public IPv4 address instead of an anchor IP.
    
*   You cannot delete a currently-assigned reserved IPv6 address. Unassign the address from its Droplet before deleting it.
    
*   You must use `doctl` v1.120.0 or higher to create and manage reserved IPv6 addresses on the command line.
    

## Bring Your Own IPs[](#bring-your-own-ips)

*   Only IPv4 addresses are supported.
    
*   BYOIP addresses can only be assigned to Droplets.
    
*   BYOIP does not support network prefixes smaller than `/24` (256 addresses) or larger than `/18` (16,384 addresses).
    
*   The first and second IP addresses of a BYOIP subnet are reserved and not assignable to resources.
    
*   Droplets cannot have more than one BYOIP address or reserved IP address assigned to them at a time.
    
*   Each BYOIP prefix is added to a single datacenter and can only be assigned to resources within that datacenter.
    

In this article...

*   [Reserved IPs](#reserved-ips)
*   [Bring Your Own IPs](#bring-your-own-ips)

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