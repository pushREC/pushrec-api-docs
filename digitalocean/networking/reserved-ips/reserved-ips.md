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
source_url: https://docs.digitalocean.com/products/networking/reserved-ips/
domain: docs.digitalocean.com
---
                Reserved IPs | DigitalOcean Documentation

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

*   Reserved IPs

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Reserved IPs

Generated on 6 Jan 2026

DigitalOcean Reserved IPs are publicly-accessible static IPv4 and IPv6 addresses. Assign and reassign reserved IP addresses to Droplets as needed, or implement an automated failover mechanism with reserved IPs to build a high availability infrastructure.

Most Viewed Reserved IPs Articles

1.  [Reserved IPs Pricing](/products/networking/reserved-ips/details/pricing/)
2.  [How to Send Outbound Traffic Over a Reserved IP](/products/networking/reserved-ips/how-to/outbound-traffic/ "Send outbound traffic from your Droplet over a reserved IP address.")
3.  [How do I get a Droplet's dedicated IP address?](/support/how-do-i-get-a-droplets-dedicated-ip-address/ "Droplets do not have a dedicated IP address, but you can create a Reserved IP, which is a reassignable static IP address.")
4.  [How to Reassign or Unassign Reserved IPs](/products/networking/reserved-ips/how-to/modify/ "Reassign reserved IPs to different Droplets within the same datacenter or unassign them entirely.")
5.  [Can I choose my Droplet's IP address?](/support/can-i-choose-my-droplets-ip-address/ "You cannot create Droplets with a specific IP address, but you can use reserved IPs for a static address that you can migrate between Droplets.")
6.  [How to Find Information about Droplet Anchor IPs](/products/networking/reserved-ips/how-to/find-anchor-ips/ "Bind public services to your Droplet's anchor IP to make them highly available through a reserved IP.")
7.  [How to Provision a BYOIP Prefix](/products/networking/reserved-ips/how-to/provision-byoip/ "Provision a BYOIP prefix to assign your own IP addresses to Droplets.")
8.  [Reserved IP Limits](/products/networking/reserved-ips/details/limits/ "Limits and known issues for Reserved IPs.")
9.  [How to Manually Enable Reserved IPs](/products/networking/reserved-ips/how-to/manually-enable/ "Manually configure Droplets to enable reserved IPv4 and IPv6 addresses.")
10.  [Reserved IP Details](/products/networking/reserved-ips/details/ "Features, plans and pricing, availability, limits, known issues, and more.")

[](/products/networking/reserved-ips/getting-started/)

![](https://docs.digitalocean.com/images/icons/reserved-ips.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/networking/reserved-ips/how-to/)

![](https://docs.digitalocean.com/images/icons/reserved-ips.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/networking/reserved-ips/reference/)

![](https://docs.digitalocean.com/images/icons/reserved-ips.svg)

Reference

API and CLI reference documentation for Reserved IPs, including example requests and available parameters.

[](/products/networking/reserved-ips/concepts/)

![](https://docs.digitalocean.com/images/icons/reserved-ips.svg)

Concepts

Explanations and definitions of core concepts in Reserved IP.

[](/products/networking/reserved-ips/details/)

![](https://docs.digitalocean.com/images/icons/reserved-ips.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

[](/products/networking/reserved-ips/support/)

![](https://docs.digitalocean.com/images/icons/reserved-ips.svg)

Support

Get help with technical support and answers to frequently asked questions.

## Latest Updates[](#latest-updates)

### 18 September 2025[](#18-september-2025)

*   Bring Your Own IP (BYOIP) is now in [general availability](/platform/product-lifecycle/#general-availability). BYOIP enables bringing your own block of IPv4 addresses to DigitalOcean. Once provisioned, assign your addresses to Droplets using the same interface and APIs as [Reserved IPs](/products/networking/reserved-ips/).
    

### 25 June 2025[](#25-june-2025)

*   Bring Your Own IP (BYOIP) is now in [public preview](/platform/product-lifecycle/#public-preview). BYOIP allows you to bring your own block of IPv4 addresses to DigitalOcean. Once provisioned, assign your addresses to Droplets using the same interface and APIs as [Reserved IPs](/products/networking/reserved-ips/).
    

### 17 June 2025[](#17-june-2025)

*   Reserved IPv6 addresses are now in [general availability](/platform/product-lifecycle/#general-availability). Reserved IPv6 addresses are publicly-accessible static IPv6 addresses that you can assign to Droplets and instantly remap to other Droplets in the same datacenter. See [How to Create Reserved IPs](/products/networking/reserved-ips/how-to/create/) to get started.
    

For more information, see [all Reserved IPs release notes](https://docs.digitalocean.com/release-notes/reserved-ips/).

In this article...

[Reserved IPs](https://docs.digitalocean.com/products/networking/reserved-ips/)

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

Try using different keywords or simplifying your search terms