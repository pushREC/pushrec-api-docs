---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# App Platform Buildpack References

Validated on 8 Apr 2022 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

## Supported Languages and Frameworks[](#supported-languages-and-frameworks)

[](/products/app-platform/reference/buildpacks/bun/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Bun Buildpack on App Platform

Details on using the Bun buildpack in App Platform, including files for buildpack detection, choosing versions, and limits.

[](/products/app-platform/reference/buildpacks/legacy-nodejs/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Legacy Node.js Buildpack on App Platform

Details on using the Node.js buildpack in App Platform, including files for buildpack detection, choosing versions, and limits.

[](/products/app-platform/reference/buildpacks/aptfile/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Aptfile Buildpack on App Platform

Details on using the Aptfile buildpack in App Platform, including files for buildpack detection, choosing versions, and limits.

[](/products/app-platform/reference/buildpacks/go/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Go Buildpack on App Platform

Details on using the Go buildpack in App Platform, including files for buildpack detection, choosing versions, and limits.

[](/products/app-platform/reference/buildpacks/hugo/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Hugo Buildpack on App Platform

Details on using the Hugo buildpack in App Platform, including files for buildpack detection, choosing versions, and limits.

[](/products/app-platform/reference/buildpacks/nodejs/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Node.js Buildpack on App Platform

Details on using the Node.js buildpack in App Platform, including files for buildpack detection, choosing versions, and limits.

[](/products/app-platform/reference/buildpacks/php/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

PHP Buildpack on App Platform

Details on using the PHP buildpack in App Platform, including files for buildpack detection, choosing versions, and limits.

[](/products/app-platform/reference/buildpacks/python/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Python Buildpack on App Platform

Details on using the Python buildpack in App Platform, including files for buildpack detection, choosing versions, and limits.

[](/products/app-platform/reference/buildpacks/ruby/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Ruby Buildpack on App Platform

Details on using the Ruby buildpack in App Platform, including files for buildpack detection, choosing versions, and limits.

## Need Help?[](#need-help)

[](/products/app-platform/support/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

App Platform Support

Get help with App Platform using our knowledgebase and troubleshooting guides.