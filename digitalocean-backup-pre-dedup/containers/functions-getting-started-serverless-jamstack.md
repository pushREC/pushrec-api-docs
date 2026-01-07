---
source: https://docs.digitalocean.com/products/functions/getting-started/serverless-jamstack/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/functions/getting-started/serverless-jamstack/
domain: docs.digitalocean.com
---
                Create a Jamstack Site Using Serverless Functions | DigitalOcean Documentation

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
        *   [Deploy MongoDB](/products/functions/getting-started/serverless-jamstack/deploy-mongodb/)
        *   [Add Functions to App](/products/functions/getting-started/serverless-jamstack/add-functions/)
        *   [Connect Functions to Site](/products/functions/getting-started/serverless-jamstack/connect-functions-to-website/)
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
*   Serverless Jamstack Site

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Create a Jamstack Site Using Serverless Functions

Validated on 19 May 2022 • Last edited on 14 Aug 2024

Functions are blocks of code that run on demand without the need to manage any infrastructure. Develop on your local machine, test your code from the command line (using `doctl`), then deploy to a production namespace or App Platform — no servers required.

Serverless architecture is a way to build web applications and services without managing backend infrastructure. In a serverless architecture, cloud providers like DigitalOcean provision, manage, and scale the backend servers and components required to host applications so you can focus on writing and deploying code instead of maintaining the servers that host your applications.

DigitalOcean Functions allow you to deploy pieces of functionality that can perform the same tasks as a traditional API without the requirement of setting up a server to manage the requests. For example, you can write a traditional Node.js function that returns a list of products from a database and then deploy that function to the Functions service. Once deployed, users and applications can retrieve data from the database by making an HTTP request to the function’s URL.

Using serverless functions can make applications more lightweight and secure. Because you only pay for DigitalOcean Functions when a function runs, serverless architecture is often less expensive for apps with variable levels of traffic.

In this tutorial series, you deploy a Jamstack website that uses DigitalOcean Functions to retrieve and post data to a [MongoDB database cluster](/products/databases/mongodb/).

## What is Jamstack?[](#what-is-jamstack)

The “JAM” in Jamstack stands for JavaScript, APIs, and Markdown. [Jamstack applications](https://jamstack.org) use a combination of client-side JavaScript, third-party APIs, and static HTML to create a website that has the same robust functionality as a full-stack website but without the usual backend infrastructure to handle and process requests.

![Traditional versus Jamstack architecture](https://docs.digitalocean.com/screenshots/functions/jamstack-architecture.ed1df75551defd005747248d4c50871962b56baf00df113cdaa6fdf05f147e4a.png)

Serverless functions augment the Jamstack approach to web application development by providing a way to develop and deploy CRUD functionality without relying as heavily on third-party APIs to handle and process the application’s requests.

## About the Sample Application[](#about-the-sample-application)

The sample application in this tutorial is an e-commerce storefront with the following functionality:

*   On load, the application retrieves a list of available products (in this case, coffee beans) from a MongoDB database and renders the list on the HTML page.
    
*   The application then allows users to subscribe to an email list. This functionality posts the user’s email address to a separate collection in the MongoDB database.
    

The site uses [Bootstrap CSS](https://getbootstrap.com/docs/3.4/css) elements for its design and layout, the [Axios HTTP client](https://axios-http.com/docs/intro) to make requests to and from the MongoDB database, and a few vanilla JavaScript functions to enable the site’s functionality.

![Preview of completed site](https://docs.digitalocean.com/screenshots/functions/jamstack-tutorial_site-complete.bd4203b4901dbd9a7e1621919a11fac8f096a45a9381f82d368c8d96f370dce1.png)

## Start Tutorial[](#start-tutorial)

The series consists of three parts:

[](/products/functions/getting-started/serverless-jamstack/deploy-mongodb/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Serverless Jamstack, Part 1: Deploy a MongoDB Database

Deploy a static website and a MongoDB database as part of setting up a Jamstack-style app.

[](/products/functions/getting-started/serverless-jamstack/add-functions/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Serverless Jamstack, Part 2: Add Serverless Functions to App

Set up serverless functions and connect them to the database.

[](/products/functions/getting-started/serverless-jamstack/connect-functions-to-website/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Serverless Jamstack, Part 3: Connect Serverless Functions to Website

Connect the serverless functions to the static website, test the site’s functionality and redeploy the app.

In this article...

*   [What is Jamstack?](#what-is-jamstack)
*   [About the Sample Application](#about-the-sample-application)
*   [Start Tutorial](#start-tutorial)

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

Try using different keywords or simplifying