---
source: https://docs.digitalocean.com/products/droplets/how-to/rebuild/
scraped: 2026-01-07
tags: [digitalocean, compute, droplets, api-docs]
---

How to Rebuild Droplets | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/droplets.f4877fc574e6b07f8fb9608e252be4160ebecd65569acea11775a046b9370c6f.svg)Droplets](/products/droplets/)
*   [Getting Started](/products/droplets/getting-started/)
    *   [Quickstart](/products/droplets/getting-started/quickstart/)
    *   [Recommended Droplet Setup](/products/droplets/getting-started/recommended-droplet-setup/)
    *   [Recommended GPU Setup](/products/droplets/getting-started/recommended-gpu-setup/)
*   [How-Tos](/products/droplets/how-to/)
    *   [Create Droplets](/products/droplets/how-to/create/)
    *   [Use GPU Droplets](/products/droplets/how-to/gpu/)
    *   [Provide User Data](/products/droplets/how-to/provide-user-data/)
    *   [Connect with SSH](/products/droplets/how-to/connect-with-ssh/)
    *   [Add SSH Keys to Droplets](/products/droplets/how-to/add-ssh-keys/)
    *   [Connect with the Droplet Console](/products/droplets/how-to/connect-with-console/)
    *   [Transfer Files with FileZilla](/products/droplets/how-to/transfer-files/)
    *   [Tag Droplets](/products/droplets/how-to/tag/)
    *   [Track Performance](/products/droplets/how-to/track-performance/)
    *   [Resize Droplets](/products/droplets/how-to/resize/)
    *   [Use Autoscale Pools](/products/droplets/how-to/use-autoscale-pools/)
    *   [Access Metadata](/products/droplets/how-to/access-metadata/)
    *   [Rebuild Droplets](/products/droplets/how-to/rebuild/)
    *   [Manage the Droplet Agent](/products/droplets/how-to/manage-agent/)
    *   [Manage the Kernel](/products/droplets/how-to/kernel/)
    *   [Recover Access or Data](/products/droplets/how-to/recovery/)
    *   [Destroy Droplets](/products/droplets/how-to/destroy/)
*   [Reference](/products/droplets/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Droplets)
    *   [CLI Reference](/reference/doctl/reference/compute/droplet/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/droplets/concepts/)
    *   [Choosing a Plan](/products/droplets/concepts/choosing-a-plan/)
    *   [Tips on Downsizing Droplets](/products/droplets/concepts/downsizing-considerations/)
    *   [Autoscale Pools](/products/droplets/concepts/autoscale-pools/)
    *   [Glossary](/glossary/droplets/)
*   [Details](/products/droplets/details/)
    *   [Features](/products/droplets/details/features/)
    *   [Pricing](/products/droplets/details/pricing/)
    *   [Availability](/products/droplets/details/availability/)
    *   [Images](/products/droplets/details/images/)
    *   [Limits](/products/droplets/details/limits/)
    *   [Image Deprecation Policy](/products/droplets/details/image-deprecation/)
    *   [Droplet Policies](/products/droplets/details/policies/)
    *   [Live Migrations](/products/droplets/details/live-migration/)
    *   [CPU Droplet SLA](https://www.digitalocean.com/sla/cpu-droplets)
    *   [GPU Droplet SLA](https://www.digitalocean.com/sla/gpu-droplets)
    *   [GPU Droplets](/products/gpu-droplets/)
*   [Support](/products/droplets/support/)

*   [How-Tos](/products/droplets/how-to/) 
*   Rebuild Droplets

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Rebuild Droplets

Validated on 28 Apr 2020 • Last edited on 17 Apr 2025

DigitalOcean Droplets are Linux-based virtual machines (VMs) that run on top of virtualized hardware. Each Droplet you create is a new server you can use, either standalone or as part of a larger, cloud-based infrastructure.

Rebuilding a Droplet wipes the Droplet’s disk and replaces it with an image you select. You can rebuild a Droplet with any image as long as it is from the same operating system family as the original Droplet, including Marketplace 1-Click Apps. This is an option if you’re concerned that your Droplet has been compromised, you’ve lost access to it, you’d like to switch operating system versions, or you’d like to completely replace the contents of a Droplet.

In some scenarios, it’s simpler to [destroy the current Droplet](/products/droplets/how-to/destroy/) and create a new one. We recommend rebuilding in two scenarios:

1.  **You want to keep your IP address**. When you destroy a Droplet, its IP address is released back into the datacenter’s pool of available IPs. These are assigned randomly, so it’s very unlikely for you get that IP address back. However, when you rebuild a Droplet, the IP address is retained.
    
2.  **You want to spend less**. DigitalOcean charges by the hour and only charges for the first 672 hours (28 days) in each month. That means if your Droplet has existed all month, you get up to 3 days at the end of the month free. If you destroy your Droplet and create a new one, that timer restarts. If you rebuild it, that timer continues to count up toward the free time at the end of the month.
    

Warning

Rebuilding a Droplet, like destroying a Droplet, is an irreversible process. If you have no backups, snapshots, or local copies of the data on your Droplet and you rebuild it, that data is completely irretrievable by DigitalOcean.

## Rebuilding a Droplet with the Control Panel[](#rebuilding-a-droplet-with-the-control-panel)

You can use any image in your account that runs an OS that is in the same family as the Droplet you’re rebuilding, including backups, snapshots, custom images, 1-Click Applications, and base OS distributions we provide. If you’re trying to rebuild from a backup, you need to [convert the backup into a snapshot](/products/backups/how-to/convert-to-snapshot/) before rebuilding your Droplet.

From the [DigitalOcean Control Panel](https://cloud.digitalocean.com/droplets), on the **Droplets** page, click the name of the Droplet you want to rebuild to open the Droplet’s detail page. From there, open the **Destroy** page on the left.

![Droplet Destroy & Rebuild page](https://docs.digitalocean.com/screenshots/droplets/pages/rebuild.f01d932f6d59dfd7b4acb3da2ba3cfe0049361fd6146146a3ebace8130b63afc.png)

In the **Rebuild Droplet** section, click the **Select an image** text box and search for the image you’d like to use.

![Image Selection Drop-down](https://docs.digitalocean.com/screenshots/droplets/rebuild-drop-down.794fea98ed2d025dbff64be96c41d32f2357afcee882db3fe42b45163029d036.png)

Once you’ve selected the image you’d like to use, the **Rebuild** button turns blue. Click it to begin rebuilding the Droplet. The rebuild should take roughly the same amount of time as creating a new Droplet from that image. When it’s complete, you have a clean Droplet with the new image.

Once the Droplet has been rebuilt, it has a new fingerprint, also known as a remote host identification key. Because local SSH clients store the fingerprints of the servers they connect to, you may see a warning about the differing fingerprint when you reconnect to the rebuilt Droplet:

    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
    Someone could be eavesdropping on you right now (man-in-the-middle attack)!
    It is also possible that a host key has just been changed.
    The fingerprint for the ECDSA key sent by the remote host is
    SHA256:RqX4d+VC6sBaOSMEo8JgyjpvmoQTQY4E6EYe7vCQV5c.
    Please contact your system administrator.
    Add correct host key in /root/.ssh/known_hosts to get rid of this message.
    Offending ECDSA key in /root/.ssh/known_hosts:3
      remove with:
      ssh-keygen -f "/root/.ssh/known_hosts" -R 203.0.113.47
    ECDSA host key for 203.0.113.47 has changed and you have requested strict checking.
    Host key verification failed.

To resolve this, run the command from the warning message:

    ssh-keygen -f "/root/.ssh/known_hosts" -R use_your_droplet_ip

This removes the old key, which lets you connect to the Droplet as normal without seeing the warning.

## Rebuilding a Droplet with Automation[](#rebuilding-a-droplet-with-automation)

How to Rebuild a Droplet Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl compute droplet-action rebuild`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/compute/droplet-action/rebuild/) for more details:
    
        doctl compute droplet-action rebuild <droplet-id> [flags]
    
    The following example rebuilds a Droplet with the ID `386734086` from the image with the ID `146288445`:
    
        doctl compute droplet-action rebuild 386734086 --image 146288445
    

Below are generic instructions for initiating a Droplet action using the API. You need to specify the `rebuild` action type when calling this endpoint.

How to Rebuild a Droplet Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/droplets/{droplet_id}/actions`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/dropletActions_post).

### cURL[](#rebuild-a-droplet-curl)

Using cURL:

    # Enable Backups
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"enable_backups"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Disable Backups
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"disable_backups"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Reboot a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"reboot"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Power cycle a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"power_cycle"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Shutdown and Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"shutdown"}' \
      "https://api.digitalocean.com/v2/droplets/3067649/actions"
    
    # Power off a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"power_off"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Power on a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"power_on"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Restore a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"restore", "image": 12389723 }' \
      "https://api.digitalocean.com/v2/droplets/3067649/actions"
    
    # Password Reset a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"password_reset"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Resize a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"resize","size":"1gb"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Rebuild a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"rebuild","image":"ubuntu-16-04-x64"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Rename a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"rename","name":"nifty-new-name"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Change the Kernel
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"change_kernel","kernel":991}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Enable IPv6
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"enable_ipv6"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Enable Private Networking
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"enable_private_networking"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Snapshot a Droplet
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"snapshot","name":"Nifty New Snapshot"}' \
      "https://api.digitalocean.com/v2/droplets/3164450/actions"
    
    # Acting on Tagged Droplets
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"type":"enable_backups"}' \
      "https://api.digitalocean.com/v2/droplets/actions?tag_name=awesome"
    
    # Retrieve a Droplet Action
    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/droplets/3164444/actions/36804807"

### Go[](#rebuild-a-droplet-go)

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
    // Enable Backups
        action, _, err := client.DropletActions.EnableBackups(ctx, 3164450)
    
    // Disable Backups
    //  action, _, err := client.DropletActions.DisableBackups(ctx, 3164450)
    
    // Reboot a Droplet
    //  action, _, err := client.DropletActions.Reboot(ctx, 3164450)
    
    // Power Cycle a Droplet
    //  action, _, err := client.DropletActions.PowerCycle(ctx, 3164450)
    
    // Shutdown a Droplet
    //  action, _, err := client.DropletActions.Shutdown(ctx, 3067649)
    
    // Power Off a Droplet
    //  action, _, err := client.DropletActions.PowerOff(ctx, 3164450)
    
    // Power On a Droplet
    //  action, _, err := client.DropletActions.PowerOn(ctx, 3164450)
    
    // Restore a Droplet
    //  action, _, err := client.DropletActions.Restore(ctx, 3164449, 12389723)
    
    // Password Reset a Droplet
    //  action, _, err := client.DropletActions.PasswordReset(ctx, 3164450)
    
    // Resize a Droplet
    //  action, _, err := client.DropletActions.Resize(ctx, 3164450, "1gb", true)
    
    // Rebuild a Droplet
    //  action, _, err := client.DropletActions.RebuildByImageSlug(ctx, 3164450, "ubuntu-16-04-x64")
    
    // Rename a Droplet
    //  action, _, err := client.DropletActions.Rename(ctx, 3164450, "nifty-new-name")
    
    // Change the Kernel
    //  action, _, err := client.DropletActions.ChangeKernel(ctx, 3164450, 991)
    
    // Enable IPv6
    //  action, _, err := client.DropletActions.EnableIPv6(ctx, 3164450)
    
    // Enable Private Networking
    //  action, _, err := client.DropletActions.EnablePrivateNetworking(ctx, 3164450)
    
    // Snapshot a Droplet
    //  action, _, err := client.DropletActions.Snapshot(ctx, 3164450, "Nifty New Snapshot")
    
    // Retrieve a Droplet Action
    //  action, _, err := client.DropletActions.Get(ctx, 3164450, 36804807)
    
    }

### Ruby[](#rebuild-a-droplet-ruby)

Using [DropletKit](https://github.com/digitalocean/droplet_kit), the official DigitalOcean API client for Ruby:

    require 'droplet_kit'
    token = ENV['DIGITALOCEAN_TOKEN']
    client = DropletKit::Client.new(access_token: token)
    
    # Enable Backups
    client.droplet_actions.enable_backups(droplet_id: 3164450)
    
    # Disable Backups
    # client.droplet_actions.disable_backups(droplet_id: 3164450)
    
    # Reboot a Droplet
    # client.droplet_actions.reboot(droplet_id: 3164450)
    
    # Power Cycle a Droplet
    # client.droplet_actions.power_cycle(droplet_id: 3164450)
    
    # Shutdown a Droplet
    # client.droplet_actions.shutdown(droplet_id: 3067649)
    
    # Power Off a Droplet
    # client.droplet_actions.power_off(droplet_id: 3164450)
    
    # Power On a Droplet
    # client.droplet_actions.power_on(droplet_id: 3164450)
    
    # Restore a Droplet
    # client.droplet_actions.restore(droplet_id: 3067649, image: 12389723)
    
    # Password Reset a Droplet
    # client.droplet_actions.password_reset(droplet_id: 3164450)
    
    # Resize a Droplet
    # client.droplet_actions.resize(droplet_id: 3164450, size: '1gb')
    
    # Rebuild a Droplet
    # client.droplet_actions.rebuild(droplet_id: 3164450, image: 'ubuntu-16-04-x64')
    
    # Rename a Droplet
    # client.droplet_actions.rename(droplet_id: 3164450, name: 'nifty-new-name')
    
    # Change the Kernel
    # client.droplet_actions.change_kernel(droplet_id: 3164450, kernel: 991)
    
    # Enable IPv6
    # client.droplet_actions.enable_ipv6(droplet_id: 3164450)
    
    # Enable Private Networking
    # client.droplet_actions.enable_private_networking(droplet_id: 3164450)
    
    # Snapshot a Droplet
    # client.droplet_actions.snapshot(droplet_id: 3164450, name: 'Nifty New Snapshot')

### Python[](#rebuild-a-droplet-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    # enable back ups example
    req = {
      "type": "enable_backups"
    }
    
    resp = client.droplet_actions.post(droplet_id=346652, body=req)

For more details, see [the documentation for initiating Droplet actions with the DigitalOcean API](/reference/api/digitalocean/#operation/dropletActions_post).

In this article...

*   [Rebuilding a Droplet with the Control Panel](#rebuilding-a-droplet-with-the-control-panel)
*   [Rebuilding a Droplet with Automation](#rebuilding-a-droplet-with-automation)

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
