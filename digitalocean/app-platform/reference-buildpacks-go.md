---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/go/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# Go Buildpack on App Platform

Validated on 25 Jun 2025 • Last edited on 22 Jul 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## How App Platform Builds Images[](#how-app-platform-builds-images)

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

## Go Applications using Buildpacks[](#go-applications-using-buildpacks)

App Platform looks for any of the following files to detect a Go application:

*   `go.mod`
*   `Gopkg.toml`
*   `Godeps/Godeps.json`
*   `vendor/vendor.json`
*   `glide.yaml`

If App Platform detects one of these files, it [guides you through the remaining configuration](/products/app-platform/how-to/create-apps/) and then builds the app with the appropriate buildpack.

App Platform uses the [heroku-buildpack-go](https://github.com/heroku/heroku-buildpack-go/blob/main/README.md) buildpack for detecting and building Golang applications and applications using Golang frameworks such as Gin.

### Current Buildpack Version and Supported Runtimes[](#current-buildpack-version-and-supported-runtimes)

App Platform uses version `207` of the Heroku Go Buildpack. The buildpack supports Go runtime versions `1.11` up to `1.24`. If no version is specified in your app, App Platform defaults to using version `1.20`.

App Platform offers the v1 and v0 version of the Go buildpack. To start using Go v1, we recommend [upgrading your stack to Ubuntu-22](/products/app-platform/how-to/change-stack/) before upgrading to newer Go buildpack versions. To see specific runtimes that are available for these versions, please look at [our release notes](/release-notes/app-platform/).

The buildpack supports the following Go runtime versions:

*   Ubuntu-22
    *   1.11 - 1.23.9
    *   1.24.1 - 1.24.3

### Specify a Go Version[](#specify-a-go-version)

App Platform automatically uses the Go version specified in your `go.mod` file:

`go.mod`

    module github.com/digitalocean/sample-golang
    
    go 1.16
    ...

## Limits[](#limits)

*   Go apps that do not use a supported package manager may fail to build.
    
    App Platform supports the following package managers: Go modules, dep, Godep, govendor, and Glide.
    
*   Go apps with dependencies in private git repos may fail to build.
    
    The instructions in [Heroku’s documentation for configuring authentication with private git repos for their Go buildpack](https://github.com/heroku/heroku-buildpack-go#private-git-repos) will also work in App Platform. Alternatively, you can vendor the dependencies into the repository.
    
    If your Go app uses private dependencies that are not accessible with the same account used to access the apps, you can inject a personal access token by setting the value of the `GO_GIT_CRED__HTTPS__GITHUB__COM` environment variable to your GitHub personal access token. Learn more in [Heroku’s documentation on private git repository credentials](https://github.com/heroku/heroku-buildpack-go#private-git-repos).
    

## Golang & Hugo Detection Mismatch[](#golang--hugo-detection-mismatch)

To detect a Hugo application, App Platform looks for the following files:

*   `config.toml`
*   `config.yaml`
*   `config.json`

If App Platform detects one of these files, it considers the app a Hugo application and builds it. To have App Platform consider the app a Golang application, please rename the above file (for example, to `settings.yaml`) and re-deploy it.