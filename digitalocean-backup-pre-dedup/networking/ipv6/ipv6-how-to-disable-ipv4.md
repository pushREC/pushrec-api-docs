---
source: '[unknown - ipv6-how-to-disable-ipv4.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Disable IPv4 and Only Use IPv6 | DigitalOcean Documentation

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
*   Disable IPv4

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Disable IPv4 and Only Use IPv6

Validated on 28 Oct 2019 • Last edited on 17 Apr 2025

[IP addresses](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking) let machines communicate across a network. DigitalOcean Droplets are assigned IPv4 addresses by default. Enabling IPv6 on a Droplet gives you access to its 16 additional IPv6 addresses.

When you enable IPv6 on a Droplet, both the IPv4 and IPv6 interfaces are available. You can disable IPv4 and rely solely on IPv6, although you still need to have IPv4 available for the localhost so your programs operate as expected.

Note

DigitalOcean blocks all SMTP traffic over IPv6. If you disable IPv4 on a Droplet that hosts a mail server, mail delivery stops.

## Disable IPv4 on Boot[](#disable-ipv4-on-boot)

To disable IPv4, you need to modify the file that configures your network at boot. The file you edit and what you change in it depends on which distribution your Droplet is running.

 Ubuntu 18.04

On Ubuntu 18.04, you need to edit `/etc/netplan/50-cloud-init.yaml`.

If you enabled IPv6 when the Droplet was created, remove the IPv4 address and `gateway4` lines. If you enabled IPv6 after creation, you need to add the IPv6 address and `gateway6` lines. In both cases, add the IPv6 name servers as well.

When you’re done, the file should look like this:

`/etc/netplan/50-cloud-init.yaml`

    network:
        version: 2
        ethernets:
            eth0:
                addresses:
                - public_ipv6_address/64
                - anchor_ip
                gateway6: public_ipv6_gateway
                match:
                    macaddress: droplet_mac_address
                nameservers:
                    addresses:
                    - 2001:4860:4860::8844
                    - 2001:4860:4860::8888
                    search: []
                set-name: eth0

 Debian and Ubuntu 16.04

On Debian 9 and Ubuntu 16.04, you need to edit `/etc/network/interfaces.d/50-cloud-init.cfg`. On Ubuntu 14.04, you need to edit `/etc/network/interfaces`.

If you enable IPv6 when you created your Droplet, there are two sections beginning with `iface eth0`, and maybe more if you also enabled private networking. In this case, you should delete or comment out the `inet` section for `eth0` so that only the `inet6` section is defined for `eth0`.

If you enabled IPv6 after creation, the `iface eth0 inet6 static` section does not exist. In this case, you should delete or comment out the `inet` section for `eth0` and add in the `inet6` section as below.

When you’re done, the file should look like this:

    iface eth0 inet6 static
        address public_ipv6_address
        netmask 64
        gateway public_ipv6_gateway
        autoconf 0
        dns-nameservers 2001:4860:4860::8844 2001:4860:4860::8888 209.244.0.3
    
    # iface eth0 inet static
    #    . . .

 CentOS and Fedora

On CentOS and Fedora, you need to edit `/etc/sysconfig/network`.

If it isn’t already there, add `NETWORKING_IPV6=yes` on a new line to enable IPv6:

`/etc/sysconfig/network`

    NETWORKING=yes
    HOSTNAME=centafter
    NETWORKING_IPV6=yes

Next, edit `/etc/sysconfig/network-scripts/ifcfg-eth0`, which specifies how the network should be configured when it is brought up.

Comment out the IPv4 information so that it isn’t taken into account at boot by adding a `#` at the beginning of those lines:

`/etc/sysconfig/network-scripts/ifcfg-eth0`

        #IPADDR=128.199.175.162
        #NETMASK=255.255.192.0
        #GATEWAY=128.199.128.1

If you enabled IPv6 after the Droplet was created, you need to add your IPv6 information (`IPV6ADDR=...` and `IPV6_DEFAULTGW=...`) and adjust the DNS directives (`DNS1=...`) so they point to IPv6 name servers:

`/etc/sysconfig/network-scripts/ifcfg-eth0`

    IPV6INIT=yes
    IPV6ADDR=public_ipv6_address/64
    IPV6_DEFAULTGW=public_ipv6_gateway
    IPV6_AUTOCONF=no
    . . .
    DNS1=2001:4860:4860::8844
    DNS2=2001:4860:4860::8888
    DNS3=209.244.0.3

These steps disable IPv4 at next boot. You can also disable IPv4 immediately.

## Disable IPv4 Immediately[](#disable-ipv4-immediately)

To disable IPv4 immediately, you need to delete the rule that configures your IPv4 address.

If you enabled IPv6 after you created your Droplet, you first need to edit the `/etc/resolv.conf` file to use IPv6 DNS servers. Set the `nameserver` directives to Google’s IPv6 name servers by changing the file to look like this:

`/etc/resolv.conf`

    nameserver 2001:4860:4860::8844
    nameserver 2001:4860:4860::8888
    nameserver 209.244.0.3

After the Droplet is set to use IPv6 name servers, find its IPv4 address and CIDR routing prefix.

    ip -4 addr show eth0

This is the information after `inet`, which is `198.51.100.0/24` in this example:

    2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        inet 198.51.100.0/24 brd 128.199.191.255 scope global eth0

Warning

If you are connecting to the Droplet through an IPv4 connection, disabling the IPv4 interface drops your connection. You need to reconnect using IPv6 (if your local configuration supports it) or [log in using the control panel](/products/droplets/how-to/recovery/recovery-console/).

To disable IPv4 immediately, remove the rule configuring your IPv4 address, using the Droplet’s IP address and CIDR routing prefix:

    ip addr del 128.199.175.162/18 dev eth0

Unless you disable IPv4 on boot, these changes are reverted the next time you reboot.

In this article...

*   [Disable IPv4 on Boot](#disable-ipv4-on-boot)
*   [Disable IPv4 Immediately](#disable-ipv4-immediately)

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

Try using different keywords or simplifying you