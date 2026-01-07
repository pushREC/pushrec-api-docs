---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/legacy-nodejs/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 Legacy Node.js Buildpack on App Platform

Validated on 15 Oct 2024 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## How App Platform Builds Images[](#how-app-platform-builds-images)

Warning

This buildpack is deprecated. Use the [new Heroku Node.js Buildpack](/products/app-platform/reference/buildpacks/nodejs/), instead.

All new apps use the new Node.js buildpack by default. To upgrade existing apps crated before 17 September 2024 to the new Node.js buildpack, see [How to Upgrade Your Node.js Buildpack in App Platform](/products/app-platform/how-to/migrate-nodejs-buildpack/).

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

[heroku-buildpack-nodejs](https://github.com/heroku/heroku-buildpack-nodejs#readme) is utilized as the buildpack for detecting and building your Node.js applications and applications using Node.js frameworks such as Express.js, Next.js, and Nuxt.js.

## Node.js Applications using Buildpacks[](#nodejs-applications-using-buildpacks)

App Platform looks for any of the following files to detect a Node.js application:

*   `package.json`
*   `package-lock.json`
*   `yarn.lock`
*   `pnpm-lock.yaml`

The order of preference is `yarn.lock`, `pnpm-lock.yaml` and `package-lock.json`. If all three files are present, Yarn is preferred. If only `pnpm-lock.yaml` and `package-lock.json` exist, Pnpm is preferred.

### Current Buildpack Version and Supported Runtimes[](#current-buildpack-version-and-supported-runtimes)

#### Default Stack[](#default-stack)

App Platform uses version `0.4.0` of the Node.js Cloud Native Buildpack by default. If no version is specified in your app, for Node.js v1 App Platform defaults to using version `20.x` and for Node.js v0 App Platform defaults to using version `16.x`.

The buildpack supports the following Node.js runtime versions:

*   Ubuntu-22
    *   6.x - 21.x
*   Ubuntu-18
    *   6.x - 17.x

### Specifying Versions[](#specifying-versions)

Specify your desired Node version in the `engines` section of `package.json`.

`package.json`

    {
      "engines": {
        "node": "16.x"
      }
    }

You can customize the npm version used by specifying the version in the `engines` section of your `package.json`:

`package.json`

    {
      "engines": {
        "npm": "~1.0.20"
      }
    }

You can customize the Yarn version used by specifying the version in the `engines` section of your `package.json`:

`package.json`

    {
      "engines": {
        "yarn": "^0.14.0"
      }
    }

Starting from Yarn v3, the default behaviour is changed to Plug’n’Play i.e. on yarn install, a single Node.js loader file is generated in place of typical node\_modules.

Our nodejs-buildpack needs node\_modules to be present in project. In order to fix this, the user needs to add a .yarnrc.yml file with config - nodeLinker: node-modules. This tells yarn to generate node\_modules.

Note

[Long Term Support (LTS)](https://github.com/nodejs/Release) versions of Node.js are not supported.

You can customize the Pnpm version used by specifying the version in the `engines` section of your `package.json`:

`package.json`

    {
      "engines": {
        "pnpm": "8.14.1"
      }
    }

### Specifying devDependencies[](#specifying-devdependencies)

App Platform installs `devDependencies` and doesn’t set `NODE_ENV` during the build process by default. If your build command requires `devDependencies` but you want to set `NODE_ENV` to `production`, configure the following custom script. This script installs `devDependencies` even if `NODE_ENV` is set to `production`.

#### Yarn[](#yarn)

`package.json`

    "scripts": {
        "build:digitalocean": "yarn install --production=false && yarn run build && rm -rf node_modules && yarn install --production --frozen-lockfile",
        ... 
      } 

App Platform Build Command

    yarn build:digitalocean 

#### Pnpm[](#pnpm)

`package.json`

    "scripts": {
        "build:digitalocean": "pnpm install --production=false && pnpm run build && rm -rf node_modules && pnpm install --production --frozen-lockfile",
        ... 
      } 

App Platform Build Command

    pnpm run build:digitalocean 

#### npm[](#npm)

`package.json`

      "scripts": {
        "build:digitalocean": "npm install --production=false && npm run build && npm ci",
        ... 
      } 

Note

If you are using an older Node.js version prior to 7.7.x, use this build command instead.

`package.json`

      "scripts": {
        "build:digitalocean": "npm install --include=dev && npm run build && npm ci",
        ... 
      } 

App Platform Build Command

    npm run build:digitalocean  

### Caching[](#caching)

The buildpack automatically caches and re-uses the `node_modules` directory between builds. After the package manager’s install command is run (`yarn install` or `npm install`), the `node_modules` directory is stored in the build cache along with snapshot of the package manager’s lockfile. In subsequent builds, the cached `node_modules` directory will be restored only if the lockfile’s contents are identical to cached version. Otherwise, the cache will be discarded.

### Clearing the Cache[](#clearing-the-cache)

If your app is failing to build and you suspect that the issue is related to `node_modules` caching, you can force clear the cache and start a new build. To do this in the control panel, navigate to your app, click the **Actions** menu, and then select **Force Build and Deploy**.

![Force Build and Deploy screen with Clear Build Cache checked](https://docs.digitalocean.com/screenshots/app-platform/app-force-build-deploy.ea850a5eedb3f0eb34516acbab175572522ccee86f310e9ae18d75b096b94c1d.png)

In the **Force Build and Deploy** window, select the **Clear Build Cache** option, and then click the “Deploy” button. This clears the build cache and starts a new deployment.

Here’s an example with Node and Express that uses the PORT variable or `3000` for developing locally.

    const express = require('express');
    const app = express();
    
    // get our port
    const port = process.env.PORT || 3000;
    
    // application code goes here
    
    // have node listen on our port
    app.listen(port, () => console.log(`App listening on port ${port}!`));