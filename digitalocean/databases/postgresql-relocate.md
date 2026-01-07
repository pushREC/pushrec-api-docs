---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/relocate/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
roplet How-Tos | DigitalOcean Documentation

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

*   How-Tos

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Droplet How-Tos

Generated on 6 Jan 2026

DigitalOcean Droplets are Linux-based virtual machines (VMs) that run on top of virtualized hardware. Each Droplet you create is a new server you can use, either standalone or as part of a larger, cloud-based infrastructure.

## Creation[](#creation)

[](/products/droplets/how-to/create/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Create a Droplet

Create Droplets and customize the image, plan, authentication method, and quantity of Droplets you want.

[](/products/droplets/how-to/gpu/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Create and Configure DigitalOcean Gradient™ AI GPU Droplets

Create and configure GPU Droplets, which are powered by AMD or NVIDIA GPUs.

[](/products/droplets/how-to/provide-user-data/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Provide User Data During Droplet Creation

Automate Droplet configuration by providing user data to a Droplet during creation.

## Connection[](#connection)

[](/products/droplets/how-to/connect-with-ssh/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Connect to Droplets with SSH

Use a terminal to connect to Droplets using OpenSSH or PuTTY for shell access to your remote server.

[](/products/droplets/how-to/add-ssh-keys/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Add SSH Keys to New or Existing Droplets

Improve security when you log in by creating SSH keys and adding them to Droplets.

[](/products/droplets/how-to/connect-with-console/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Connect to Droplets with the Droplet Console

Use the Droplet Console from a web browser to connect to Droplets for native-like terminal access to your remote server.

[](/products/droplets/how-to/transfer-files/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Transfer Files to Droplets With FileZilla

Securely move files between Droplets and your local machine using FileZilla, an open-source FTP client.

## Configuration and Scaling[](#configuration-and-scaling)

[](/products/droplets/how-to/tag/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Tag Droplets

Organize Droplets with tags to group and filter Droplets by role, automatically include Droplets in firewall or load balancer configurations, or target multiple Droplets at once with the API.

[](/products/droplets/how-to/track-performance/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Track Performance with Droplet Graphs

Monitor Droplet performance with default graphs for bandwidth, CPU usage, and disk I/O. Install the DigitalOcean metrics agent for extended graphs like CPU load average, memory usage, and disk usage.

[](/products/droplets/how-to/resize/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Resize Droplets for Vertical Scaling

Resize a Droplet to change the amount of CPU and RAM a Droplet has, optionally add additional disk space, or change to a different type of Droplet plan or CPU.

[](/products/droplets/how-to/use-autoscale-pools/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Use Droplet Autoscale Pools for Automatic Horizontal Scaling

Create a Droplet autoscale pool to enable automatic horizontal scaling based on resource utilization or a fixed size.

[](/products/droplets/how-to/access-metadata/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Access Information about a Droplet using the Metadata API

Use the Droplet metadata service to programmatically query a Droplet for information about itself.

[](/products/droplets/how-to/rebuild/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Rebuild Droplets

Overwrite the entirety of a Droplet’s disk with an image you select.

## Management and Recovery[](#management-and-recovery)

[](/products/droplets/how-to/manage-agent/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Install or Uninstall the DigitalOcean Droplet Agent

Install the Droplet agent on older Droplets to enable features like the Droplet Console, or uninstall the agent to remove access.

[](/products/droplets/how-to/kernel/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Manage a Droplet's Kernel

Upgrade a Droplet’s internal kernel version, boot into a specific non-default version, or use the DigitalOcean GrubLoader kernel to convert legacy Droplets from external to internal kernel management.

[](/products/droplets/how-to/recovery/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

Recover Access or Data

Droplets come with several recovery features, including the Recovery Console for out-of-band connectivity independent of network settings and the recovery ISO for regaining access to the Droplet’s filesystem.

[](/products/droplets/how-to/destroy/)

![](https://docs.digitalocean.com/images/icons/droplets.svg)

How to Destroy a Droplet from the DigitalOcean Control Panel

Destroy a Droplet to permanently and irreversibly destroy the Droplet and its contents.

In this article...

[Droplet How-Tos](https://docs.digitalocean.com/products/droplets/how-to/)

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