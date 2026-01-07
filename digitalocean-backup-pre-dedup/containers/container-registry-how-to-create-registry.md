---
source: https://docs.digitalocean.com/products/container-registry/how-to/create-registry/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/container-registry/how-to/create-registry/
domain: docs.digitalocean.com
---
                How to Create a Container Registry | DigitalOcean Documentation

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
*   Create Registry

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create a Container Registry

Validated on 17 Nov 2025 • Last edited on 10 Dec 2025

The DigitalOcean Container Registry (DOCR) is a private Docker image registry that lets you store and manage private container images. DOCR integrates natively with Docker environments and DigitalOcean Kubernetes clusters.

You can create a new container registry using the control panel, API, or CLI. It requires a name, datacenter region, and subscription plan. If you use the [Professional subscription plan](/products/container-registry/details/pricing/), you can create up to nine additional registries (for a total maximum of 10) per team.

After creating a registry, you can [configure it](/products/container-registry/how-to/use-registry-docker-kubernetes/) to push and pull from Docker and DigitalOcean Kubernetes.

## Create a Container Registry Using the Control Panel[](#create-a-container-registry-using-the-control-panel)

To create a container registry from the DigitalOcean Control Panel, in the left menu, click **Container Registry**. Then, click the **Create a Container Registry** button to go to the **Create a container registry** page.

### Choose a Subscription Plan[](#choose-a-subscription-plan)

Choose from the Starter, Basic, or Professional subscription plan. For more details on the different plans, see the [pricing page](/products/container-registry/details/pricing/).

### Choose a Datacenter Region[](#choose-a-datacenter-region)

Use the drop-down menu to select your registry’s datacenter region. For the best performance, we recommend you select a region close to your other DigitalOcean resources.

### Name Your Container Registry[](#name-your-container-registry)

Enter a custom name for your container registry. Names must be unique, be between 3 and 63 characters long, and only contain alphanumeric characters and dashes. You cannot change a registry’s name after creation.

### Create Registry[](#create-registry)

Create the registry by clicking **Create Registry**.

Once your registry is created, the **Repositories** tab opens where you can view registry information such as stored images and monitor unused data.

After creation, you can change the subscription plan of an existing registry. For example, you can change the plan from the Starter plan to the Professional plan, which allows you to [create additional registries](#create-additional-registries-using-the-control-panel). To do this, from the [control panel](https://cloud.digitalocean.com/registry), in the left menu, click **Container Registry**. On the **Container Registries** page, in the **Plan details** section, click **Edit plan**. After you select the subscription plan, click **Update plan**.

## Create Additional Container Registries Using the Control Panel[](#create-additional-registries-using-the-control-panel)

With the Professional subscription plan, you can create additional container registries. From the DigitalOcean Control Panel, in the left menu, click **Container Registry**. On the **Container Registries** page, click the **Create Registry** button.

![Container Registries page showing a registry with its region, size, and creation time, followed by plan details.](https://docs.digitalocean.com/screenshots/container-registry/overview.9da9b6d4ba1398b0f3e0b6a8b12843b372b818ee29d8f9d484a2d875922602bc.png)

If your existing registry is already on the Professional subscription plan, specify a region and name for your registry, and then click **Create Registry** to create an additional registry.

If your current registry is not on the Professional subscription plan, under the **Upgrade your subscription plan** section, select **Professional**, then specify a region and name for your registry, and then click **Create Registry**.

Note

Before you can downgrade the plan, you need to delete the additional registries.

## Create Container Registry Using the API[](#create-container-registry-using-the-api)

How to Create a Container Registry Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/registry`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/registry_create).

### cURL[](#create-a-container-registry-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name": "example", "subscription_tier_slug": "basic", "region": "fra1"}' \
      "https://api.digitalocean.com/v2/registry"

### Python[](#create-a-container-registry-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "example",
      "subscription_tier_slug": "basic",
      "region": "fra1"
    }
    
    resp = client.registry.create(body=req)

If your container registry uses the [Professional subscription plan](/products/container-registry/details/pricing/), you can use the API to create up to nine additional registries (for a total maximum of 10).

How to Create Additional Registries on the Professional Plan Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/registries`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/registries_create).

### cURL[](#create-additional-registries-on-the-professional-plan-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name": "example", "region": "fra1"}' \
      "https://api.digitalocean.com/v2/registries"

### Python[](#create-additional-registries-on-the-professional-plan-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "name": "example",
      "region": "fra1"
    }
    
    resp = client.registries.create(body=req)

## Create a Container Registry Using the CLI[](#create-a-container-registry-using-the-cli)

How to Create a Container Registry Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl registry create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/registry/create/) for more details:
    
        doctl registry create <registry-name> [flags]
    
    The following example creates a registry named `example-registry` in the NYC3 region:
    
        doctl registry create example-registry --region=nyc3
    

If your container registry uses the [Professional subscription plan](/products/container-registry/details/pricing/), you can use `doctl` to create up to nine additional registries (for a total maximum of 10).

How to Create a Container Registry Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl registries create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/registries/create/) for more details:
    
        doctl registries create <registry-name> [flags]
    
    The following example creates a registry named `example-registry` in the NYC3 region:
    
        doctl registries create example-registry --region=nyc3
    

In this article...

*   [Create a Container Registry Using the Control Panel](#create-a-container-registry-using-the-control-panel)
    *   [Choose a Subscription Plan](#choose-a-subscription-plan)
    *   [Choose a Datacenter Region](#choose-a-datacenter-region)
    *   [Name Your Container Registry](#name-your-container-registry)
    *   [Create Registry](#create-registry)
*   [Create Additional Container Registries Using the Control Panel](#create-additional-registries-using-the-control-panel)
*   [Create Container Registry Using the API](#create-container-registry-using-the-api)
*   [Create a Container Registry Using the CLI](#create-a-container-registry-using-the-cli)

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