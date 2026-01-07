---
source: '[unknown - vpc-details-features.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               VPC Features | DigitalOcean Documentation

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
*   Features

[Give Feedback](https://ideas.digitalocean.com/documentation)

# VPC Features

Validated on 19 Nov 2025 • Last edited on 18 Dec 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are private networks that contain collections of resources that are isolated from the public internet and other VPC networks within your account, [project](/products/projects/) or between [teams](/platform/teams/) in the same datacenter region. This means your resources, such as Droplets and databases, can reside in a network that is only accessible to other resources in the same network.

You can use VPC networks to organize and isolate resources in a more secure infrastructure for your applications, execution environments, and tenancies. VPC networks provide control over your networking environment: you can choose your network’s IP range, set up cloud firewalls, configure NAT gateways, connect VPC networks through peering, and connect to external networks through Partner Network Connect.

You can create a variety of new resources in a VPC network, but you can’t migrate all kinds of resources between networks. The following table lists DigitalOcean resources compatible with VPC networks and which ones support migration:

Resource Type

Create within VPCs

Migrate between VPCs

Droplets

[Creation supported](/products/networking/vpc/how-to/add-resources/).

[Migration supported using snapshots](/products/networking/vpc/how-to/migrate-resources/#migrate-your-droplet-to-a-different-vpc-network).

Managed databases

[Creation supported](/products/networking/vpc/how-to/add-resources/).

[Native migration supported](/products/networking/vpc/how-to/migrate-resources/#migrate-your-database-to-a-different-vpc-network).

Kubernetes clusters

[Creation supported](/products/networking/vpc/how-to/add-resources/).

Not supported.

Load balancers

[Creation supported](/products/networking/vpc/how-to/add-resources/).

Not supported.

NAT gateways

[Creation supported](/products/networking/vpc/how-to/create-nat-gateway/).

Not supported.

Spaces

Not applicable.

Not applicable.

Volumes

Not applicable.

Not applicable.

Note

[Cloud Firewalls](/products/networking/firewalls/) affect both public and VPC network traffic. Rules specific to either must specify the public or private IP range.

## Internet Gateways[](#internet-gateways)

Internet gateways route traffic between your VPC resources and the public internet. This enables isolating backend resources while maintaining controlled internet connectivity.

### NAT Gateways[](#nat-gateways)

DigitalOcean provides a managed Network Address Translation (NAT) Gateway service that centralizes outbound internet access for resources within a VPC network in a datacenter.

[NAT Gateways](/products/networking/vpc/how-to/create-nat-gateway/) provide:

*   Fully managed service maintained by DigitalOcean
*   High availability and scalability
*   Simple configuration and maintenance
*   Enhanced security features

The following diagrams contrast how traffic is routed without and with a NAT Gateway.

**Network without Internet Gateway**

  flowchart LR
    subgraph Datacenter Region
        subgraph VPC 10.0.220.0/16
            ServerA(<img alt="SSDs icon" src="https://docs.digitalocean.com/images/icons/diagram/SSDs.1b6b4e826c1f734f8051e47497cc8d5894e8593444ec007b158928cc2cd61e21.svg" class="mermaid-icon" />   Web Server)
            ServerB(<img alt="SSDs icon" src="https://docs.digitalocean.com/images/icons/diagram/SSDs.1b6b4e826c1f734f8051e47497cc8d5894e8593444ec007b158928cc2cd61e21.svg" class="mermaid-icon" />   Web Server)
            ServerC(<img alt="SSDs icon" src="https://docs.digitalocean.com/images/icons/diagram/SSDs.1b6b4e826c1f734f8051e47497cc8d5894e8593444ec007b158928cc2cd61e21.svg" class="mermaid-icon" />   Web Server)
        end
    end
    ServerA --> Internet(<img alt="global-data-centers icon" src="https://docs.digitalocean.com/images/icons/diagram/global-data-centers.0ae9dbf9cd223ee5dc3ad44d496d5f74d801c59f6c8a19cf0d3532200a374888.svg" class="mermaid-icon" />   Internet)
    ServerB --> Internet
    ServerC --> Internet

**Network with NAT Gateway**

  flowchart LR
    subgraph Datacenter Region
        subgraph VPC 10.0.220.0/16
            ServerA(<img alt="SSDs icon" src="https://docs.digitalocean.com/images/icons/diagram/SSDs.1b6b4e826c1f734f8051e47497cc8d5894e8593444ec007b158928cc2cd61e21.svg" class="mermaid-icon" />   Web Server) --> NATGateway(<img alt="load-balancers icon" src="https://docs.digitalocean.com/images/icons/diagram/load-balancers.1624ac0bbbc110a344dd677a12b6c9c5aa2aa9fa63c2aa61358b03eacf0bcc40.svg" class="mermaid-icon" />   NAT Gateway)
            ServerB(<img alt="SSDs icon" src="https://docs.digitalocean.com/images/icons/diagram/SSDs.1b6b4e826c1f734f8051e47497cc8d5894e8593444ec007b158928cc2cd61e21.svg" class="mermaid-icon" />   Web Server)  --> NATGateway
            ServerC(<img alt="SSDs icon" src="https://docs.digitalocean.com/images/icons/diagram/SSDs.1b6b4e826c1f734f8051e47497cc8d5894e8593444ec007b158928cc2cd61e21.svg" class="mermaid-icon" />   Web Server)  --> NATGateway
        end
    end
    NATGateway --> Internet(<img alt="global-data-centers icon" src="https://docs.digitalocean.com/images/icons/diagram/global-data-centers.0ae9dbf9cd223ee5dc3ad44d496d5f74d801c59f6c8a19cf0d3532200a374888.svg" class="mermaid-icon" />   Internet)

#### NAT Gateway Features[](#nat-gateway-features)

The following table details the specific features and functionality of NAT Gateways:

Feature

Description

Size tiers

Available in 1-16 increments. Each increment provides 25 Mbps of symmetrical bandwidth and 100 GiB of outbound data transfer per month.

Timeouts

Configure idle timeout values for TCP, UDP, and ICMP connections.

Default gateway

Set one NAT gateway as the [default gateway](/products/networking/vpc/how-to/configure-droplet-nat-gateway/#default-gateway-routing) for a VPC. Droplets configured to use the VPC gateway IP automatically route through the default NAT gateway without requiring manual route updates when switching gateways.

Redundancy

Create multiple NAT gateways in a single VPC for redundancy or capacity scaling. Only one can be set as the default gateway at a time.

Static egress IPs

Each NAT gateway receives one or more static public IP addresses for outbound traffic, simplifying firewall allowlist management.

To learn how to set up NAT Gateways, see [How to Create a NAT Gateway](/products/networking/vpc/how-to/create-nat-gateway/). For implementation guidance and security considerations, see [VPC Best Practices](/products/networking/vpc/concepts/best-practices/#internet-gateways).

In this article...

*   [Internet Gateways](#internet-gateways)
    *   [NAT Gateways](#nat-gateways)
        *   [NAT Gateway Features](#nat-gateway-features)

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