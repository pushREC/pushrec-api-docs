---
source: https://docs.digitalocean.com/products/functions/how-to/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/how-to/
domain: docs.digitalocean.com
---
                Functions How-Tos | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/functions.b0bb037d0e06c09d659cd32aeb2b48c4195d6e824680f25a98d7ed1c24010331.svg)Functions](/products/functions/)
*   [Getting Started](/products/functions/getting-started/)
    *   [Quickstart](/products/functions/getting-started/quickstart/)
    *   [Sample Functions](/products/functions/getting-started/sample-functions/)
    *   [Serverless Jamstack Site](/products/functions/getting-started/serverless-jamstack/)
*   [How-Tos](/products/functions/how-to/)
    *   [Create Functions](/products/functions/how-to/create-functions/)
    *   [Develop Functions](/products/functions/how-to/develop-functions/)
    *   [Configure Functions](/products/functions/how-to/configure-functions/)
    *   [Schedule Functionsprivate](/products/functions/how-to/schedule-functions/)
    *   [Call Async Functions](/products/functions/how-to/async-functions/)
    *   [Destroy Functions](/products/functions/how-to/destroy/)
    *   [Include Static Files](/products/functions/how-to/include-files/)
    *   [Set CORS Headers](/products/functions/how-to/set-custom-cors-headers/)
    *   [Create Namespaces](/products/functions/how-to/create-namespaces/)
    *   [Destroy Namespaces](/products/functions/how-to/destroy-namespaces/)
    *   [Structure Projects](/products/functions/how-to/structure-projects/)
    *   [Forward Logs](/products/functions/how-to/forward-logs/)
    *   [Deploy to App Platform](/products/functions/how-to/deploy-to-app-platform/)
*   [Reference](/products/functions/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Functions)
    *   [CLI Reference](/reference/doctl/reference/serverless/)
    *   [Activation Records](/products/functions/reference/activation-records/)
    *   [HTTP Headers](/products/functions/reference/http-headers/)
    *   [Parameters and Responses](/products/functions/reference/parameters-responses/)
    *   [Project Configuration](/products/functions/reference/project-configuration/)
    *   [Supported Runtimes](/products/functions/reference/runtimes/)
        *   [Go](/products/functions/reference/runtimes/go/)
        *   [Node.js](/products/functions/reference/runtimes/node-js/)
        *   [PHP](/products/functions/reference/runtimes/php/)
        *   [Python](/products/functions/reference/runtimes/python/)
    *   [Build Process](/products/functions/reference/build-process/)
*   [Concepts](/products/functions/concepts/)
    *   [Glossary](/glossary/functions/)
*   [Details](/products/functions/details/)
    *   [Features](/products/functions/details/features/)
    *   [Pricing](/products/functions/details/pricing/)
    *   [Availability](/products/functions/details/availability/)
    *   [Limits](/products/functions/details/limits/)

*   How-Tos

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Functions How-Tos

Generated on 6 Jan 2026

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

## Create[](#create)

[](/products/functions/how-to/create-functions/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Create Functions

Create and deploy a function using the command line or control panel.

[](/products/functions/how-to/develop-functions/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Develop Functions

Improve your serverless development with this guidance on invoking, iterating on, and observing DigitalOcean Functions.

[](/products/functions/how-to/destroy/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Destroy Functions

You can destroy individual functions at any time. You can also destroy all functions in a namespace at once by resetting the namespace.

[](/products/functions/how-to/include-files/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Include Static Files

Node.js, Python, and PHP functions include all the files in their directory when deployed. Functions written in Go must use the [embed package](https://pkg.go.dev/embed) to refer to these files.

[](/products/functions/how-to/set-custom-cors-headers/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Set Custom CORS Headers

Set custom CORS headers.

[](/products/functions/how-to/structure-projects/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Structure Projects

Projects contain functions that are grouped into packages and configured by a project.yml file.

## Configure[](#configure)

[](/products/functions/how-to/configure-functions/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Configure Functions

Configure the resource limits, runtime, and environment of your DigitalOcean Functions.

[](/products/functions/how-to/schedule-functions/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Schedule Functions

Schedule functions to run periodically.

[](/products/functions/how-to/forward-logs/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Forward Logs

You can configure functions to forward console and error logs from the function to a third-party logging service. Functions supports Papertrail, Datadog, and Logtail.

## Deploy and Use[](#deploy-and-use)

[](/products/functions/how-to/async-functions/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Call Long-running Functions Asynchronously

You can invoke long-running functions asynchronously using the `doctl` command line tool or the Functions REST API. You cannot run functions invoked as web functions asynchronously.

[](/products/functions/how-to/deploy-to-app-platform/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Deploy Functions to App Platform

Use App Platform to deploy your Functions as a component of a production app.

## Namespaces[](#namespaces)

[](/products/functions/how-to/create-namespaces/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Create Namespaces to Organize DigitalOcean Functions

Namespaces are a level of isolation and organization for functions and their settings. All functions and projects must be created in a namespace.

[](/products/functions/how-to/destroy-namespaces/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Destroy Namespaces

Namespaces are a level of isolation and organization for functions and their settings. All functions and projects must be created in a namespace. Destroying a namespace permanently destroys all of its projects and functions.

In this article...

[Functions How-Tos](https://docs.digitalocean.com/products/functions/how-to/)

##### Company

*   [About](https://www.digitalocean.com/about)
*   [Careers](https://www.digitalocean.com/careers)
*   [Blog](https://www.digitalocean.com/blog)

##### Docs

*   [Docs Home](https://docs.digitalocean.com)
*   [API Reference](https://docs.digitalocean.com/reference/api)
*   [CLI Reference](https://docs.digitalocean.com/reference/doctl)
*   [Release Notes](https://docs.digitalocean.com/release-notes)
*   [Trust Platform](https://www.digitalocean.com/trust)

##### Community

*   [Tutorials](https://www.digitalocean.com/community/tutorials)
*   [Q&A](https://www.digitalocean.com/community/questions)
*   [Write for DOnations](https://www.digitalocean.com/community/pages/write-for-digitalocean)
*   [Currents Research](https://www.digitalocean.com/currents)
*   [Legal](https://www.digitalocean.com/legal)
*   [Code of Conduct](https://www.digitalocean.com/community/pages/code-of-conduct)

##### Support

*   [Support Center](/support)
*   [Report Abuse](https://www.digitalocean.com/company/contact/abuse)

* * *

© 2025 DigitalOcean, LLC. All rights reserved

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https://www.linkedin.com/company/digitalocean)[](https://github.com/digitalocean)

### We can't find any results for your search.

Try using different keywords or simplifying your search ter