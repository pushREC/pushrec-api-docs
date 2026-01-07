---
source: https://docs.digitalocean.com/products/app-platform/concepts/platform-upgrade-policy/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# App Platform Build System Update Policy

Validated on 16 Jun 2022 • Last edited on 11 Mar 2024

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## Platform Update Policy[](#platform-update-policy)

One of the ways App Platform supports app building is with [Cloud Native Buildpacks](/products/app-platform/reference/buildpacks/). The Buildpacks build system is based on [Long Term Support (LTS) versions of Ubuntu](https://ubuntu.com/blog/what-is-an-ubuntu-lts-release) and receives routine feature and security updates. These Ubuntu environments are referred to as “Stacks”.

## Updating Existing Stacks[](#updating-existing-stacks)

Packages available on our stacks automatically update on a monthly basis, in order to ensure the stability and security of your applications. Packages also receive security updates as soon as they become available. You can view stack updates in the [App Platform changelog](/release-notes/app-platform/), which list the modified packages and their changes.

Our goal when updating stacks is to minimize disruptions and maintain compatibility with existing stacks. We carefully test updates with internal Apps before rolling them out to the platform, and once a package is added to a stack, it will remain there for the lifetime of that stack. We strive to ensure that any updates we make to our stacks are thoroughly tested and carefully implemented, in order to maintain the stability and continuity of your Apps.

## Adding New Stacks[](#adding-new-stacks)

App Platform periodically releases updated stacks based on [Ubuntu Long Term Support (LTS)](https://ubuntu.com/blog/what-is-an-ubuntu-lts-release) versions. We thoroughly test all new stacks are before offering them to users, ensuring stability and compatibility with our existing infrastructure. Due to this testing process, stack releases may trail behind LTS releases by some time.

## Deprecation of Old Stacks[](#deprecation-of-old-stacks)

App Platform deprecates stacks in accordance with Canonical’s deprecation of their corresponding Ubuntu LTS versions, which have a lifespan of 5 years. However, any Apps that you have already deployed will continue to function even after their stack is deprecated.

New deployments and builds require an upgrade to a newer stack. In these cases, we send out email notifications and release blog posts. Additionally, you can upgrade your app for testing purposes for a limited time.

We highly recommend keeping Apps upgraded to the latest stack as they become available. This ensures that you are using the most stable and secure version of the stack.

## Need Help?[](#need-help)

[](/products/app-platform/support/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

App Platform Support

Get help with App Platform using our knowledgebase and troubleshooting guides.