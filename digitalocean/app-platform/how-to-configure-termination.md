---
source: https://docs.digitalocean.com/products/app-platform/how-to/configure-termination/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Configure App Termination Settings

Validated on 15 Aug 2024 • Last edited on 17 Apr 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

You can configure the amount of time that a component’s container has between receiving a termination command and actually shutting down. Container terminations occur when you redeploy or scale. Changing termination parameters can be useful if your app needs time to perform actions before shutting down, such as completing in-progress tasks, releasing resources, or saving data.

You can only change a component’s termination parameters by [updating the app spec](/products/app-platform/how-to/update-app-spec/). To do this, add the following object to the component you want to configure in the app spec:

`app.yaml`

    termination:
      drain_seconds: 60
      grace_period_seconds: 120

You can customize the values of the two parameters:

*   The `drain_seconds` parameter specifies the number of seconds to wait between selecting a container for termination and issuing the termination signal. Selecting a container instance for termination begins an asynchronous drain of new requests on upstream load balancers. The parameter’s default value is `15` seconds and the maximum value is `110` seconds.
    
*   The `grace_period_seconds` parameter specifies the number of seconds to wait after a termination signal (`SIGTERM`) is sent before the container is forcefully killed (`SIGKILL`). Your application can receive the termination signal and use this time to complete and save in-progress work. The parameter’s default value is `120` seconds and the maximum value is `600` seconds.
    

Once you have added the `termination` object to your spec, upload the spec to your app. This automatically triggers a deployment with the new termination parameters.