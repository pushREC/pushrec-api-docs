---
source: '[unknown - reserved-ips-how-to-outbound-traffic.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Send Outbound Traffic Over a Reserved IP | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/reserved-ips.c9c9b721d99d9592de022671f4dd4b27147dea7162dbfa52ee239edccf9d612f.svg)Reserved IPs](/products/networking/reserved-ips/)
*   [Getting Started](/products/networking/reserved-ips/getting-started/)
    *   [Quickstart](/products/networking/reserved-ips/getting-started/quickstart/)
*   [How-Tos](/products/networking/reserved-ips/how-to/)
    *   [Create Reserved IPs](/products/networking/reserved-ips/how-to/create/)
    *   [Delete Reserved IPs](/products/networking/reserved-ips/how-to/delete/)
    *   [Reassign Reserved IPs](/products/networking/reserved-ips/how-to/modify/)
    *   [Manually Enable Reserved IPs](/products/networking/reserved-ips/how-to/manually-enable/)
    *   [Find Droplet Anchor IPs](/products/networking/reserved-ips/how-to/find-anchor-ips/)
    *   [Send Outbound Traffic](/products/networking/reserved-ips/how-to/outbound-traffic/)
    *   [Provision BYOIP](/products/networking/reserved-ips/how-to/provision-byoip/)
    *   [Deprovision BYOIP](/products/networking/reserved-ips/how-to/deprovision-byoip/)
    *   [Manage BYOIP Advertisement](/products/networking/reserved-ips/how-to/pause-byoip/)
    *   [Assign BYOIP IPs](/products/networking/reserved-ips/how-to/assign-byoip-ip/)
    *   [Modify BYOIP IPs](/products/networking/reserved-ips/how-to/modify-byoip-ip/)
*   [Reference](/products/networking/reserved-ips/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Floating-IPs)
    *   [CLI Reference](/reference/doctl/reference/compute/reserved-ip/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/reserved-ips/concepts/)
    *   [Glossary](/glossary/reserved-ips/)
*   [Details](/products/networking/reserved-ips/details/)
    *   [Features](/products/networking/reserved-ips/details/features/)
    *   [Pricing](/products/networking/reserved-ips/details/pricing/)
    *   [Availability](/products/networking/reserved-ips/details/availability/)
    *   [Limits](/products/networking/reserved-ips/details/limits/)
*   [Support](/products/networking/reserved-ips/support/)

*   [How-Tos](/products/networking/reserved-ips/how-to/) 
*   Send Outbound Traffic

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Send Outbound Traffic Over a Reserved IP

Validated on 27 Feb 2025 • Last edited on 18 Sep 2025

DigitalOcean Reserved IPs are publicly-accessible static IPv4 and IPv6 addresses. Assign and reassign reserved IP addresses to Droplets as needed, or implement an automated failover mechanism with reserved IPs to build a high availability infrastructure.

You can configure your Droplet’s network settings to send outbound traffic over a reserved IP address assigned to the Droplet. This causes traffic to originate from the reserved IP address instead of the Droplet’s original IPv4 address.

## Prerequisites[](#prerequisites)

To configure a Droplet to send its outbound traffic over a reserved IP address, you must first [assign the reserved IP address to the Droplet](/products/networking/reserved-ips/how-to/create/) and then obtain the Droplet’s gateway anchor IP address.

Most Droplets already have an anchor IP, but Droplets created before October 2015 and Droplets created using [custom images](/products/custom-images/) don’t have anchor IPs assigned by default.

On Droplets without an anchor IP, first [manually assign an anchor IP to the Droplet](/products/networking/reserved-ips/how-to/manually-enable/#enable-anchor-ips-immediately), then continue following this guide.

On Droplets with an anchor IP, get the gateway address by querying its [metadata](/reference/api/metadata/) using a `curl` request. The `-s` flag mutes any progress meters or error messages and returns only the output.

    curl -s http://169.254.169.254/metadata/v1/interfaces/public/0/anchor_ipv4/gateway

The command returns the anchor IP’s gateway address. You need to use this address to update your server’s default IPv4 gateway, enabling outbound traffic from your reserved IP.

## Enable Outbound Reserved IP Traffic Immediately[](#enable-outbound-reserved-ip-traffic-immediately)

To immediately update your network configuration, use the `ip route` command to add this address as the gateway for the default route. The following command removes the default route from your Droplet’s public network interface and replaces it with a route that uses the anchor’s gateway IP address. Replace `<anchor-gateway-IP-address>` with the IP address you retrieved in the previous step:

    sudo sh -c "ip route del 0/0; ip route add default via <anchor-gateway-IP-address> dev eth0"

The command may take a moment to complete and prints no output.

Verify that the Droplet’s traffic is being routed through the reserved IP address by sending a `curl` request to `icanhazip.com`, a website that returns the request’s originating public IP. The `-4` flag instructs `curl` to use the Droplet’s IPv4 address only:

    curl -4 https://icanhazip.com/

Changes made with the `ip route` command are lost when you restart your Droplet. To make the setting persist after reboot, you need to modify the Droplet’s network configuration files. How you do this depends on which operating system you’re using.

## Persist Outbound Reserved IP Traffic After Reboot[](#persist-outbound-reserved-ip-traffic-after-reboot)

First, disable cloud-init’s automatic network configuration, otherwise your settings could be overwritten:

    echo "network: {config: disabled}" | sudo tee /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

 Ubuntu 20.04+, Debian 12+

Open the Droplet’s network interface configuration file:

    sudo nano /etc/netplan/50-cloud-init.yaml

Under the `eth0` configuration, update the `via` field under the `routes` section to use the Droplet’s anchor IP gateway address:

`/etc/netplan/50-cloud-init.yaml`

    network:
        version: 2
        ethernets:
            eth0:
                addresses:
                - 203.0.113.216/20
                - 10.17.0.5/16
                match:
                    macaddress: da:f8:7a:69:ce:ea
                mtu: 1500
                nameservers:
                    addresses:
                    - 67.207.67.2
                    - 67.207.67.3
                    search: []
                routes:
                -   to: 0.0.0.0/0
                    via: <anchor-gateway-IP-address>
                set-name: eth0
            eth1:
                addresses:
                - 10.132.0.5/16
                match:
                    macaddress: a6:08:53:fb:fb:7d
                mtu: 1500
                nameservers:
                    addresses:
                    - 67.207.67.2
                    - 67.207.67.3
                    search: []
                set-name: eth1

This updates the default gateway for the interface.

Save and close the configuration file, then use the `netplan` command to apply the changes:

    sudo netplan apply

Verify that the changes to your network now persist through a reboot:

    sudo reboot

 Debian 11

Open the Droplet’s network interface configuration file:

    sudo nano /etc/network/interfaces

Update the `gateway` field with the Droplet’s anchor IP gateway address:

`/etc/network/interfaces`

    auto lo
    iface lo inet loopback
            dns-nameservers  67.207.67.2 67.207.67.3
    
    auto eth0
    iface eth0 inet static
            hwaddress 5e:6c:28:98:28:ce
            address   203.0.113.216
            netmask   255.255.240.0
            gateway   <anchor-gateway-IP-address>
            post-up ifup eth0:1

This updates the default gateway for the interface.

Save and close the configuration file. Then run the following command to check the configuration’s syntax and apply the network changes:

    sudo systemctl restart networking

Verify that the changes to your network now persist through a reboot:

    sudo reboot

 Fedora 38

Open the Droplet’s public network interface configuration file:

    nano /etc/NetworkManager/system-connections/cloud-init-eth0.nmconnection

Under the `[ipv4]` section, replace the second IP address in the `route1` field with your Droplet’s anchor gateway IP address:

`/etc/NetworkManager/system-connections/cloud-init-eth0.nmconnection`

    [connection]
    id=cloud-init eth0
    uuid=1dd9a779-d327-56e1-8454-c65e2556c12c
    type=ethernet
    
    [user]
    org.freedesktop.NetworkManager.origin=cloud-init
    
    [ethernet]
    mtu=1500
    mac-address=E2:67:39:7C:55:85
    
    [ipv4]
    method=manual
    may-fail=false
    address1=143.110.211.104/20
    route1=0.0.0.0/0,<anchor-gateway-IP-address>    
    address2=10.20.0.7/16

This updates the default gateway for the interface.

Save and close the file, then reboot the Droplet:

    sudo reboot

 CentOS 8+, AlmaLinux 9, Rocky Linux 9

Open the Droplet’s public network interface configuration file:

    sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0

Update the `GATEWAY=` field with the Droplet’s anchor gateway IP address:

`/etc/sysconfig/network-scripts/ifcfg-eth0`

    BOOTPROTO=none
    DEFROUTE=yes
    DEVICE=eth0
    GATEWAY=<anchor-gateway-IP-address>
    HWADDR=36:7d:f2:8d:72:15
    IPADDR=203.0.113.216
    IPADDR1=10.17.0.5
    MTU=1500
    NETMASK=255.255.240.0
    NETMASK1=255.255.0.0
    ONBOOT=yes
    TYPE=Ethernet
    USERCTL=no

This updates the default gateway for the interface.

Save and close the configuration file, then reboot the Droplet:

    sudo reboot

Once the Droplet has rebooted, log back in to the Droplet and verify that its traffic is being routed through the reserved IP address by sending another `curl` request to `icanhazip.com`:

    curl -4 https://icanhazip.com/

## Disable Outbound Reserved IP Traffic[](#disable-outbound-reserved-ip-traffic)

To reverse this change, first retrieve the gateway address of the Droplet’s public interface:

    curl -s http://169.254.169.254/metadata/v1/interfaces/public/0/ipv4/gateway

The command returns the interface’s gateway address.

Use the `ip route` command to remove the reserved IP gateway and add back the original gateway address of the Droplet. Replace with the IP address you retrieved in the previous step:

    sudo sh -c "ip route del 0/0; ip route add default via <gateway-IP-address> dev eth0"

The command may take a moment to complete and prints no output.

Verify that the Droplet’s traffic is being routed through its assigned IP address by sending a `curl` request to `icanhazip.com`, a website that returns the request’s originating public IP. The `-4` flag instructs `curl` to use the Droplet’s IPv4 address only:

    curl -4 https://icanhazip.com/

Changes made with the `ip route` command are lost when you restart your Droplet. If you followed the [Persist Outbound Reserved IP Traffic After Reboot](#persist-outbound-reserved-ip-traffic-after-reboot) section above, you need to revert those changes, as well. Follow the those directions again using the gateway address of the Droplet’s public interface that you retrieved at the beginning of this section.

In this article...

*   [Prerequisites](#prerequisites)
*   [Enable Outbound Reserved IP Traffic Immediately](#enable-outbound-reserved-ip-traffic-immediately)
*   [Persist Outbound Reserved IP Traffic After Reboot](#persist-outbound-reserved-ip-traffic-after-reboot)
*   [Disable Outbound Reserved IP Traffic](#disable-outbound-reserved-ip-traffic)

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

T