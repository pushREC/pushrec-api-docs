---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/bun/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# Bun Buildpack on App Platform

Validated on 29 Oct 2025 • Last edited on 10 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## How App Platform Builds Images[](#how-app-platform-builds-images)

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

## JavsScript Applications using Bun Buildpack[](#javsscript-applications-using-bun-buildpack)

App Platform looks for any of the following to detect if Bun buildpack is used:

*   `bun.lock`
*   `bun.lockb`

If App Platform detects one of these files, it [guides you the remaining configuration](/products/app-platform/how-to/create-apps/) and then builds the app with the bun buildpack.

### Current Buildpack Version and Supported Runtimes[](#current-buildpack-version-and-supported-runtimes)

App Platform uses version `v0.0.2` of the Bun Cloud Native Buildpack. The bun version is selected in the following order:

1.  From `BUN_VERSION` environment variable.
2.  From `.bun-version` file.
3.  From `.runtime.bun.txt` file.

If no version is specified, it uses the latest version from [Bun’s GitHub Releases](https://github.com/oven-sh/bun/releases)

## Specify a Node.js Engine[](#specify-a-nodejs-engine)

To use Bun as the package manager and Node.js during runtime, App Platform installs Node.js in the following cases:

*   If you define bun as `pacakgeManager` in your `package.json`:

`package.json`

    {
      "packageManager": "[email protected]"
    }

*   If any script in `package.json` contains node. By default, it installs `Node.js v22.x`. If you want to install a specific Node.js version, you can define it in the `engines` section of `package.json`:

`package.json`

    {
      "engines": {
        "node": "16.x"
      }
    }

## Build Behaviour[](#build-behaviour)

App Platform installs all dependencies listed in `package.json` using `bun install`.

By default, App Platform runs `bun run build` to build the code. You can override this by defining `build_command` in the app spec.

To run specific actions before or after installing dependencies, use `digitalocean-prebuild` and `digitalocean-postbuild`:

`package.json`

    "scripts": {
      "digitalocean-prebuild": "echo This runs before installing dependencies.",
      "digitalocean-postbuild": "echo This runs after installing dependencies, but before pruning and caching dependencies."
    }

## Caching[](#caching)

App Platform caches the following steps to improve the build time:

*   `node_modules`: If `bun.lock` is not changed, it’ll re-use cached `node_modules`.
*   `bun`: If `bun` version is not changed, it’ll re-use the cached version.
*   `node`: If `Node.js` engine version is not changed, it’ll re-use the cached on.

## Run Command[](#run-command)

App Platform uses `bun run start` as the default run command. You can override this by specifying `run_command` in the AppSpec.

For the following `packge.json`, you can set `run_command: bun run deploy`:

`package.json`

    "scripts": {
      "deploy": "node src/index.js"
    }