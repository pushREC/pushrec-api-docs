---
source: '[unknown - vpc-how-to-create-nat-gateway.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Create a NAT Gateway | DigitalOcean Documentation

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
*   Create NAT Gateway

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create a NAT Gateway

Validated on 19 Nov 2025 • Last edited on 19 Nov 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

VPC Network Address Translation (NAT) Gateway is a software-defined NAT Gateway service that centralizes outbound internet access for VPC resources within a datacenter. This enables isolating backend IPs while maintaining secure internet access.

You can create NAT gateways using the control panel, the command line `doctl`, or the DigitalOcean API.

## Create a NAT Gateway Using the CLI[](#create-a-nat-gateway-using-the-cli)

To create a NAT gateway, you need to provide the ID of a VPC network to place the gateway in. You can find a list of your VPC networks and their IDs using the [`doctl vpcs list`](/reference/doctl/reference/compute/region/list/) command.

How to Create a NAT Gateway Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute vpc-nat-gateway create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/vpc-nat-gateway/create/) for more details:
    
        doctl compute vpc-nat-gateway create [flags]
    

When provisioning of the gateway starts, the state of the gateway displayed in the `State` column, updates to `PROVISIONING` instead of `NEW`. Then, it changes to `ACTIVE` when the provisioning process completes.

Next, you can set up your backend resources to route traffic through the gateway, as described in [How to Configure Droplets for NAT Gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/) or [How to Configure DOKS for NAT Gateway](/products/networking/vpc/how-to/configure-doks-nat-gateway/).

## Create a NAT Gateway Using the API[](#create-a-nat-gateway-using-the-api)

To create a NAT gateway, you need to provide the ID of a VPC network. You can find a list of your VPC networks and their IDs by using the [`/v2/vpcs`](/reference/api/digitalocean/#operation/vpcs_list) endpoint.

How to Create a NAT Gateway Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/vpc_nat_gateways`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/vpcnatgateways_create).

### cURL[](#create-a-nat-gateway-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{
        "name": "test-vpc-nat-gateways",
        "type": "PUBLIC",
        "region": "tor1",
        "size": 1,
        "vpcs": [
          {
            "vpc_uuid": "0eb1752f-807b-4562-a077-8018e13ab1fb",
            "default_gateway": true
          }
        ],
        "udp_timeout_seconds": 30,
        "icmp_timeout_seconds": 30,
        "tcp_timeout_seconds": 30
      }' \
      "https://api.digitalocean.com/v2/vpc_nat_gateways"

The `state` of the gateway is `NEW` until `PROVISIONING` starts, then it becomes `ACTIVE` when the provisioning process completes.

Read [How to Configure Droplets for NAT Gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/) or [How to Configure DOKS for NAT Gateway](/products/networking/vpc/how-to/configure-doks-nat-gateway/) to set up your backend resources to route traffic through the gateway.

## Create a NAT Gateway Using the Control Panel[](#create-a-nat-gateway-using-the-control-panel)

To create a NAT gateway using the control panel, click **Networking** in the left menu, then click the **VPC** tab. In the **VPC** tab, click **Actions**, then **Create a NAT Gateway**.

On the **Create NAT Gateway** page, configure the following options:

### Choose a region[](#choose-a-region)

Choose the NAT gateway’s datacenter region.

### Select a VPC[](#select-a-vpc)

Select a VPC network from any datacenter within the chosen region. The VPC network list is automatically filtered based on the selected region and the search terms.

### Choose a size[](#choose-a-size)

The NAT gateway’s size scales the cost, available bandwidth, and outbound data transfer allotment.

### Timeouts[](#timeouts)

Enter the desired idle timeouts in seconds for TCP, UDP, and ICMP connections.

#### Set as default IP route for this VPC[](#set-as-default-ip-route-for-this-vpc)

Select this checkbox to set this NAT gateway as the default IP route for the VPC network. Droplets configured to use the VPC gateway IP automatically route through the default NAT gateway. Only one NAT gateway can be set as the default gateway for a VPC at a time. Read [How to Configure Droplets for NAT Gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/) for instructions.

### Finalize[](#finalize)

Finalize the NAT gateway by optionally creating a unique name for it. You can change the name at any time.

Review your total cost in the summary area at the upper-right corner of the control panel, then click **Create NAT Gateway** to create the NAT gateway.

After the provisioning completes, you can see an overview of the NAT gateway’s configuration and costs in the **Overview** tab.

![Screenshot of a NAT gateway details page showing the Overview tab with Configuration Details, Monthly Cost, and Connection Details cards](https://docs.digitalocean.com/screenshots/vpc/vpc-nat-gateway-details.41bf938c4a54d941db01de4046dc94b9c91b50c3088fd52fcb33f01e804867d8.png)

Note the **Routing table IP address**, which you need to configure your Droplet or DOKS routing tables to send traffic through the gateway. Read [How to Configure Droplets for NAT Gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/) or [How to Configure DOKS for NAT Gateway](/products/networking/vpc/how-to/configure-doks-nat-gateway/) for instructions.

In this article...

*   [Create a NAT Gateway Using the CLI](#create-a-nat-gateway-using-the-cli)
*   [Create a NAT Gateway Using the API](#create-a-nat-gateway-using-the-api)
*   [Create a NAT Gateway Using the Control Panel](#create-a-nat-gateway-using-the-control-panel)
    *   [Choose a region](#choose-a-region)
    *   [Select a VPC](#select-a-vpc)
    *   [Choose a size](#choose-a-size)
    *   [Timeouts](#timeouts)
        *   [Set as default IP route for this VPC](#set-as-default-ip-route-for-this-vpc)
    *   [Finalize](#finalize)

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

Try using different keywords or simplifying your se