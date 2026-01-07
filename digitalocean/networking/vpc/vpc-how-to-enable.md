---
source: '[unknown - vpc-how-to-enable.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Enable VPC Networking on Existing Droplets | DigitalOcean Documentation

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
*   Enable on Existing Droplets

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Enable VPC Networking on Existing Droplets

Validated on 30 Jun 2021 • Last edited on 17 Apr 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

Note

All DigitalOcean Droplets, Kubernetes clusters, managed databases, and load balancers created after 1 October 2020 are automatically added to a VPC network (either the account’s default network or a user-created network).

If you enabled VPC networking on your Droplet before 1 October 2020 but didn’t configure the Droplet’s private network interface, use this guide to configure the network interface necessary for the Droplet to communicate with the region’s default VPC network.

You can also [migrate the Droplet into any specified VPC network using a snapshot](/products/networking/vpc/how-to/migrate-resources/). We do not support VPC networks between Droplets in different datacenter regions.

## Enable VPC Networking on Existing Droplets[](#on-existing-droplets)

To enable VPC networking on an existing Droplet, you need to power the Droplet down. This safest way to do this is by logging into your Droplet and using the `shutdown` command with the `h` flag:

    sudo shutdown -h now

The `-h` flag halts the system completely.

Once the Droplet is off, the next step is to enable private networking from the control panel. This gives you the address information you need to then configure it on the Droplet itself.

On the **Droplets** page, click the name of the Droplet, then click **Networking** in the left menu. In the **Private network** section, click the **Enable** button.

![The Droplet Networking page with the private networking enable button highlighted](https://docs.digitalocean.com/screenshots/vpc/resources/enable.2581078c438d8eef4f59ee1b34a4cf7fe717ba20bfff2a368151e2dbc67ec18d.png)

The page updates automatically and lists the private network information assigned to the Droplet. When you’re done, click the **OFF** button to switch the Droplet back **ON**.

![Powering on the Droplet by clicking the On/Off switch in the control panel](https://docs.digitalocean.com/screenshots/droplets/switch-on.ff337f00913f223f83a0b8d6f5c3098ef9ec49da1ec5cc77314c10138f03d377.png)

The Droplet is booted when the switch turns green and the label says **ON**.

### Network Configuration by Operating System[](#network-configuration-by-operating-system)

If your Droplet is apart of a VPC network but its private network interface hasn’t been enabled to communicate with the VPC network, you need to manually configure the private network interface on the Droplet itself. How you do this depends on which Linux distribution your Droplet is running.

 Ubuntu 18.04

On Ubuntu 18.04, you need to use [Netplan](https://netplan.io/) to define the network interface using the Droplet’s private IP address and the MAC address for the Ethernet interface. You can learn more about Netplan and the files in `/etc/netplan` in [this section of What’s New in Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/what-s-new-in-ubuntu-18-04#netplan-and-systemd-networkd).

To get the MAC address, use `lshw` to list the details of your server’s network-class hardware.

    lshw -class network

Locate `*-network:1` in the output. The `serial` value is the MAC address you need.

    . . .
    *-network:1
        description: Ethernet controller
        . . .
        *-virtio1 DISABLED
            description: Ethernet interface
            physical id: 0
            bus info: virtio@1
            logical name: ens4
            serial: ex:am:pl:e3:65:13
    . . .

At the bottom of `/etc/netplan/50-cloud-init.yaml`, add the following stanza.

`/etc/netplan/50-cloud-init.yaml`

            eth1:
                addresses:
                - 198.51.100.0/16
                match:
                    macaddress: ex:am:pl:e3:65:13
                set-name: eth1

Replace the `addresses` value with the private IP address of the Droplet followed by the `/16` subnet prefix. Replace the `macaddress` value with the MAC address you found with `lshw`.

Errors in your syntax can disrupt your networking and force you to use the [Droplet console](https://cloud.digitalocean.com/login) to restore connectivity, so check the file’s syntax before you apply the changes.

    sudo netplan apply --debug

If the file has syntax errors, this command returns the errors and doesn’t apply the changes. When the file’s syntax is correct, the command returns no output and applies the changes.

Reboot the Droplet one more time for the changes to take effect, and to verify that the configuration remains after the system is restarted:

    sudo reboot

 Ubuntu 16.04

On Ubuntu 16.04, you need to disable [consistent network device naming](https://en.wikipedia.org/wiki/Consistent_Network_Device_Naming) to make sure public traffic uses the `eth0` interface and private traffic uses the `eth1` interface.

Open `/etc/default/grub.d/50-cloudimg-settings.cfg` and edit the `GRUB_CMDLINE_LINUX_DEFAULT` setting. At the end of the line, within the quotations, add `net.ifnames=0`:

`/etc/default/grub.d/50-cloudimg-settings.cfg`

    GRUB_CMDLINE_LINUX_DEFAULT="console=tty1 console=ttyS0 net.ifnames=0"

Save and close the file, then update GRUB with the new settings and reboot the Droplet.

    sudo update-grub
    sudo reboot

After the Droplet finishes rebooting, reconnect with SSH.

Open the network configuration file `/etc/network/interfaces.d/50-cloud-init.cfg` in a text editor and add a new section at the bottom of the file to define the interface for the VPC network. Substitute the IP address (`198.51.100.0`) in the `address` field for the Droplet’s private IP address located in the **Private Network** section of the Droplet’s **Networking** tab.

`/etc/network/interfaces.d/50-cloud-init.cfg`

    auto eth1
    iface eth1 inet static
            address 198.51.100.0
            netmask 255.255.0.0

Save and close the file then restart networking, which checks the configuration for errors and load the network interface.

    sudo systemctl restart networking

When the command is successful, it doesn’t return output.

 Debian and Ubuntu 14.04

Warning

Standard support for [Ubuntu 14.04 LTS ended](https://wiki.ubuntu.com/Releases) in April 2019. Because this distribution has reached end of life, we recommend [migrating to a newer release](https://www.digitalocean.com/community/tutorials/how-to-migrate-linux-servers-part-1-system-preparation) so your Droplets remain supported and secure.

To add a private network interface to Ubuntu 14.04 and Debian distributions, open the network configuration file `/etc/network/interfaces` in a text editor. Add a new section at the bottom of the file to define the interface for the VPC network. Substitute the IP address (`198.51.100.0`) in the `address` field for the Droplet’s private IP address located in the **Private Network** section of the Droplet’s **Networking** tab.

`/etc/network/interfaces`

    auto eth1
    iface eth1 inet static
            address 198.51.100.0
            netmask 255.255.0.0

Save and close the file, then use `ifup` to bring up the interface.

    ifup eth1

When the command is successful, it doesn’t return output. If run more than once, the command returns `ifup: interface eth1 already configured`.

 CentOS and Fedora

On CentOS and Fedora, get the hardware address for `eth1` with `ifconfig`.

    sudo ifconfig -a

On **CentOS 7 and Fedora**, use the `ether` value in the `eth1` section:

    eth1: flags=4098<BROADCAST,MULTICAST>  mtu 1500
            ether 12:23:34:45:56:67  txqueuelen 1000  (Ethernet)

On **CentOS 6**, use the value of `HWaddr` in the `eth1` section:

    eth1      Link encap:Ethernet  HWaddr 12:23:34:45:56:67
            BROADCAST MULTICAST  MTU:1500  Metric:1

Next, create and open a new file in the interface configuration directory called `/etc/sysconfig/network-scripts/ifcfg-eth1`.

Enter the content below, substituting the values for the specific Droplet. `HWADDR` is the value from the `ifconfig` output, and the `IPADDR` value is displayed on the Droplet’s **Networking** tab in the **Private network** section.

`/etc/sysconfig/network-scripts/ifcfg-eth1`

    DEVICE="eth1"
    HWADDR=info_from_ifconfig
    IPADDR=198.51.100.0
    BOOTPROTO=none
    ONBOOT="yes"
    NETMASK=255.255.0.0
    NM_CONTROLLED="yes"
    IPV6INIT="no"
    DEFROUTE="no"

Save and close the file, then use `ifup` to bring up the new network interface.

    ifup eth1

When the command is successful, it doesn’t return output.

 FreeBSD

On FreeBSD, you need to edit `/etc/rc.conf`.

In this file, locate the line which reads `# DigitalOcean Dynamic Configuration lines and the immediate line below it, are removed each boot`. Directly above that comment, add the following line, substituting in the private IP from on the Droplet’s **Networking** tab in the **Private network section**. The file should look like this:

`/etc/rc.conf`

    ifconfig_vtnet1="inet 198.51.100.0 netmask 255.255.0.0"
    
    # DigitalOcean Dynamic Configuration lines and the immediate line below it,
    # are removed each boot.

Save and close the file, then restart networking, which verifies the syntax of the changes and applies them.

    sudo /etc/netstart

When the interface is successfully enabled, the output contains a `vtnet1` section with the private IP address.

## Verify the Configuration[](#verify-the-configuration)

You can verify the private network configuration with `ifconfig`.

    sudo ifconfig

The output should contain a section for the interface that includes the private IP address and shows the status as `UP` and `RUNNING`.

On Linux distributions (like Ubuntu, Debian, CentOS, and Fedora), look for the `eth1` section:

    eth1: flags=4163< UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
            inet 198.51.100.0  netmask 255.255.0.0  broadcast 192.0.2.255
            inet6 xxxx::xxxx:xxxx:xxxx:xxx  prefixlen 64  scopeid 0x20<link>
            ether 12:34:46:78:98:10  txqueuelen 1000  (Ethernet)
            RX packets 258  bytes 13872 (13.5 KiB)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 146  bytes 10640 (10.3 KiB)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

On FreeBSD, look for the `vtnet1` section:

    vtnet1: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=6c07bb<RXCSUM,TXCSUM,VLAN_MTU,VLAN_HWTAGGING,JUMBO_MTU,VLAN_HWCSUM,TSO4,TSO6,LRO,VLAN_HWTSO,LINKSTATE,RXCSUM_IPV6,TXCSUM_IPV6>
            ether 12:34:46:78:98:10
            hwaddr 12:34:46:78:98:10
            inet6 xxxx::xxxx:xxxx:xxxx:xxx%vtnet1 prefixlen 64 scopeid 0x2
            inet 198.51.100.0 netmask 0xffff0000 broadcast 192.0.2.255
            nd6 options=21<PERFORMNUD,AUTO_LINKLOCAL>
            media: Ethernet 10Gbase-T <full-duplex>
            status: active

To fully test that the network is configured, try pinging the newly-enabled Droplet from a second Droplet on the VPC network.

In this article...

*   [Enable VPC Networking on Existing Droplets](#on-existing-droplets)
    *   [Network Configuration by Operating System](#network-configuration-by-operating-system)
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

Try using diffe