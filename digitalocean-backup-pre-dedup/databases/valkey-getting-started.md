---
source: https://docs.digitalocean.com/products/databases/valkey/getting-started/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Connect to your Droplet with PuTTY on Windows | DigitalOcean Documentation

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
        *   [Connect with OpenSSH](/products/droplets/how-to/connect-with-ssh/openssh/)
        *   [Connect with PuTTY](/products/droplets/how-to/connect-with-ssh/putty/)
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
*   [Connect with SSH](/products/droplets/how-to/connect-with-ssh/) 
*   Connect with PuTTY

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Connect to your Droplet with PuTTY on Windows

Validated on 20 Feb 2025 • Last edited on 21 Feb 2025

DigitalOcean Droplets are Linux-based virtual machines (VMs) that run on top of virtualized hardware. Each Droplet you create is a new server you can use, either standalone or as part of a larger, cloud-based infrastructure.

[PuTTY](https://www.putty.org/) is an open-source SSH and Telnet client for Windows. It allows you to securely connect to remote servers from a local Windows computer.

If you don’t have PuTTY installed, visit the [PuTTY website](https://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) and choose the Windows installer from the **Package files** list. Once PuTTY is installed, start the program.

We recommend following the [official PuTTY documentation on getting started](https://the.earth.li/~sgtatham/putty/0.83/htmldoc/Chapter2.html#gs):

[](https://the.earth.li/~sgtatham/putty/0.83/htmldoc/Chapter2.html)

![](https://docs.digitalocean.com/images/icons/default.svg)

Getting Started with PuTTY

Official PuTTY documentation on how to start a session, verify the host key, log in, and log out of remote servers.

the.earth.li

PuTTY’s documentation covers how to start a session. To avoid entering the same configuration options each time you connect, you can save your session settings:

1.  In the [host name section](https://the.earth.li/~sgtatham/putty/0.83/htmldoc/Chapter4.html#config-hostname), enter the Droplet’s IP address, which you can find in [the control panel](https://cloud.digitalocean.com) and set the port to `22`. Set the [connection type](https://the.earth.li/~sgtatham/putty/0.83/htmldoc/Chapter4.html#config-ssh-prot) to SSH.
    
2.  [Set the SSH protocol](https://the.earth.li/~sgtatham/putty/0.83/htmldoc/Chapter4.html#config-ssh-prot) to 2.
    
3.  If you’re using SSH keys, [add the private key file](https://the.earth.li/~sgtatham/putty/0.83/htmldoc/Chapter4.html#config-ssh-privkey).
    
4.  If you don’t want to enter a username every time you connect, [add an auto-login username](https://the.earth.li/~sgtatham/putty/0.83/htmldoc/Chapter4.html#config-username).
    
5.  Finally, [save the session](https://the.earth.li/~sgtatham/putty/0.83/htmldoc/Chapter4.html#config-saving).
    

You can use this saved session to connect in the future.

In this article...

[How to Connect to your Droplet with PuTTY on Windows](https://docs.digitalocean.com/products/droplets/how-to/connect-with-ssh/putty/)

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

Try using different keywords or simplifying your 
