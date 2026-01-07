---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/ruby/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 Ruby Buildpack on App Platform

Validated on 25 Jun 2025 • Last edited on 22 Jul 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## How App Platform Builds Images[](#how-app-platform-builds-images)

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

[heroku-buildpack-ruby](https://github.com/heroku/heroku-buildpack-ruby/blob/main/README.md) is the buildpack for detecting and building Ruby applications and applications using Ruby frameworks such as Ruby on Rails.

## Ruby Applications using Buildpacks[](#ruby-applications-using-buildpacks)

App Platform looks for any of the following to detect a Ruby or Ruby on Rails application:

*   `Gemfile`
*   `Gemfile.lock`
*   `Rakefile`

### Current Buildpack Version and Supported Runtimes[](#current-buildpack-version-and-supported-runtimes)

App Platform uses version `312` of the Heroku Ruby Buildpack. If no version is specified in your app, App Platform defaults to using version `3.3.8`.

App Platform offers the v2 and v1 of the Ruby buildpack. To start using Ruby v2, we recommend [upgrading your stack to Ubuntu-22](/products/app-platform/how-to/change-stack/) before upgrading to newer Ruby versions. To see specific runtimes that are available for these versions, look at [our release notes](/release-notes/app-platform/).

The buildpack supports the following Ruby runtime versions:

*   Ubuntu-22
    *   3.4.4 - 3.4.0
    *   3.3.8 - 3.3.0
    *   3.2.8 - 3.2.0
    *   3.1.7 - 3.1.0

### Specify a Ruby Version[](#specify-a-ruby-version)

You can configure the Ruby version used at runtime by specifying a `Gemfile` file at the root of your source code:

`Gemfile`

    source "https://rubygems.org"
    ruby "2.5.1"
    # ...

## Limits[](#limits)

*   You must commit a `Gemfile` to an app’s repo alongside its source code.