---
source: '[unknown - vpc-how-to-troubleshoot-partner-attachment.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Troubleshoot a Partner Attachment | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/vpc.8e35a29c5ce11122208ae3824979d1635c2e67bfb31236328f0665502135db7e.svg)VPC](/products/networking/vpc/)
*   [Getting Started](/products/networking/vpc/getting-started/)
    *   [Quickstart](/products/networking/vpc/getting-started/quickstart/)
*   [How-Tos](/products/networking/vpc/how-to/)
    *   [Create VPCs](/products/networking/vpc/how-to/create/)
    *   [Destroy VPCs](/products/networking/vpc/how-to/destroy/)
    *   [Add Resources](/products/networking/vpc/how-to/add-resources/)
    *   [Migrate Resources](/products/networking/vpc/how-to/migrate-resources/)
    *   [Enable on Existing Droplets](/products/networking/vpc/how-to/enable/)
    *   [Set Default VPC](/products/networking/vpc/how-to/set-default-vpc/)
    *   [Use VPC-local DNS](/products/networking/vpc/how-to/use-local-dns-resolver/)
    *   [Create Peering](/products/networking/vpc/how-to/create-peering/)
    *   [Destroy Peering](/products/networking/vpc/how-to/destroy-peering/)
    *   [Update Peering Routes](/products/networking/vpc/how-to/update-peering-routes/)
    *   [Create NAT Gateway](/products/networking/vpc/how-to/create-nat-gateway/)
    *   [Destroy NAT Gateway](/products/networking/vpc/how-to/destroy-nat-gateway/)
    *   [Configure Droplets for NAT Gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/)
    *   [Configure DOKS for NAT Gateway](/products/networking/vpc/how-to/configure-doks-nat-gateway/)
    *   [Create Partner Attachment](/products/networking/vpc/how-to/create-partner-attachment/)
    *   [Destroy Partner Attachment](/products/networking/vpc/how-to/destroy-partner-attachment/)
    *   [Edit Partner Attachment VPC](/products/networking/vpc/how-to/edit-partner-attachment-vpc/)
    *   [Add High Availability to Partner Attachment](/products/networking/vpc/how-to/add-ha-to-partner-attachment/)
    *   [Troubleshoot Partner Attachment](/products/networking/vpc/how-to/troubleshoot-partner-attachment/)
*   [Reference](/products/networking/vpc/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/VPCs)
    *   [CLI Reference](/reference/doctl/reference/vpcs/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/vpc/concepts/)
    *   [Plan Custom VPC Network](/products/networking/vpc/concepts/plan-your-network/)
    *   [VPC Best Practices](/products/networking/vpc/concepts/best-practices/)
*   [Details](/products/networking/vpc/details/)
    *   [Features](/products/networking/vpc/details/features/)
    *   [Pricing](/products/networking/vpc/details/pricing/)
    *   [Availability](/products/networking/vpc/details/availability/)
    *   [Limits](/products/networking/vpc/details/limits/)
*   [Support](/products/networking/vpc/support/)

*   [How-Tos](/products/networking/vpc/how-to/) 
*   Troubleshoot Partner Attachment

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Troubleshoot a Partner Attachment

Validated on 1 Apr 2025 • Last edited on 28 May 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

Refer to the following documentation and resources when troubleshooting your partner attachment.

## Troubleshoot with Megaport Cloud Router Looking Glass[](#troubleshoot-with-megaport-cloud-router-looking-glass)

If you are using a Megaport Cloud Router, its Looking Glass tool provides information about connections and routing tables. Refer to the [Megaport Cloud Router Looking Glass docs](https://docs.megaport.com/mcr/mcr-looking-glass/) for information about how to launch the tool and what information it provides.

## Troubleshoot Using the DigitalOcean Control Panel[](#troubleshoot-using-the-digitalocean-control-panel)

Go to the [**Multi-cloud Integrations**](https://cloud.digitalocean.com/networking/multi-cloud-integrations/) tab in the **Networking** section of the control panel. All of your partner attachments are listed under **Partner Network Connect**. The **Status** column shows **Up** or **Down**, where **Down** indicates there is a problem with Megaport or your Megaport configuration. Configuration errors are often made while copying BGP info between platforms. Double-check your BGP configuration.

Click on the **Remote Routes** tab. This tab lists the partner attachment’s learned routes. There are no routes shown until you complete the full end-to-end connection. If you’ve set up the full connection and still see no routes, double-check your BGP settings.

## View Megaport Maintenance and Outage Status[](#view-megaport-maintenance-and-outage-status)

Megaport provides service status updates through its service portal. If your partner attachment shows as **Down** but your configuration is correct, check the [maintenance or outage events](https://docs.megaport.com/portal-admin/monitoring-events/) to see if there’s a known issue.

## Regenerate an Expired Service Key[](#regenerate-an-expired-service-key)

Service keys expire after 90 days. When you use an expired service key to connect Megaport to your partner attachment, you receive the error message `This service key is no longer valid.`.

To fix this, regenerate the service key. First go to the [**Multi-cloud Integrations**](https://cloud.digitalocean.com/networking/multi-cloud-integrations/) tab in the **Networking** section of the control panel. Click the **…** “More” menu to the right of the partner attachment you are setting up. Select **Regenerate service key** from the menu. The service key is regenerated.

In this article...

*   [Troubleshoot with Megaport Cloud Router Looking Glass](#troubleshoot-with-megaport-cloud-router-looking-glass)
*   [Troubleshoot Using the DigitalOcean Control Panel](#troubleshoot-using-the-digitalocean-control-panel)
*   [View Megaport Maintenance and Outage Status](#view-megaport-maintenance-and-outage-status)
*   [Regenerate an Expired Service Key](#regenerate-an-expired-service-key)

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

Try using different keywords or simplifying y