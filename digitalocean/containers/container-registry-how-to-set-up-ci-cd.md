---
source: https://docs.digitalocean.com/products/container-registry/how-to/set-up-ci-cd/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/container-registry/how-to/set-up-ci-cd/
domain: docs.digitalocean.com
---
                How to Use CI/CD Systems with Your Container Registry | DigitalOcean Documentation

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

*   [How-Tos](/products/container-registry/how-to/) 
*   Integrate with CI/CD

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Use CI/CD Systems with Your Container Registry

Validated on 15 Oct 2020 • Last edited on 15 May 2025

The DigitalOcean Container Registry (DOCR) is a private Docker image registry that lets you store and manage private container images. DOCR integrates natively with Docker environments and DigitalOcean Kubernetes clusters.

You can push images from your CI/CD system to DigitalOcean Container Registry. For example, you can push a new image to the registry whenever a build with your commit is successful on your source control system.

Note

Your CI/CD setup may fail to push images during [garbage collection](/products/container-registry/how-to/clean-up-container-registry/) when the container registry is in read-only mode.

To start using your CI/CD system with the registry, you first need to authenticate it to push images to the registry. Depending on your CI system, you can use one of the following methods to authenticate it:

*   Using a Docker configuration file
    
*   Using a username and password
    
*   Using `doctl`
    

You can then run `docker` commands to [push an image to the registry](/products/container-registry/getting-started/quickstart/#push-to-your-registry), or you can configure your CI system to specify what to build and push the image automatically.

## Authenticate Using a Docker Configuration File[](#authenticate-using-a-docker-configuration-file)

Many CI systems support configuring authentication using a Docker `config.json` file. You can fetch this JSON file for your container registry using one of the following methods:

*   In the DigitalOcean Control Panel, [navigate to the registry page](https://cloud.digitalocean.com/registry). Then, click **Actions** and select **Download Docker Credentials** to download the credentials JSON file.
    
*   Run `doctl registry docker-config --read-write`. If you do not provide the `--read-write` flag, you will receive read-only credentials, which are usually undesirable for CI.
    
*   Use the [DigitalOcean Container Registry API](https://developers.digitalocean.com/documentation/v2/#get-docker-credentials-for-container-registry).
    

## Authenticate Using a Username and Password[](#authenticate-using-a-username-and-password)

For CI systems that support configuring registry authentication via username and password, use a [DigitalOcean API token](/reference/api/create-personal-access-token/) as both the username and the password. The API token must have read/write privileges to push to your registry.

## Authenticate Using doctl[](#authenticate-using-doctl)

If you can run `doctl` in your CI environment, run [the `registry login` command](/reference/doctl/reference/registry/login/) to authenticate before pushing images:

    doctl registry login --expiry-seconds <time>

This method is a good choice for CI systems such as GitHub Actions, where you can run arbitrary commands and push Docker images via the Docker command-line. For an example, see [Enable Push-to-Deploy](/products/kubernetes/how-to/deploy-using-github-actions/).

In this article...

*   [Authenticate Using a Docker Configuration File](#authenticate-using-a-docker-configuration-file)
*   [Authenticate Using a Username and Password](#authenticate-using-a-username-and-password)
*   [Authenticate Using doctl](#authenticate-using-doctl)

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