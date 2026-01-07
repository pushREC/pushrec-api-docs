---
source: https://docs.digitalocean.com/products/functions/reference/activation-records/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/reference/activation-records/
domain: docs.digitalocean.com
---
                Activation Record JSON Structure | DigitalOcean Documentation

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
*   Activation Records

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Activation Record JSON Structure

Validated on 23 May 2022 • Last edited on 29 Aug 2023

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

Each asynchronous (or _non-blocking_) activation of a function creates an activation record, which you can retrieve to learn more about the process. Asynchronous activations are the default behavior when using the function’s authenticated REST API.

All web-based invocations are blocking and do not retain an activation record.

You can retrieve activation records from the command line using `doctl` or from the **Logs** tab of the Functions namespace in the control panel. See the [Inspect Logs section of How to Develop Functions](/products/functions/how-to/develop-functions/#inspect-logs) for more information.

## Activation Record Structure[](#activation-record-structure)

Activation records are a JSON object in the following structure:

    {
      "activationId": "c15d4bacedfa4bab9d4bacedfa2bcbec",
      "annotations": [
        {
          "key": "path",
          "value": "fn-feb132ee-706a-4f13-9c81-f24a3330260b/sample/hello"
        },
        {
          "key": "waitTime",
          "value": 80
        },
        {
          "key": "uuid",
          "value": "da25db4890885df62c1bfb6afdb4c91cb3b4bca5"
        },
        {
          "key": "entry",
          "value": "main"
        },
        {
          "key": "user_id",
          "value": "2559851"
        },
        {
          "key": "gbs",
          "value": 0.025
        },
        {
          "key": "kind",
          "value": "nodejs:14"
        },
        {
          "key": "timeout",
          "value": false
        },
        {
          "key": "limits",
          "value": {
            "concurrency": 1,
            "logs": 16,
            "memory": 256,
            "timeout": 3000
          }
        }
      ],
      "date": "2022-05-13 11:13:11",
      "duration": 5,
      "end": 1652454791582,
      "logs": [
        "2022-05-13T15:13:11.580825656Z stdout: Hello sammy"
      ],
      "name": "hello",
      "namespace": "fn-feb132ee-706a-4f13-9c81-f24a3330260b",
      "publish": false,
      "response": {
        "result": {
          "body": "Hello sammy"
        },
        "size": 27,
        "status": "success",
        "success": true
      },
      "start": 1652454791577,
      "subject": "da25db4890885df62c1bfb6afdb4c91cb3b4bca5",
      "version": "0.0.5"
    }

The output includes the following fields:

*   `activationId`: The activation ID
*   `annotations`: An array of key-value pairs that record metadata about the action activation
*   `namespace` and `name`: The namespace and function name
*   `start` and `end`: Timestamps recording the start and end of the activation. The values are in [UNIX time format](http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.html#tag_04_15)
*   `logs`: An array of strings with the logs that are produced by the action during its activation. Each array element corresponds to a line output to `stdout` or `stderr` by the action, and includes the time and stream of the log output. The structure is as follows: `TIMESTAMP` `STREAM:` `LOG LINE`
*   `response`: A dictionary that defines the following keys:
    *   `result`: A dictionary as a JSON object which contains the activation result. If the activation was successful, this contains the value that is returned by the action. If the activation was unsuccessful, `result` contains the `error` key, generally with an explanation of the failure.
    *   `success`: Is _true_ if and only if the status is _“success”_.
    *   `status`: The activation result, which might be one of the following values:
        *   `success`: the function invocation completed successfully
        *   `application error`: the function was invoked, but returned an error value on purpose, for instance because a precondition on the arguments was not met
        *   `action developer error`: the action was invoked, but it completed abnormally, for instance the action did not detect an exception, or a syntax error existed. This status code is also returned under specific conditions such as:
            *   the action failed to initialize for any reason
            *   the action exceeded its time limit during the init or run phase
            *   the action specified a wrong docker container name
            *   the action did not properly implement the expected runtime protocol

In this article...

*   [Activation Record Structure](#activation-record-structure)

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

Try using different keywords or simplifying your se