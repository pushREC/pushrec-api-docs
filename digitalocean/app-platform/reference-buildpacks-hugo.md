---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/hugo/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 Hugo Buildpack on App Platform

Validated on 25 Jun 2025 • Last edited on 22 Jul 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## How App Platform Builds Images[](#how-app-platform-builds-images)

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

## Hugo Applications using Buildpacks[](#hugo-applications-using-buildpacks)

App Platform looks for any of the following to detect a Hugo application:

*   `config.toml`
*   `config.yaml`
*   `config.json`

If App Platform detects one of these files, it [guides you the remaining configuration](/products/app-platform/how-to/create-apps/) and then builds the app with the appropriate buildpack.

### Current Buildpack Version and Supported Runtimes[](#current-buildpack-version-and-supported-runtimes)

App Platform uses version `v1.12.0` of the Hugo Cloud Native Buildpack. If no version is specified, App Platform defaults to using version `0.147.8`.

The buildpack supports the following Hugo runtime versions:

*   Ubuntu-22
    *   0.54.0 - 0.147.8

### Specify a Hugo Version[](#specify-a-hugo-version)

You can choose the default Hugo version by setting `HUGO_VERSION` environment variable to any valid release from [Hugo’s upstream repository](https://github.com/gohugoio/hugo/releases), like `0.144.2`.

To use the extended version of Hugo with Sass/SCSS support, set the `HUGO_EXTENDED` environment variable to `1`.

For `HUGO_ENVIRONMENT`, it checks if there is a `config/{env}` directory. It goes into the config folder and looks to see if a hugo detect file exists. The detect file has to be named: “config.toml”, “config.yaml”, “config.json”, “config.yml”, “hugo.toml”, “hugo.yaml”, “hugo.json”, or “hugo.yml”.