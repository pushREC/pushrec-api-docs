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
source_url: https://docs.digitalocean.com/products/networking/ipv6/getting-started/quickstart/
domain: docs.digitalocean.com
---
                IPv6 Quickstart | DigitalOcean Documentation

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

*   [Getting Started](/products/networking/ipv6/getting-started/) 
*   Quickstart

[Give Feedback](https://ideas.digitalocean.com/documentation)

# IPv6 Quickstart

Validated on 19 Jun 2018 • Last edited on 14 Aug 2024

[IP addresses](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking) let machines communicate across a network. DigitalOcean Droplets are assigned IPv4 addresses by default. Enabling IPv6 on a Droplet gives you access to its 16 additional IPv6 addresses.

## Enable IPv6 during Droplet Creation[](#enable-ipv6-during-droplet-creation)

Enabling IPv6 when you create a Droplet means all of the network configuration is automatically done for you.

To enable IPv6 while creating a Droplet:

1.  From the [Droplet create page](https://cloud.digitalocean.com/droplets/new), in the **Additional Options** section, check **IPv6**.
    
2.  Finish creating the Droplet as normal.
    

Once the Droplet is created, its IPv6 address is displayed in the header. You can also click the Droplet’s name, then click the **Networking** link to view more IPv6 network information.

## Enable IPv6 on Existing Droplets[](#enable-ipv6-on-existing-droplets)

To [enable IPv6 on an existing Droplet](/products/networking/ipv6/how-to/enable/#on-existing-droplets):

1.  Shut down the Droplet with `sudo shutdown -h now`.
    
2.  On the **Droplets** page, click the name of the Droplet, then click **Networking** in the side menu.
    
3.  In the **Public IPv6 network** section, click **Enable**.
    
4.  Turn the Droplet back on by clicking the **On/Off** switch in the control panel.
    
5.  Manually configure the IPv6 network on the Droplet itself.
    
    Instructions vary based on the Droplet’s operating system. Our [manual IPv6 configuration documentation](/products/networking/ipv6/how-to/enable/#on-existing-droplets) has step by step details for supported distributions.
    
6.  Reboot your Droplet with `reboot` for the changes to take effect.
    

Once the Droplet boots, its IPv6 address is displayed in the header. You can also click the Droplet’s name, then click the **Networking** link to view more IPv6 network information.

In this article...

*   [Enable IPv6 during Droplet Creation](#enable-ipv6-during-droplet-creation)
*   [Enable IPv6 on Existing Droplets](#enable-ipv6-on-existing-droplets)

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

Try using different keywords or simplifying your