---
source: https://docs.digitalocean.com/products/app-platform/how-to/manage-health-checks/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Set Up and Manage Health Checks

Validated on 21 May 2025 • Last edited on 7 Oct 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Health checks in App Platform serve as readiness probes to determine when an application is ready to start handling traffic. When you a deploy an app, App Platform uses a set of parameters to determine when health checks should begin, how often they should run, and how many times they must fail before considering the app unhealthy and sending an email to the account’s email address.

App Platform has default health check settings that work for most apps, but you can customize them for your specific app’s needs. For example, if you know your app takes longer to deploy than the default time before health checks start, you may want to increase that value.

You can customize your app’s health check settings using the [control panel](#using-the-control-panel) or the [app spec](#using-the-app-spec).

## Using the Control Panel[](#using-the-control-panel)

To customize your app’s health check settings, go to the [control panel](https://cloud.digitalocean.com/apps), click **Apps**, and select the app you want to customize health settings for. Click on the **Settings** tab, scroll down to the **Health Checks** section, and click **Edit**.

![Health checks section](https://docs.digitalocean.com/screenshots/app-platform/health-checks-section.1635c217df61034b41be4c38bc6dab281079989aeeff9ac02ac8dfdb6dc0472f.png)

Enter the health check’s type (TCP or HTTP) and its port. Then, you can optionally configure the following or leave them at their default values:

*   Initial Delay: The number of seconds before the App Platform begins initiating health checks after a deployment.
*   Period: The number of seconds (interval) between health checks.
*   Timeout: The number of seconds before a health check is considered failed.
*   Success Threshold: The number of consecutive successful health checks required before the app is considered healthy.
*   Failure Threshold: The number of consecutive failed health checks required before the app is considered unhealthy.

You can enable liveness probes for [services](#services) and [workers](#workers) that automatically restart your app if its health check fails. We recommend using liveness checks (which restart the app) in conjunction with health checks (which stop traffic). To do so, click the **Add liveness check** button and enter the same information as above.

![Liveness checks section](https://docs.digitalocean.com/screenshots/app-platform/liveness-checks-section.d61a8f239071b9e53f0a7ced998a0fc71026a4ae29568b49d5120b37f9b7c84c.png)

Click **Save** to confirm your changes.

## Using the App Spec[](#using-the-app-spec)

To customize your app’s health check settings, [edit the app’s spec](/products/app-platform/how-to/update-app-spec/) and add the `health_check` object to your service component, like this:

`app.yaml`

    health_check:
      initial_delay_seconds: 30
      period_seconds: 10
      timeout_seconds: 5
      success_threshold: 1
      failure_threshold: 5
      http_path: /api
      port: 8080

Each field in the `health_check` object has the following meaning:

*   `initial_delay_seconds`: The number of seconds before the App Platform begins initiating health checks after a deployment.
*   `period_seconds`: The number of seconds (interval) between health checks.
*   `timeout_seconds`: The number of seconds before a health check is considered failed.
*   `success_threshold`: The number of consecutive successful health checks required before the app is considered healthy.
*   `failure_threshold`: The number of consecutive failed health checks required before the app is considered unhealthy.
*   `http_path`: The HTTP path on which to perform health checks. If not set, App Platform disables the HTTP health check and a TCP health check used instead.
*   `port`: The port on which to perform health checks. If not set, App Platform performs the health check on the component’s `http_port`.

Once you add the `health_check` object to your app spec, upload the spec to your app’s repo or deploy it directly using the control panel.

### Set Up Liveness Probes[](#set-up-liveness-probes)

You can enable liveness probes for [services](#services) and [workers](#workers) that automatically restart your app if its health check fails.

We recommend using `liveness_health_check` (which restarts the app) in conjunction with `health_check` (which stops traffic).

#### Services[](#services)

To enable liveness probes for a service, specify `liveness_health_check` in your app spec, like this:

    name: sample-golang 
    services: 
     - name: web 
       github: 
         repo: digitalocean/sample-golang 
         branch: master 
       liveness_health_check: 
         initial_delay_seconds: 10 
         period_seconds: 10 
         timeout_seconds: 5 
         success_threshold: 1 
         failure_threshold: 6 
         http_path: / 
         port: 8080

#### Workers[](#workers)

To enable liveness probes on workers, specify `liveness_health_check` in your app spec and ensure your worker application is listening to the designated port and responds to health checks, like this:

    ame: sample-golang 
    workers: 
     - name: background-service 
       envs: 
         - key: PORT 
           value: "8080" 
       github: 
         repo: digitalocean/sample-golang 
         branch: master 
       liveness_health_check: 
         initial_delay_seconds: 10 
         period_seconds: 10 
         timeout_seconds: 5 
         success_threshold: 1 
         failure_threshold: 5 
         http_path: / 
         port: 8080