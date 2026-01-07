---
source: https://docs.digitalocean.com/products/container-registry/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/container-registry/
domain: docs.digitalocean.com
---
                DigitalOcean Container Registry | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/container-registry.9233118a7fd14376bbb94aedab28b1762ed7cb822f6df9ae7f66db21052e45d6.svg)Container Registry](/products/container-registry/)
*   [Getting Started](/products/container-registry/getting-started/)
    *   [Quickstart](/products/container-registry/getting-started/quickstart/)
    *   [Deploy Image to Cluster](/products/kubernetes/getting-started/deploy-image-to-cluster/)
*   [How-Tos](/products/container-registry/how-to/)
    *   [Create Registry](/products/container-registry/how-to/create-registry/)
    *   [Use Docker and Kubernetes](/products/container-registry/how-to/use-registry-docker-kubernetes/)
    *   [Clean Up Container Registry](/products/container-registry/how-to/clean-up-container-registry/)
    *   [Integrate with CI/CD](/products/container-registry/how-to/set-up-ci-cd/)
    *   [Enable Push-to-Deploy](/products/container-registry/how-to/enable-push-to-deploy/)
*   [Reference](/products/container-registry/reference/)
    *   [API Reference (Container Registry)](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Container-Registry)
    *   [API Reference (Container Registries)](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Container-Registries)
    *   [CLI Reference](/reference/doctl/reference/registry/repository/)
*   [Details](/products/container-registry/details/)
    *   [Features](/products/container-registry/details/features/)
    *   [Pricing](/products/container-registry/details/pricing/)
    *   [Availability](/products/container-registry/details/availability/)
    *   [Limits](/products/container-registry/details/limits/)
*   [Support](/products/container-registry/support/)

*   Container Registry

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DigitalOcean Container Registry

Generated on 6 Jan 2026

The DigitalOcean Container Registry (DOCR) is a private Docker image registry that lets you store and manage private container images. DOCR integrates natively with Docker environments and DigitalOcean Kubernetes clusters.

Most Viewed Container Registry Articles

1.  [Container Registry Quickstart](/products/container-registry/getting-started/quickstart/ "Just the essentials to go from zero to working in a few minutes.")
2.  [How to Use Your Private DigitalOcean Container Registry with Docker and Kubernetes](/products/container-registry/how-to/use-registry-docker-kubernetes/ "Push images to and pull images from your registry and use them in a cluster.")
3.  [How to Free Up Space in Your Container Registry](/products/container-registry/how-to/clean-up-container-registry/ "Free up storage space in your registry by deleting digests and tags, and running garbage collection.")
4.  [Enable Push-to-Deploy on DigitalOcean Kubernetes Using GitHub Actions](/products/container-registry/how-to/enable-push-to-deploy/ "Integrate a DigitalOcean Container Registry with a DigitalOcean Kubernetes cluster and set up a CI/CD workflow using GitHub Actions.")
5.  [Container Registry Pricing](/products/container-registry/details/pricing/ "DOCR has three subscription plans: a free plan to try out DOCR, a basic plan for larger projects, and a professional plan with unlimited repositories and a large amount of storage.")
6.  [Container Registry Availability](/products/container-registry/details/availability/)
7.  [Container Registry Limits](/products/container-registry/details/limits/ "Limits and known issues for Container Registry.")
8.  [Container Registry Details](/products/container-registry/details/ "Features, plans and pricing, availability, limits, known issues, and more.")
9.  [How to Use CI/CD Systems with Your Container Registry](/products/container-registry/how-to/set-up-ci-cd/ "Set up and use CI/CD systems with your container registry.")
10.  [Container Registry Features](/products/container-registry/details/features/ "Container registry features.")

[](/products/container-registry/getting-started/)

![](https://docs.digitalocean.com/images/icons/container-registry.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/container-registry/how-to/)

![](https://docs.digitalocean.com/images/icons/container-registry.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/container-registry/reference/)

![](https://docs.digitalocean.com/images/icons/container-registry.svg)

Reference

API and CLI reference documentation for the Container Registry service, including example requests and available parameters.

[](/products/container-registry/details/)

![](https://docs.digitalocean.com/images/icons/container-registry.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

[](/products/container-registry/support/)

![](https://docs.digitalocean.com/images/icons/container-registry.svg)

Support

Get help with technical support and answers to frequently asked questions.

## Latest Updates[](#latest-updates)

### 17 November 2025[](#17-november-2025)

*   Support for multiple registries when using the [Professional subscription plan](/products/container-registry/details/pricing/) is now in [general availability](/platform/product-lifecycle/). You can create the registries using the [DigitalOcean Control Panel](/products/container-registry/how-to/create-registry/#create-additional-container-registries-using-the-control-panel), [CLI](/products/container-registry/how-to/create-registry/#create-a-container-registry-using-the-cli), or [API](/products/container-registry/how-to/create-registry/#create-container-registry-using-the-api).
    

### 29 September 2025[](#29-september-2025)

*   We have increased the size limit of images from 5 GB to 20 GB with a maximum size of 5 GB per image layer.
    

### 11 June 2025[](#11-june-2025)

*   If your container registry uses the [Professional subscription plan](/products/container-registry/details/pricing/), you can now create up to nine additional registries (for a total maximum of 10) per team using the [DigitalOcean Control Panel](/products/container-registry/how-to/create-registry/#create-additional-container-registries-using-the-control-panel) or [API](/products/container-registry/how-to/create-registry/#create-container-registry-using-the-api). You can create these registries in different regions and the storage is shared among them. This feature is in [public preview](/platform/product-lifecycle/).
    

For more information, see [all Container Registry release notes](https://docs.digitalocean.com/release-notes/container-registry/).

In this article...

[DigitalOcean Container Registry](https://docs.digitalocean.com/products/container-registry/)

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

Try using different keywords or simplifying your search terms