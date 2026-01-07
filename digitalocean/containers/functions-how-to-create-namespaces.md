---
source: https://docs.digitalocean.com/products/functions/how-to/create-namespaces/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/how-to/create-namespaces/
domain: docs.digitalocean.com
---
                How to Create Namespaces to Organize DigitalOcean Functions | DigitalOcean Documentation

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
*   Create Namespaces

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create Namespaces to Organize DigitalOcean Functions

Validated on 23 May 2022 • Last edited on 9 Apr 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

Namespaces are a level of isolation and organization for functions and their settings. All functions and projects must be created in a namespace.

 Command Line

To create a new namespace, use the `create` subcommand of `doctl serverless namespaces`, passing in a namespace label (name) and datacenter region:

    doctl serverless namespaces create --label "example-namespace" --region "nyc1"

The namespace is created and automatically connected to:

    Connected to functions namespace 'fn-c92ea830-a657-43b0-96a2-9478ea730c44' on API host 'https://faas-nyc1-2ef2e6cc.doserverless.co'

The `--label` flag specifies a label (name) for the namespace. The `--region` flag indicates the region. For a list of valid regions, use the `list-regions` subcommand:

    doctl serverless namespaces list-regions

This command prints a list of regions:

    [ams ams3 blr blr1 fra fra1 lon lon1 nyc nyc1 sfo sfo3 sgp sgp1 tor tor1 syd1]

By default, `doctl` immediately connects to newly created namespaces. Use the `-n` or `--no-connect` flag to disable this.

 Control Panel

To create a namespace from the [DigitalOcean Control Panel](https://cloud.digitalocean.com), first click **Functions** in the left-hand menu to go to the [Functions page](https://cloud.digitalocean.com/functions).

If you have no namespaces, click the **Create Function Namespace** button to begin creating your first namespace. If you already have namespaces, click the **Create Namespace** button at the top of the **Namespaces** table.

Both links take you to the **Create a Function Namespace** page:

![The Create a Function Namespace page, with options for datacenter region and label](https://docs.digitalocean.com/screenshots/functions/create-namespace.bb4d9a3e7de8954a7b55d98bcc831668f436b6a6e645af1f20b8b9f53a888042.png)

Choose your datacenter region and namespace name, then click **Create Namespace**. When your new namespace is created, you’re taken to its overview page.

In this article...

[How to Create Namespaces to Organize DigitalOcean Functions](https://docs.digitalocean.com/products/functions/how-to/create-namespaces/)

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