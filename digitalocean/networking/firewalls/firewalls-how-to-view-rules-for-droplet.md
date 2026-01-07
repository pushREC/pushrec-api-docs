---
source: '[unknown - firewalls-how-to-view-rules-for-droplet.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to View All Firewall Rules Applied to a Droplet | DigitalOcean Documentation

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

*   [How-Tos](/products/networking/firewalls/how-to/) 
*   View Rules for Droplets

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to View All Firewall Rules Applied to a Droplet

Validated on 4 Sep 2019 • Last edited on 17 Apr 2025

DigitalOcean Cloud Firewalls are a network-based, stateful firewall service for Droplets provided at no additional cost. Cloud firewalls block all traffic that isn’t expressly permitted by a rule.

To see the firewall rules currently applied to a Droplet, click the Droplet’s name, then visit its **Networking** page which is linked in the left-hand menu.

When you haven’t applied any firewalls to the Droplet, the page displays a message saying as much and provides a **Manage Firewalls** button, which leads directly to the firewalls overview page.

![Droplet Networking page with no firewalls added and Manage Firewalls highlighted](https://docs.digitalocean.com/screenshots/firewalls/droplet-networking-page.733df3d38052920a764c7093b5f75ab8292bf37124203a411db34a48af543451.png)

With at least one firewall applied to the Droplet, the firewall’s name appears below the **Firewalls** section header, followed by its **Inbound** and **Outbound** rules.

When you’ve applied more than one firewall to the Droplet, the name of each firewall appears under the Firewalls header, and the union of all of the Firewalls’ rules is displayed:

![The combined ruleset of multiple Cloud Firewalls](https://docs.digitalocean.com/screenshots/firewalls/combined-ruleset.d0097b3e49f0f66faac9b636761582acafd4b44ab75a38feb2c21543a26b5610.png)

Note

If two firewalls contain identical rules, only one appears in the table. Learn more about [organizing firewalls](/products/networking/firewalls/concepts/organization/).

You can click any Firewall’s name to [configure the firewall’s rules](/products/networking/firewalls/how-to/configure-rules/).

In this article...

[How to View All Firewall Rules Applied to a Droplet](https://docs.digitalocean.com/products/networking/firewalls/how-to/view-rules-for-droplet/)

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

Try using different keywords or simplifying