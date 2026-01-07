---
source: '[unknown - vpc-how-to-create-peering.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Create a VPC Peering | DigitalOcean Documentation

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
*   Create Peering

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create a VPC Peering

Validated on 11 Dec 2024 • Last edited on 28 Aug 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

VPC peering joins two VPC networks with a secure, private connection. This allows resources in those networks to connect to each other’s private IP addresses as if they were in the same network.

VPC peering is available across all regions and enables routing between any two VPC networks. The one exception is that peering between datacenters is not available in BLR1.

Peering works with the following resources:

*   **Droplets**
    *   Droplets created after 2 October 2024 on a peered VPC network are configured for peering automatically. If you add a peering to an existing Droplet’s VPC network, restart the Droplet’s networking stack to add the necessary peering route information. See [How to Update Droplet Routes to Enable VPC Peering](/products/networking/vpc/how-to/update-peering-routes/) for instructions.
    *   Droplets created before 2 October 2024 must be updated manually to enable peering traffic. See [How to Update Droplet Routes to Enable VPC Peering](/products/networking/vpc/how-to/update-peering-routes/) for instructions.
*   **Managed Databases**
    *   All managed databases are compatible with VPC peering.
*   **Managed Kubernetes (DOKS)**
    *   Worker nodes created after 2 October 2024 on a peered VPC network are configured for peering automatically. If you created the nodes before this date, or added your first peering connection after the nodes were created, recycle your worker nodes to add the new peering routes.

## Create a VPC Peering Using the CLI[](#create-a-vpc-peering-using-the-cli)

The VPC peering creation command requires you to provide two VPC network IDs for the `--vpc-ids` flag. Use [`doctl vpcs list`](/reference/doctl/reference/compute/region/list/) command to retrieve a list of your VPC networks and their IDs.

How to Create a VPC Peering Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl vpcs peerings create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/vpcs/peerings/create/) for more details:
    
        doctl vpcs peerings create [flags]
    
    The following example creates a VPC Peering named `example-peering-name` :
    
        doctl vpcs peerings create example-peering-name --vpc-ids f81d4fae-7dec-11d0-a765-00a0c91e6bf6,3f900b61-30d7-40d8-9711-8c5d6264b268
    

## Create a VPC Peering Using the API[](#create-a-vpc-peering-using-the-api)

The VPC peering creation call requires you to provide two VPC network IDs for the `vpc_ids` field. Use the [`/v2/vpcs`](/reference/api/digitalocean/#operation/vpcs_list) endpoint to retrieve a list of your VPC networks and their IDs.

How to Create a VPC Peering Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/vpc_peerings`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/vpcPeerings_create).

### cURL[](#create-a-vpc-peering-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name": "my-first-vpc-peering", "vpc_ids": [ "997615ce-132d-4bae-9270-9ee21b395e5d", "e51aed59-3bb1-4a6a-8de0-9d1329e9c997"]}' \
      "https://api.digitalocean.com/v2/vpc_peerings"

## Create a VPC Peering Using the Control Panel[](#create-a-vpc-peering-using-the-control-panel)

To create a VPC peering, click **Networking** in the main menu, then click the **VPC** tab. In the **VPC** tab, click **Actions** then **Create a Peering Connection**. The **Create VPC Peering** window pops up:

![The VPC peering creation interface, showing some instructions, two drop-downs for selecting the two VPCs to peer, a textbox for naming the peering, and 'Cancel' and 'Create peering connection' buttons.](https://docs.digitalocean.com/screenshots/vpc/vpc-create-vpc-peering.8355a0682845b46f8533cd2e37ce4401231be420992e812d86d930c36369487d.png)

In the **Create VPC Peering** window, select a VPC network, and a second VPC network to peer it with. The VPC selection fields update to show matching VPCs as you type.

Create a name for the peering or use the default generated name, then click **Create peering connection** to finish.

## View a VPC’s Peering Connections[](#view-a-vpcs-peering-connections)

To view a VPC network’s peering connections, click **Networking** in the main menu, then click the **VPC** tab. Peering connections are listed under the **Connections** column in the **VPC Networks** list.

You can also click an individual VPC network to go to its details page, then click the **Peering Connections** tab. All active connections are listed, and you can click **Create a Peering Connection** to peer another network to this VPC.

In this article...

*   [Create a VPC Peering Using the CLI](#create-a-vpc-peering-using-the-cli)
*   [Create a VPC Peering Using the API](#create-a-vpc-peering-using-the-api)
*   [Create a VPC Peering Using the Control Panel](#create-a-vpc-peering-using-the-control-panel)
*   [View a VPC’s Peering Connections](#view-a-vpcs-peering-connections)

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