---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - vpc
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/vpc/getting-started/quickstart/
domain: docs.digitalocean.com
---
                VPC Quickstart | DigitalOcean Documentation

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

*   [Getting Started](/products/networking/vpc/getting-started/) 
*   Quickstart

[Give Feedback](https://ideas.digitalocean.com/documentation)

# VPC Quickstart

Validated on 28 Apr 2020 • Last edited on 8 May 2024

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

## Create a VPC Network[](#create-a-vpc-network)

To create a VPC network:

1.  From the [control panel](https://cloud.digitalocean.com), click **Networking** in the main menu, then click the **VPC** tab. In the **VPC** tab, click **Create VPC Network**.
    
2.  Choose a [datacenter region](/products/droplets/#regional-availability). You cannot add resources to VPC networks that reside in different datacenter regions.
    
3.  Select how you want your network’s IP range to be generated. We strongly recommend choosing **Generate an IP range for me** to avoid overlapping network ranges.
    
4.  Name the network and, optionally, add a description. You can change the name and description after creation.
    
5.  Click **Create VPC Network**.
    

## Add a New Resource to a VPC[](#add-a-new-resource-to-a-vpc)

To add a new resource to a VPC network:

1.  From the **Create** menu in the top right of the [control panel](https://cloud.digitalocean.com), click the kind of resource you want to create, either **Droplets**, **Clusters**, **Databases**, or **Load Balancers**.
    
2.  On the create page, choose the specifications for your resource, including the VPC network. You must create the resource in the same [datacenter region](/products/droplets/#regional-availability) as the VPC network.
    
3.  Enter a name for the resource, then click **Create**.
    

The new resource is automatically added to the VPC network on creation.

## Migrate an Existing Droplet to a VPC Network[](#migrate-an-existing-droplet-to-a-vpc-network)

To migrate an existing Droplet to a different VPC network, you need to create a [snapshot](/products/snapshots/) of the Droplet and then recreate the Droplet in the network:

1.  Shut down the Droplet with `sudo shutdown -h now`.
    
2.  From the [control panel](https://cloud.digitalocean.com), click the Droplet you want to snapshot.
    
3.  From the Droplet’s details page, click **Snapshots**, then click **Take Snapshot**. This creates an image of the Droplet in its current state that can be used to create new Droplets.
    
4.  From the **Create** menu, click **Droplets**.
    
5.  On the **Create Droplets** page, click the **Snapshots** tab and select the snapshot you want to create a new Droplet from.
    
6.  Choose a plan for the Droplet.
    
7.  Under **Choose datacenter region**, choose the region that your VPC network resides in, then select the target VPC network from the **Choose a VPC network** menu.
    
8.  Fill out the rest of the choices on the create page, then click **Create**. The new Droplet is created within your VPC network.
    

In this article...

*   [Create a VPC Network](#create-a-vpc-network)
*   [Add a New Resource to a VPC](#add-a-new-resource-to-a-vpc)
*   [Migrate an Existing Droplet to a VPC Network](#migrate-an-existing-droplet-to-a-vpc-network)

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

Try using different keywords or simplifying your sear