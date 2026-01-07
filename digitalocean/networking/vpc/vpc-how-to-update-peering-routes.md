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
source_url: https://docs.digitalocean.com/products/networking/vpc/how-to/update-peering-routes/
domain: docs.digitalocean.com
---
                How to Update Routes to Enable VPC Peering | DigitalOcean Documentation

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
*   Update Peering Routes

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Update Routes to Enable VPC Peering

Validated on 11 Dec 2024 • Last edited on 6 Nov 2025

A Virtual Private Cloud (VPC) is a private network interface for collections of DigitalOcean resources. VPC networks are inaccessible from the public internet and other VPC networks, and traffic on them doesn’t count against bandwidth usage. You can link VPC networks to each other using VPC peering connections.

[VPC peering](/products/networking/vpc/how-to/create-peering/) joins two VPC networks with a secure, private connection.

Droplets on peered VPC networks need additional routing information to know how to send packets between networks. This information is automatically configured on Droplets created after 2 October 2024 using a standard base image if:

*   the Droplet was started or restarted while on a peered VPC.
*   the Droplet’s networking service was started or restarted while on a peered VPC network.

To activate a newly-created peering on an existing Droplet that was created after 2 October 2024, see the [Restart Network Services section](#restart-network-services).

For Droplets created before 2 October 2024, or Droplets using custom base images, see the [Manually Adding Routes section](#manually-add-routes) for how to configure routes for VPC peering.

## Restart Network Services[](#restart-network-services)

To minimize the impact of new routes on customer Droplets, peering routes are only automatically added to Droplets created in a VPC network that is already peered with at least one other VPC network.

To activate a newly-created peering on an existing Droplet that was created after 2 October 2024, restart the Droplet’s networking service.

The command to restart the networking service depends on the networking stack used by the Droplet’s operating system. Here are some common examples:

 Netplan (Ubuntu and Debian)

Ubuntu and Debian use Netplan with `systemd-networkd` to manage network configuration. Use `systemctl` to restart `systemd-networkd`:

    sudo systemctl restart systemd-networkd

Note

**Debian 11 users**: [Debian 11 reached end of life and is no longer supported](https://docs.digitalocean.com/release-notes/droplets/#2025-07-23). We recommend upgrading to ensure you receive security updates. If you need to continue using Debian 11 temporarily, use the legacy `ifupdown` method with `sudo systemctl restart networking`.

 NetworkManager (CentOS, Alma Linux, Rocky Linux, Fedora)

CentOS, Alma Linux, Rocky Linux, and Fedora use NetworkManager to manage network configuration. Use `systemctl` to restart `NetworkManager`:

    sudo systemctl restart NetworkManager

After restarting the networking service, read [Verify Added Routes](#verify-added-routes) for details on how to check that the new configuration is working.

## Add Routes Manually[](#add-routes-manually)

On Droplets created before 2 October 2024, or Droplets using custom base images, VPC peering routes must be added manually.

Execute the following script in your Droplet console to add the necessary routes:

    VPC_GATEWAY_IP=$(curl -s 169.254.169.254/metadata/v1/interfaces/private/0/ipv4/gateway)
    
    ip route replace 10.0.0.0/8 via ${VPC_GATEWAY_IP} dev eth1 mtu 1500 metric 101
    ip route replace 172.16.0.0/12 via ${VPC_GATEWAY_IP} dev eth1 mtu 1500 metric 101
    ip route replace 192.168.0.0/16 via ${VPC_GATEWAY_IP} dev eth1 mtu 1500 metric 101

This script first queries the Droplet metadata service to get the IP address of its VPC gateway. It then adds three routes using the `ip route` command and the saved gateway IP address.

These three routes cover the entire RFC 1918 range and enable all current and future VPC peering connections. For advanced use cases, it is possible to limit the routes to only the subnets of the peered VPCs.

### Permanently Add the Routes[](#permanently-add-the-routes)

The routes added in the previous section are lost when the Droplet or its networking stack is restarted. The steps needed to make the changes persistent depend on the particular network services used by your Linux distribution or your custom image. Some example configurations follow.

 Netplan (Ubuntu and Debian)

To persist VPC peering routes on a Netplan-based distribution, you need to update the Droplet’s network configuration file. First, gather the necessary information.

Note

**Debian 11 users**: [Debian 11 reached end of life and is no longer supported](https://docs.digitalocean.com/release-notes/droplets/#2025-07-23). We recommend upgrading to a current Debian release or Ubuntu. If you need to continue using Debian 11 temporarily, it uses `ifupdown` by default - you can create routes in `/etc/network/interfaces` or use dispatcher scripts as shown in the NetworkManager section, but substitute `ifupdown` restart commands.

Get the Droplet’s VPC gateway IP address:

    curl -s 169.254.169.254/metadata/v1/interfaces/private/0/ipv4/gateway

This returns a single IP address, like this:

    10.120.0.1

Open and edit `/etc/netplan/50-cloud-init.yaml` in a text editor. Look for the `eth1` interface configuration and add the peering routes to the `routes` section:

    network:
      version: 2
      ethernets:
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
            - to: 10.0.0.0/8
              via: <your_gateway_ip>
              metric: 101
            - to: 172.16.0.0/12
              via: <your_gateway_ip>
              metric: 101
            - to: 192.168.0.0/16
              via: <your_gateway_ip>
              metric: 101
          set-name: eth1

Replace `<your_gateway_ip>` (in all three places) with the gateway IP address returned from the `curl` command.

If there are existing routes under your VPC interface, add the new peering routes to the existing `routes` section. If there is no `routes` section (which is common if you haven’t previously configured routes manually), create one as shown above.

Save the changes and exit the file. Then run the following command to apply the new network configuration:

    netplan apply --debug

The `--debug` flag returns any YAML formatting errors in the configuration file. If formatted correctly, the command returns a blank prompt.

For details on how to check that the new configuration works, see the [Verify Added Routes section](#verify-added-routes).

 NetworkManager (CentOS, Alma Linux, Rocky Linux, Fedora)

To persist VPC peering routes on a NetworkManager-based distribution, you need to update the Droplet’s private network interface configuration. First, gather the necessary information.

Get the Droplet’s VPC gateway IP address:

    curl -s 169.254.169.254/metadata/v1/interfaces/private/0/ipv4/gateway

This returns a single IP address, like this:

    10.120.0.1

Next, identify the private network interface configuration file. Find the interface that has your VPC’s private IP address:

    curl -s 169.254.169.254/metadata/v1/interfaces/private/0/ipv4/address

This returns your VPC private IP, like `10.120.0.43`. Then find which interface has this IP:

    ip addr show | grep "<private_ip_address>"

This shows output similar to:

        inet 10.120.0.43/20 brd 10.120.15.255 scope global noprefixroute ens4

The interface name (in this example, `ens4`) tells you which configuration file to edit: `/etc/NetworkManager/system-connections/cloud-init-ens4.nmconnection`.

Once you’ve identified the correct file, open and edit it in a text editor. Here’s an example using `cloud-init-ens4.nmconnection`:

    [connection]
    id=cloud-init ens4
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
    route1=10.0.0.0/8,<your_gateway_ip>
    route2=172.16.0.0/12,<your_gateway_ip>
    route3=192.168.0.0/16,<your_gateway_ip>

Replace `<your_gateway_ip>` (in all three route entries) with the gateway IP address returned from the `curl` command.

If there are existing routes in the `[ipv4]` section, add the new peering routes as additional route entries (for example, if `route1` already exists, add the peering routes as `route2`, `route3`, and `route4`).

Save the changes and exit the file.

Once you have configured the network interface, reboot the Droplet for the changes to take effect.

For details on how to check that the new configuration works, see the [Verify Added Routes section](#verify-added-routes).

## Verify Added Routes[](#verify-added-routes)

To verify the Droplet’s routes are updated, check its routing table. Run the following `ip` command to print the routing table:

    ip route show

This produces output similar to the following, but with your specific gateway IP address:

    10.0.0.0/8 via 10.120.0.1 dev eth1 proto static metric 101
    172.16.0.0/12 via 10.120.0.1 dev eth1 proto static metric 101
    192.168.0.0/16 via 10.120.0.1 dev eth1 proto static metric 101

You can further verify that the peering connection works by pinging the private IP addresses of Droplets in other VPC networks. Use `ping` followed by the other Droplet’s private IP address:

    ping <private_ip_address>

## Remove Manually Added Routes[](#remove-manually-added-routes)

After removing all VPC peering connections from a VPC network, you can remove the peering routes from your Droplets. For Droplets created after 2 October 2024, restart the Droplet or its networking service to remove the routes automatically.

To remove manually added routes on Droplets created before 2 October 2024, use `ip route del`:

    ip route del 10.0.0.0/8 dev eth1 mtu 1500 metric 101
    ip route del 172.16.0.0/12 dev eth1 mtu 1500 metric 101
    ip route del 192.168.0.0/16 dev eth1 mtu 1500 metric 101

You can verify the routes have been removed by running `ip route show`.

If you added scripts or additional configuration to persistently add peering routes, you must remove them, then restart the Droplet or its networking service to remove the routes.

## Disable Automatic Route Injection[](#disable-automatic-route-injection)

To disable the automatic configuration of peering routes on Droplets created after 2 October 2024, deactivate the distribution-specific configuration script or service.

 Netplan (Ubuntu and Debian)

For Ubuntu or Debian disable the `vpc-peering.service` service using `systemctl`:

    sudo systemctl disable vpc-peering.service --now

To re-enable automatic route configuration, re-enable the service.

Note

**Debian 11 users**: [Debian 11 reached end of life and is no longer supported](https://docs.digitalocean.com/release-notes/droplets/#2025-07-23). We recommend upgrading to a current Debian release or Ubuntu for security updates and continued support. If you need to continue using Debian 11 temporarily, use `sudo chmod -x /etc/network/if-up.d/vpc-peering` to disable automatic route injection.

 NetworkManager (CentOS, Alma Linux, Rocky Linux, Fedora)

On CentOS, Alma Linux, Rocky Linux, and Fedora, make the `vpc-peering` script not executable using `chmod`:

    sudo chmod -x /etc/NetworkManager/dispatcher.d/vpc-peering

To re-enable automatic route configuration, make the script executable again with `chmod +x`.

## Disable Automatic Route Injection for the Entire Team[](#disable-automatic-route-injection-for-the-entire-team)

If you want to disable DigitalOcean’s route injection entirely to manage your own routes, [contact support](https://cloudsupport.digitalocean.com) to disable it for all future Droplet creations. After this feature is disabled, reboot existing Droplets to remove automatically-configured routes.

In this article...

*   [Restart Network Services](#restart-network-services)
*   [Add Routes Manually](#add-routes-manually)
    *   [Permanently Add the Routes](#permanently-add-the-routes)
*   [Verify Added Routes](#verify-added-routes)
*   [Remove Manually Added Routes](#remove-manually-added-routes)
*   [Disable Automatic Route Injection](#disable-automatic-route-injection)
*   [Disable Automatic Route Injection for the Entire Team](#disable-automatic-route-injection-for-the-entire-team)

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

Try using different keywords 