---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/aptfile/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 Aptfile Buildpack on App Platform

Validated on 11 Oct 2023 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## How App Platform Builds Images[](#how-app-platform-builds-images)

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

When you use the Aptfile buildpack, DigitalOcean’s version of the [heroku-buildpack-apt](https://github.com/digitalocean/buildpack-apt) buildpack detects and builds your applications.

Aptfile is meant to be used with other buildpacks and declare Ubuntu system-level packages that App Platform installs during the app’s build process. This is different from declaring dependencies in a Pipfile (Python) or `package.json` (Node.js) file that declare application-level dependencies.

## Aptfile Applications using Buildpacks[](#aptfile-applications-using-buildpacks)

App Platform looks for a file named `Aptfile` (no file extension) to detect an application requiring system packages. If this file is detected, the heroku-buildpack-apt buildpack is used to install any packages listed in the Aptfile during the build process.

The following example Aptfile declares three system packages to install:

`Aptfile`

    libpq-dev
    imagemagick
    curl

This example installs:

*   `libpq-dev`: A library for PostgreSQL applications.
*   `imagemagick`: A command-line tool for image processing.
*   `curl`: A command line tool for making HTTP requests.

## Limits[](#limits)

*   Shared libraries and packages with components installed outside common directories like `/lib` and `/bin` may not be accessible to apps at runtime. For example, [FFmpeg](https://ffmpeg.org) requires installing additional packages for certain codecs in directories that are not available to the app.