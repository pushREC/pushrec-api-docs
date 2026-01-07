---
source: https://docs.digitalocean.com/products/functions/how-to/structure-projects/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/how-to/structure-projects/
domain: docs.digitalocean.com
---
                How to Structure Projects | DigitalOcean Documentation

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

*   [How-Tos](/products/functions/how-to/) 
*   Structure Projects

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Structure Projects

Validated on 25 Apr 2023 • Last edited on 9 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

A Functions _project_ is a collection of resources including functions, configuration files, and library files, which are stored on your local computer or in a GitHub repository. Projects have a prescriptive structure that they must follow in order to deploy them to App Platform or a Functions namespace.

You can create a project manually, but we recommend the following ways to get started:

*   Use [`doctl serverless init <project-name>`](/reference/doctl/reference/serverless/init/) to initialize a project with a minimal set of files and example code.
    
*   Fork one of the [sample repositories](/products/functions/getting-started/sample-functions/) of our example projects.
    

## Project Structure[](#project-structure)

The project root can either be the root of a Git repository or a subdirectory in a [monorepo](/products/app-platform/how-to/deploy-from-monorepo/). This top-level project root must contain the following:

*   A project configuration file called `project.yml`. See [Project Configuration](/products/functions/reference/project-configuration/) for more details.
    
*   A directory named `packages` containing one or more packages. A _package_ is a collection of functions. Each package must have its own directory under `packages`.
    
    Each function must be in a package directory. Functions can be a single source code file or a directory with one or more source code files.
    

The `packages` directory can contain any number of packages, and each package can contain an arbitrary number of functions. This lets you organize your project in the way that makes the most sense to you.

The organization of packages determines the URL where functions are served. Functions components deployed to App Platform are served at a URL with the structure `app_url/component_route/package/function`.\\

The project can also contain a top-level `lib` directory, where files common to multiple packages can be stored or built. See [Build Process](/products/functions/reference/build-process/) for details on the build process and its use of the `lib` directory.

## Example Project Structures[](#example-project-structures)

Here is a minimal example of the structure of a project:

    example-project
    ├── project.yml
    └── packages
        └── example-package
            └── example-function.php

Here is an example structure for a project with two packages, `example-package-1` and `example-package-2`. `example-package-1` has three functions, and `example-package-2` has one.

    example-project
    ├── packages
    │   ├── example-package-1
    │   │   ├── example-function-a.php
    │   │   ├── example-function-b
    │   │   │   ├── package.json
    │   │   │   └── example.js
    │   │   └── example-function-c
    │   │       └── index.php
    │   └── example-package-2
    │       └── example-function
    │           ├── requirements.txt
    │           ├── __main__.py
    │           └── example.py
    └── project.yml

In this article...

*   [Project Structure](#project-structure)
*   [Example Project Structures](#example-project-structures)

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

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https://www.linkedin.com/company/digit