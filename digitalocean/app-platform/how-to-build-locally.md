---
source: https://docs.digitalocean.com/products/app-platform/how-to/build-locally/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Build Components Locally

Validated on 18 Aug 2023 • Last edited on 18 Dec 2024

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

You can build your App Platform components locally using the same Cloud Native Buildpack- or Dockerfile-based build process as App Platform. This can improve your development process by allowing you to test and iterate more quickly.

The local build process can also be used to build App Platform containers as part of an existing CI/CD workflow. The containers can be deployed directly to App Platform by pushing them to a DigitalOcean Container Registry.

## Prerequisites[](#prerequisites)

You need the following to get started with local builds of App Platform apps:

*   Our command line interface `doctl`, version 1.82.0 or higher, installed and authenticated with your account. Use `doctl version` to check your version. Read [How to Install and Configure doctl](/reference/doctl/how-to/install/) for more information on installing `doctl` and authenticating your account.
*   Docker installed and running. See [our Community `docker` tag](https://www.digitalocean.com/community/tags/docker) for tutorials on installing Docker on various platforms.
*   The [Docker daemon socket](https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-socket-option) running.
*   An app to build. Your app should have an [App Spec](/products/app-platform/reference/app-spec/) `app.yaml` file, or be deployed to App Platform (`doctl` can download the generated App Spec from a deployed app). Browse our [sample apps](/products/app-platform/getting-started/sample-apps/) to get started with a pre-configured repo for various programming languages and frameworks.

## Quickstart[](#quickstart)

First navigate to your app’s source repository on your local command line:

    cd ~/sample-nodejs

Run the build command to start a build:

    doctl app dev build

Note

If you don’t have an App Spec file (`.do/app.yaml` by default) in your repo, specify your app ID using the `--app` flag to fetch the App Spec from App Platform. You can find your app ID using `doctl app list`.

    doctl app dev build --app f283c9c0-8c49-46d3-85f7-4cf9d8a01756

If your app has multiple components you’re prompted to select which one to build. Make your selection with the arrow keys, then press `Enter`. To skip this selection step next time, specify the component name when you run the build command, such as `doctl app dev build example-component`.

The build process begins. The build images are downloaded and used to build your component:

    ✔ using app spec from .do/app.yaml
    ▸ current app dev workspace: /home/sammy/sample-nodejs
    ✔ preparing app dev environment
    ✔ building service sample-nodejs (sample-nodejs)

When the build completes, status information and an example Docker command are printed:

    ✔ successfully built sample-nodejs in 24s
    ✔ created container image sample-nodejs:dev
    
    ▸ push your image to a container registry using docker push
    ▸ or run it locally using docker run; for example:
    
    ❯ docker run -e PORT=3000 --rm -p 8080:3000 sample-nodejs:dev
    
    then access your component at http://localhost:8080

Run the `docker` command to test your component locally. If you have trouble connecting, make sure the port information in the Docker command is correct. If it is incorrect, check your App Spec for missing or misconfigured port information.

## Deploy Local Builds to App Platform via Container Registry[](#deploy-local-builds-to-app-platform-via-container-registry)

Depending on your CI/CD workflow, you may wish to deploy your locally built images directly to App Platform. To do so, first set up an App Platform component that deploys from a container registry. Setting the build command’s `--registry` flag to your registry information saves you an extra tagging step when pushing to the registry.

Images pushed to a DigitalOcean Container Registry can optionally trigger the **Autodeploy** feature, which automatically re-deploys your app with the updated image.

For more information on deploying App Platform components from container images, see the [Deploy from Container Images](/products/app-platform/how-to/deploy-from-container-images/) documentation.

## Build Configuration[](#build-configuration)

Local builds often need to override production configuration options. App Platform local build options can be specified as flags to the `doctl app dev build` command. Some common options are explained below. All flags are optional.

For a full list, run `doctl app dev build --help` to display the online help text.

*   `--app`: An app ID to fetch an existing App Spec from.
*   `--build-command`: An alternate build command override for local development.
*   `--env-file`: Path to a `.env` file with overrides for environment variables.
*   `--spec`: Path to an app spec in JSON or YAML format (defaults to `.do/app.yaml`).
*   `--registry`: Registry name to use when tagging built images.
*   `--timeout`: A timeout duration for the build. Valid units are `s`, `m`, `h`. Example: `15m30s`.

These configuration options can also be placed in a `.do/dev-config.yaml` file using a text editor or by using `doctl app dev config set`. You can also set component-specific build commands and environment variables in this file. See the [`dev-config.yaml` reference](/products/app-platform/reference/dev-config/) for details.

## Limits[](#limits)

*   The local build process does not yet support App Platform’s Function components. Use `doctl serverless deploy` to deploy and test your functions.