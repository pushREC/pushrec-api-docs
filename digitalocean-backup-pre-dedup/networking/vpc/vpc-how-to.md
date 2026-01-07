---
source: '[unknown - vpc-how-to.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               VPC How-Tos | DigitalOcean Documentation

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

*   How-Tos

[Give Feedback](https://ideas.digitalocean.com/documentation)

# VPC How-Tos

Generated on 6 Jan 2026

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

## Getting Started[](#getting-started)

[](/products/networking/vpc/how-to/create/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Create a VPC

Create a VPC and add resources like Droplets, load balancers, managed databases, and Kubernetes clusters to it.

[](/products/networking/vpc/how-to/add-resources/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Add New Resources to a VPC Network

Automatically add new resources to a VPC network when you create them.

[](/products/networking/vpc/how-to/enable/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Enable VPC Networking on Existing Droplets

Manually enable VPC networking on an existing Droplet.

[](/products/networking/vpc/how-to/use-local-dns-resolver/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Use the VPC-local DNS Resolver

Use the VPC-local DNS resolver for improved performance and reliability.

## VPC Network Management[](#vpc-network-management)

[](/products/networking/vpc/how-to/destroy/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Destroy a VPC

Permanently delete VPC networks from your account.

[](/products/networking/vpc/how-to/migrate-resources/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Migrate Resources Into and Between VPC Networks

Migrate existing Droplets and managed databases into and between VPC networks.

[](/products/networking/vpc/how-to/set-default-vpc/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Set a Default VPC

Set a default VPC for a datacenter region.

## VPC Peering Management[](#vpc-peering-management)

[](/products/networking/vpc/how-to/create-peering/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Create a VPC Peering

Create a VPC peering to connect two VPCs.

[](/products/networking/vpc/how-to/destroy-peering/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Destroy a VPC Peering

Permanently destroy a VPC peering connection.

[](/products/networking/vpc/how-to/update-peering-routes/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Update Routes to Enable VPC Peering

Update routing tables to enable VPC peering.

## NAT Gateway[](#nat-gateway)

[](/products/networking/vpc/how-to/create-nat-gateway/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Create a NAT Gateway

Create a NAT Gateway to centralize outbound access for resources on a VPC.

[](/products/networking/vpc/how-to/destroy-nat-gateway/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Destroy a NAT Gateway

Permanently destroy a NAT Gateway by deleting it via the control panel, command line, or API.

[](/products/networking/vpc/how-to/configure-droplet-nat-gateway/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Configure Droplets for NAT Gateway

Configure IP routes to direct backend Droplet traffic through NAT gateway.

[](/products/networking/vpc/how-to/configure-doks-nat-gateway/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Configure DOKS for NAT Gateway

Use the routing agent to route DOKS traffic through a NAT gateway

## Partner Network Connect[](#partner-network-connect)

[](/products/networking/vpc/how-to/create-partner-attachment/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Create a Partner Attachment

Create a partner attachment to connect VPCs to other clouds or on-premesis networks.

[](/products/networking/vpc/how-to/destroy-partner-attachment/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Destroy a Partner Attachment

Permanently destroy a partner attachment by deleting it via the control panel or API. This action irreversibly removes the connection.

[](/products/networking/vpc/how-to/edit-partner-attachment-vpc/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Edit a Partner Attachment's VPC Networks

Use a partner attachment’s Overview page to add and remove VPC networks

[](/products/networking/vpc/how-to/add-ha-to-partner-attachment/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Add High Availability to a Partner Attachment

Add high availability to a partner attachment to increase its reliability with a redundant connection.

[](/products/networking/vpc/how-to/troubleshoot-partner-attachment/)

![](https://docs.digitalocean.com/images/icons/vpc.svg)

How to Troubleshoot a Partner Attachment

Troubleshoot issues with a partner attachment.

In this article...

[VPC How-Tos](https://docs.digitalocean.com/products/networking/vpc/how-to/)

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