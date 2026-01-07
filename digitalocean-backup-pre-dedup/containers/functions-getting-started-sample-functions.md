---
source: https://docs.digitalocean.com/products/functions/getting-started/sample-functions/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/getting-started/sample-functions/
domain: docs.digitalocean.com
---
                Sample Functions | DigitalOcean Documentation

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

*   [Getting Started](/products/functions/getting-started/) 
*   Sample Functions

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Sample Functions

Validated on 23 May 2022 • Last edited on 17 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

These repositories contain sample functions that you can [deploy as components to App Platform](/products/app-platform/how-to/manage-functions/). Each repository contains the necessary `app-spec.yaml` for App Platform and the requisite [project structure](/products/functions/how-to/structure-projects/), including `project.yml`.

## Node.js Example Projects[](#nodejs-example-projects)

[](https://github.com/digitalocean/sample-functions-nodejs-helloworld)

![](https://docs.digitalocean.com/images/icons/default.svg)

JavaScript Hello, World!

This repository contains a project with a sample “Hello, World!” function written in Node.js JavaScript.

github.com

[](https://github.com/digitalocean/sample-functions-nodejs-qrcode)

![](https://docs.digitalocean.com/images/icons/default.svg)

QR Code Generator

This repository contains a project with a sample QR code generator function written in Node.js JavaScript.

github.com

## Python Example Projects[](#python-example-projects)

[](https://github.com/digitalocean/sample-functions-python-helloworld)

![](https://docs.digitalocean.com/images/icons/default.svg)

Python Hello, World!

This repository contains a project with a sample “Hello, World!” function written in Python.

github.com

[](https://github.com/digitalocean/sample-functions-python-jokes)

![](https://docs.digitalocean.com/images/icons/default.svg)

Jokes API

This repository contains a project with a sample API that returns jokes written in Python. It includes Pip requirements and a build script.

github.com

[](https://github.com/digitalocean/sample-functions-python-twilio-sms)

![](https://docs.digitalocean.com/images/icons/default.svg)

Twilio SMS API

This repository contains a project with a sample API that sends SMS messages using Twilio written in Python.

github.com

[](https://github.com/digitalocean/sample-functions-python-sendgrid-email)

![](https://docs.digitalocean.com/images/icons/default.svg)

SendGrid Emails API

This repository contains a project with a sample API that sends emails using SendGrid written in Python.

github.com

## PHP Example Projects[](#php-example-projects)

[](https://github.com/digitalocean/sample-functions-php-helloworld)

![](https://docs.digitalocean.com/images/icons/default.svg)

PHP Hello, World!

This repository contains a project with a sample “Hello, World!” function written in PHP.

github.com

[](https://github.com/digitalocean/sample-functions-php-numberstowords)

![](https://docs.digitalocean.com/images/icons/default.svg)

Numbers to Words API

This repository contains a project with a sample API that converts numerals to words written in PHP. It includes a required Composer library and a build script.

github.com

## Go Example Projects[](#go-example-projects)

[](https://github.com/digitalocean/sample-functions-golang-helloworld)

![](https://docs.digitalocean.com/images/icons/default.svg)

Go Hello, World!

This repository contains a project with a sample “Hello, World!” function written in Go.

github.com

[](https://github.com/digitalocean/sample-functions-mysql)

![](https://docs.digitalocean.com/images/icons/default.svg)

MySQL Database

This repository contains a project with a sample Go function that connects to a MySQL database.

github.com

[](https://github.com/digitalocean/sample-functions-golang-presigned-url)

![](https://docs.digitalocean.com/images/icons/default.svg)

Spaces Presigned URL API

This repository contains a project with a sample API that returns a presigned URL to upload or download a file to or from a DigitalOcean Space written in Go.

github.com

In this article...

*   [Node.js Example Projects](#nodejs-example-projects)
*   [Python Example Projects](#python-example-projects)
*   [PHP Example Projects](#php-example-projects)
*   [Go Example Projects](#go-example-projects)

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

Try using different keywords or simplifyi