---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/php/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# PHP Buildpack on App Platform

Validated on 25 Jun 2025 • Last edited on 22 Jul 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## How App Platform Builds Images[](#how-app-platform-builds-images)

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

[heroku-buildpack-php](https://github.com/heroku/heroku-buildpack-php#readme) is utilized as the buildpack for detecting and building your PHP applications and applications using PHP frameworks such as Laravel.

## PHP Applications using Buildpacks[](#php-applications-using-buildpacks)

App Platform looks for any of the following to detect a PHP application:

*   `composer.json`
*   `index.php`

### Current Buildpack Version and Supported Runtimes[](#current-buildpack-version-and-supported-runtimes)

App Platform uses version `268` of the Heroku PHP Buildpack. The buildpack supports PHP runtime versions `8.1.x`, `8.2.x`, `8.3.x`, and `8.4.x`. If you do not specify a version in your app, App Platform defaults to using the latest PHP release, which is currently `8.4.4`.

App Platform offers the v2 and v1 versions of the PHP buildpack. To start using PHP v2, we recommend [upgrading your stack to Ubuntu-22](/products/app-platform/how-to/change-stack/) before upgrading to newer PHP buildpack versions. To see specific runtimes that are available for these versions, please look at [our release notes](/release-notes/app-platform/).

The buildpack supports the following PHP runtime versions:

*   Ubuntu-22
    *   8.4.8 - 8.4.4
    *   8.3.19 - 8.3.0
    *   8.2.28 - 8.2.1
    *   8.1.32 - 8.1.6

### Specify a PHP Version[](#specify-a-php-version)

*   PHP versions 7.x and 8.x are supported. App Platform uses PHP 8.4.4 by default, unless your app or its dependencies request a specific version via `composer.json`. To configure the version used for your app, add a `php` dependency to `composer.json` like so:

`composer.json`

      {
        "require": {
          "php": "^8.0.0"
        }
      }

## Composer and Private Repositories[](#composer-and-private-repositories)

If your Composer configuration requires access to packages in private repositories, use the `COMPOSER_AUTH` environment variable to configure your authentication details. Composer automatically reads this variable when needed.

The value of the `COMPOSER_AUTH` variable is the same JSON structure found in Composer’s `auth.json` file. If you already have this file, you may extract the relevant portions, remove all new lines, and set the `COMPOSER_AUTH` value to the resulting single line of JSON.

See [Authentication for Privately Hosted Packages and Repositories](https://getcomposer.org/doc/articles/authentication-for-private-packages.md) in the Composer docs for more details on the different authentication types available and the JSON needed to configure them.

### Example[](#example)

A commonly used authentication type is [`github-oauth`](https://getcomposer.org/doc/articles/authentication-for-private-packages.md#github-oauth) . The JSON required to configure `github-oauth` is shown in the Composer documentation as:

    {
        "github-oauth": {
            "github.com": "token"
        }
    }

To use this on App Platform, first flatten the JSON into a single line, then substitute your GitHub personal access token for `token`:

    COMPOSER_AUTH={"github-oauth":{"github.com": "github_pat_11AABJX..."}}

Multiple authentication types and accounts can be set simultaneously in a single `COMPOSER_AUTH` variable. For more details on how to set and manage environment variables on App Platform, see How to Use Environment Variables:

[](/products/app-platform/how-to/use-environment-variables/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

How to Use Environment Variables in App Platform

Use and encrypt environment variables in App Platform.

## Enable PHP Extensions[](#enable-php-extensions)

App Platform does not enable PHP extensions by default, but you can enable them by requiring them in your app’s `composer.json` file.

For example, to enable the [GD extension](https://www.php.net/manual/en/book.image.php), add the `ext-gd` field to your `composer.json` file:

`composer.json`

    {
        "require": {
            "ext-gd": "*"
        }
    }

The asterisk (`*`) indicates that your application can use any version of the GD extension.

Once you’ve updated the `composer.json` file, update your app’s dependencies:

    composer update

Once you’ve updated your app’s dependencies, push the changes to your app’s repository. This triggers the app to redeploy with the new extensions.

For a list of available extensions, see [Heroku’s documentation](https://devcenter.heroku.com/articles/php-support#available-built-in-extensions).

## Limits[](#limits)

*   The PHP buildpack supports Composer versions 1.x and 2.x. App Platform uses the version of Composer that generated the `composer.lock` file. Generally, you can update your project by running `composer update --lock` using Composer 2.
    
*   You cannot use the `request_slowlog_timeout` directive from the PHP FastCGI Process Manager (FPM) with App Platform. We recommend using [log forwarding](/products/app-platform/how-to/forward-logs/) to capture your app’s logs and query them based on request response times.