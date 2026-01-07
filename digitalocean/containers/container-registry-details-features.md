---
source: https://docs.digitalocean.com/products/container-registry/details/features/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/container-registry/details/features/
domain: docs.digitalocean.com
---
                Container Registry Features | DigitalOcean Documentation

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

*   [Details](/products/container-registry/details/) 
*   Features

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Container Registry Features

Validated on 17 Nov 2025 • Last edited on 17 Nov 2025

The DigitalOcean Container Registry (DOCR) is a private Docker image registry that lets you store and manage private container images. DOCR integrates natively with Docker environments and DigitalOcean Kubernetes clusters.

## Use Cases[](#use-cases)

*   Secure, private storage of your Docker images
*   Automatic configuration of your Docker environment
*   Automatic configuration of your DigitalOcean Kubernetes clusters
*   Automatic global load balancing across caching endpoints in multiple geographic regions
*   Ability to store any artifact that is compatible with OCI-based registries, such as [Helm charts](https://helm.sh/docs/topics/registries/)

## Multiple Registry Support[](#multiple-registry-support)

*   You can create up to nine additional registries (for a total maximum of 10) per team if your container registry uses the [Professional subscription plan](/products/container-registry/details/pricing/). You can create these registries in different regions using the [DigitalOcean Control Panel](/products/container-registry/how-to/create-registry/#create-additional-container-registries-using-the-control-panel), [CLI](/products/container-registry/how-to/create-registry/#create-a-container-registry-using-the-cli), or [API](/products/container-registry/how-to/create-registry/#create-container-registry-using-the-api) and the storage is shared among them.

In this article...

*   [Use Cases](#use-cases)
*   [Multiple Registry Support](#multiple-registry-support)

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