---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - firewalls
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/firewalls/details/limits/
domain: docs.digitalocean.com
---
                Firewalls Limits | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/firewalls.ae799a907969d743602c769c16fd2ad744471b683543c748c3cfb89494091454.svg)Cloud Firewalls](/products/networking/firewalls/)
*   [Getting Started](/products/networking/firewalls/getting-started/)
    *   [Quickstart](/products/networking/firewalls/getting-started/quickstart/)
*   [How-Tos](/products/networking/firewalls/how-to/)
    *   [Create Firewalls](/products/networking/firewalls/how-to/create/)
    *   [Configure Rules](/products/networking/firewalls/how-to/configure-rules/)
    *   [Apply Firewalls to Droplets](/products/networking/firewalls/how-to/manage-droplets/)
    *   [View Rules for Droplets](/products/networking/firewalls/how-to/view-rules-for-droplet/)
    *   [Destroy Firewalls](/products/networking/firewalls/how-to/destroy/)
*   [Reference](/products/networking/firewalls/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Firewalls)
    *   [CLI Reference](/reference/doctl/reference/compute/firewall/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/firewalls/concepts/)
    *   [Organize Firewalls](/products/networking/firewalls/concepts/organization/)
*   [Details](/products/networking/firewalls/details/)
    *   [Features](/products/networking/firewalls/details/features/)
    *   [Pricing](/products/networking/firewalls/details/pricing/)
    *   [Availability](/products/networking/firewalls/details/availability/)
    *   [Limits](/products/networking/firewalls/details/limits/)
*   [Support](/products/networking/firewalls/support/)

*   [Details](/products/networking/firewalls/details/) 
*   Limits

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Firewalls Limits

Validated on 19 Jun 2018 • Last edited on 17 Jun 2025

DigitalOcean Cloud Firewalls are a network-based, stateful firewall service for Droplets provided at no additional cost. Cloud firewalls block all traffic that isn’t expressly permitted by a rule.

*   You can have a maximum of **10 Droplets per firewall** and **5 tags per firewall**. If you have more than 10 Droplets that need the same firewall, [tag](/products/droplets/how-to/tag/) the Droplets, then add that tag to the firewall.
    
*   Each firewall can have up to 50 total incoming and outgoing rules.
    
*   You cannot apply cloud firewalls to [load balancers](/products/networking/load-balancers/).
    
*   Firewalls affect both public and [VPC network](/products/networking/vpc/) traffic. Rules specific to either must specify the public or private IP range.
    
*   Firewalls only support ICMP, TCP, and UDP.
    
*   Firewalls block traffic at the network layer before that traffic reaches your resources. Because of this, traffic logs are not available.
    
*   Adding new rules to a firewall does not terminate existing connections.
    
*   Firewall rules are limited to 1000 entries in the **Sources** or **Destinations** field. To filter more than 1000 IPs, use tags or network ranges instead of listing individual IPs. More information is available in [How to Configure Firewall Rules](/products/networking/firewalls/how-to/configure-rules/).
    
*   DigitalOcean uses DHCP on port `67` to configure networking for Droplets using custom images. If you put a Droplet created from a custom image behind a firewall, including a [DIgitalOcean Cloud Firewall](/products/networking/firewalls/), you need to [create an outbound UDP rule](/products/networking/firewalls/how-to/configure-rules/) that opens port `67`.
    

In this article...

[Firewalls Limits](https://docs.digitalocean.com/products/networking/firewalls/details/limits/)

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