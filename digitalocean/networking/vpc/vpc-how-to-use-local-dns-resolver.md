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
source_url: https://docs.digitalocean.com/products/networking/vpc/how-to/use-local-dns-resolver/
domain: docs.digitalocean.com
---
                How to Use the VPC-local DNS Resolver | DigitalOcean Documentation

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
*   Use VPC-local DNS

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Use the VPC-local DNS Resolver

Validated on 19 Nov 2025 • Last edited on 19 Nov 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

DigitalOcean VPC networks provide an internal DNS resolver on the second-to-last IP address of the network. Configure your Droplets to use the internal resolver for better DNS performance and reliability on your DigitalOcean VPC network. This is especially important when using a NAT gateway, where multiple backend Droplets appear as one client to our DNS infrastructure and may be rate limited.

Note

Droplets created on or after 20 August 2025 automatically include the VPC-local DNS resolver along with the public resolvers (67.207.67.2 and 67.207.67.3). To exclusively use the VPC-local resolver, follow the steps below to [update your Droplet’s networking configuration](/products/networking/vpc/how-to/use-local-dns-resolver/#update-droplets).

To update your Droplets to use the internal DNS resolver, find the IP address of your resolver, then update your Droplet’s DNS resolution configuration to use the new IP address.

## Find a VPC Network’s Internal Resolver IP Address[](#find-a-vpc-networks-internal-resolver-ip-address)

A VPC network’s internal resolver IP address is always the second-to-last IP address of the network. To retrieve this IP address, use the DigitalOcean API or calculate it based on VPC network information shown in the control panel.

### Use the Control Panel to Find a VPC Network’s Internal Resolver IP Address[](#use-the-control-panel-to-find-a-vpc-networks-internal-resolver-ip-address)

Go to the [**VPC**](https://cloud.digitalocean.com/networking/vpc) tab in the control panel and note the value shown in the **IP Range** column for your VPC network. It is an IPv4 address and network size is in CIDR format, like `10.116.0.0/20`.

Next, open to the [ARIN CIDR Calculator](https://account.arin.net/public/cidrCalculator). In the **Convert to IP Address Range** section, enter the following:

*   **Prefix**: The prefix is the IP address before the `/` slash.
    
*   **Prefix Length**: The length is the number after the slash.
    

In the previous CIDR example, the prefix is `10.116.0.0` and the prefix length is `20`.

Next, click **Convert**. You can view the end IP address in **End IP Address**. Your resolver IP address is the end IP address, minus 1 from the last octet. For example, if your end IP is `10.136.255.255`, your resolver IP address is `10.136.255.254`.

Use the resolver IP address in the [next step](#update-droplets) to reconfigure your Droplet.

### Use the DigitalOcean API to Find a VPC Network’s Internal Resolver IP Address[](#use-the-digitalocean-api-to-find-a-vpc-networks-internal-resolver-ip-address)

Send a `GET` request to the `/v2/vpcs` endpoint to list all of your team’s VPC networks. The following command pipes the API’s JSON response to `jq` which outputs only the VPC network name and resolver IP address:

    curl -X GET \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
        "https://api.digitalocean.com/v2/vpcs" \
        | jq -r '.vpcs[] | "\(.name):\t\(.resolver_ip)"'

Add a valid DigitalOcean API token to the environment variable `$DIGITALOCEAN_TOKEN` before running the command.

The output is a list of VPC names and resolver IP addresses:

    default-nyc2:	10.100.15.254
    default-sgp1:	10.104.15.254
    default-sfo3:	10.124.15.254

Find the resolver IP address for your VPC network and use it in the [next step](#update-droplets) to reconfigure your Droplet.

## Update Droplets to Use the VPC-local DNS Resolver[](#update-droplets)

Update your Droplet’s networking configuration to use the VPC-local DNS resolver. This configuration procedure varies between different Linux distributions.

 Ubuntu, Debian

Ubuntu and Debian use Netplan to configure networking, and `systemd-resolved` to manage DNS resolution. You must update both systems to configure your Droplet to use its VPC-local DNS resolver.

First, update the DigitalOcean-specific `systemd-resolved` configuration file at `/etc/systemd/resolved.conf.d/DigitalOcean.conf`:

    sudo nano /etc/systemd/resolved.conf.d/DigitalOcean.conf

Replace the two default IP addresses with your single VPC-local DNS resolver IP address:

    [Resolve]
    DNS=<your-resolver-ip>

Replace `<your-resolver-ip>` with the actual resolver IP address you retrieved in the previous section.

Save and close the file, then restart `systemd-resolved`:

    sudo systemctl restart systemd-resolved

Next, update the Netplan configuration file that cloud-init generated at first boot:

    sudo nano /etc/netplan/50-cloud-init.yaml

Remove all the lines highlighted below, from `nameservers:` to `search: []`. These lines define interface-specific name servers that are not necessary.

    network:
      version: 2
      ethernets:
        eth0:
          match:
            macaddress: "ce:68:83:13:e9:dd"
          addresses:
          - "159.203.129.109/20"
          - "10.17.0.6/16"
          nameservers:
            addresses:
            - 67.207.67.3
            - 67.207.67.2
            search: []
          set-name: "eth0"
          mtu: 1500
          routes:
          - to: "0.0.0.0/0"
            via: "159.203.128.1"
        eth1:
          match:
            macaddress: "ea:a8:49:d0:7c:09"
          addresses:
          - "10.132.1.108/16"
          nameservers:
            addresses:
            - 67.207.67.3
            - 67.207.67.2
            search: []
          set-name: "eth1"
          mtu: 1500

Save and close the file, then apply the changes:

    sudo netplan apply

Use `resolvectl` to display the status of DNS resolution on your system:

    sudo resolvectl status

The output shows that the VPC-local DNS server is set as the only available DNS server in the **Global** section:

    Global
             Protocols: +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
      resolv.conf mode: stub
           DNS Servers: 10.132.255.254
    
    Link 2 (eth0)
        Current Scopes: LLMNR/IPv4 LLMNR/IPv6
             Protocols: -DefaultRoute +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
         Default Route: no
    
    Link 3 (eth1)
        Current Scopes: LLMNR/IPv4 LLMNR/IPv6
             Protocols: -DefaultRoute +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
         Default Route: no

 Rocky Linux, CentOS

Rocky Linux and CentOS define DNS resolvers in the `/etc/resolv.conf` file. The following command uses `echo` to replace the contents of `/etc/resolv.conf` with a single `nameserver <your-resolver-ip>` configuration line:

    echo "nameserver <your-resolver-ip>" > /etc/resolv.conf

Replace `<your-resolver-ip>` with the actual resolver IP address you retrieved in the previous section.

 Fedora

Fedora configures DNS resolvers in NetworkManager configuration files in the directory `/etc/NetworkManager/system-connections/`. On a DigitalOcean Droplet, this directory has one file for each interface: `cloud-init-ens3.nmconnection` and `cloud-init-ens4.nmconnection`.

Use `nano` or another text editor to update the `dns=` line in both files:

    dns=<your-resolver-ip>

Replace `<your-resolver-ip>` with the actual resolver IP address you retrieved in the previous section.

Restart NetworkManager to apply the changes:

    sudo systemctl restart NetworkManager

Your system is now configured to use its VPC-local DNS resolver. Use the `dig` command to verify DNS resolution is functioning properly. Read [How to Retrieve DNS Information Using Dig](https://www.digitalocean.com/community/tutorials/how-to-retrieve-dns-information-using-dig) for more information.

In this article...

*   [Find a VPC Network’s Internal Resolver IP Address](#find-a-vpc-networks-internal-resolver-ip-address)
    *   [Use the Control Panel to Find a VPC Network’s Internal Resolver IP Address](#use-the-control-panel-to-find-a-vpc-networks-internal-resolver-ip-address)
    *   [Use the DigitalOcean API to Find a VPC Network’s Internal Resolver IP Address](#use-the-digitalocean-api-to-find-a-vpc-networks-internal-resolver-ip-address)
*   [Update Droplets to Use the VPC-local DNS Resolver](#update-droplets)

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

Try using different keywords or s