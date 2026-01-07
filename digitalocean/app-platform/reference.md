---
source: https://docs.digitalocean.com/products/app-platform/reference/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# App Platform Reference

Validated on 16 Jun 2022 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## The DigitalOcean API[](#the-digitalocean-api)

The [DigitalOcean API](/reference/) lets you manage resources programmatically with standard HTTP requests. All actions available in the control panel are also available through the API.

The endpoint for the App Platform API is `https://api.digitalocean.com/v2/apps`; [the API documentation](https://developers.digitalocean.com/documentation/v2/) has details on how to send native HTTP requests that are properly formed to make API calls.

Alternatively, you can use an [API wrapper](https://developers.digitalocean.com/libraries/) for your desired programming language to integrate access to the API in your application’s codebase. This makes calls to the DigitalOcean API similar to calling functions from locally-installed libraries that your code is importing. You still need to create an API token with [the control panel’s token generator](https://cloud.digitalocean.com/account/api/tokens/new) and reference the token string in your code.

[](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Apps)

![](https://docs.digitalocean.com/images/icons/default.svg)

DigitalOcean API Reference for App Platform

Most App Platform API operations are centered around a few core object types which are defined here.

## The DigitalOcean Command Line Client, doctl[](#the-digitalocean-command-line-client-doctl)

[`doctl`](https://github.com/digitalocean/doctl) is the command-line interface for the DigitalOcean API. It supports most of the same actions available in the API and DigitalOcean Control Panel.

The commands for App Platform are inside the `apps` command space.

To create or update an app, you can pass in a YAML or JSON app specification to the create command, as in `doctl apps create --spec <path-to-spec>`.

[](/reference/doctl/reference/apps/)

![](https://docs.digitalocean.com/images/icons/default.svg)

doctl apps

The subcommands of `doctl app` manage your App Platform apps. For documentation on app specs, see the [app spec reference](https://www.digitalocean.com/docs/app-platform/concepts/app-spec).

## Additional References[](#additional-references)

[](/products/app-platform/reference/mcp/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

MCP Reference

Use DigitalOcean MCP servers with AI tools to simplify cloud infrastructure management.

[](/products/app-platform/reference/buildpacks/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

App Platform Buildpack References

Reference information for supported buildpacks on App Platform.

[](/products/app-platform/reference/dockerfile/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

App Platform Dockerfile Build Reference

Reference for using Dockerfiles to build App Platform apps.

[](/products/app-platform/reference/dev-config/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Reference for Dev Config YAML

Reference for the format of dev-config.yaml, a file that configures local App Platform builds using doctl

[](/products/app-platform/reference/app-spec/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

Reference for App Specification

Reference for the format of app configuration files for App Platform, also known as app specs.

[](/products/app-platform/reference/error-codes/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

App Platform Error Code Reference

Reference for error codes and their reasons in App Platform.