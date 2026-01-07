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
source_url: https://docs.digitalocean.com/products/networking/vpc/how-to/configure-droplet-nat-gateway/
domain: docs.digitalocean.com
---
                How to Configure Droplets for NAT Gateway | DigitalOcean Documentation

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
*   Configure Droplets for NAT Gateway

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Configure Droplets for NAT Gateway

Validated on 19 Nov 2025 • Last edited on 19 Nov 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

After [creating a VPC NAT gateway](/products/networking/vpc/how-to/create-nat-gateway/), you need to configure new IP routes for any backend Droplets that should use the gateway to access the internet. These routes direct internet traffic through the gateway.

When you set a NAT gateway as the [default gateway for a VPC network](#default-gateway-routing), Droplets can use the VPC gateway IP for routing, which automatically updates when you switch between default NAT gateways. Alternatively, you can send traffic through a specific NAT gateway by using its routing table IP address.

You can send all traffic through the gateway by replacing the default route, or send select traffic through the gateway by specifying an IP address or subnet.

Note

In addition to updating IP routes on your backend Droplets, you should also update your Droplets to [use their VPC-local DNS resolver](/products/networking/vpc/how-to/use-local-dns-resolver/). Using the default DNS resolver from behind a NAT gateway may result in poor performance and reliability due to rate limiting.

## Default Gateway Routing[](#default-gateway-routing)

When you set a NAT gateway as the default gateway for a VPC network, Droplets in that VPC can route traffic through the VPC gateway IP address. The VPC gateway IP automatically routes to whichever NAT gateway is set as default, allowing you to switch between NAT gateways without updating routes on individual Droplets.

Note

If you choose to route traffic directly to a specific NAT gateway’s routing table IP instead of the VPC gateway IP, you must manually update the route on every Droplet whenever you change or delete that NAT gateway.

This routing method applies to all Droplets in the VPC network, whether they were created before or after the NAT gateway.

To use default gateway routing:

1.  [Create a NAT gateway](/products/networking/vpc/how-to/create-nat-gateway/) and set it as the default gateway for the VPC network.
2.  Configure your Droplets to route traffic via the VPC gateway IP address, which you can retrieve from the Droplet’s metadata endpoint.

To retrieve the VPC gateway IP address, connect to your Droplet and run the following command:

    curl -s http://169.254.169.254/metadata/v1/interfaces/private/0/ipv4/gateway

This returns the VPC gateway IP address for your Droplet’s private interface (typically `eth1`). Use this IP address in your routing configuration as described in the sections below.

If you later set a different NAT gateway as the default for the same VPC, traffic automatically routes through the new default NAT gateway without requiring changes to your Droplet configuration.

Warning

If you unset a NAT gateway as the default without setting another as default, Droplets configured to use the VPC gateway IP lose connectivity. You must either set another NAT gateway as default or update your Droplet routes to remove the gateway configuration.

## Define Temporary Route Changes[](#define-temporary-route-changes)

The following configuration changes are temporary and revert after a reboot, but are useful when first setting up and testing routing through a NAT gateway. Read the [Persistent Route Changes](#persistent-route-changes) section to make permanent configuration changes.

 Send All Traffic Through the Gateway

This configuration redirects all of the backend Droplet’s internet traffic through the gateway. To prevent the SSH connection to the Droplet from disconnecting once you change the IP routes, you need to log in to the backend Droplet through a second “control Droplet” on the same VPC network, or use the Recovery Console in the Droplet’s Access tab in the control panel.

To log in to the backend Droplet through a control Droplet, open a new terminal on your local machine and run the following `ssh` command with the `ProxyCommand` option, replacing the `<public_IP_of_control_Droplet>` and `<private_IP_of_backend_Droplet>` values with the applicable IP addresses. The `ProxyCommand` option tells `ssh` to connect to the control Droplet first, and then use that connection to connect to the backend Droplet:

    ssh -o \
      ProxyCommand="ssh -W %h:%p root@<public_IP_of_control_Droplet>" \
      root@<private_IP_of_backend_Droplet>

Once logged into the backend Droplet, you need to add an IP route to its network configuration that retains the Droplet’s access to its metadata endpoint (`169.254.169.254`). The metadata endpoint is a service provided by DigitalOcean that allows the Droplet to access data about itself, like its IP address, DNS name server settings, and network interface information.

To do this, locate the backend Droplet’s original gateway IP address by sending the following `curl` request to the metadata endpoint:

    curl -s http://169.254.169.254/metadata/v1/interfaces/public/0/ipv4/gateway

The command returns the backend Droplet’s current gateway address.

To create the necessary IP route, run the following command, replacing `<your-gateway-IP>` with the gateway IP address returned in the `curl` request:

    ip route add 169.254.169.254 via <your-gateway-IP> dev eth0

The command line returns a blank prompt when executed, which indicates that the metadata API route has been set.

Next, set a new default route using the VPC gateway IP address.

If you have set a NAT gateway as the default gateway for your VPC network, retrieve the VPC gateway IP address from the metadata endpoint:

    curl -s http://169.254.169.254/metadata/v1/interfaces/private/0/ipv4/gateway

The command returns the VPC gateway IP address for your Droplet’s private interface.

Alternatively, if you want to route traffic through a specific NAT gateway regardless of which is set as default, use that NAT gateway’s **Routing table IP address** instead. You can find this on the NAT gateway’s details page in the control panel by clicking **Networking** in the left menu, then clicking the **VPC** tab. Click on the VPC that contains the NAT gateway, then click its **NAT Gateway** tab. Click on the name of the NAT gateway to view its details.

You can also use `doctl` to print a list of your NAT gateways along with their names, regions, and the VPCs they’re attached to:

    doctl compute vpc-nat-gateway list --format Name,Region,VPCs

The output is a table of information:

    Name               Region    VPCs     
    example-gateway    tor1      4cc3fca9-0d4e-4292-bb4c-3806dc943a5a:10.137.0.2

Under the `VPCs` column is a list of VPC IDs. The NAT gateway’s routing table IP address for that VPC network is displayed after the `:` colon. In the example output above, the routing table IP address is `10.137.0.2`.

Add the gateway IP (either the VPC gateway IP or the NAT gateway’s routing table IP) as the default route to the backend Droplet’s network configuration:

    ip route change default via <your-gateway-IP>

The command does not print any output when successful.

 Send Select Traffic Through the Gateway

If you’re routing select traffic through the gateway, and you’re connecting from an IP address that is not affected by the planned route changes, you can connect with SSH directly into the backend Droplet or use the Droplet console in the control panel.

To route traffic through the gateway, you need the gateway IP address to use for routing.

If you have set a NAT gateway as the default gateway for your VPC network, retrieve the VPC gateway IP address from the metadata endpoint:

    curl -s http://169.254.169.254/metadata/v1/interfaces/private/0/ipv4/gateway

The command returns the VPC gateway IP address.

Alternatively, if you want to route traffic through a specific NAT gateway regardless of which is set as default, use that NAT gateway’s routing table IP address. You can retrieve it using `doctl`:

    doctl compute vpc-nat-gateway list --format Name,Region,VPCs

The output is a table of information:

    Name               Region    VPCs     
    example-gateway    tor1      4cc3fca9-0d4e-4292-bb4c-3806dc943a5a:10.137.0.2

Under the `VPCs` column is a list of VPC IDs. The NAT gateway’s routing table IP address for that VPC network is displayed after the `:` colon. In the example output above, the routing table IP address is `10.137.0.2`.

Use the `ip route` command with the `via` option to add a route through your chosen gateway IP address:

    ip route add 203.0.113.0/20 via <your-gateway-IP>

Replace `203.0.113.0/20` with the network prefix you’d like to route through the gateway, in CIDR notation, or with a single IPv4 address. Replace `<your-gateway-IP>` with either the VPC gateway IP or the NAT gateway’s routing table IP.

The command line returns a blank prompt when executed.

Your backend Droplet networking changes are complete. See [Test Route Changes](#test-route-changes) to test that the configuration is working correctly, then read [Persistent Route Changes](#persistent-route-changes) to configure routes that persist when you reboot your machine.

## Test Route Changes[](#test-route-changes)

You can verify your backend Droplet networking changes using the `ping` and `ip route` commands.

`ping` verifies that your Droplet can reach the internet. To ping a website, run:

    ping google.com

The command returns results that look like this:

    root@backend:~# ping google.com
    PING google.com (216.58.196.174) 56(84) bytes of data.
    64 bytes from maa03s31-in-f14.1e100.net (216.58.196.174): icmp_seq=1 ttl=118 time=9.70 ms
    64 bytes from maa03s31-in-f14.1e100.net (216.58.196.174): icmp_seq=2 ttl=118 time=8.38 ms

If you are only routing select traffic through the NAT gateway, ping an IP address or hostname that matches your configuration.

After you verify that the Droplet can reach the internet, use `ip route` to verify the network route the backend Droplet uses to reach an IP address on the internet. To use `ip route`, run:

    ip route get 8.8.8.8

The command returns the network route the Droplet uses to reach the IP address, `8.8.8.8`.

    8.8.8.8 via  <gateway-IP-address> dev eth1 src <backend-droplet-private-IP-address> uid 0

If you’ve not updated the default route, make sure you’re testing an address that should be routed through the NAT gateway.

## Persistent Route Changes[](#persistent-route-changes)

To persist IP route changes and ensure that the Droplet boots with the new route information, you need to update the Droplet’s network configuration files. This process is operating-system specific, but most popular Linux distributions use either Netplan or NetworkManager.

 Netplan (Ubuntu and Debian)

To persist route updates on a Netplan-based distribution, open and edit `/etc/netplan/50-cloud-init.yaml` in a text editor.

    network:
        version: 2
        ethernets:
            eth0:
                addresses:
                - 137.184.174.21/20
                - 10.20.0.7/16
                match:
                    macaddress: 86:bc:46:82:4d:95
                mtu: 1500
                nameservers:
                    addresses:
                    - 67.207.67.3
                    - 67.207.67.2
                    search: []
                routes:
                -   to: 0.0.0.0/0
                    via: <original gateway address>               
                set-name: eth0
            eth1:
                addresses:
                - 10.118.0.4/20
                match:
                    macaddress: 5a:59:57:e0:f3:9d
                mtu: 1500
                nameservers:
                    addresses:
                    - 67.207.67.3
                    - 67.207.67.2
                    search: []
                routes:
                -   to: 0.0.0.0/0
                    via: <gateway IP address of NAT gateway>
                set-name: eth1

If you are setting a new default route to route all traffic through the NAT gateway, first update the existing `eth0` route to only route the metadata API:

                routes:
                -   to: 169.254.169.254/32
                    via: <original gateway address>

If you are only sending select traffic through the NAT gateway, do not change the existing `eth0` default route.

Next create a new route under `eth1` by updating the following lines:

                routes:
                -   to: 0.0.0.0/0
                    via: <gateway IP address>

Replace `<gateway IP address>` with either the VPC gateway IP address (if using default gateway routing) or the specific NAT gateway’s routing table IP address. If you’re replacing the default route, leave `to: 0.0.0.0/0` as is, otherwise update it to a more specific network prefix in CIDR notation such as `203.0.113.0/20`.

Save the changes and exit the file. Then run the following command to apply the new network configuration:

    netplan apply -debug

The `-debug` flag returns any YAML formatting errors in the configuration file. If formatted correctly, the command returns a blank prompt.

 NetworkManager (CentOS, Alma Linux, Rocky Linux, Fedora)

To persist route updates on a NetworkManager-based distribution, update the `eth0` and `eth1` interfaces of the Droplet. Start with editing the `eth0` interface `/etc/NetworkManager/system-connections/cloud-init-eth0.nmconnection`. This is the configuration file for the Droplet’s public interface.

    [connection]
    id=cloud-init eth0
    uuid=1dd9a779-d327-56e1-8454-c65e2556c12c
    type=ethernet
    
    [user]
    org.freedesktop.NetworkManager.origin=cloud-init
    
    [ethernet]
    mtu=1500
    mac-address=D6:4B:77:B4:C0:36
    
    [ipv4]
    method=manual
    may-fail=false
    address1=178.128.238.189/20
    route1=0.0.0.0/0,<original gateway address>
    address2=10.20.0.10/16

If you are setting a new default route to route all traffic through the NAT gateway, update the existing default route to only route the metadata API:

    route1=169.254.169.254/32,<original gateway address>

Do not modify the original gateway address.

Save the changes to the file and close it. Next open and edit the `eth1` private interface configuration file `/etc/NetworkManager/system-connections/cloud-init-eth1.nmconnection`

    [connection]
    id=cloud-init eth1
    uuid=3c50eb47-7260-5a6d-801d-bd4f587d6b58
    type=ethernet
    
    [user]
    org.freedesktop.NetworkManager.origin=cloud-init
    
    [ethernet]
    mtu=1500
    mac-address=D6:84:01:8D:69:63
    
    [ipv4]
    method=manual
    may-fail=false
    address1=10.118.0.8/20
    route1=0.0.0.0/0,<gateway IP address>

Update `<gateway IP address>` with either the VPC gateway IP address (if using default gateway routing) or the specific NAT gateway’s routing table IP address. If you’re replacing the default route to route all traffic through the gateway, leave `0.0.0.0/0`, otherwise update it to a more specific network prefix in CIDR notation such as `203.0.113.0/20`.

Save the changes and exit the file.

Once you have configured your network interfaces and added the IP route, reboot the Droplet for the changes to take effect.

In this article...

*   [Default Gateway Routing](#default-gateway-routing)
*   [Define Temporary Route Changes](#define-temporary-route-changes)
*   [Test Route Changes](#test-route-changes)
*   [Persistent Route Changes](#persistent-route-changes)

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

### We can't find any results for your sear