---
source: https://docs.digitalocean.com/products/functions/reference/project-configuration/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/reference/project-configuration/
domain: docs.digitalocean.com
---
                Project Configuration YAML File | DigitalOcean Documentation

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

*   [Reference](/products/functions/reference/) 
*   Project Configuration

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Project Configuration YAML File

Validated on 23 May 2022 • Last edited on 17 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

The `project.yml` file is a YAML configuration file in the root directory of a project which lets you define environment variables, parameters, and other properties for the project and the packages and functions within it.

The structure of the information in `project.yml` is aligned with the [structure of the project](/products/functions/how-to/structure-projects/). Using this structure, you can scope the properties you define in `project.yml` to one of three different levels:

*   Scoped to the _project_, which is the top-level collection of resources, including at least one package
*   Scoped to a _package_, which is a collection of functions
*   Scoped to individual _functions_, which may be called _actions_ in the configuration file.

Additionally, the build process for `project.yml` uses a [templating](#templating) syntax which supports including variables from local `.env` files or [App Platform environment variables](/products/app-platform/how-to/use-environment-variables/).

## Properties[](#properties)

### Parameters[](#parameters)

Parameters are passed into function invocations alongside query or POST parameters from the HTTP request.

*   **Scope**: Projects, packages, and functions.
    
*   **Valid values**: Any structure that converts to valid JSON, including nested lists and objects.
    

This `parameters` example defines two parameters: `param1`, which has a single value, and `param2`, which is a list of two values:

    parameters:
      param1: <value>
      param2: 
        - <value>
        - <value>

### Environment[](#environment)

Environment values defined in the configuration are added as the environment variables of the process that runs the function.

*   **Scope**: Projects, packages, and functions.
    
*   **Valid values**: Must be a string.
    

You can statically define environment variables in the `project.yml` file, as in this example:

    environment:
      env1: <value>
      env2: <value>

You can also [template](#templating) environment variables from an `.env` file in the project filesystem or from App Platform’s environment variable configuration.

### Main[](#main)

The `main` parameter defines the entry point for a function.

*   **Scope**: Functions.
    
*   **Valid values**: Must be a string.
    

    packages:
      - name: <package-name>
        functions:
          - name: <function-name>
            main: <main-entry-point>

If you don’t specify a `main` for a function, the build process tries to detect the correct entry point.

### Runtime[](#runtime)

The `runtime` parameter specifies the runtime package used by the function.

*   **Scope**: Functions.
    
*   **Valid values**: Any [supported runtime](/products/functions/reference/runtimes/). You can use the value `default` in place of the runtime version (for example, `go:default` instead of `go:1.15`).
    

    packages:
      - name: <package-name>
        functions:
          - name: <function-name>
            runtime: <runtime>

If you do not specify a `runtime`, the build process tries to detect it.

### Limits[](#limits)

The `limits` parameter lets you override the function’s default limits for timeout time, memory allocation, and total log size.

*   **Scope**: Functions.
    
*   **Valid fields and values**: An object with at least one field.
    
    *   `timeout`: Timeout time in milliseconds.
    *   `memory`: Memory allocation in megabytes.
    *   `logs`: Total log size in kilobytes.

    packages:
    - name: <package-name>
      functions:
        - name: <function-name>
          limits:
            timeout: <milliseconds>
            memory: <megabytes>
            logs: <kilobytes>

### Triggers[](#triggers)

The `triggers` parameter lets you create scheduled function triggers.

*   **Scope**: Functions.
    
*   **Valid fields and values**:
    
    *   `name`: A name for the trigger.
    *   `sourceType`: Currently only the `scheduler` type of trigger is supported.
    *   `sourceDetails`
        *   `cron`: A string using cron syntax to set the trigger schedule.
        *   `withBody`: Optional. An object to be passed as input to the function via POST.

    packages:
    - name: <package-name>
      functions:
        - name: <function-name>
          triggers:
          - name: <trigger-name>
            sourceType: scheduler
            sourceDetails: 
              cron: <string>
              withBody:  <object>

### Web[](#web)

The `web` parameter lets you create a _web function_, meaning you can access it using normal HTTP methods outside of the authenticated REST API. You can also set your web function to receive the request body as raw `base64`\-encoded text by using `web: raw`. To secure your web function, use [the `webSecure` parameter](#websecure).

*   **Scope**: Functions.
    
*   **Valid values**: Either `true`, `false`, or `raw`. A `true` value enables web access to the function, and `false` disables access. A `raw` value enables web access and also passes in request bodies as raw, `base64`\-encoded text. If you omit the `web` parameter entirely, it defaults to `true`.
    

    packages:
    - name: <package-name>
      functions:
        - name: <function-name>
          web: true

### WebSecure[](#websecure)

The `webSecure` parameter enables authentication for web functions and sets the secret token to the given value. You must provide the secret during HTTP requests by using the `X-Require-Whisk-Auth: <secret-token>` header.

*   **Scope**: Functions.
    
*   **Valid values**: Any string.
    

    packages:
    - name: <package-name>
      functions:
        - name: <function-name>
          web: true
          webSecure: <secret-token>

## Templating[](#templating)

You can template variables in `project.yml` from local `.env` files or [App Platform environment variables](/products/app-platform/how-to/use-environment-variables/). This is especially useful in combination with App Platform’s encrypted variables for secret storage.

You can substitute in variables from the runtime environment using the format `"${SYMBOL}"`, where `SYMBOL` is the name of the variable specified in App Platform. We recommend using quotes around the variable substitution to ensure proper parsing.

## Examples[](#examples)

### Basic[](#basic)

Here is a simplified example of a `project.yml` file:

Example `project.yml`

    parameters: # project scope
        param1: value
    environment:
        env1: value
    packages:
      - name: package1
        parameters: # package scope
        environment:
        functions:
          - name: function1
            parameters: # function scope
            environment:
            limits: 
            runtime: 'nodejs:default'
            main: ''

This example defines a single package, `package1`, and a single function within it, `function1`, which uses the `nodejs:default` runtime. This example also defines one parameter, `param1,` and one environment variable, `env1`, at the package scope.

### With Templating[](#with-templating)

The following simplified YAML example includes some templated variables:

Example `project.yml` with templated variables

    environment:
      # ENV is statically defined as "production" in this example:
      ENV: production
    packages:
      - name: store
        environment:
          # DATABASE_URL will be substituted to the DATABASE_URL_READ_ONLY value
          # defined in App Platform's environment variable configuration. 
          # NOTE: The receiving variable name does not need to match the name as
          # defined in the app / component config. This facilitates narrowly
          # scoped or overlapping values.
          DATABASE_URL: "${DATABASE_URL_READ_ONLY}"
        functions:
          - name: buy 
            environment:
              # PAYMENT_API_KEY will substitute the PAYMENT_API_KEY variable
              # from App Platform's runtime variable configuration.
              PAYMENT_API_KEY: "${PAYMENT_API_KEY}"
              # DATABASE_URL will be substituted with the DATABASE_URL_WRITE 
              # value defined in App Platform's environment variable config.
              DATABASE_URL: "${DATABASE_URL_WRITE}"

By default, the `doctl serverless deploy` command looks for an `.env` file in the same directory as the `project.yml` file. You can also add an `--env <path to .env-formatted file>` flag to specify an alternate file name and location anywhere on the filesystem.

## Learn More[](#learn-more)

[](/products/functions/how-to/structure-projects/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Structure Projects

Projects contain functions that are grouped into packages and configured by a project.yml file.

[](/products/app-platform/how-to/use-environment-variables/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

How to Use Environment Variables in App Platform

Use and encrypt environment variables in App Platform.

[](/products/app-platform/how-to/manage-functions/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

How to Manage Functions in App Platform

Create and configure functions in App Platform. Functions are blocks of code that run on demand without the need to manage any infrastructure.

In this article...

*   [Properties](#properties)
    *   [Parameters](#parameters)
    *   [Environment](#environment)
    *   [Main](#main)
    *   [Runtime](#runtime)
    *   [Limits](#limits)
    *   [Triggers](#triggers)
    *   [Web](#web)
    *   [WebSecure](#websecure)
*   [Templating](#templating)
*   [Examples](#examples)
    *   [Basic](#basic)
    *   [With Templating](#with-templating)
*   [Learn More](#learn-more)

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

Try using different keywords or simplifying your 