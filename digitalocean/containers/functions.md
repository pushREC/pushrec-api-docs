---
source: https://docs.digitalocean.com/products/functions/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/
domain: docs.digitalocean.com
---
                Functions | DigitalOcean Documentation

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

*   Functions

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Functions

Generated on 6 Jan 2026

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

Most Viewed Functions Articles

1.  [Project Configuration YAML File](/products/functions/reference/project-configuration/)
2.  [How to Schedule Functions](/products/functions/how-to/schedule-functions/ "Schedule functions to run periodically.")
3.  [Functions Python Runtime](/products/functions/reference/runtimes/python/ "Details on developing Functions using Python.")
4.  [How to Configure Functions](/products/functions/how-to/configure-functions/ "Configure the resource limits, runtime, and environment of your DigitalOcean Functions.")
5.  [Sample Functions](/products/functions/getting-started/sample-functions/ "Use our example repositories with sample projects and functions to get started quickly with DigitalOcean Functions.")
6.  [Build Process](/products/functions/reference/build-process/)
7.  [How to Develop Functions](/products/functions/how-to/develop-functions/ "Improve your serverless development with this guidance on invoking, iterating on, and observing DigitalOcean Functions.")
8.  [How to Create Functions](/products/functions/how-to/create-functions/ "Create and deploy a function using the command line or control panel.")
9.  [Functions Quickstart](/products/functions/getting-started/quickstart/ "Just the essentials to go from zero to working in a few minutes.")
10.  [Functions Limits](/products/functions/details/limits/ "Limits and known issues for DigitalOcean Functions.")

[](/products/functions/getting-started/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/functions/how-to/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/functions/reference/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Reference

CLI documentation for functions, including example requests and available parameters, and other reference information like project YAML configuration and activation records.

[](/products/functions/concepts/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Concepts

Explanations and definitions of core concepts in Functions.

[](/products/functions/details/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

## Latest Updates[](#latest-updates)

### 2 September 2025[](#2-september-2025)

*   The Functions Python 3.11 runtime now includes the `daft`, `duckdb`, `polars`, `pyiceberg`, and `pyspark` packages. Visit the [Python 3.11 runtime documentation](/products/functions/reference/runtimes/python/#python-311-runtime) for more information.
    

### 28 August 2023[](#28-august-2023)

*   All Functions API calls now require read-write tokens, even if they are for read-only actions. See the [Functions section of the DigitalOcean API reference](/reference/api/digitalocean/#tag/Functions) for more details.
    

### 26 April 2023[](#26-april-2023)

*   DigitalOcean Functions now supports functions written in Go 1.20, PHP 8.2, and Python 3.11.
    
    Visit the [Functions documentation](/products/functions/) to learn more about which runtimes are available.
    

For more information, see [all Functions release notes](https://docs.digitalocean.com/release-notes/functions/).

In this article...

[Functions](https://docs.digitalocean.com/products/functions/)

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