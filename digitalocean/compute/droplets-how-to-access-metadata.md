---
source: https://docs.digitalocean.com/products/droplets/how-to/access-metadata/
scraped: 2026-01-07
tags: [digitalocean, compute, droplets, api-docs]
---

How to Access Information about a Droplet using the Metadata API | DigitalOcean Documentation

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
*   Access Metadata

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Access Information about a Droplet using the Metadata API

Validated on 22 Nov 2024 • Last edited on 24 Jan 2025

DigitalOcean Droplets are Linux-based virtual machines (VMs) that run on top of virtualized hardware. Each Droplet you create is a new server you can use, either standalone or as part of a larger, cloud-based infrastructure.

[Metadata](/reference/api/metadata/) is a DigitalOcean service that allows a Droplet to access data about itself.

[](/reference/api/metadata/)

![](https://docs.digitalocean.com/images/icons/api.svg)

DigitalOcean Metadata API Reference

Complete reference documentation for the Metadata API for Droplets.

Droplets can access the metadata service using the special, static, link-local IP address `169.254.169.254`. This allows you to use the same commands on different Droplets without needing to change the destination IP address.

## Access Droplet Metadata[](#access-droplet-metadata)

You can query the metadata API from a Droplet by sending an HTTP GET request to a metadata endpoint. For example, this `curl` command sends an HTTP GET request to the top level of a Droplet’s metadata endpoint, `/metadata/v1/`:

    curl http://169.254.169.254/metadata/v1/interfaces/public/0/ipv4/address

This returns an index of the available Droplet metadata:

    id
    hostname
    user-data
    vendor-data
    public-keys
    region
    interfaces/
    dns/
    floating_ip/
    tags/

You can think of this index like a directory listing. Items in the index without a trailing slash represent data, and items with a trailing slash are nested indexes. You can further `curl` into the indexes to see more entries.

For example, you can retrieve the Droplet’s public IPv4 address:

    curl -s http://169.254.169.254/metadata/v1/interfaces/public/0/ipv4/address

Full documentation of the metadata service and its endpoints are available in the [Droplet metadata API reference](/reference/api/metadata/).

In this article...

*   [Access Droplet Metadata](#access-droplet-metadata)

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

Try using different keywords or simplifying your search
