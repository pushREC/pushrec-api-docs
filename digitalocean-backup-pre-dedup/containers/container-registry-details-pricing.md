---
source: https://docs.digitalocean.com/products/container-registry/details/pricing/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/container-registry/details/pricing/
domain: docs.digitalocean.com
---
                Container Registry Pricing | DigitalOcean Documentation

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
*   Pricing

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Container Registry Pricing

Validated on 30 Aug 2023 • Last edited on 11 Jun 2025

The DigitalOcean Container Registry (DOCR) is a private Docker image registry that lets you store and manage private container images. DOCR integrates natively with Docker environments and DigitalOcean Kubernetes clusters.

DOCR has three subscription plans:

*   **Starter** is a free offering with a single registry and repository to let you try out DOCR.
*   **Basic** includes a single registry with five repositories and 5 GiB storage to support larger projects. It costs $5.00 per month.
*   **Professional** includes up to 10 registries, an unlimited number of repositories, and 100 GiB of storage to scale your projects. It costs $20.00 per month.

Features

Starter

Basic

Professional

Registry

1

1

Up to 10

Repositories

1

5

Unlimited

Storage

500 MiB

5 GiB

100 GiB

Extra Storage

Not Available

$0.02 per GiB

$0.02 per GiB

Monthly Price

$0.00 per month

$5.00 per month

$20.00 per month

Container registry plans include a certain amount of storage per month. This amount is prorated based on how many days the registry is active during the month. If your registry has been active for fewer than the standard 28 days in a month, it receives a proportional fraction of its plan’s storage allowance.

For example, a Starter registry receives 500 MiB of allowance per full month. If a Starter registry is active for 16 days in a month, it receives ~285 MiB of storage allowance ((16 days/28 days) \* 500 MiB). If you destroy a registry early, it reduces the number of days it was active in the month, which can result in a small overage charge.

Extra storage is charged at the end of the day and is prorated based on the number of days your storage exceeds the quota in the given month.

Untagged images count towards your storage quota. To delete untagged images, [clean up your registry](/products/container-registry/how-to/clean-up-container-registry/#run-garbage-collection).

In this article...

[Container Registry Pricing](https://docs.digitalocean.com/products/container-registry/details/pricing/)

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

Try using different keywords or simplifying your search t