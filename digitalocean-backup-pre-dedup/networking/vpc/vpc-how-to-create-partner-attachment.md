---
source: '[unknown - vpc-how-to-create-partner-attachment.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Create a Partner Attachment | DigitalOcean Documentation

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
*   Create Partner Attachment

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create a Partner Attachment

Validated on 17 Jun 2025 • Last edited on 28 Aug 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

DigitalOcean’s Partner Network Connect lets you establish high-bandwidth, low-latency network connections directly between DigitalOcean VPC networks and other public cloud providers or on-premises datacenters.

Creating a full end-to-end connection has four main steps:

1.  [Create a partner attachment](#create-a-partner-attachment) on DigitalOcean.
2.  [Create a Megaport Cloud Router](#create-a-megaport-cloud-router) (MCR) on Megaport. You can use an existing MCR if it applies. For specialized setups, such as connecting to an existing on-premises Megaport port, you may not need an MCR at all.
3.  [Create a Virtual Cross Connection](#create-a-virtual-cross-connection-vxc-to-digitalocean) (VXC) on the Megaport Cloud Router and connect it to the partner attachment.
4.  [Create a connection from Megaport to another cloud provider or on-premesis network](#connecting-megaport-to-other-clouds-or-on-premises-datacenters).

This document covers how to create a partner attachment on DigitalOcean and connect it to your Megaport Cloud Router. To help you complete the other side of the connection, see [Connect Megaport to Other Clouds or On-premises Datacenters](#connect-megaport-to-other-clouds-or-on-premises-datacenters) for links to relevant Megaport resources for common partner networks.

## Create a Partner Attachment[](#create-a-partner-attachment)

A partner attachment is a point of connection between DigitalOcean and Megaport. Partner attachments exist in a DigitalOcean region and can connect VPCs from any datacenter within that region.

You can create partner attachments in the control panel, on the command line with `doctl`, or using the DigitalOcean API.

 Control Panel

Go to the [**Multi-cloud Integrations**](https://cloud.digitalocean.com/networking/multi-cloud-integrations/) tab in the **Networking** section of the control panel, then click **Create Partner Attachment**.

On the creation page, configure the following options:

1.  **Choose a region**: partner attachments serve an entire region, not a specific datacenter within the region.
2.  **Choose VPC networks**: select up to five VPC network from any datacenter within the chosen region. The VPC network list is automatically filtered based on the region selected.
3.  **Choose a bandwidth plan**: plans are based on the maximum reserved bandwidth capacity. Transfer is unmetered.
4.  **Configure Border Gateway Protocol settings**: useable defaults are provided for all options, but you may update the **BGP authentication key**, **Peer ASN**, and local and peer router IP addresses.
5.  **Megaport diversity zone**: optionally select the [Megaport diversity zone](https://docs.megaport.com/mcr/mcr-mve-diversity/) the partner attachment connects to. This is mainly used for high-availability setups or if you already have a Megaport Cloud Router in a particular diversity zone.
6.  **Finalize** the partner attachment by optionally creating a unique name for it. You can change the name at any time.

Review your total cost in the summary area at the upper-right corner of the control panel, then click **Create partner attachment** to create the partner attachment.

Once your partner attachment is created, you’re taken to its details page:

![Details page of a partner attachment, showing 'Your partner attachment is ready' and a 'Continue' button](https://docs.digitalocean.com/screenshots/vpc/partner-attachment-creating-detail.e1d0031b1450aba40a56fded8b9ae174e6cf16d0068b74296cec4ee66a0bddcf.png)

Click **Continue** to view the configuration details needed to complete setup on Megaport. This includes a service key and the BGP details you provided earlier. You use the service key once during Megaport setup. The BGP details remain available and editable in the partner attachment’s **Settings** tab.

Proceed to the next step to complete the connection with Megaport.

 CLI

Use [`doctl network attachment create`](/reference/doctl/reference/network/attachment/create/) to create a partner attachment:

    doctl network attachment create \
      --name "example-attachment" \
      --connection-bandwidth-in-mbps 1000 \
      --naas-provider "MEGAPORT" \
      --region "nyc" \
      --vpc-ids "c5537207-ebf0-47cb-bc10-6fac717cd672"

Update the following flags with your own configuration:

*   `--name`: The name of the partner attachment. It can include uppercase or lowercase letters, numbers, and hyphens (`-`).
*   `--connection-bandwidth-in-mbps`: The reserved bandwidth in Mbps. It must match one of the capacities listed on [the pricing page](/products/networking/vpc/details/pricing/). Bandwidth is measured in metric units (for example, 5 Gbps is entered as `5000`).
*   `--naas-provider`: the name of the Network as a Service provider you are connecting the partner attachment to. Currently only `MEGAPORT` is supported.
*   `--region`: Region where the partner attachment is created.
*   `--vpc-ids`: List of DigitalOcean VPC IDs to attach to the partner attachment. You can use [`doctl vpcs list`](/reference/doctl/reference/vpcs/list/) to view your VPCs, their regions, and IDs.

You can optionally use the `--redundancy-zone` flag to specify `MEGAPORT_BLUE` or `MEGAPORT_RED` to place your partner attachment connection in the corresponding [Megaport diversity zone](https://docs.megaport.com/mcr/mcr-mve-diversity/). This is mainly used for high-availability setups or if you already have a Megaport Cloud Router in a particular diversity zone.

The command returns a table of information about the new partner attachment, including an ID that looks similar to `03078143-8a69-4170-a441-36f4b7952570`, and four BGP-related details:

*   BGP Local ASN
*   BGP Local Router IP
*   BGP Peer ASN
*   BGP Peer Router IP

Save the BGP configuration details for use when setting up Megaport in the next section.

Next, retrieve the generated service key using your attachment ID:

    doctl network attachment get-service-key <your_attachment_id>

Replace `<your_attachment_id>` with your ID from the command response.

The command returns a service key. This key is used to connect a Megaport VXC back to DigitalOcean. Save the key for later use.

    Value                                   State      CreatedAt
    18aa1436-8728-44ec-baac-0d2857868749    CREATED    2025-06-11 13:46:46 +0000 UTC

Now retrieve the BGP auth key:

    doctl network attachment get-bgp-auth-key <your_attachment_id>

Replace `<your_attachment_id>` with your ID.

The command responds with an auth key:

    Value
    0xDcJ9lfTxuhSXyitcfZ5MnrK

Save this key to use when configuring BGP on Megaport.

To check the status of the partner attachment, use the `doctl network attachment get` command:

    doctl network attachment get <your_attachment_id>

The `State` of the partner attachment is `CREATED` when it is created but not yet fully connected.

 API

Send a POST request to the `/v2/partner_network_connect/attachments` endpoint with a JSON payload like the following:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DO_TOKEN" \
      --data-binary @- \
      "https://api.digitalocean.com/v2/partner_network_connect/attachments" <<EOF
    {
      "name": "<attachment-name>",
      "connection_bandwidth_in_mbps": 1000,
      "region": "AMS",
      "naas_provider": "MEGAPORT",
      "vpc_ids": [
        "c140286f-e6ce-4131-8b7b-df4590ce8d6a",
        "994a2735-dc84-11e8-80bc-3cfdfea9fba1"
      ]
    }
    EOF

Update these configuration options in your request:

*   `name`: The name of the partner attachment. It can include uppercase or lowercase letters, numbers, and hyphens (`-`).
*   `connection_bandwidth_in_mbps`: The reserved bandwidth in Mbps. It must match one of the capacities listed on [the pricing page](/products/networking/vpc/details/pricing/), or the API returns the error `invalid connection bandwidth rate provided`. Bandwidth is measured in metric units (for example, 5 Gbps is entered as `5000`).
*   `region`: Region where the partner attachment is created.
*   `vpc_ids`: List of DigitalOcean VPC IDs to attach to the partner attachment. You can use [`doctl vpcs list`](/reference/doctl/reference/vpcs/list/) to view your VPCs, their regions, and IDs.

You can optionally use the `redundancy-zone` key to specify `MEGAPORT_BLUE` or `MEGAPORT_RED` to place your partner attachment connection in the corresponding [Megaport diversity zone](https://docs.megaport.com/mcr/mcr-mve-diversity/). This is mainly used for high-availability setups or if you already have a Megaport Cloud Router in a particular diversity zone.

The API response should look similar to the example below. It includes the ID of the new resource (`1cf0aad8-292b-40f8-9d32-1fbde6e04991` in this example) and the generated BGP configuration (excluding the auth key).

    {
      "partner_attachment": {
        "id": "1cf0aad8-292b-40f8-9d32-1fbde6e04991",
        "name": "example-ams",
        "urn": "do:partner_attachment:1cf0aad8-292b-40f8-9d32-1fbde6e04991",
        "state": "CREATING",
        "connection_bandwidth_in_mbps": 1000,
        "region": "AMS",
        "naas_provider": "MEGAPORT",
        "vpc_ids": [
          "c140286f-e6ce-4131-8b7b-df4590ce8d6a",
          "994a2735-dc84-11e8-80bc-3cfdfea9fba1"
        ],
        "bgp": {
          "local_asn": 64532,
          "local_router_ip": "169.254.0.1/29",
          "peer_asn": 133937,
          "peer_router_ip": "169.254.0.6/29"
        },
        "created_at": "2024-12-13T12:37:52.152922792Z"
      }
    }

Save the BGP configuration details for use when setting up Megaport in the next section.

Next, retrieve the generated service key:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DO_TOKEN" \
      "https://api.digitalocean.com/v2/partner_network_connect/attachments/<your_attachment_id>/service_key"

Replace `<your_attachment_id>` with your ID from the previous API response.

The API returns a service key. This key is used to connect a Megaport VXC back to DigitalOcean. Save the key for later use.

    {
      "service_key": {
        "created_at": "2024-12-13T12:37:55Z",
        "value": "6e4fa7f8-8ab2-47c4-956f-dd3be7ca1367"
      }
    }

Now retrieve the BGP auth key:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DO_TOKEN" \
      "https://api.digitalocean.com/v2/partner_network_connect/attachments/<your_attachment_id>/bgp_auth_key"

Replace `<your_attachment_id>` with your ID.

The API responds with an auth key:

    {
      "bgp_auth_key": {
        "value": "0xGb6eHCZQKiaJXtgd1HdULK22m0Rs0zWmR3akyRdOL"
      }
    }

Save this key to use when configuring BGP on Megaport.

To check the status of the partner attachment, send a `GET` request to its URL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DO_TOKEN" \
    "https://api.digitalocean.com/v2/partner_network_connect/attachments/<your_attachment_id>"

The `state` of the partner attachment is `CREATED` when it is created but not yet fully connected.

## Create a Megaport Cloud Router[](#create-a-megaport-cloud-router)

Next, create a Megaport Cloud Router (MCR). The MCR routes traffic between the Virtual Cross Connections (VXCs) attached to it. If you already have an MCR, you can use the existing one.

Go to the Megaport website, then in the Megaport portal, on the top of the [**Services** page](https://portal.megaport.com/services), click the link to the [Create MCR page](https://portal.megaport.com/create-megaport/mcr).

![Screenshot of the Megaport portal showing a blue 'Create MCR' button and a tooltip explaining more about what an MCR is](https://docs.digitalocean.com/screenshots/vpc/partner-attachment-megaport-mcr.b398876b33d0c45e63fc4835047629d4199722face7d0cdfdac66856778e538b.png)

1.  Select a location, preferably one close to the partner attachment.
2.  Choose a rate limit for your MCR. This setting cannot change after creation.
3.  Choose a name for the MCR.
4.  Select your minimum term. The default is **12 months**. If you’re testing Partner Network Connect, choose **No Minimum Term**.
5.  Leave the **MCR ASN** set to the default (`133937`) unless you have a specific reason to change it.

When you’re done configuring the MCR, you still need to order it to complete the process. Set up your billing details and finish ordering the MCR before proceeding.

Refer to Megaport’s [Creating an MCR](https://docs.megaport.com/mcr/creating-mcr/) documentation for more in-depth information on this process.

## Create a Virtual Cross Connection (VXC) to DigitalOcean[](#create-a-virtual-cross-connection-vxc-to-digitalocean)

To make a connection between Megaport and the partner attachment at DigitalOcean, add a Virtual Cross Connection (VXC) to your Megaport Cloud Router.

This step requires the service key, BGP auth key, and BGP configuration from your partner attachment.

First, find your MCR **Services** list in the Megaport portal.

![Screenshot of the Megaport portal showing a MCR listing. The 'test_mcr_sfo' entry has a blue 'Connect' button highlighted with a tooltip saying 'Add new connection to this MCR'](https://docs.digitalocean.com/screenshots/vpc/partner-attachment-mcr-add-connection.808f375d3033ba80198eca671cb316da0242d328c50b4b572ab503fb5fbc6b91.png)

Click the **\+ Connection** button to add a VXC.

1.  Select **Enter Service Key** as the destination type.
2.  Type the service key you received when creating the partner attachment. Megaport checks the key immediately and marks it as a **Valid Service Key**.
3.  Choose a name for the connection.
4.  Choose a **Rate Limit**. You **cannot** change this after the VXC is created. The maximum is based on the bandwidth selected when you created the partner attachment.
5.  Select your minimum term. Check this carefully, as the default is **12 months**.
6.  Click **Next**.
7.  Set **Interface IP Address** to the partner attachment’s **Peer router IP**.
8.  Click **Add BGP Connection**. For **Local IP**, select the **Interface IP Address** you configured. Then, type the partner attachment’s BGP details. Remember to flip **Local** and **Peer** (for example, the `Local router IP` from DigitalOcean is the **Peer IP** for Megaport). Use the **BGP authentication key** for the **BGP Password**.
9.  Click **Add** to finish adding the BGP connection, then click **Next** to continue to the confirmation page.
10.  Review your information, then click **Add VXC** to add the VXC to your MCR.

As with creating the MCR, you must order the VXC to complete the process.

Refer to Megaport’s [Creating an MCR VXC](https://docs.megaport.com/mcr/mcr-vxc/) documentation for more in-depth information.

## Verify the Connection Between DigitalOcean and Megaport[](#verify-the-connection-between-digitalocean-and-megaport)

After the MCR and VXC are configured and ordered, go to the VXC **Configuration Details** page. The **Service Status** and **BGP IP Address** status indicators turn green when the connection is fully established.

Back in the DigitalOcean Control Panel, return to your partner attachment’s details page. The connection status indicates **Established** when the connection from DigitalOcean to the Megaport Cloud Router is complete.

## Connect Megaport to Other Clouds or On-premises Datacenters[](#connect-megaport-to-other-clouds-or-on-premises-datacenters)

To finish connecting your DigitalOcean VPC networks to other clouds or datacenters you need to configure a second connection from your Megaport Cloud Router. The type of connections available are listed on Megaport’s [Creating an MCR VXC](https://docs.megaport.com/mcr/mcr-vxc/) page.

The following documentation links cover some common cloud provider and on-premesis destinations:

*   [Creating MCR Connections to AWS](https://docs.megaport.com/cloud/mcr/aws/)
*   [Creating MCR Connections to Azure using ExpressRoute](https://docs.megaport.com/cloud/mcr/azure/)
*   [Creating MCR Connections to Google Cloud Services.](https://docs.megaport.com/cloud/mcr/google/)
*   [Creating a Private VXC](https://docs.megaport.com/connections/private-vxc/)
*   [Megaport Marketplace](https://docs.megaport.com/marketplace/)

In this article...

*   [Create a Partner Attachment](#create-a-partner-attachment)
*   [Create a Megaport Cloud Router](#create-a-megaport-cloud-router)
*   [Create a Virtual Cross Connection (VXC) to DigitalOcean](#create-a-virtual-cross-connection-vxc-to-digitalocean)
*   [Verify the Connection Between DigitalOcean and Megaport](#verify-the-connection-between-digitalocean-and-megaport)
*   [Connect Megaport to Other Clouds or On-premises Datacenters](#connect-megaport-to-other-clouds-or-on-premises-datacenters)

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

Try using different keywords or sim