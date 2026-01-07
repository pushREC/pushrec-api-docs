---
source: https://docs.digitalocean.com/products/app-platform/reference/dev-config/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# Reference for Dev Config YAML

Validated on 27 Sep 2022 • Last edited on 28 Sep 2022

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

As an alternative to configuring your local App Platform builds using `doctl` command line flags, you can define a development configuration using the `dev-config.yaml` YAML file.

This file can be created and edited using a text editor, or by setting and unsetting keys using the `doctl app dev config set` and `unset` commands.

## File Structure[](#file-structure)

The `dev-config.yaml` file is a YAML file with the following keys available. All configuration is optional.

*   `app`: ID of an App Platform app to load the AppSpec from. Use `doctl app list` to list your App Platform apps and their IDs.
*   `spec`: Path to an App Spec file in JSON or YAML format (defaults to `.do/app.yaml`).
*   `registry`: Registry name to use when tagging built images.
*   `no_cache`: Boolean to determine whether to disable the build cache.
*   `timeout`: A timeout duration for the build. Valid units are `s`, `m`, and `h`. Example: `15m30s`).
*   `components`: An object with your component names as keys, for component-specific configuration.
    *   `example-component`
        *   `build_command`: Custom build command for `example-component`.
        *   `env_file`: Path to a `.env` file to set environment variables for `example-component`.

## Example[](#example)

Below is an example `dev-config.yaml` file. This configuration fetches App Spec from App Platform using `app`, sets up pushing to a DigitalOcean Container Registry with `registry`, disables caching, sets a 15 minute and 30 seconds timeout, and configures two components with component-specific options.

    app: f283c9c0-8c49-46d3-85f7-4cf9d8a01756
    registry: registry.digitalocean.com/example-registry
    no_cache: true
    timeout: 15m30s
    components:
      example-component:
        build-command: ./scripts/build.sh
      second-component:
        env_file: ./configuration/second-component.env