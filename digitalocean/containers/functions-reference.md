---
source: https://docs.digitalocean.com/products/functions/reference/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/reference/
domain: docs.digitalocean.com
---
                Functions Reference | DigitalOcean Documentation

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

*   Reference

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Functions Reference

Validated on 23 May 2022 • Last edited on 17 Jun 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

## The DigitalOcean API[](#the-digitalocean-api)

The [DigitalOcean API](/reference/) lets you manage resources programmatically with standard HTTP requests. All actions available in the control panel are also available through the API.

You can use the API to [manage your Functions namespaces](/reference/api/digitalocean/#tag/Functions).

## The DigitalOcean Command Line Client, doctl[](#the-digitalocean-command-line-client-doctl)

[`doctl`](https://github.com/digitalocean/doctl) supports a command line workflow for developing functions locally and managing their deployment to Functions. See the `doctl serverless` documentation or use `doctl serverless --help` for more information.

[](/reference/doctl/reference/serverless/)

![](https://docs.digitalocean.com/images/icons/default.svg)

doctl serverless

The sub-commands of `doctl serverless` manage local and cloud functions during development and deployment.

## Other Reference Material[](#other-reference-material)

[](/products/functions/reference/activation-records/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Activation Record JSON Structure

Each asynchronous activation of a function creates an activation record, which you can retrieve to learn more about the process. Activation records are a JSON object, the structure of which is documented here.

[](/products/functions/reference/http-headers/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

HTTP Headers

HTTP headers used by Functions.

[](/products/functions/reference/parameters-responses/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Parameters and Responses

Functions receive two parameters, event and context, and should return a single value.

[](/products/functions/reference/project-configuration/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Project Configuration YAML File

The `project.yml` file is a YAML configuration file in the root directory of a project which lets you define environment variables, parameters, and other properties for the project and the packages and functions within it.

[](/products/functions/reference/runtimes/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Supported Runtimes for DigitalOcean Functions

Reference information for supported Functions runtimes.

[](/products/functions/reference/build-process/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Build Process

The Functions service performs a build process to transform your project’s source code into executable functions. Though much of the build runs in your own build scripts, there are other details about the Functions build process that are useful to understand and configure.

In this article...

*   [The DigitalOcean API](#the-digitalocean-api)
*   [The DigitalOcean Command Line Client, doctl](#the-digitalocean-command-line-client-doctl)
*   [Other Reference Material](#other-reference-material)

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

Try using different keywords or simplifying your search