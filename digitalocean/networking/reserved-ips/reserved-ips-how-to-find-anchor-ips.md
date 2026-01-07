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
source_url: https://docs.digitalocean.com/products/networking/reserved-ips/how-to/find-anchor-ips/
domain: docs.digitalocean.com
---
                How to Find Information about Droplet Anchor IPs | DigitalOcean Documentation

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

*   [How-Tos](/products/networking/reserved-ips/how-to/) 
*   Find Droplet Anchor IPs

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Find Information about Droplet Anchor IPs

Validated on 27 Feb 2025 • Last edited on 18 Sep 2025

DigitalOcean Reserved IPs are publicly-accessible static IPv4 and IPv6 addresses. Assign and reassign reserved IP addresses to Droplets as needed, or implement an automated failover mechanism with reserved IPs to build a high availability infrastructure.

Note

Droplets created before 20 October 2015 do not automatically have anchor IPs. [Manually add anchor IPs to older Droplets](/products/networking/reserved-ips/how-to/manually-enable/) to use reserved IPs with them.

An anchor IP is only accessible to the Droplet it belongs to and the reserved IP assigned to the Droplet. You should bind any public services that you want to make highly available through a reserved IP to the anchor IP to prevent users from using the public IP addresses of your Droplets to bypass your reserved IP.

For example, if you are using a reserved IP in an active/passive load balancer setup, you should bind your load balancer services to their respective Droplet anchor IPs so they can only be accessed via the reserved IP address.

Droplets created from a [custom image](/products/custom-images/) do not receive an [anchor IP address](/products/networking/reserved-ips/how-to/find-anchor-ips/) and do not require one to use a [reserved IP](/products/networking/reserved-ips/). When you assign a reserved IP address to a Droplet created from a custom image, the reserved IP is automatically mapped to the Droplet’s public IPv4 address instead of an anchor IP.

## Get a Droplet’s Anchor IP[](#get-a-droplets-anchor-ip)

To retrieve your Droplet’s anchor IP, you can use standard networking utilities, like `ip addr show eth0`. For simplicity, we recommend using the [Droplet Metadata service](/products/droplets/how-to/access-metadata/) by running [`curl` on the Droplet](https://developers.digitalocean.com/documentation/metadata/#using-curl).

To get a Droplet’s anchor IP, `curl` the [anchor interface IPv4 address metadata endpoint](https://developers.digitalocean.com/documentation/metadata/#interface-anchor_ipv4-address) from the Droplet:

    curl -s http://169.254.169.254/metadata/v1/interfaces/public/0/anchor_ipv4/address

You can similarly use the [anchor IP netmask endpoint](https://developers.digitalocean.com/documentation/metadata/#interface-anchor_ipv4-netmask) and [anchor IP gateway endpoint](https://developers.digitalocean.com/documentation/metadata/#interface-anchor_ipv4-gateway).

Using metadata, you can also check if a Droplet has a reserved IP with the [active reserved IP endpoint](https://developers.digitalocean.com/documentation/metadata/#reserved_ip-ipv4-active) and get the address of its reserved IP address with the [reserved IP address endpoint](https://developers.digitalocean.com/documentation/metadata/#reserved_ip-ipv4-address).

Learn more in the [metadata API documentation](/reference/api/metadata/).

In this article...

*   [Get a Droplet’s Anchor IP](#get-a-droplets-anchor-ip)

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