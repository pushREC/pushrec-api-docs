---
source: '[unknown - vpc.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               VPC | DigitalOcean Documentation

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

*   VPC

[Give Feedback](https://ideas.digitalocean.com/documentation)

# VPC

Generated on 6 Jan 2026

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

Most Viewed VPC Articles

1.  [How to Create a NAT Gateway](/products/networking/vpc/how-to/create-nat-gateway/ "Create a NAT Gateway to centralize outbound access for resources on a VPC.")
2.  [How to Enable VPC Networking on Existing Droplets](/products/networking/vpc/how-to/enable/ "Manually enable VPC networking on an existing Droplet.")
3.  [How to Add New Resources to a VPC Network](/products/networking/vpc/how-to/add-resources/ "Automatically add new resources to a VPC network when you create them.")
4.  [How to Create a VPC Peering](/products/networking/vpc/how-to/create-peering/ "Create a VPC peering to connect two VPCs.")
5.  [How to Configure Droplets for NAT Gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/ "Configure IP routes to direct backend Droplet traffic through NAT gateway.")
6.  [How to Plan Your Custom VPC Network](/products/networking/vpc/concepts/plan-your-network/ "Determine the right size for your custom VPC network and learn how to calculate its IP range.")
7.  [VPC Pricing](/products/networking/vpc/details/pricing/)
8.  [Use VPC Networks to Secure Your Servers and Other Best Practices](/products/networking/vpc/concepts/best-practices/ "Develop your infrastructure securely by isolating groups of resources using a VPC and implementing other best security practices.")
9.  [How to Update Routes to Enable VPC Peering](/products/networking/vpc/how-to/update-peering-routes/ "Update routing tables to enable VPC peering.")
10.  [How to Configure DOKS for NAT Gateway](/products/networking/vpc/how-to/configure-doks-nat-gateway/ "Use the routing agent to route DOKS traffic through a NAT gateway")

[](/products/networking/vpc/getting-started/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/networking/vpc/how-to/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/networking/vpc/reference/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

Reference

Native and third-party tools, troubleshooting, and answers to frequently asked questions.

[](/products/networking/vpc/concepts/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

Concepts

Explanations and definitions of core concepts in VPC.

[](/products/networking/vpc/details/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

[](/products/networking/vpc/support/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

Support

Get help with technical support and answers to frequently asked questions.

## Latest Updates[](#latest-updates)

### 19 November 2025[](#19-november-2025)

*   VPC Network Address Translation (NAT) Gateways are now generally available. NAT gateways are a software-defined networking service that centralizes outbound internet access for VPC resources within a datacenter.
    
    Read [How to Create a VPC NAT Gateway](/products/networking/vpc/how-to/create-nat-gateway/) and [How to Configure Droplets for NAT Gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/) to get started.
    

### 30 September 2025[](#30-september-2025)

*   VPC networks now provide an internal DNS resolver on the second-to-last IP address of the network. Configure your Droplets to use the internal resolver for better DNS performance and reliability. Read [How to Use the VPC-local DNS Resolver](/products/networking/vpc/how-to/use-local-dns-resolver/) for more information.
    

### 28 August 2025[](#28-august-2025)

*   VPC Network Address Translation (NAT) Gateways are now available in [public preview](/platform/product-lifecycle/#public-preview). NAT gateways are a software-defined networking service that centralizes outbound internet access for VPC resources within a datacenter. Read [How to Create a VPC NAT Gateway](/products/networking/vpc/how-to/create-nat-gateway/) to get started.
    

For more information, see [all VPC release notes](https://docs.digitalocean.com/release-notes/vpc/).

In this article...

[VPC](https://docs.digitalocean.com/products/networking/vpc/)

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