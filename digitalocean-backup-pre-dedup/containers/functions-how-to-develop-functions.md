---
source: https://docs.digitalocean.com/products/functions/how-to/develop-functions/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/how-to/develop-functions/
domain: docs.digitalocean.com
---
                How to Develop Functions | DigitalOcean Documentation

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
*   Develop Functions

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Develop Functions

Validated on 23 May 2022 • Last edited on 9 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

The development workflow of DigitalOcean Functions is based on the command line, so first, [install `doctl`](/reference/doctl/how-to/install/), the official DigitalOcean Command-Line Interface (CLI).

To get started, [create a function using the command line](/products/functions/how-to/create-functions/) to initialize a sample project directory on your local machine and deploy it to the cloud. The recommendations in this article can help you during your workflow for creating and testing functions.

## List Deployed Functions[](#list-deployed-functions)

Use `doctl` to list the functions you have deployed to the current namespace:

    doctl serverless functions list

Here is example output:

     Datetime        Access   Kind      Version  Actions                                           
     ─────────────── ──────── ───────── ──────── ───────────────────────────────────────────────── 
     05/10 13:56:34  web      nodejs:14 0.0.1    sample/hello  

This example lists a single Node.js function deployed called `sample/hello`.

## Invoke a Function[](#invoke-a-function)

After your function is deployed, you can invoke it from the command line using `doctl` or `curl`. You can also invoke it from the DigitalOcean Control Panel in your browser. We recommend using `doctl`.

 Using doctl

To invoke your function using `doctl`, use the `serverless functions invoke` subcommand, replacing `sample/hello` with the name of your function:

    doctl serverless functions invoke sample/hello

The function returns the response body in a JSON object:

    {
      "body": "Hello stranger!"
    }

Adding the `--full` flag to `doctl serverless functions invoke` returns a full activation record, which includes more information about the invocation such as the duration of execution, runtime, response status, and logs. Learn more in the [activation records reference](/products/functions/reference/activation-records/).

### Invoke a Function with Parameters[](#invoke-a-function-with-parameters)

To set parameters when invoking a function, use the `-p` or `--param` flag and give it a `key:value` pair.

    doctl serverless functions invoke sample/hello --param name:sammy

    {
      "body": "Hello sammy!"
    }

You can use multiple `-p` or `--param` flags to pass more than one `key:value` pair:

    doctl serverless functions invoke sample/hello -p name:sammy -p age:10

You can also format multiple parameters as a single, comma-separated list:

    doctl serverless functions invoke sample/hello -p name:sammy,age:10

You can also pass in parameters from a JSON file using the `-P` or `--param-file` flags.

 Using curl

The `curl` command is a common tool for making web requests. All the functions you deploy have a public URL where you can invoke them with `curl`.

Use the `functions get` subcommand to find the URL of your function, replacing `sample/hello` with the name of your function:

    doctl serverless functions get sample/hello --url

This command returns a URL similar to the following:

    https://faas-nyc1-78edc.doserverless.co/api/v1/web/fn-EXAMPLE-706a-4f13-9c81-f24a3330260b/sample/hello

Use the bare `curl` command with your URL to fetch a response:

    curl https://faas-nyc1-78edc.doserverless.co/api/v1/web/fn-EXAMPLE-706a-4f13-9c81-f24a3330260b/sample/hello

This returns the response body:

    Hello stranger!

### Invoke a Function with Parameters[](#invoke-a-function-with-parameters)

You can add parameters to a `curl` request using the `-d` flag:

    curl https://faas-nyc1-78edc.doserverless.co/api/v1/web/fn-feb132ee-706a-4f13-9c81-f24a3330260b/sample/hello \
      -d 'name=sammy'

You can send multiple parameters using multiple `-d` flags.

You can also send parameters as JSON using the same flag, but you must also send the appropriate `Content-Type` header:

    curl https://faas-nyc1-78edc.doserverless.co/api/v1/web/fn-feb132ee-706a-4f13-9c81-f24a3330260b/sample/hello \
      -d '{"name":"sammy"}' \
      -H 'Content-Type: application/json'

 Using the control panel

The Functions control panel interface has a basic text editor for single-file functions and the ability to run functions, pass in parameters, and view output and logs.

To invoke a function in the control panel, click **Functions** in the left menu, then click a namespace to go to its **Overview** page.

![The overview tab of the a namespace with two example functions listed.](https://docs.digitalocean.com/screenshots/functions/overview-tab.70e23368019e518387d750d2c30b34a71f212aa3f82bd5b2694145dc991e040c.png)

Then, click the name of the function you want to invoke to go to its **Source** tab.

![The Source tab of a sample/hello function and the Output and Logs areas.](https://docs.digitalocean.com/screenshots/functions/source-tab-w-output.8b65e4261114469bffbf11d437f60bd44a773fc58bfb3e8616a7244fe6811ab4.png)

To invoke the function, press the green **Run** button. The function runs and prints output and logs:

![The Source tab Output and Logs interface showing 'Hello stranger' output and a timestamped log line](https://docs.digitalocean.com/screenshots/functions/source-tab-run-output.e6f5d0b446ac93b59b086d2d6b955182828138586351fa7c82ffc5b7bd66998f.png)

The output of the function matches the content type. For example, if your function returns an image, the output section displays the image.

### Invoke a Function with Parameters[](#invoke-a-function-with-parameters)

To send parameters to your function, click the **Parameters** button next to the green **Run** button to open the **Change Function Input** window.

![The function parameter input dialog textbox with JSON text defining name equals sammy.](https://docs.digitalocean.com/screenshots/functions/source-tab-parameter-input.ace6a82dde188851ea5d2cc61f9fe3d1d5716a83d59f3d017850a40e09809121.png)

Enter parameters as JSON-formatted text. If your JSON has formatting errors, the lines with issues have red highlights in right-hand margin and the problematic characters are be underlined with red squiggles.

Once your input has no formatting errors, click **Save** to save the new input.

Click **Run** again to see the output and logs for your function given the new input parameters.

## Automatically Re-deploy Functions while Developing[](#automatically-re-deploy-functions-while-developing)

While developing functions, having a development server watching for code changes can help automate build steps and speed up iteration. To watch a functions project directory and automatically re-deploy changes, use the `serverless watch` subcommand, replacing `example-project` with the path to the root of your project directory.

    doctl serverless watch example-project

The command prints `Watching` and waits to detect changes in the directory.

    Watching 'example-project' [use Control-C to terminate]

When you edit and save your function’s code, the `watch` command automatically redeploys your changes with an explanation:

    Deploying 'example-project' due to change in 'packages/sample/hello.js'

To stop the `watch` command, enter `CTRL+C` in the terminal.

## Inspect Logs[](#inspect-logs)

For asynchronous (or _non-blocking_) invocations only, any text your function sends to `STDOUT` is logged as part of an activation record. Function invocations through the authenticated REST API are non-blocking by default.

You can inspect logs from the command line with `doctl` or in the control panel. Each activation record also contains additional structured information about the function’s activation. See the [activation records reference](/products/functions/reference/activation-records/) for more information.

 Using doctl

To retrieve logs from the most recent function activation, use the `serverless activations logs` subcommand. The default `--limit` is 1, but this example uses `--limit 3` to show the last three activations:

    doctl serverless activations logs --limit 3

This returns a header with the activation ID, status, date and time, and function version information, followed by the actual logged output:

    === 49aa4a2bd3834635aa4a2bd383f63514 (success) 05/12 15:55:21 hello:0.0.3
    2022-05-12T19:55:21.532898871Z stdout: Hello sammy
    === 918883de63b7403f8883de63b7a03f14 (success) 05/12 15:55:37 hello:0.0.3
    2022-05-12T19:55:37.646627522Z stdout: Hello sammy
    === d4e9d0de96c3461aa9d0de96c3e61aa1 (success) 05/13 11:03:06 hello:0.0.5
    2022-05-13T15:03:06.910748257Z stdout: Hello sammy

Add the `--follow` flag to follow the logs as they are generated (like `tail -f`). You can also filter down to a specific function or package by using the `--function` or `--package` flags.

This example tails logs for the `sample/hello` function:

    doctl serverless activations logs --follow --function sample/hello

enter `CTRL+C` to stop continuously following the logs and return to your command prompt.

### Retrieve Full Activation Records[](#retrieve-full-activation-records)

Using the activation ID from the log output, you can retrieve the full activation record for more information:

    doctl serverless activations get EXAMPLEdaf34232747f4c7ab34232747f

This returns the full JSON object for an activation, which includes logs, response status, response body, and other details that may be useful for debugging. Learn more in the [activation records reference](/products/functions/reference/activation-records/).

 Using the control panel

You can inspect function activation records and logs in the **Logs** tab of the current namespace:

![The Logs tab of a Functions namespace showing drop-down selectors for 'Select Function' and 'Select Period', as well as a table of function activation logs.](https://docs.digitalocean.com/screenshots/functions/logs-tab.99d0f9ead94c6215b1af08f366680499a7548e5fe1f6c1a3c60f8c30dbbfa662.png)

Use the **Select Function** drop-down to filter the records by a package name or a single function name. Use the **Select Period** drop-down to filter the records by time period.

To view more details about an activation, including logged `STDOUT` text, click the **+** disclosure button on the left side of the record:

![A detail view of a single activation record in the Logs tab, showing a portion of the JSON structure of an activation record.](https://docs.digitalocean.com/screenshots/functions/logs-tab-activation-record.9a856d4746871d030c84709e0f1e8ec1d80e80aaea6626a43983056da1c0eb4c.png)

This displays the complete JSON activation record. The logged `STDOUT` text is available under `logs` in the top level of the object. Learn more in the [activation records reference](/products/functions/reference/activation-records/).

## Deploy to Production[](#deploy-to-production)

The functions deployed to your Functions namespaces are production-ready, though we recommend that you additionally implement common DevOps patterns of versioning, continuous deployment, and rollback.

For a more managed production deployment, you can create a GitHub repository and deploy your functions as an [App Platform](https://docs.digitalocean.com/products/app-platform/) component.

[](/products/functions/how-to/deploy-to-app-platform/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

How to Deploy Functions to App Platform

Use App Platform to deploy your Functions as a component of a production app.

In this article...

*   [List Deployed Functions](#list-deployed-functions)
*   [Invoke a Function](#invoke-a-function)
*   [Automatically Re-deploy Functions while Developing](#automatically-re-deploy-functions-while-developing)
*   [Inspect Logs](#inspect-logs)
*   [Deploy to Production](#deploy-to-production)

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

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https: