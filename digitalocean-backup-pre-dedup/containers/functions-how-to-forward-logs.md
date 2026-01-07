---
source: https://docs.digitalocean.com/products/functions/how-to/forward-logs/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/how-to/forward-logs/
domain: docs.digitalocean.com
---
                How to Forward Logs | DigitalOcean Documentation

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
*   Forward Logs

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Forward Logs

Validated on 20 Dec 2022 • Last edited on 9 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

You can configure functions to forward console and error logs from the function to a third-party logging service. Functions supports Papertrail, Datadog, and Logtail.

To configure your function to ship logs to a third party, you need to define a `LOG_DESTINATIONS` environment variable for it. This environment variable goes in your `project.yml` file and contains a JSON string with details on the log forwarding destination.

The JSON string is a JSON version of the `log_destinations` field of App Platform’s [App Spec](/products/app-platform/reference/app-spec/) YAML file. You may use the [App Spec reference](/products/app-platform/reference/app-spec/) for more details on the configuration required.

Note

In App Platform, you configure Papertrail using a syslog endpoint. Functions requires an HTTP source token when using Papertrail.

## Examples[](#examples)

The following examples show how to configure the `LOG_DESTINATIONS` environment variable in your `project.yml` file. The `LOG_DESTINATIONS` line belongs under an `environment:` key at whichever scope is appropriate for your situation: project, package, or function. See the [`project.yml` reference](/products/functions/reference/project-configuration/) for more information about scopes and setting environment variables.

### Papertrail[](#papertrail)

For Papertrail, create a log destination that accepts token-based authentication over HTTPS. This setting is under the **Accept connections via…** heading on [Papertrail’s Create Log Destination page](https://papertrailapp.com/destinations/new). Refer to [Papertrail’s log destinations documentation](https://www.papertrail.com/help/log-destinations/) for more details.

Use the provided token in your configuration:

    LOG_DESTINATIONS:'[{"papertrail":{"token":"<your-log-destination-token>"}}]'

### Datadog[](#datadog)

For Datadog, the configuration requires an endpoint URL and an API key:

    LOG_DESTINATIONS:'[{"datadog":{"endpoint":"https://http-intake.logs.datadoghq.com","api_key":"<your-api-key>"}}]'

### Logtail[](#logtail)

For Logtail, [create an HTTP source](https://docs.logtail.com/integrations/rest-api) and use the resulting token for the configuration:

    LOG_DESTINATIONS:'[{"logtail":{"token":"<your-http-source-token>"}}]'

### Multiple Destinations[](#multiple-destinations)

The `LOG_DESTINATIONS` JSON structure is a list, so you can configure multiple log destinations:

    LOG_DESTINATIONS:'[{"papertrail":{"token":"<your-http-source-token>"}},{"logtail":{"token":"<your-http-source-token>"}}]'

In this article...

*   [Examples](#examples)
    *   [Papertrail](#papertrail)
    *   [Datadog](#datadog)
    *   [Logtail](#logtail)
    *   [Multiple Destinations](#multiple-destinations)

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