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
source_url: https://docs.digitalocean.com/products/networking/ipv6/how-to/enable/
domain: docs.digitalocean.com
---
                How to Enable IPv6 on Droplets | DigitalOcean Documentation

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
*   Enable IPv6

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Enable IPv6 on Droplets

Validated on 5 Feb 2024 • Last edited on 10 Dec 2025

[IP addresses](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking) let machines communicate across a network. DigitalOcean Droplets are assigned IPv4 addresses by default. Enabling IPv6 on a Droplet gives you access to its 16 additional IPv6 addresses.

You can enable IPv6 on a Droplet when you create it or after you create it.

[Enabling IPv6 during Droplet creation](#during-creation) automatically configures the Droplet’s network interfaces. We recommend this option because it’s faster and avoids manual configuration errors.

You can still [enable IPv6 on an existing Droplet](#on-existing-droplets) by manually configuring its network interface.

## Enable IPv6 During Droplet Creation Using the CLI[](#enable-ipv6-during-droplet-creation-using-the-cli)

You can enable IPv6 on Droplets during creation by setting the `--enable-ipv6` flag to `true` when using the `doctl compute droplet create` command.

How to Create a Droplet Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute droplet create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/droplet/create/) for more details:
    
        doctl compute droplet create <droplet-name>... [flags]
    
    The following example creates a Droplet named `example-droplet` with a two vCPUs, two GiB of RAM, and 20 GBs of disk space. The Droplet is created in the `nyc1` region and is based on the `ubuntu-20-04-x64` image. Additionally, the command uses the `--user-data` flag to run a Bash script the first time the Droplet boots up:

doctl compute droplet create example-droplet –size s-2vcpu-2gb –image ubuntu-20-04-x64 –region nyc1 –user-data $’#!/bin/bash\\n touch /root/example.txt; sudo apt update;sudo snap install doctl'

Please note: In Windows Powershell, the example command would be the following instead:

    ```shell
    doctl compute droplet create example-droplet --size s-2vcpu-2gb --image ubuntu-20-04-x64 --region nyc1  --user-data "#!/bin/bash`n touch /root/example.txt; sudo apt update;sudo snap install doctl"
    ```

## Enable IPv6 During Droplet Creation Using the API[](#enable-ipv6-during-droplet-creation-using-the-api)

You can enable IPv6 on Droplets during creation by setting the `ipv6` field to `true` when using the Droplet creation call.

How to Create a Droplet Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/droplets`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/droplets_create).

### cURL[](#create-a-droplet-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name":"example.com","region":"nyc3","size":"s-1vcpu-1gb","image":"ubuntu-20-04-x64","ssh_keys":[289794,"3b:16:e4:bf:8b:00:8b:b8:59:8c:a9:d3:f0:19:fa:45"],"backups":true,"ipv6":true,"monitoring":true,"tags":["env:prod","web"],"user_data":"#cloud-config\nruncmd:\n  - touch /test.txt\n","vpc_uuid":"760e09ef-dc84-11e8-981e-3cfdfeaae000"}' \
      "https://api.digitalocean.com/v2/droplets"

### Go[](#create-a-droplet-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "os"
    
        "github.com/digitalocean/godo"
    )
    
    func main() {
        token := os.Getenv("DIGITALOCEAN_TOKEN")
    
        client := godo.NewFromToken(token)
        ctx := context.TODO()
    
        createRequest := &godo.DropletCreateRequest{
            Name:   "example.com",
            Region: "nyc3",
            Size:   "s-1vcpu-1gb",
            Image: godo.DropletCreateImage{
                Slug: "ubuntu-20-04-x64",
            },
            SSHKeys: []godo.DropletCreateSSHKey{
                godo.DropletCreateSSHKey{ID: 289794},
                godo.DropletCreateSSHKey{Fingerprint: "3b:16:e4:bf:8b:00:8b:b8:59:8c:a9:d3:f0:19:fa:45"}
            },
            Backups: true,
            IPv6: true,
            Monitoring: true,
            Tags: []string{"env:prod","web"},
            UserData: "#cloud-config\nruncmd:\n  - touch /test.txt\n",
            VPCUUID: "760e09ef-dc84-11e8-981e-3cfdfeaae000",
        }

### Ruby[](#create-a-droplet-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    droplet = DropletKit::Droplet.new(
      name: 'example.com',
      region: 'nyc3',
      size: 's-1vcpu-1gb',
      image: 'ubuntu-20-04-x64',
      ssh_keys: [289794,"3b:16:e4:bf:8b:00:8b:b8:59:8c:a9:d3:f0:19:fa:45"],
      backups: true,
      ipv6: true,
      monitoring: true,
      tags: ["env:prod","web"],
      user_data: "#cloud-config\nruncmd:\n  - touch /test.txt\n",
      vpc_uuid: "760e09ef-dc84-11e8-981e-3cfdfeaae000",
    )
    client.droplets.create(droplet)

### Python[](#create-a-droplet-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "example.com",
      "region": "nyc3",
      "size": "s-1vcpu-1gb",
      "image": "ubuntu-20-04-x64",
      "ssh_keys": [
        289794,
        "3b:16:e4:bf:8b:00:8b:b8:59:8c:a9:d3:f0:19:fa:45"
      ],
      "backups": True,
      "ipv6": True,
      "monitoring": True,
      "tags": [
        "env:prod",
        "web"
      ],
      "user_data": "#cloud-config\nruncmd:\n  - touch /test.txt\n",
      "vpc_uuid": "760e09ef-dc84-11e8-981e-3cfdfeaae000"
    }
    
    resp = client.droplets.create(body=req)

## Enable IPv6 During Droplet Creation Using the Control Panel[](#during-creation)

To create a Droplet with IPv6 enabled, open the **Create** menu from [your DigitalOcean Control Panel](https://cloud.digitalocean.com) and select **Droplets**.

![The create menu](https://docs.digitalocean.com/screenshots/create.88f76a2e0fbab47d46467cfdb31a9a9396d289032523120cfbdf1b695f0aac34.png)

On the **Create Droplet** page, in the **Advanced Options** section, check the box next to **Enable IPv6**.

![The advanced options section of the Droplet creation page, which includes the Enable IPv6 checkbox.](https://docs.digitalocean.com/screenshots/droplets/create/advanced-options.cde61ff2a33d464586c34af97c73b53dee91fe27bc2cbd85aa30ce927b9f19c9.png)

When you’ve selected all of your options, click the **Create Droplet** button at the bottom.

Once you’ve created the Droplet, the header displays the Droplet’s IPv6 address. To view more IPv6 information, including the public IPv6 address, gateway address, and configurable address range, click the Droplet’s name, then click **Networking** in the side menu.

At this point, your new IPv6 address is ready for use.

## Enable IPv6 on Existing Droplets[](#on-existing-droplets)

You need to power down your Droplet to enable IPv6. To safely do this, log in to your Droplet and use the shutdown command with the `-h` flag, which instructs the system to shut down and then halt:

    sudo shutdown -h now

Once the Droplet is off, the next step is to enable IPv6 from the control panel. This assigns IPv6 address information to the Droplet that you need to configure the Droplet’s network interface.

On the **Droplets** page, click the name of the Droplet, then click **Networking** in the side menu. In the **Public Network** section, click **Enable**. This assigns an IPv6 address to the Droplet.

![Droplet networking page showing public IPv4 details, floating IP option, disabled IPv6 with an Enable button, and private network information including VPC network and IP range.](https://docs.digitalocean.com/screenshots/ipv6/droplet-networking.47ac78ac7d3cc6ed8f243ffe52287cb1fdbe7572f0411085c97bfecc719b0925.png)

Once enabled, on the right, click the **OFF** button to switch the Droplet back **ON**. The page automatically updates with the IPv6 network information.

When you enable IPv6 on an existing Droplet, you need to manually configure the IPv6 network interface on the Droplet itself. This involves adding information to the Droplet’s network configuration file, including the Droplet’s static IPv6 address, gateway address, IPv6 name servers, and disabling its automatic network configuration.

Click **Console** to access your Droplet directly. The file you edit and the way you add information depends on which Linux distribution your Droplet is running.

 Ubuntu 20.04+, Debian 12

On Ubuntu 20.04+ and Debian 12, open the `/etc/netplan/50-cloud-init.yaml` configuration file in a text editor and make the following changes:

*   In the `eth0` stanza, under `addresses:`, add the Droplet’s IPv6 address on a new line followed by the netmask value, `/64`.
    
*   In the `eth0` stanza, under `routes`, add a new gateway connection stanza as seen in the following example, substituting the gateway address from the Droplet’s IPv6 networking page.
    

The file looks like this when you’re done:

`/etc/netplan/50-cloud-init.yaml`

     1network:
     2    version: 2
     3    ethernets:
     4        eth0:
     5            accept-ra: false
     6            addresses:
     7            - substitute_your_primary_ipv6_address/64
     8            - 174.138.74.145/20
     9            - 10.17.0.6/16
    10            match:
    11                macaddress: f5:7c:7f:da:c3:e6
    12            mtu: 1500
    13            nameservers:
    14                addresses:
    15                - 67.207.67.3
    16                - 67.207.67.2
    17                search: []
    18            routes:
    19            -   to: ::/0
    20                via: substitute_your_ipv6_gateway
    21            -   to: 0.0.0.0/0
    22                via: 174.138.64.1
    23            set-name: eth0

To locate your Droplet’s IPv6 address and gateway address in the control panel, click **Droplets**, then click the Droplet’s name from the list. From the Droplet’s page, click **Networking** in the side menu. The **Public Network** section lists your Droplet’s IPv6 information.

Once you’ve edited and saved the file, run the following command to check the configuration’s syntax and temporarily apply the network changes:

    sudo netplan apply --debug

 Ubuntu 18.04

On Ubuntu 18.04, open the `/etc/netplan/50-cloud-init.yaml` configuration file in a text editor and make the following changes:

*   In the `eth0` stanza, under `addresses:`, add the Droplet’s IPv6 address on a new line followed by the netmask value, `/64`.
    
*   In the `eth0` stanza, on a new line, add `gateway6` and the gateway address from the Droplet’s IPv6 networking page.
    
*   In the `nameservers` stanza, add two lines for IPv6 name servers, `2001:4860:4860::8844` and `2001:4860:4860::8888`.
    

The file looks like this when you’re done:

`/etc/netplan/50-cloud-init.yaml`

     1network:
     2    version: 2
     3    ethernets:
     4        eth0:
     5            addresses:
     6            - substitute_your_primary_ipv6_address/64
     7            - 203.0.113.213/20
     8            - 192.0.2.11/16
     9        gateway4: 206.189.208.1
    10        gateway6: substitute_your_ipv6_gateway
    11        match:
    12            macaddress: 5e:5x:5a:2m:8p:le
    13        nameservers:
    14            addresses:
    15                - 67.207.67.2
    16                - 67.207.67.3
    17                - 2001:4860:4860::8844
    18                - 2001:4860:4860::8888
    19                search: []
    20        set-name: eth0

To locate your Droplet’s IPv6 address and gateway address in the control panel, click **Droplets**, then click the Droplet’s name from the list. From the Droplet’s page, click **Networking** in the side menu. The **Public Network** section lists your Droplet’s IPv6 information.

Once you’ve edited and saved the file, run the following command to check the configuration’s syntax and temporarily apply the network changes:

    sudo netplan apply --debug

If you receive the error `Cannot call Open vSwitch: ovsdb-server.service is not running.`, you need to install the `openvswitch-switch-dpdk` package on the Droplet. Open vSwitch is a virtual switch licensed under the open source Apache 2.0 license. It helps more efficiently forward packets via the kernel space data path. Run `sudo apt-get install openvswitch-switch-dpdk` to install the package and then run `netplan apply` again.

 Ubuntu 14.04, Debian 10/11

On Ubuntu 14.04 and Debian 10/11, open the `/etc/network/interfaces` configuration file in a text editor.

Add the entire stanza below, substituting the `substitute_your_primary_ipv6_address` variable with your Droplet’s IPv6 address, and the `substitue_your_ipv6_gateway` variable with your Droplet’s gateway address:

`/etc/network/interfaces`

    iface eth0 inet6 static
    	hwaddress c6:45:b9:90:08:4b
    	address   substitute_your_primary_ipv6_address/64
    	gateway   substitue_your_ipv6_gateway

Once you’ve edited and saved the file, run the following command to check the configuration’s syntax and temporarily apply the network changes:

    sudo systemctl restart networking

 FreeBSD

On FreeBSD, open the `/etc/network/interfaces` configuration file in a text editor.

Add the entire stanza below, substituting the `address` variable for your Droplet’s IPv6 address, and the `gateway` variable for your Droplet’s gateway address:

`/etc/network/interfaces`

    iface eth0 inet6 static
        address substitute_your_primary_ipv6_address
        netmask 64
        gateway substitute_your_ipv6_gateway
        autoconf 0
        dns-nameservers 2001:4860:4860::8844 2001:4860:4860::8888 209.244.0.3

Warning

**If your configuration file has syntax errors, it may disrupt connectivity or lock you out of your Droplet.** Please ensure your configuration file is correct before proceeding. Currently, you can only access FreeBSD via `ssh`. However, when enabling IPv6 via `ssh`, you cannot reset network or routing to verify your syntax without terminating your connection to the Droplet.

 Fedora

On Fedora, use the Network Manager’s CLI to add the new IPv6 route to the Droplet’s network configuration.

To do this, first add the Droplet’s IPv6 address, followed by its `/64` netmask value, to the `eht0` interface:

    nmcli connection modify "cloud-init eth0" ipv6.address <your-ipv6-address>/64

Then add the Droplet’s IPv6 gateway address to the configuration:

    nmcli connection modify "cloud-init eth0" ipv6.gateway <your-gateway-address>

Lastly, add DigitalOcean’s DNS servers to the configuration:

    nmcli connection modify "cloud-init eth0" ipv6.dns "2001:4860:4860::8844 2001:4860:4860::8888"

Once you have added all of the Droplet’s IPv6 information into the network configuration, restart the `eth0` interface.

    nmcli connection up "cloud-init eth0"

 CentOS 7/8/9, Rocky Linux 8/9, Almalinux 8/9

On CentOS 7/8/9, Rocky Linux 8/9, and Almalinux 8/9 open the `/etc/sysconfig/network-scripts/ifcfg-eth0` configuration file in a text editor.

Add the following block, substituting the `primary_ipv6_address` variable with your Droplet’s IPv6 address, and the `ipv6_gateway` variable with your Droplet’s gateway address.

`/etc/sysconfig/network-scripts/ifcfg-eth0`

    IPV6ADDR=primary_ipv6_address/64
    IPV6INIT=yes
    IPV6_AUTOCONF=no
    IPV6_DEFAULTGW=ipv6_gateway
    IPV6_FORCE_ACCEPT_RA=no

To locate your Droplet’s IPv6 address and gateway address in the control panel, click **Droplets**, then click the Droplet’s name from the list. From the Droplet’s page, click **Networking** in the menu on the left. The **Public Network** section lists your Droplet’s IPv6 information.

Once you’ve edited and saved the file, run the following command to check the configuration’s syntax and temporarily apply the network changes:

    sudo systemctl restart NetworkManager.service

The verification prints any errors in the syntax on the screen. When the syntax is correct, the command returns you to the command prompt with no output.

Finally, reboot the server to apply the changes.

    reboot

If you become locked out of your Droplet, you can [access your Droplet from the Recovery Console](/products/droplets/how-to/recovery/recovery-console/#log-in-with-the-console) to repair the file.

## Verify the Configuration[](#verify-the-configuration)

Note

To use IPv6, both ends of the connection must be configured to send and receive IPv6 traffic. Not all ISPs offer IPv6 addresses for customers, so you may not be able to connect to an IPv6 address directly from your local machine. For example, if your local machine does not have an IPv6 address, you cannot connect to your Droplet using its IPv6 address.

You can locate your public IPv6 address using [test-ipv6.com](https://test-ipv6.com/).

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

*   [Enable IPv6 During Droplet Creation Using the CLI](#enable-ipv6-during-droplet-creation-using-the-cli)
*   [Enable IPv6 During Droplet Creation Using the API](#enable-ipv6-during-droplet-creation-using-the-api)
*   [Enable IPv6 During Droplet Creation Using the Control Panel](#during-creation)
*   [Enable IPv6 on Existing Droplets](#on-existing-droplets)
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
