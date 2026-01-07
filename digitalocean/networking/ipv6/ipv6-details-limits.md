---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - ipv6
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/ipv6/details/limits/
domain: docs.digitalocean.com
---
                IPv6 Limits | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/ipv6.5328c5b0b5ae17c7784679c40c051945e4799cda74d004c85a41eba70b6a07f9.svg)IPv6](/products/networking/ipv6/)
*   [Getting Started](/products/networking/ipv6/getting-started/)
    *   [Quickstart](/products/networking/ipv6/getting-started/quickstart/)
*   [How-Tos](/products/networking/ipv6/how-to/)
    *   [Enable IPv6](/products/networking/ipv6/how-to/enable/)
    *   [Use Additional Addresses](/products/networking/ipv6/how-to/configure-additional-addresses/)
    *   [Disable IPv4](/products/networking/ipv6/how-to/disable-ipv4/)
*   [Reference](/products/networking/ipv6/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#operation/dropletActions_post_byTag)
    *   [CLI Reference](/reference/doctl/reference/compute/droplet-action/enable-ipv6/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/ipv6/concepts/)
*   [Details](/products/networking/ipv6/details/)
    *   [Features](/products/networking/ipv6/details/features/)
    *   [Pricing](/products/networking/ipv6/details/pricing/)
    *   [Availability](/products/networking/ipv6/details/availability/)
    *   [Limits](/products/networking/ipv6/details/limits/)
*   [Support](/products/networking/ipv6/support/)

*   [Details](/products/networking/ipv6/details/) 
*   Limits

[Give Feedback](https://ideas.digitalocean.com/documentation)

# IPv6 Limits

Validated on 11 Feb 2025 • Last edited on 18 Feb 2025

[IP addresses](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking) let machines communicate across a network. DigitalOcean Droplets are assigned IPv4 addresses by default. Enabling IPv6 on a Droplet gives you access to its 16 additional IPv6 addresses.

*   To use IPv6, it must be enabled and configured at both ends of a connection: where you’re connecting from (like your home or work network) and where you’re connecting to (like a Droplet). Not all ISPs offer IPv6 addresses for customers, so you may not be able to connect to an IPv6 address directly from your local machine.
    
*   We support a maximum of 16 addresses (a subnet mask of `/124`) per Droplet. Additional addresses are not available.
    
*   If the name of an IPv6-enabled Droplet is an FQDN, a PTR record is automatically generated only for the first IPv6 address assigned to the Droplet, not to all 16 addresses available.
    
*   You cannot enable IPv6 on Droplets created from [custom images](/products/custom-images/).
    
*   SMTP traffic over IPv6 is blocked at the network level.
    
*   We do not support IPv6 for [VPC networking](/products/networking/vpc/).
    
*   IPv6 addresses assigned to a Droplet remain static for the life of the Droplet. Once the Droplet is destroyed, the address is released back into a pool of available addresses in its respective datacenter. Once back in the pool, the chances of obtaining the same address again are unlikely.
    

In this article...

[IPv6 Limits](https://docs.digitalocean.com/products/networking/ipv6/details/limits/)

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

Try using different keywords or simplifying your search