---
source: https://docs.digitalocean.com/products/droplets/how-to/manage-agent/
scraped: 2026-01-07
tags: [digitalocean, compute, droplets, api-docs]
---

How to Install or Uninstall the DigitalOcean Droplet Agent | DigitalOcean Documentation

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
*   Manage the Droplet Agent

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Install or Uninstall the DigitalOcean Droplet Agent

Validated on 11 Jun 2021 • Last edited on 18 Dec 2024

DigitalOcean Droplets are Linux-based virtual machines (VMs) that run on top of virtualized hardware. Each Droplet you create is a new server you can use, either standalone or as part of a larger, cloud-based infrastructure.

The [Droplet agent](https://github.com/digitalocean/droplet-agent) is an open-source daemon that runs on your Droplet to support additional features. For example, to use the [Droplet Console](/products/droplets/how-to/connect-with-console/), your Droplet must have the Droplet agent installed.

The Droplet agent is installed by default on new Droplets created with the control panel and the API after August 2021. You can manually install the agent on older Droplets.

The Droplet agent is supported on all DigitalOcean-provided Linux distributions. This also includes all Marketplace images built on top of these distributions. The Droplet agent does not support FreeBSD.

## Installing the Droplet Agent[](#install)

For officially supported operating systems, log in to the Droplet as the root user or a user with sudo access, then download and execute the agent installation script.

On Debian-based operating systems (like Ubuntu), use `wget`:

    wget -qO- https://repos-droplet.digitalocean.com/install.sh | sudo bash

On RHEL-based operating systems (like CentOS and Fedora), use `curl`:

    curl -q https://repos-droplet.digitalocean.com/install.sh | sudo bash

For any other operating systems, check out [the source code](https://github.com/digitalocean/droplet-agent) and build the agent binary using the instructions in the repository README.

Once the Droplet agent is installed, you can [connect using the Droplet Console](/products/droplets/how-to/connect-with-console/).

## Opting Out of Automatic Installation[](#optout)

When using the API to create a Droplet, you can opt out of installing the agent at creation time by passing the `"with_droplet_agent":false` parameter.

You cannot currently opt out of installing the Droplet agent when creating a Droplet using the control panel.

## Uninstalling the Droplet Agent[](#uninstall)

If you no longer wish to use the Droplet agent, you can remove the package using your native package manager.

On Debian-based operating systems (like Ubuntu), use `apt-get`:

    sudo apt-get purge droplet-agent*

On RHEL-based operating systems (like CentOS and Fedora), use `yum`:

    sudo yum remove droplet-agent*

The service is stopped and the package is removed from your system. You can manually reinstall the Droplet agent in the future.

In this article...

*   [Installing the Droplet Agent](#install)
*   [Opting Out of Automatic Installation](#optout)
*   [Uninstalling the Droplet Agent](#uninstall)

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

Try using different keywords or simplifying your search ter
