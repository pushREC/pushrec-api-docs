---
source: https://docs.digitalocean.com/products/functions/how-to/create-functions/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/how-to/create-functions/
domain: docs.digitalocean.com
---
                How to Create Functions | DigitalOcean Documentation

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
*   Create Functions

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create Functions

Validated on 23 May 2022 • Last edited on 9 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

You can create a basic function directly in the control panel for experimentation, but for continuous development of production-ready functions we recommend our command-line workflow.

 Command Line

To create functions from the command line, first make sure you have the latest version of `doctl` installed, authorized to access your DigitalOcean account, and set up with the `serverless` extension:

[](/reference/doctl/how-to/install/)

![](https://docs.digitalocean.com/images/icons/default.svg)

How to Install and Configure doctl

Install and configure doctl, the official DigitalOcean command-line client (CLI).

## Create or Connect To a Namespace[](#create-or-connect-to-a-namespace)

To work with DigitalOcean Functions on the command line, you first connect `doctl` to a Functions namespace. Namespaces isolate and organize functions and their settings.

If you already have a Functions namespace set up, connect to it with the `doctl serverless connect` command. If not, [create a namespace](/products/functions/how-to/create-namespaces/).

After you connect or create a namespace, you see a connection status message listing the namespace ID and API host:

    Connected to functions namespace 'fn-ef552165-54d2-4656-b6b1-7dedc370591a' on API host 'https://faas-nyc1-2ef2e6cc.doserverless.co'

You’re now ready to create functions and deploy them to the namespace.

## Initialize a Sample Function[](#initialize-a-sample-function)

To help you get started developing a function, `doctl` can initialize a [properly structured project directory](/products/functions/how-to/structure-projects/) with sample configuration files and function code.

On your local machine, from the directory where you want to create your project and write your functions, use the `serverless init` subcommand to initialize a sample project.

The `doctl serverless init` command creates a directory with sample code and configuration. The `-l` or `--language` flag specifies which programming language the sample project should use. You can see the available languages in the [supported runtimes documentation](/products/functions/reference/runtimes/) or by running `doctl serverless status --languages`.

On your local machine, from the directory where you want to create your project and write your functions, use the `serverless init` subcommand to initialize a sample project. This command creates a JavaScript project called `example-project`, but you can choose a different runtime and project name:

    doctl serverless init --language js example-project

The output confirms that the project was initialized:

    A local functions project directory 'example-project' was created for you.

Once initialized, the project directory contains a [`project.yml` configuration file](/products/functions/reference/project-configuration/) in it, a `packages` directory containing the `sample` package, a `hello` function directory, and the sample “Hello world” function code:

    example-project/
    ├── packages
    │   └── sample
    │       └── hello
    │           └── hello.js
    └── project.yml

Once you create a project with at least one function, you can deploy it to the current namespace to run and test it.

## Deploy a Function in the Current Namespace[](#deploy-a-function-in-the-current-namespace)

The development namespace is a single namespace designed for testing functions before [deploying them to App Platform](/products/app-platform/how-to/manage-functions/).

The `doctl serverless deploy` command deploys code to the development namespace. The command takes one argument: a path to the project directory you created.

Run the deploy command, substituting your own project name for `example-project`:

    doctl serverless deploy example-project

The command outputs information about the deployment:

    Deploying '/home/sammy/example-project'
      to namespace 'fn-feb132ee-706a-4f13-9c81-f24a3330260b'
      on host 'https://faas-nyc1-78edc.doserverless.co'
    Deployment status recorded in '.deployed'
    
    Deployed functions ('doctl sbx fn get <funcName> --url' for URL):
      - sample/hello

The function is now deployed as `sample/hello`.

 Control Panel

## Create or Connect To a Namespace[](#create-or-connect-to-a-namespace)

You can create single-file functions in the control panel using your browser. The DigitalOcean Functions source editor in the control panel is meant to support experimentation and testing for single-file functions without using the command line.

To get started, from the [DigitalOcean Control Panel](https://cloud.digitalocean.com), click **Functions** in the left menu to go to the [Functions page](https://cloud.digitalocean.com/functions).

Next, click the namespace you’d like to add a function to, or click the **Create Function Namespace** button to create a new namespace.

This takes you to the namespace’s **Overview** page, which lists any functions that you already have in the namespace.

![The overview tab of a Functions namespace with two example functions listed.](https://docs.digitalocean.com/screenshots/functions/overview-tab.70e23368019e518387d750d2c30b34a71f212aa3f82bd5b2694145dc991e040c.png)

To create a new function, click the **Actions** button in the top right. In the menu that opens, click **Create Function** to open the **New Function** window.

![The New Function window with runtime, function name, and optional package name fields.](https://docs.digitalocean.com/screenshots/functions/new-function-window.6063351efee3dccabc075f259ed8adb5080062eea26c6c037af625ff848e5b90.png)

In this window, fill out the following fields:

*   **Runtime**. This is the runtime environment for your function, like Python or Node.js.
    
*   **Function name**. This is name of your function, which determines how it appears in the control panel and the URL at which you can access the function.
    
*   Optionally, **Package Name**. Packages are an optional way to organize functions within a namespace. The package also determines the URL at which you can access the function.
    

After you fill in the fields, click **Create**. This brings you to the **Source** tab for the new function, where you can edit the source code of the function, change the input to the function, and run the function to see the output and logs.

To start, the source code of new functions in the control panel interface contain a basic “Hello, World!” example.

## Iterative Development and Deployment[](#iterative-development-and-deployment)

Once you’ve created a function locally and deployed it to a namespace, you can test and iterate:

[](/products/functions/how-to/develop-functions/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Develop Functions

Improve your serverless development with this guidance on invoking, iterating on, and observing DigitalOcean Functions.

In this article...

*   [Iterative Development and Deployment](#iterative-development-and-deployment)

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
