---
source: https://docs.digitalocean.com/products/functions/how-to/schedule-functions/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/how-to/schedule-functions/
domain: docs.digitalocean.com
---
                How to Schedule Functions | DigitalOcean Documentation

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
*   Schedule Functions

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Schedule Functionsprivate

Validated on 23 May 2022 • Last edited on 9 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

To run functions on a schedule, you can create a function trigger and then specify a schedule using standard [cron syntax](#cron-syntax). Each trigger is attached to a single function, but functions can have multiple triggers with different schedules and payloads.

## Create a Scheduled Trigger[](#create-a-scheduled-trigger)

You can create triggers in the control panel or by updating your project’s `project.yml` file and deploying the changes with `doctl serverless deploy`.

 Command Line

If you have already [deployed your function](/products/functions/how-to/create-functions/) from the command line using `doctl serverless deploy`, you can create your scheduled trigger in `project.yml` and redeploy.

Note

To use `doctl` to deploy and manage triggers, you must have `doctl` version `1.82.0` or higher. Use `doctl version` to check your version.

First, navigate to the project directory containing the function you want to schedule. If you don’t have an existing project, see the [Functions Quickstart](/products/functions/getting-started/quickstart/) to get started.

Open the `project.yml` file in your text editor. A simplified version of the default `project.yml` from a Node.js project follows.

    packages:
      - name: sample
        functions:
          - name: hello
            binary: false
            runtime: 'nodejs:default'
            web: true

To create a scheduled trigger, add a `triggers:` key to the function definition:

    packages:
      - name: sample
        functions:
          - name: hello
            binary: false
            runtime: 'nodejs:default'
            web: true
            triggers:
              - name: trigger-hello
                sourceType: scheduler
                sourceDetails:
                  cron: "* * * * *"
                  withBody:
                    name: 'sammy'

Under `triggers` is a list of objects specifying triggers. Refer to the [triggers section of the `project.yml` reference](/products/functions/reference/project-configuration/#triggers) for details on the configuration options.

In this example, the above trigger configuration creates one trigger named `trigger-hello`, scheduled to run every minute (`* * * * *`). The trigger passes in a payload with the `name` parameter set to `sammy`.

Note

The example function has `web: true` set, which means it is a **Web Function** that responds to normal public HTTP requests. If you want your function to remain private and only be invoked by the trigger, set this to `false`.

Save the updated `project.yml` file, then deploy the changes:

    doctl serverless deploy .

Which returns the output:

    Deploying '/home/sammy/example-node'
      to namespace 'fn-378ae839-e58b-4cd1-afcf-632cd7b7b8db'
      on host 'https://faas-nyc1-2ef2e6cc.doserverless.co'
    
    Deployed functions ('doctl sbx fn get <funcName> --url' for URL):
      - sample/hello
    Deployed triggers:
      - trigger-hello

Notice the `Deployed triggers:` section. Your new trigger should be listed as deployed.

To check that your scheduled trigger is working, fetch the latest log entry from your function:

    doctl serverless activations logs --function "sample/hello"

You can also add `--limit` and specify a number to print multiple log entries at once.

    doctl serverless activations logs --function "sample/hello" --limit 10

A successful invocation of the `sample/hello` function, reflecting the payload set in `project.yml`, results in the following log entry:

    === 0870c85762594431b0c85762594431c2 (success) 10/06 12:34:51 hello:0.0.2
    2022-10-06T16:34:51.687835976Z stdout: Hello sammy!

For more information on developing, testing, and inspecting functions, see [How to Develop Functions](/products/functions/how-to/develop-functions/).

 Control Panel

To create a trigger for a function using the control panel, first navigate to the function. From the [main Functions page](https://cloud.digitalocean.com/functions) click the namespace containing the function, then click the function name.

Warning

Creating a trigger using the control panel interface for a function deployed on the command line using `doctl` could result in the trigger being overwritten or destroyed during subsequent runs of `doctl serverless deploy`.

This takes you to the function’s **Source** tab. Click the **Triggers** tab.

![screenshot of a function's Triggers tab with no triggers listed and a Create Trigger button](https://docs.digitalocean.com/screenshots/functions/function-triggers-tab-empty.f4edf0dc4150c9f77fb22253bdf6995cacc9760f81afdcdbe7b322145cd428e1.png)

If your function has no triggers, the page only has a placeholder image and a **Create Trigger** button. Click the button to start creating a new trigger. This pops up the **Create Trigger** dialog.

![screenshot of the Create Trigger dialog with textboxes for a name, a cron-like schedule string, and a JSON payload](https://docs.digitalocean.com/screenshots/functions/create-trigger-dialog.71e005d286765bfac5f74d75373abd4930923614795c47a291bd039be1a09cd9.png)

There are three fields to fill out. First, choose a name for your trigger.

Next, set the schedule using standard cron syntax. See the [cron Syntax](#cron-syntax) section for more details on formatting the schedule.

As you fill out the schedule, your input is automatically checked for errors and interpreted into plain language. Check the interpretation to ensure it matches your intended schedule.

Finally, you can optionally send parameters to the function as a JSON payload. Input any valid JSON object (or leave it empty `{}`), then press **Save** to create the scheduled trigger.

Note

If only the scheduled trigger invokes your function, we recommend disabling the **Web Function** feature in its settings to remove all public access to the function.

To check that your trigger is active and working as expected, navigate to the **Logs** tab of your function’s namespace. Inspect the activation records from your function to verify that the trigger is firing and the logs are correct.

## cron Syntax[](#cron-syntax)

The cron syntax used to schedule jobs on UNIX systems has become a standard method of specifying repeating task schedules. A cron schedule string consists of five fields: `minute`, `hour`, `day of the month`, `month`, and `day of the week`. A basic example looks like this:

    30 17 * * 2

This schedule triggers every Tuesday at 5:30 PM. The allowed values for each field are listed in the following table.

Field

Allowed Values

minute

`0-59`

hour

`0-23`

Day of the month

`1-31`

month

`1-12` or `JAN-DEC`

Day of the week

`0-6` or `SUN-SAT`

There are also a few special characters you can use to express more complex schedules:

*   `*`: The asterisk is a wildcard that represents “all”. A schedule of `* * * * *` runs every minute of every hour of every day of every month.
    
*   `,`: Commas allow you to list multiple values for a field. If you want to have a task run at the beginning and middle of every hour you could achieve this with `0,30 * * * *`.
    
*   `-`: A hyphen represents a range of values. `0-29 * * * *` triggers every minute in the first half of each hour.
    
*   `/`: You can use a forward slash after an asterisk to express a step value. For example, to run a command every three hours you could use `0 */3 * * *`.
    
    Note
    
    When expressing step values, you can only use integers that divide evenly into the range allowed by the field in question. For example, in the “hours” field, you can only follow a forward slash with `1`, `2`, `3`, `4`, `6`, `8`, or `12`.
    

### Example cron Schedules[](#example-cron-schedules)

Here are some more examples of the cron scheduling syntax:

*   `* * * * *` – Every minute
*   `12 * * * *` – 12 minutes after every hour
*   `0,15,30,45 * * * *` – Every 15 minutes
*   `*/15 * * * *` – Every 15 minutes
*   `0 4 * * *` – Every day at 4:00 AM
*   `0 4 * * 2-4` – Every Tuesday, Wednesday, and Thursday at 4:00 AM
*   `20,40 */8 * JUL-DEC *` – On the 20th and 40th minute of every 8th hour every day of the last 6 months of the year

## Limits[](#limits)

*   You can create a maximum of 3 triggers during private preview. There is no charge for creating scheduled triggers during private preview but this is subject to change. Function invocations are still billed normally. See [Functions Pricing](/products/functions/details/pricing/) for pricing and free allowance details.
*   Scheduled triggers are not yet available for function components deployed through App Platform.

In this article...

*   [Create a Scheduled Trigger](#create-a-scheduled-trigger)
*   [cron Syntax](#cron-syntax)
    *   [Example cron Schedules](#example-cron-schedules)
*   [Limits](#limits)

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

Try using different keyword