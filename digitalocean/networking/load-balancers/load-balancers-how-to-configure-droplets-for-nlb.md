---
source: '[unknown - load-balancers-how-to-configure-droplets-for-nlb.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Configure Backend Droplets for Network Load Balancers | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/load-balancers.1b5f8a9d40bf92d2798a187032a28a29572afdd5e74855e5b1c1d30dfffc07ed.svg)Load Balancers](/products/networking/load-balancers/)
*   [Getting Started](/products/networking/load-balancers/getting-started/)
    *   [Quickstart](/products/networking/load-balancers/getting-started/quickstart/)
    *   [Manage Load Balancers with doctl](/products/networking/load-balancers/getting-started/with-doctl/)
*   [How-Tos](/products/networking/load-balancers/how-to/)
    *   [Create Regional Load Balancers](/products/networking/load-balancers/how-to/create/)
    *   [Create Global Load Balancers](/products/networking/load-balancers/how-to/create-global-load-balancer/)
    *   [Manage Regional Load Balancers](/products/networking/load-balancers/how-to/manage/)
    *   [Manage Global Load Balancers](/products/networking/load-balancers/how-to/manage-global-load-balancers/)
    *   [Scale Regional Load Balancers](/products/networking/load-balancers/how-to/scale/)
    *   [Configure SSL Passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/)
    *   [Balance TCP Traffic](/products/networking/load-balancers/how-to/tcp/)
    *   [Configure Backend Droplets](/products/networking/load-balancers/how-to/configure-droplets-for-nlb/)
    *   [Destroy Load Balancers](/products/networking/load-balancers/how-to/destroy/)
    *   [Configure SSL Termination](/products/networking/load-balancers/how-to/ssl-termination/)
*   [Reference](/products/networking/load-balancers/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Load-Balancers)
    *   [CLI Reference](/reference/doctl/reference/compute/load-balancer/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/load-balancers/concepts/)
    *   [Best Practices](/products/networking/load-balancers/concepts/best-practices/)
    *   [Load Balancer Status](/products/networking/load-balancers/concepts/load-balancer-status/)
*   [Details](/products/networking/load-balancers/details/)
    *   [Features](/products/networking/load-balancers/details/features/)
    *   [Pricing](/products/networking/load-balancers/details/pricing/)
    *   [Availability](/products/networking/load-balancers/details/availability/)
    *   [Limits](/products/networking/load-balancers/details/limits/)
*   [Support](/products/networking/load-balancers/support/)

*   [How-Tos](/products/networking/load-balancers/how-to/) 
*   Configure Backend Droplets

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Configure Backend Droplets for Network Load Balancers

Validated on 12 Aug 2025 • Last edited on 3 Sep 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

Network load balancers route traffic at the network transport level, based on IP addresses and ports. You must update the network configuration of all backend Droplets to properly handle this traffic.

## Find the Load Balancer IP Address[](#find-the-load-balancer-ip-address)

First, find the IP address of your network load balancer. The address is listed on [the **Load Balancers** page](https://cloud.digitalocean.com/networking/load_balancers) in the control panel, or [use `doctl`](/reference/doctl/how-to/install/) to retrieve it with the following command:

    doctl compute load-balancer list --format Name,IP

This outputs a table with load balancer names and IP addresses:

    Name                       IP
    nyc3-load-balancer-01      203.0.113.67
    global-load-balancer-01    
    network-load-balancer      203.0.113.2

Note

IPv6 network load balancers require IPv6-enabled backend Droplets. Read [How to Enable IPv6 on Droplets](/products/networking/ipv6/how-to/enable/) to enable IPv6 if necessary.

Note the correct load balancer IP address to use in the next steps.

## Add a Route for the Load Balancer IP Address[](#add-a-route-for-the-load-balancer-ip-address)

Log in to your backend Droplet using SSH or the console. Run the `ip route add` command to add a route to the kernel’s IP routing table, using the IP address you retrieved in the previous step. Use `eth0` for `<your_interface>` if the load balancer is public, and `eth1` if it’s a private, internal-only load balancer:

    ip route add to local <your_loadbalancer_ip> dev <your_interface>

Remember to replace `<your_loadbalancer_ip>` with the correct IP address.

This command creates a routing rule that directs traffic for the load balancer IP to the local system, regardless of its actual source. The system claims ownership of the IP address on the specified interface, ensuring that any incoming packets for the IP address are processed by the local machine, and any services listening on the IP address can handle this traffic.

**For private, internal load balancers only**, you must also configure Address Resolution Protocol (ARP) announcements on the `eth1` interface. Use `sysctl` to set `net.ipv4.conf.eth1.arp_announce` to `2`:

    sysctl -w net.ipv4.conf.eth1.arp_announce=2

Your Droplet can now handle traffic from the load balancer. Wait for the load balancer health checks to pass before testing connectivity.

The `ip route` and `sysctl` configuration changes do not persist across reboots. The next step shows how to configure systemd to run the commands during the boot process.

## Make the Route Permanent[](#make-the-route-permanent)

There are many different ways to run the network configuration commands automatically when your Droplet boots. To do so with systemd, set up a systemd unit file.

First, open the file with `nano` or your preferred text editor:

    sudo nano /etc/systemd/system/configure-nlb.service

Paste in the following, remembering to replace `<your_loadbalancer_ip>` with the correct IP address, and `<your_interface>` with `eth0` for public load balancers or `eth1` for private:

    [Unit]
    Description=Configure Network Load Balancer
    After=network.target
    
    [Service]
    ExecStart=/sbin/ip route add to local <your_loadbalancer_ip> dev <your_interface>
    #ExecStart=/sbin/sysctl -w net.ipv4.conf.eth1.arp_announce=2
    Type=oneshot
    RemainAfterExit=yes
    
    [Install]
    WantedBy=multi-user.target

If you’re configuring a private load balancer, uncomment the `ExecStart=/sbin/sysctl ...` command by removing the `#` at the beginning of the line.

Save the file and quit your editor to return to the command prompt.

Use `systemctl` to enable and start the `configure-nlb` service:

    sudo systemctl enable configure-nlb
    sudo systemctl start configure-nlb

You can check the status of the service with `systemctl status`:

    sudo systemctl status configure-nlb

The output should show `enabled` and `active (exited)`. The routing changes are now persistent across system reboots.

In this article...

*   [Find the Load Balancer IP Address](#find-the-load-balancer-ip-address)
*   [Add a Route for the Load Balancer IP Address](#add-a-route-for-the-load-balancer-ip-address)
*   [Make the Route Permanent](#make-the-route-permanent)

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