---
created: 2026-01-07
tags:
  - bright-data
  - scraper
  - digitalocean
  - networking
  - ipv6
  - api-docs
tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/networking/ipv6/how-to/configure-additional-addresses/
domain: docs.digitalocean.com
---
                How to Enable Additional IPv6 Addresses | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/ipv6.5328c5b0b5ae17c7784679c40c051945e4799cda74d004c85a41eba70b6a07f9.svg)IPv6](/products/networking/ipv6/)
*   [Getting Started](/products/networking/ipv6/getting-started/)
    *   [Quickstart](/products/networking/ipv6/getting-started/quickstart/)
*   [How-Tos](/products/networking/ipv6/how-to/)
    *   [Enable IPv6](/products/networking/ipv6/how-to/enable/)
    *   [Use Additional Addresses](/products/networking/ipv6/how-to/configure-additional-addresses/)
    *   [Disable IPv4](/products/networking/ipv6/how-to/disable-ipv4/)
*   [Reference](/products/networking/ipv6/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#operation/dropletActions_post_byTag)
    *   [CLI Reference](/reference/doctl/reference/compute/droplet-action/enable-ipv6/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/ipv6/concepts/)
*   [Details](/products/networking/ipv6/details/)
    *   [Features](/products/networking/ipv6/details/features/)
    *   [Pricing](/products/networking/ipv6/details/pricing/)
    *   [Availability](/products/networking/ipv6/details/availability/)
    *   [Limits](/products/networking/ipv6/details/limits/)
*   [Support](/products/networking/ipv6/support/)

*   [How-Tos](/products/networking/ipv6/how-to/) 
*   Use Additional Addresses

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Enable Additional IPv6 Addresses

Validated on 28 Oct 2019 • Last edited on 17 Jun 2025

[IP addresses](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking) let machines communicate across a network. DigitalOcean Droplets are assigned IPv4 addresses by default. Enabling IPv6 on a Droplet gives you access to its 16 additional IPv6 addresses.

Each Droplet with IPv6 enabled is allocated a `/124` subnet, which represents a block of 16 IPv6 addresses. When you enable IPv6, one of these addresses is configured automatically and is used for any PTR records generated for domains pointing at the Droplet.

Tip

Click here to see an example of the 16 IP addresses in `/124` subnet.

The first address in a `/124` subnet (`2001:db8::/124` in CIDR notation) ends with a 0, and each additional address increments the last digit in hexadecimal from `0` to `f`.

For example, `2604:a880:800:c1::22:e00/124` includes the addresses from `2001:db8:3:d0::76:8000` to `2001:DB8:3:d0::76:800f`:

IPv6 Address

Notes

2001:db8:3:d0::76:800**0**

First address in the Droplet’s range

2001:db8:3:d0::76:800**1**

Primary IPv6 address for the Droplet

2001:db8:3:d0::76:800**2**

2001:db8:3:d0::76:800**3**

2001:db8:3:d0::76:800**4**

2001:db8:3:d0::76:800**5**

2001:db8:3:d0::76:800**6**

2001:db8:3:d0::76:800**7**

2001:db8:3:d0::76:800**8**

2001:db8:3:d0::76:800**9**

2001:db8:3:d0::76:800**a**

2001:db8:3:d0::76:800**b**

2001:db8:3:d0::76:800**c**

2001:db8:3:d0::76:800**d**

2001:db8:3:d0::76:800**e**

2001:db8:3:d0::76:800**f**

Last address in the Droplet’s range

You can view a Droplet’s available range of IPv6 addresses in the **Networking** section of its detail page, in the **Configurable address range** section.

The DigitalOcean backend is already set up to serve requests for the other addresses in the subnet, but to gain access to them, you need to configure the network on the Droplet to use them.

You can configure as many IPv6 addresses from a Droplet’s addressable range as you like. Multiple addresses allow flexibility in your configuration and allow you to use different addresses for specific purposes.

## Enable New Addresses on Boot[](#enable-new-addresses-on-boot)

To set up additional IPv6 addresses, you need to add the new addresses to the file that configures your network at boot. The file you edit and the lines you add depend on which Linux distribution the Droplet is running.

 Ubuntu 18.04

On Ubuntu 18.04, you need to edit `/etc/netplan/50-cloud-init.yaml`. In the `addresses:` section, add each new IPv6 address on its own line, as follows:

`/etc/netplan/50-cloud-init.yaml`

    network:
        version: 2
        ethernets:
            eth0:
                addresses:
                - 203.0.113.213/20
                - your_primary_ipv6_address/64
                - your_additional_ipv6_address/64
                - 192.0.2.11/16
                gateway4: 206.189.208.1
                gateway6: ipv6_gateway
                match:
                    macaddress: ce:2c:ex:am:pl:e6

Use Netplan to apply the change:

    sudo netplan apply --debug

When the command is successful, it doesn’t provide output.

 Debian and Ubuntu 16.04

On Debian and Ubuntu 16.04 or earlier, you need to edit `/etc/network/interfaces.d/50-cloud-init.cfg`. On Ubuntu 14.04 or earlier, you need to edit `/etc/network/interfaces`.

This file has a section for each of the different network configured, like public IpV6, public IPv6, and private IPv4. The public IPv6 interface section begins with `iface eth0 inet6 static`, for example.

Underneath the public IPv6 interface, add an additional section that includes the new address you are adding and a netmask specification:

    iface eth0 inet6 static
            address new_ipv6_address/64

Add an additional `iface eth0 inet6 static` section for each new IPv6 address in the addressable range that you want to use.

 CentOS and Fedora

On CentOS and Fedora, you need to edit `/etc/sysconfig/network-scripts/ifcfg-eth0` and add a parameter called `IPV6ADDR_SECONDARIES` with a value that specifies the new IPv6 addresses.

Add a new line that begins with `IPV6ADDR_SECONDARIES=` anywhere in the file, then list all of the IPv6 addresses you’re adding, separated by spaces. The line should look like this, with your IPv6 addresses:

`/etc/sysconfig/network-scripts/ifcfg-eth0`

    IPV6ADDR_SECONDARIES="second_ipv6_address/64 third_ipv6_address/64 .../64"

The addresses are automatically configured on a reboot:

    sudo shutdown -r now

## Enable New Addresses Immediately[](#enable-new-addresses-immediately)

Adding new IPv6 addresses to your Droplet’s interface makes the addresses available immediately.

To configure the Droplet’s networking interface, choose the address you want to configure out of your address range and add it using `ip -6 addr add`:

    ip -6 addr add new_ipv6_address/64 dev eth0

The new address is immediately available. You can check by listing the available addresses:

    ip -6 addr show eth0

    2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qlen 1000
        inet6 first_ipv6_address/64 scope global 
           valid_lft forever preferred_lft forever
        inet6 second_ipv6_address/64 scope global 
           valid_lft forever preferred_lft forever

The new address remains available for the duration of your current session. If you want it to persist across reboots, [enable it in your networking configuration file](#enable-new-addresses-on-boot).

## Verify the Configuration[](#verify-the-configuration)

To test the IPv6 configuration, try pinging the Google IPv6 name server from the Droplet:

    ping6 2001:4860:4860::8888

If IPv6 is working correctly, you’ll receive output like this, which means the Droplet can communicate across the internet with other IPv6-enabled sites and servers.

    PING 2001:4860:4860::8888(2001:4860:4860::8888) 56 data bytes
    64 bytes from 2001:4860:4860::8888: icmp_seq=1 ttl=57 time=3.16 ms
    64 bytes from 2001:4860:4860::8888: icmp_seq=2 ttl=57 time=2.79 ms
    64 bytes from 2001:4860:4860::8888: icmp_seq=3 ttl=57 time=2.85 ms
    64 bytes from 2001:4860:4860::8888: icmp_seq=4 ttl=57 time=2.83 ms
    64 bytes from 2001:4860:4860::8888: icmp_seq=5 ttl=57 time=2.88 ms
    Copy
    To exit, press q.

If you receive the output `ping: sendmsg: Network is unreachable`, verify that you used `ping6` and not `ping`. If you still can’t connect, check the changes you made to the configuration file for errors, then reboot and test again.

In this article...

*   [Enable New Addresses on Boot](#enable-new-addresses-on-boot)
*   [Enable New Addresses Immediately](#enable-new-addresses-immediately)
*   [Verify the Configuration](#verify-the-configuration)

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

Try using different keywords or simplif