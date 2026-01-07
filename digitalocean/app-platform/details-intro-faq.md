---
source: https://docs.digitalocean.com/products/app-platform/details/intro-faq/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# An Introduction to App Platform

Validated on 16 Jun 2022 • Last edited on 24 Nov 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## What is App Platform?[](#what-is-app-platform)

App Platform is a Platform-as-a-Service (PaaS) offering that allows developers to continually publish web applications and static sites directly to DigitalOcean’s hosting servers without needing to set up any of the usual underlying infrastructure, such as servers and runtime environments.

You can connect App Platform directly to your application’s code repository and configure it to monitor your repo for changes, which it immediately deploys. App Platform then hosts the application at a public URL.

## How does App Platform work?[](#how-does-app-platform-work)

App Platform can deploy your [Dockerfiles](/products/app-platform/how-to/deploy-from-container-images/) or build image containers for your applications and deploy them.

If your app doesn’t use a Dockerfile, App Platform deploys your app by running the following steps:

1.  Reads the code in your app’s repository.
2.  Assesses the app’s language and dependencies (using [CNCF buildpacks](https://www.cncf.io)).
3.  Builds a container image for the app based on that assessment.
4.  Runs the container image with your app inside of it.
5.  Hosts the application or site at a public URL provided by DigitalOcean or a [domain that you provide](/products/app-platform/how-to/manage-domains/).

For example, if you have a NodeJS application that use the Axios and Mocha packages, App Platform automatically sets up NodeJS and installs those packages in a container image along with your app. App Platform then runs the container on a shared [DigitalOcean Kubernetes cluster](/products/kubernetes/) and makes it publicly accessible.

Additionally, if your application or site requires other elements like [databases](/products/app-platform/how-to/manage-databases/), [worker services](/products/app-platform/how-to/manage-services/), or [serverless functions](/products/app-platform/how-to/manage-functions/), you can add those components as needed to the app at any time.

The infrastructure of an app deployed to App Platform looks like this:

![App infrastructure diagram that displays an app in a Kubernetes cluster node, its DNS record stored on DigitalOcean DNS, and its TLS certificates stored in a CDN.](https://docs.digitalocean.com/screenshots/app-platform/infra-diagram_app.9cf59db2eda87b7582134267b38f45941646dd8a2534dfedefb3c6bcf7f446a7.png)

The infrastructure of a static site deployed to App Platform looks like this:

![App infrastructure diagram that displays a static site's files hosted on DigitalOcean Spaces, DNS records stored on DigitalOcean DNS, and its TLS certificates stored on a CDN.](https://docs.digitalocean.com/screenshots/app-platform/infra-diagram_static.c6a01dd05292ededd7009cebcedd5dcc5eadd5efdaaaf67ce2a828783fd17502.png)

## What are the use cases for App Platform?[](#what-are-the-use-cases-for-app-platform)

App Platform is ideal for developers who don’t want to manage and maintain their own servers when hosting a web app. You can deploy a broad variety of different web applications to App Platform, including [NodeJS](/products/app-platform/getting-started/sample-apps/node/), [Python](/products/app-platform/getting-started/sample-apps/python/), [Go](/products/app-platform/getting-started/sample-apps/go/), and [Ruby](/products/app-platform/getting-started/sample-apps/ruby/) apps. You can also deploy static websites such as [Jamstack-style sites](/products/functions/getting-started/serverless-jamstack/), plain HTML websites, and websites that use frameworks like [Hugo](/products/app-platform/getting-started/sample-apps/hugo/).

Some common use cases include:

*   Ruby on Rails apps that use:
    
    *   Web services to run a dynamic website or API.
    *   Workers to process delayed tasks (using `sidekiq`).
    *   MySQL/PostgreSQL as relational databases to power an app or API.
    *   Redis for queueing delayed tasks with `sidekiq`.
    *   Job (pre-deploy) to run migrations.
*   Django apps that use:
    
    *   Web services to run the main part of a website or app.
    *   Workers to process delayed tasks (with Celery).
    *   MySQL/PostgreSQL as a relational databases to power a website or API.
    *   Redis for queuing using Celery.
    *   Job (pre-deploy) to run migrations.
*   Static sites with dynamic behavior that use:
    
    *   Static site frameworks (NextJS, React, Hugo).
    *   Jamstack-style architecture.
    *   Serverless functions.

## What are components in App Platform?[](#what-are-components-in-app-platform)

Components are additional pieces of functionality hosted by DigitalOcean that you can configure and add to your app at anytime. Components include:

*   **[Services](/products/app-platform/how-to/manage-services/)** - Apps are services by default, but you can add additional services to support your web app, such as a second API. Services have internet-accessible endpoints. If you only need your app to access the service, you can create an internal service.
*   **[Workers](/products/app-platform/how-to/manage-workers/)** - While services are publicly accessible from the internet, background workers are not. They can contain any application code you like, but cannot be accessed from the internet. Some examples of background workers include applications that delete old logs, resize images in a [Space](/products/spaces/), or periodically write entries into a database.
*   **[Databases](/products/app-platform/how-to/manage-databases/)** - Repositories for your data. You can connect any DigitalOcean hosted database to your app, including MySQL, PostgreSQL, and MongoDB databases. We also offer a number of bindable environment variables that automatically contain sensitive information about your database. You can use these variables anywhere in your application’s code.
*   **[Jobs](/products/app-platform/how-to/manage-databases/)** - Any code that you would like to run at specific times. Currently, you can only schedule jobs to run pre- or post-deployment, not during deployment. You can also configure jobs to only run if a deployment fails or not.
*   **[Serverless Functions](/products/app-platform/how-to/manage-functions/)** - Blocks of code you can run without any self-managed infrastructure. Any serverless functions you build and deploy can be accessed from the web, and you are only billed for the time that the function is running. Functions can contain any functional piece of code and be used for such things as APIs for Jamstack style websites, basic web services that process images and upload them to storage services, or handlers that process web form data.

## What is the difference between using buildpacks and Dockerfiles to deploy an application?[](#what-is-the-difference-between-using-buildpacks-and-dockerfiles-to-deploy-an-application)

When you deploy your application to App Platform, you can deploy your app using either Cloud Native Buildpacks or Dockerfiles:

*   **Dockerfiles** - Custom container images that you provide that contain all of the utilities, system libraries, and configurations your application needs to run. Dockerfile images are immutable, meaning your application can only be updated by deploying a new version of the container image. If you want to use Dockerfiles to deploy your app to App Platform, you can store the image file in the root of your code repository or in a [DigitalOcean Container Registry](/products/container-registry/). Dockerfiles allow you to deploy whatever application you want onto App Platform as long as the container is OCI-compliant (Open Container Initiative).
    
*   **Cloud Native Buildpacks** - Container images built from predefined build packs that contain popular system libraries and tools specific to your app’s programming language. If you do not provide a container image for your app, App Platform assesses your application’s language and dependencies and builds an OCI-compliant container image from a Cloud Native Buildpack to deploy your application into. Buildpacks are not customizable but contain most common dependencies for modern applications. Deploying your app using buildpacks is fine for most use cases and saves you from needing to build and manage a container file for your application. See our [reference documentation](/products/app-platform/reference/buildpacks/) to see which buildpacks we currently support.
    

## How do deployments work?[](#how-do-deployments-work)

When you redeploy an app with its latest changes, App Platform keeps the previous instance of the app running until the new instance is considered healthy and ready to serve traffic.

The deployment flow is as follows:

1.  App Platform builds a new container for the app with the latest changes.
2.  Once App Platform determines that the new instance is healthy, it adds the instance to the load balancer to start receiving traffic.
3.  App Platform then marks the old instance for termination and removes it from the load balancer. Once removed from the load balancer, the old instance no longer receives traffic.
4.  The old instance then receives the `SIGTERM` signal to shut down and the app can perform any cleanup operations before terminating. The default termination grace period is 30 seconds, but you can [change this value](/products/app-platform/how-to/configure-termination/) in your app’s spec.
5.  This process repeats until all instances have been replaced.