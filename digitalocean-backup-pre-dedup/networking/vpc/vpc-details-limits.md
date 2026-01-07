---
source: '[unknown - vpc-details-limits.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               VPC Limit | DigitalOcean Documentation

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

*   [Details](/products/networking/vpc/details/) 
*   Limits

[Give Feedback](https://ideas.digitalocean.com/documentation)

# VPC Limit

Validated on 28 Aug 2025 • Last edited on 16 Dec 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

## Limits[](#limits)

*   We do not support individual VPC networks that span between datacenter regions. To privately connect resources between two datacenter regions, [create a VPC peering](/products/networking/vpc/how-to/create-peering/) between VPC networks in each region.
    
*   VPC networks only support up to 10,000 resources, even if the subnet size allows for more.
    
*   You cannot migrate load balancers or Kubernetes clusters between VPC networks. Droplets can be migrated between networks [using snapshots](/products/networking/vpc/how-to/migrate-resources/#migrate-your-droplet-to-a-different-vpc-network), and databases can be directly migrated in their [**Settings** tab](/products/networking/vpc/how-to/migrate-resources/#migrate-your-database-to-a different-vpc-network).
    
*   VPC network ranges cannot overlap with the ranges of other networks in the same account. The IP ranges available for VPC networks are the same as those outlined in [RFC 1918](https://tools.ietf.org/html/rfc1918).
    
*   VPCs do not support multicast, broadcast, or jumbo frames (Ethernet frames with more than 1500 bytes of payload).
    
*   Resources do not currently support multiple private network interfaces and cannot be placed in multiple VPC networks.
    
*   We reserve a few addresses in each VPC network and subnet for internal use, including the network ID and the broadcast ID.
    
*   The `10.244.0.0/16`, `10.245.0.0/16`, `10.246.0.0/24`, and `10.229.0.0/16` IP address ranges are reserved in all regions for DigitalOcean internal use. We also reserve the following IP ranges in these regions:
    
    Region
    
    Reserved Range
    
    AMS2
    
    10.14.0.0/16
    
    AMS3
    
    10.18.0.0/16
    
    ATL1
    
    10.50.0.0/16
    
    BLR1
    
    10.47.0.0/16
    
    FRA1
    
    10.19.0.0/16
    
    LON1
    
    10.16.0.0/16
    
    NYC1
    
    10.10.0.0/16
    
    NYC2
    
    10.13.0.0/16
    
    NYC3
    
    10.17.0.0/16
    
    SFO1
    
    10.12.0.0/16
    
    SFO2
    
    10.46.0.0/16
    
    SFO3
    
    10.48.0.0/16
    
    SGP1
    
    10.15.0.0/16
    
    SYD1
    
    10.49.0.0/16
    
    TOR1
    
    10.20.0.0/16
    

### VPC Peering Limits[](#vpc-peering-limits)

*   Droplets created before 2 October 2024 require manual updates to enable VPC peering traffic. See [How to Update Droplet Routes to Enable VPC Peering](/products/networking/vpc/how-to/update-peering-routes/) for instructions.
    
*   DOKS worker nodes created before 2 October 2024 require recycling to enable VPC peering.
    
*   DOKS worker nodes created on a non-peered VPC network require recycling to enable VPC peering when a new peering connection is added for the first time. Subsequent peering connections work automatically.
    
*   VPC peering between datacenters is not available in BLR1.
    
*   You may not peer two VPCs if either VPC’s IP address range conflicts with a reserved range in the other datacenter.
    

### VPC NAT Gateway Limits public[](#vpc-nat-gateway-limits)

*   VPC NAT Gateway does not support custom routing policies.
    
*   IPv6 is not supported.
    
*   A single NAT gateway cannot attach to multiple VPC networks.
    
*   The `default_gateway` setting is not implemented.
    

## Known Issues[](#known-issues)

*   When creating new resources, the **VPC Network** drop-down menu on the create page can only list up to 50 VPC networks. We are working to increase this limit.
    
*   In DOKS clusters without VPC-native networking using Network Load Balancers (NLB) for ingress traffic, [overriding the default route with the routing agent](/products/kubernetes/how-to/use-routing-agent/#override-default-route) causes routing configuration issues. As a workaround, use a [VPC-native networking cluster](/products/kubernetes/how-to/create-clusters/#create-a-cluster-with-vpc-native-networking).
    
    If you cannot use a VPC-native cluster, you can run the ingress workloads on dedicated nodes and update the route definition with your default route override to exclude those nodes. This allows the NLB to operate correctly without conflicting with the routing configuration.
    

In this article...

*   [Limits](#limits)
    *   [VPC Peering Limits](#vpc-peering-limits)
    *   [VPC NAT Gateway Limits](#vpc-nat-gateway-limits)
*   [Known Issues](#known-issues)

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

Try using different keywords or simplifying your search