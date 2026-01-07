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
source_url: https://docs.digitalocean.com/products/networking/firewalls/
domain: docs.digitalocean.com
---
                Cloud Firewalls | DigitalOcean Documentation

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

*   Cloud Firewalls

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Cloud Firewalls

Generated on 6 Jan 2026

DigitalOcean Cloud Firewalls are a network-based, stateful firewall service for Droplets provided at no additional cost. Cloud firewalls block all traffic that isn’t expressly permitted by a rule.

Most Viewed Cloud Firewalls Articles

1.  [How to Configure Firewall Rules](/products/networking/firewalls/how-to/configure-rules/ "Create, modify, or delete firewall rules to restrict Droplets' inbound and outbound traffic based on ports, sources, and destinations.")
2.  [Firewalls Pricing](/products/networking/firewalls/details/pricing/)
3.  [How to Create Firewalls](/products/networking/firewalls/how-to/create/ "Create a cloud firewall to restrict network traffic to and from specified Droplets.")
4.  [How do I debug a firewall causing connection problems with my Droplet?](/support/how-do-i-debug-a-firewall-causing-connection-problems-with-my-droplet/ "Diagnose and troubleshoot firewall issues that could be causing network connectivity issues.")
5.  [How to Add and Remove Droplets from Firewalls](/products/networking/firewalls/how-to/manage-droplets/ "Add Droplets to a firewall by name or by tag to apply the firewall's rules.")
6.  [How can I allowlist the DigitalOcean metrics agent with my firewall?](/support/how-can-i-allowlist-the-digitalocean-metrics-agent-with-my-firewall/ "Configure your firewall to allow outgoing traffic through ports 80 and 443.")
7.  [My firewalls are not working correctly](/support/my-firewalls-are-not-working-correctly/ "Use this guide to gather information about your firewalls and diagnose problems.")
8.  [Firewalls Concepts](/products/networking/firewalls/concepts/ "Explanations and definitions of core concepts in Firewalls.")
9.  [Firewalls Details](/products/networking/firewalls/details/ "Features, plans and pricing, availability, limits, known issues, and more.")
10.  [Firewalls Quickstart](/products/networking/firewalls/getting-started/quickstart/ "Just the essentials to go from zero to working in a few minutes.")

[](/products/networking/firewalls/getting-started/)

![](https://docs.digitalocean.com/images/icons/firewalls.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/networking/firewalls/how-to/)

![](https://docs.digitalocean.com/images/icons/firewalls.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/networking/firewalls/reference/)

![](https://docs.digitalocean.com/images/icons/firewalls.svg)

Reference

Native and third-party tools, troubleshooting, and answers to frequently asked questions.

[](/products/networking/firewalls/concepts/)

![](https://docs.digitalocean.com/images/icons/firewalls.svg)

Concepts

Explanations and definitions of core concepts in Firewalls.

[](/products/networking/firewalls/details/)

![](https://docs.digitalocean.com/images/icons/firewalls.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

[](/products/networking/firewalls/support/)

![](https://docs.digitalocean.com/images/icons/firewalls.svg)

Support

Get help with technical support and answers to frequently asked questions.

## Latest Updates[](#latest-updates)

### 27 June 2024[](#27-june-2024)

*   Control plane firewalls are now available in [early availability](/platform/product-lifecycle/#summary) for select DOKS customers. For more information, see [How to Add a Control Plane Firewall](/products/kubernetes/how-to/add-control-plane-firewall/).
    

### 1 July 2023[](#1-july-2023)

*   We no longer bill for outbound data transfer that we determine is dropped by a DigitalOcean firewall rule. Learn more about [bandwidth billing](/platform/billing/bandwidth/).
    

### 3 August 2021[](#3-august-2021)

*   You can now add Kubernetes clusters as [sources or destinations in Cloud Firewall rules](/products/networking/firewalls/how-to/configure-rules/#custom-rules).
    

For more information, see [all Cloud Firewalls release notes](https://docs.digitalocean.com/release-notes/firewalls/).

In this article...

[Cloud Firewalls](https://docs.digitalocean.com/products/networking/firewalls/)

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