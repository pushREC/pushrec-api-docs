---
source: https://docs.digitalocean.com/products/app-platform/how-to/store-data/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Store Data in App Platform

Validated on 6 Oct 2020 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

The following options are available to developers who need to store files and data in their App Platform app.

## Managed Database[](#managed-database)

You can create a managed relational database from directly within App Platform for use in your app. For more details, see the [Manage Database](/products/app-platform/how-to/manage-databases/) topic.

## Spaces[](#spaces)

DigitalOcean offers a product called Spaces, which is compatible with Amazon’s S3 buckets. Spaces provide programmatic access to file storage at scale.

To use Spaces in your application, read [the Spaces quickstart](/products/spaces/getting-started/quickstart/) to create a Space, and then begin using the Space in your code via [the RESTful API](https://developers.digitalocean.com/documentation/spaces/) or [existing AWS S3 tools](/products/spaces/how-to/use-aws-sdks/).

## Local Filesystem (Ephemeral Files Only)[](#local-filesystem-ephemeral-files-only)

If you are writing files for temporary use, you can use the local filesystem. However, keep these two things in mind:

1.  **Instances are ephemeral**, and are being continuously created and destroyed as the app is scaled, redeployed, etc, and any changes to the filesystem will be destroyed with the instance. This means that every redeployment of your app will reset the filesystem.
    
2.  If you have a multi-instance app from [scaling horizontally](/products/app-platform/getting-started/quickstart/#scale-your-app), you should remember that **each instance has a separate filesystem**. Because of this, you should not use the local filesystem for anything that needs to be stateful.
    

## Limits[](#limits)

*   The host instances running App Platform containers do not provide persistent data storage. Data in the host instance’s local filesystem is permanently lost after deployments and other container replacements. The local filesystem is additionally limited to 4 GiB, and if it is filled to capacity, the container is detected as unhealthy and replaced.

Apps should only use the host instance’s local filesystem for small amounts of temporary storage. For persistent storage, you can use [Spaces Object Storage](/products/spaces/) or [DigitalOcean Managed Databases](/products/databases/).

*   App Platform does not currently support [volumes](/products/volumes/). Because App Platform instances are scalable and ephemeral, we cannot yet support mounting network volumes to the filesystem in a way that is persistent and consistent between instances.