---
source: https://docs.digitalocean.com/products/functions/details/features/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/details/features/
domain: docs.digitalocean.com
---
                Functions Features | DigitalOcean Documentation

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

*   [Details](/products/functions/details/) 
*   Features

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Functions Features

Validated on 23 May 2022 • Last edited on 17 Jun 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

## What are Serverless Functions?[](#what-are-serverless-functions)

Serverless architecture is a way to design web applications and services that doesn’t rely on managing backend infrastructure. In a serverless architecture, cloud providers like DigitalOcean provision, manage, and scale the backend servers and components required to host applications.

DigitalOcean Functions is a function as a service (FaaS) platform. Functions lets you deploy code that can perform the same tasks as a traditional API without the requirement of setting up a server to manage the requests. Each function you deploy is assigned a unique URL which you can use to anonymously test the function. You can invoke your functions and inspect their logs and results directly from your terminal.

## Use Cases[](#use-cases)

Functions is a good fit for small or repetitive functions with variable workloads. Functions only run in response to events or requests, and you’re only charged for what you use, so they’re most cost-effective for components with fluctuating amounts of requests.

DigitalOcean Functions and other FaaS products are designed for ease of deployment without any need to consider the underlying infrastructure. If you want more control over your production environment, consider using [App Platform, our PaaS offering](/products/app-platform/) or [Droplets, our Linux-based VMs](/products/droplets/).

## Functions Options[](#functions-options)

### Functions Platform[](#functions-platform)

You can develop and deploy DigitalOcean Functions using our `doctl` command line tool or through the control panel.

The control panel has a basic editor with the ability to invoke your functions, change its input parameters, and view its output and logs. You can also create, edit, and destroy functions and namespaces through the control panel.

Most developers use the command line to deploy their functions. Our `doctl` command line tool allows you to scaffold new projects, connect them to a new Functions namespace in the cloud, and quickly deploy, test, and iterate your functions.

### App Platform Functions Component[](#app-platform-functions-component)

You can also deploy Functions as a component of an [App Platform](/products/app-platform/how-to/manage-functions/) app. The actual runtime environment and infrastructure is the same as the Functions platform, with the addition of App Platform handling versioning, rollback, environment variables, and other processes specific to the App Platform environment.

Functions components in App Platform integrate with the rest of App Platform’s offerings, which lets you use functions to build an API that powers the rest of your app’s backend alongside its static site or containerized web application.

## Supported Runtimes[](#supported-runtimes)

Functions currently has eight different runtimes, representing four different programming languages:

*   Go 1.17
*   Go 1.20
*   Node.js 14
*   Node.js 18
*   PHP 8.0
*   PHP 8.2
*   Python 3.9
*   Python 3.11

You can also view the list of supported runtimes with `doctl serverless status --languages`.

## Insights & Logs[](#insights--logs)

DigitalOcean Functions have built-in insights, including activation rate, average duration, average wait time, and error rate over the last 14 days. Functions also has 3 days of log retention.

In this article...

*   [What are Serverless Functions?](#what-are-serverless-functions)
*   [Use Cases](#use-cases)
*   [Functions Options](#functions-options)
    *   [Functions Platform](#functions-platform)
    *   [App Platform Functions Component](#app-platform-functions-component)
*   [Supported Runtimes](#supported-runtimes)
*   [Insights & Logs](#insights--logs)

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

Try using different keywords or simplifying you