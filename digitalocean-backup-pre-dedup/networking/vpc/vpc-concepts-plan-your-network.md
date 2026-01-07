---
source: '[unknown - vpc-concepts-plan-your-network.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Plan Your Custom VPC Network | DigitalOcean Documentation

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

*   [Concepts](/products/networking/vpc/concepts/) 
*   Plan Custom VPC Network

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Plan Your Custom VPC Network

Validated on 28 Apr 2020 • Last edited on 26 Nov 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

When you [create a new VPC network](/products/networking/vpc/how-to/create/), you can specify its size. The size of a network determines how many resources connect to it at once. We offer network sizes from `/28` to `/16`.

You can’t resize a VPC network after creation. If you need a larger network, create a new VPC and [migrate resources](/products/networking/vpc/how-to/migrate-resources/) to the new network as needed.

## Large Networks Versus Smaller Networks[](#large-networks-versus-smaller-networks)

When planning your network, calculate how many resources you expect to initially connect to the network and estimate how many resources you may add to it in the future. Creating a large network to cover all of your contingencies might sound best, but a network with 65534 resources consistently sending traffic to one another can heavily impact the network’s performance.

Smaller networks thoughtfully set up to accommodate modest amounts of growth are more desirable than large, potentially noisy networks. If you are using automation to add and remove resources from your network, selecting a larger network size may be a better option to accommodate spikes in your usage.

You can use this table to determine how many usable IPs are available for a specific CIDR prefix on DigitalOcean.

Network Size (CIDR Suffix)

Number of Usable IP Addresses

/16

65536

/17

32768

/18

16384

/19

8192

/20

4096

/21

2048

/22

1024

/23

512

/24

256

/28

16

## DigitalOcean Reserved IP Addresses and Ranges[](#digitalocean-reserved-ip-addresses-and-ranges)

The first IP address in a network is the network ID and the last IP address in a network is the broadcast ID. We reserve these addresses, along with a few others, in each VPC network and subnet for internal use, so account for them in your IP range calculations.

When you create a VPC network using the **Configure my own IP range** option, the **Network Size** drop-down menu calculates the actual number of available addresses in your network.

![Custom IP range](https://docs.digitalocean.com/screenshots/vpc/resources/vpc-custom-ip-range.b9371f8ece7791362e665d3c08900afa556ec90718af819deb394bf373afbe41.png)

DigitalOcean reserves the `10.244.0.0/16`, `10.245.0.0/16`, `10.246.0.0/24`, and `10.229.0.0/16` IP address ranges in all regions for DigitalOcean internal use, as well as the following regional reservations:

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

You cannot peer two VPC networks if either network’s IP address range overlaps with a reserved range in the other datacenter.

## Determine Your IP Range[](#determine-your-ip-range)

When creating a custom VPC network, correctly calculating the IP ranges of the network avoids overlapping the IP address ranges with other VPC networks in your account. The control panel warns you when you enter an overlapping configuration and prevents you from creating the overlapping network.

An IP address network range is represented in CIDR notation, which contains a network routing prefix and its corresponding prefix length (the number after the `/`). For example, the IPv4 CIDR `192.168.255.0/24` represents the 256 IPv4 addresses from `192.168.255.0` to `192.168.255.255`, with the routing prefix being `192.168.255.0` and the prefix length being `/24`. Your network’s routing prefix is the address used to route traffic in and out of the network and the prefix length determines the size of the network.

Each IP address contains four octets of data. Each octet in an IPv4 address represents 8 bits of data. The total sum of all four octets equals 32 bits. When a network IP range is written as a CIDR, the prefix length represents how many bits have been allocated to the network’s routing prefix. From the number of remaining bits (32 minus the prefix length), the network’s size and IP range can be calculated.

For example, the prefix length of the CIDR `192.168.255.0/24` indicates the first 24 bits (first three octets) of the address have been allocated to the network’s routing prefix and the remaining 8 bits (last octet) have been allocated to a range of IP addresses. In this case, the CIDR’s range of available IP addresses is `192.168.255.0` to `192.168.255.255` for a total of 256 IP addresses.

In the case of `192.168.250.0/23`, the CIDR’s first 23 bits have been allocated to the routing prefix, which translates to the first two octets and the first 7 bits of the third octet in the CIDR. The last number in the third octet provides an opportunity to create a network of 512 IP addresses (`192.168.250.1` to `192.168.251.254`).

DigitalOcean VPC provides several IP address ranges that have been allocated for private networking purposes (RFC 1918):

*   10.0.0.0 – 10.255.255.255
*   172.16.0.0 – 172.31.255.255
*   192.168.0.0 – 192.168.255.255

When you select a prefix from one of these ranges and your VPC network’s size, [calculate the IP range](https://www.ipaddressguide.com/cidr) of the VPC network to avoid overlaps with other networks in your account.

For example, if you choose the prefix `192.168.11.0` with a network size of `/24` (256 IP addresses) for your VPC network, the range of available IP addresses in the VPC network is `192.168.11.0` to `192.168.11.255`. If you then attempt to create a second VPC network with the prefix and network size `192.168.10.0/23` (512 available IP addresses), you receive an error message, as the new VPC network’s range (`192.168.10.0` to `192.168.11.255`) overlaps with the 256 addresses of the first VPC network.

## Other Tools and Resources[](#other-tools-and-resources)

*   [Understanding IP Addresses, Subnets, and CIDR Notation for Networking](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking)
*   IP Address Guide’s [CIDR to IPv4 Conversion](https://www.ipaddressguide.com/cidr) calculator
*   [How To Calculate Network Addresses With `ipcalc`](https://www.linux.com/topic/networking/how-calculate-network-addresses-ipcalc/)

You can install the Linux [IP address calculation tool](https://www.linux.com/topic/networking/how-calculate-network-addresses-ipcalc/) `ipcalc` by running the commands:

    sudo apt-get update
    sudo apt-get install ipcalc

In this article...

*   [Large Networks Versus Smaller Networks](#large-networks-versus-smaller-networks)
*   [DigitalOcean Reserved IP Addresses and Ranges](#digitalocean-reserved-ip-addresses-and-ranges)
*   [Determine Your IP Range](#determine-your-ip-range)
*   [Other Tools and Resources](#other-tools-and-resources)

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

Try using different keyword