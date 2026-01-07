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
source_url: https://docs.digitalocean.com/products/networking/vpc/how-to/add-ha-to-partner-attachment/
domain: docs.digitalocean.com
---
                How to Add High Availability to a Partner Attachment | DigitalOcean Documentation

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
*   Add High Availability to Partner Attachment

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Add High Availability to a Partner Attachment

Validated on 17 Jun 2025 • Last edited on 17 Jun 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

DigitalOcean’s Partner Network Connect lets you establish high-bandwidth, low-latency network connections directly between DigitalOcean VPC networks and other public cloud providers or on-premises datacenters.

High availability (HA) makes these connections more reliable by adding a second, redundant connection. When the first connection fails or degrades, traffic automatically shifts to the second.

Adding high availability to a partner attachment creates a second partner attachment that is linked with the first, where DigitalOcean handles the following automatically:

*   Placing the new partner attachment in a different diversity zone
*   Monitoring the connection for traffic disruption
*   Failing over to the redundant connection when necessary

Note

While high availability increases reliability, DigitalOcean cannot make end-to-end service level guarantees for Partner Network Connect, as parts of the end-to-end connection are provided by your network as a service (NaaS) provider and other downstream partners.

## Add High Availability to a Partner Attachment[](#add-high-availability-to-a-partner-attachment)

To start using high availability partner attachments, first [contact support](https://cloudsupport.digitalocean.com) or your account manager to enable this feature for your team.

Once your team is enabled, you can add high availability to your existing partner attachments. If you haven’t already, [create a partner attachment](/products/networking/vpc/how-to/create-partner-attachment/).

When your partner attachment is created, use the control panel or the DigitalOcean API to add a second, high availability connection to it.

 Control Panel

In the control panel’s **Networking** section, click the [**Multi-cloud Integrations**](https://cloud.digitalocean.com/networking/multi-cloud-integrations/) tab.

Under **Partner Network Connect** click on the name of the partner attachment you’d like to add high availability to. This loads the attachment’s details page.

Scroll down to the **Add High Availability** button and click it. If you don’t see the button, make sure high availability is enabled for your team account. Reach out to your account manager or [contact support](https://cloudsupport.digitalocean.com) for assistance.

Clicking the button brings up the **Add high availability** window. You can accept all the default configuration options, or update the name and connection details to meet your needs.

Click the **Add high availability** button at the bottom of the window to finish the process. You are taken back to the details page of the original partner attachment. The pane with the **Add High Availability** button is now titled **High Availability Partner Attachment** and shows a summary of the HA partner attachment. Click **View details** to go to the details page of the HA partner attachment to finish its setup.

 API

To add high availability to a partner attachment using the DigitalOcean API, create a second partner attachment that is linked to the first using the `parent_uuid` parameter. This automatically establishes the high availability relationship.

First, retrieve the ID of the existing partner attachment. This is the _parent_ partner attachment. You can list all of your partner attachment names and IDs using `doctl`:

    doctl network attachment list --format Name,ID

Or using the API:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/partner_network_connect/attachments"

Use the parent partner attachment ID in the next API call.

Send a POST request to the `/v2/partner_network_connect/attachments` endpoint with a JSON payload like the following. Replace `<parent-attachment-id>` with the ID you retrieved previously, and create a name for `<attachment-name>`.

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      --data-binary @- \
      "https://api.digitalocean.com/v2/partner_network_connect/attachments" <<EOF
    {
      "parent_uuid": "<parent-attachment-id>",
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

This is the [normal `create` call for a new partner attachment](/products/networking/vpc/how-to/create-partner-attachment/) with an additional `parent_uuid` parameter that links the two partner attachments together.

The remaining parameters are still required. `region`, `naas_provider`, and the `vpc_ids` list must match the configuration of the parent partner attachment. The `connection_bandwidth_in_mbps` parameter does not need to match.

## Complete the Connection[](#complete-the-connection)

After you’ve created the high availability partner attachment, you still need to set up the other side of the connection with your Network as a Service provider. Refer to the [_Create a Megaport Cloud Router_ section of _How to Create a Partner Attachment_](/products/networking/vpc/how-to/create-partner-attachment/#create-a-megaport-cloud-router) for help completing the full setup process.

In this article...

*   [Add High Availability to a Partner Attachment](#add-high-availability-to-a-partner-attachment)
*   [Complete the Connection](#complete-the-connection)

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