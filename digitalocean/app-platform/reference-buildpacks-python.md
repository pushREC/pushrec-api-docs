---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/python/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# Python Buildpack on App Platform

Validated on 25 Jun 2025 • Last edited on 22 Jul 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## How App Platform Builds Images[](#how-app-platform-builds-images)

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

[heroku-buildpack-python](https://github.com/heroku/heroku-buildpack-python/blob/main/README.md) is utilized as the buildpack for detecting and building your Python applications and applications using Python frameworks such as Flask.

## Python Applications using Buildpacks[](#python-applications-using-buildpacks)

App Platform looks for any of the following to detect a Python application:

*   `requirements.txt`
*   `Pipfile`
*   `setup.py`

### Current Buildpack Version and Supported Runtimes[](#current-buildpack-version-and-supported-runtimes)

App Platform uses version `289` of the Heroku Python Buildpack. If no version is specified in your app, App Platform defaults to using version `3.13.x`.

App Platform offers the v4, v3, and v2 of the Python buildpack. To start using Python v4 or v3, we recommend [upgrading your stack to Ubuntu-22](/products/app-platform/how-to/change-stack/) before upgrading to newer Python buildpack versions. To see specific runtimes that are available for these versions, please look at [our release notes](/release-notes/app-platform/).

The buildpack supports the following Python runtime versions:

*   Ubuntu-22
    *   3.13
    *   3.12.7 - 3.12.0
    *   3.11.10 - 3.11.0
    *   3.10.15 - 3.10.4
    *   3.9.20 - 3.9.12

### Support for uv Package Manager[](#support-for-uv-package-manager)

The Python buildpacks now support using the package manager uv to install app dependencies during the build.

If you have not used uv before, it supports lockfiles, is extremely fast, and is actively maintained by a full-time team! To use uv on Digitalocean, ensure your app has a `pyproject.toml`, `uv.lock` and a `.python-version` file. These can be created using `uv init`.

You must remove any other package manager files (such as `requirements.txt`, `Pipfile` or `poetry.lock`), otherwise the other package managers will take precedence for backwards compatibility.

### Specify a Python Version[](#specify-a-python-version)

You can configure the python version used at runtime by specifying a `runtime.txt` file at the root of your source code:

`runtime.txt`

    python-3.10.4

## Limits[](#limits)

*   At least one of `requirements.txt`, `Pipfile`, and `setup.py` must be located in the root directory of the repo.
*   A run command is required. If one is not auto-detected, you must set one before deploying your app.

*   Due to an issue with Gunicorn running in Docker, App Platform fails to run when the temporary directory is not specified in the run command. To resolve, run Gunicorn to use a different location for its temp files. If using Django, modify the run command by passing the option `gunicorn --worker-tmp-dir /dev/shm project.wsgi`, replacing `project` with the name of your project. If using Flask, modify the run command by passing the option `gunicorn --worker-tmp-dir /dev/shm wsgi:project`, replacing `project` with the name of your project.