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
source_url: https://docs.digitalocean.com/products/networking/firewalls/getting-started/quickstart/
domain: docs.digitalocean.com
---
                Firewalls Quickstart | DigitalOcean Documentation

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

*   [Getting Started](/products/networking/firewalls/getting-started/) 
*   Quickstart

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Firewalls Quickstart

Validated on 29 Mar 2023 • Last edited on 24 Jan 2025

DigitalOcean Cloud Firewalls are a network-based, stateful firewall service for Droplets provided at no additional cost. Cloud firewalls block all traffic that isn’t expressly permitted by a rule.

You can create a new cloud firewall from the control panel, the API, or the CLI.

*   To create a firewall from the control panel, use [the firewall creation page](https://cloud.digitalocean.com/networking/firewalls/new).
    
*   To create a firewall from the API, use the [`/v2/firewalls` endpoint](/reference/api/digitalocean/#operation/firewalls_create).
    
*   To create a firewall from the CLI, use [`doctl compute firewall create`](/reference/doctl/reference/compute/firewall/create/).
    

When you create a firewall, you need to specify its name, its inbound and outbound rules, and which Droplets the firewall rules apply to.

## Inbound Rules[](#inbound-rules)

Inbound firewall rules define what traffic to allow to the server, on which ports, and from which sources. If you do not configure inbound rules, the server does not allow any incoming traffic.

The suggested inbound rule in the control panel allows SSH connections on port 22 from anywhere so you can administer any Droplets behind this firewall from a terminal:

![The inbound rules section of the cloud firewall create page](https://docs.digitalocean.com/screenshots/firewalls/create/inbound-rules.9fecadc141f7ce8315d597ea2bd66488fb21cb3ef7ea16085ffde5da6e0f53cb.png)

## Outbound Rules[](#outbound-rules)

Outbound firewall rules define what traffic to allow to leave the server, on which ports, and to which destinations. If you do not configure outbound rules, the server does not allow any outbound traffic.

The suggested outbound rules in the control panel permit all traffic to any destination on any port to make it easier to set up a new server because many fundamental services rely on outbound connection:

![The outbound rules section of the cloud firewall create page](https://docs.digitalocean.com/screenshots/firewalls/create/outbound-rules.7e40056b0274d5df297fe2a6a9a5505d5735b0c7b61963dccdc7ee0c2f0b5d45.png)

## Apply to Droplets[](#apply-to-droplets)

You can choose to apply the firewall rules to individual Droplets by name or [by tag](/products/droplets/how-to/tag/). Using tags lets you apply firewalls rules to Droplets as you create them and simplifies managing your Droplets in bulk.

In this article...

*   [Inbound Rules](#inbound-rules)
*   [Outbound Rules](#outbound-rules)
*   [Apply to Droplets](#apply-to-droplets)

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