---
source: https://docs.digitalocean.com/products/functions/how-to/set-custom-cors-headers/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/how-to/set-custom-cors-headers/
domain: docs.digitalocean.com
---
                How to Set Custom CORS Headers | DigitalOcean Documentation

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
*   Set CORS Headers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Set Custom CORS Headers

Validated on 23 May 2022 • Last edited on 16 Dec 2025

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

By default, DigitalOcean Functions adds permissive CORS headers to every preflight `OPTIONS` request sent to a web action. You can customize your function’s CORS headers to limit which origins can call your API, constrain allowed methods and headers, and enable authenticated requests.

## Default CORS Behavior[](#default-cors-behavior)

If the incoming request includes the `Access-Control-Request-Headers` header, Functions echoes it back as `Access-Control-Allow-Headers`. Otherwise, it returns the default values shown in the following response:

    Access-Control-Allow-Origin: *
    Access-Control-Allow-Methods: OPTIONS, GET, DELETE, POST, PUT, HEAD, PATCH
    Access-Control-Allow-Headers: Authorization, Origin, X-Requested-With, Content-Type, Accept, User-Agent

## Enable Custom `OPTIONS` Responses[](#enable-custom-options-responses)

To enable manual handling of `OPTIONS` requests, set the `web` flag and the `web-custom-options: true` annotation in your `project.yml` file:

project.yml

    packages:
      - name: sample
        functions:
          - name: cors
            runtime: 'nodejs:18'
            web: true
            annotations:
              web-custom-options: true

Read [Project Configuration YAML File](/products/functions/reference/project-configuration/) for more information about `project.yml`.

Next, update your function to return custom CORS headers.

## Example Handler (Node.js)[](#example-handler-nodejs)

The following function returns custom CORS headers for preflight requests and a minimal body for other methods. Adapt the logic for [other runtimes](/products/functions/reference/runtimes/) as needed:

handler.js

    function main(event) {
      // Handle CORS preflight requests: browsers send OPTIONS
      // before cross-origin calls to check allowed methods/headers.
      if (event.method === 'options') {
        return {
          statusCode: 200,
          headers: {
            // Limit which origin can access this endpoint.
            'Access-Control-Allow-Origin': 'https://example.com',
            // Only allow specific HTTP methods for cross-origin calls.
            'Access-Control-Allow-Methods': 'OPTIONS, GET',
            // Only expose required request headers.
            'Access-Control-Allow-Headers': 'Authorization, Content-Type'
          }
        }
      }
    
      return {
        // Respond to non-OPTIONS requests with a simple body.
        body: 'ok',
        // Include a matching Allow-Origin on actual responses
        // so browsers permit the frontend to read this response.
        headers: { 'Access-Control-Allow-Origin': 'https://example.com' }
      }
    }
    
    exports.main = main

Update `https://example.com` to your own domain in the example above.

Keep the following in mind when customizing your CORS headers:

*   Return only the methods you intend to support in `Access-Control-Allow-Methods`.
*   Use a specific origin instead of `*` when you need credentialed requests.
*   Include only required headers in `Access-Control-Allow-Headers` to reduce attack surface.

See [How to Create Functions](/products/functions/how-to/create-functions/) for details on packaging and deploying functions.

In this article...

*   [Default CORS Behavior](#default-cors-behavior)
*   [Enable Custom `OPTIONS` Responses](#enable-custom-options-responses)
*   [Example Handler (Node.js)](#example-handler-nodejs)

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