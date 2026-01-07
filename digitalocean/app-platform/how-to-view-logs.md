---
source: https://docs.digitalocean.com/products/app-platform/how-to/view-logs/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to View Logs in App Platform

Validated on 5 Apr 2023 • Last edited on 3 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

You can view activity, build, deployment, and runtime logs in App Platform using the control panel, CLI, and API. You can also [enable log forwarding](/products/app-platform/how-to/forward-logs/) to forward application logs to external log providers.

## Types of Logs[](#types-of-logs)

App Platform records several different types of information about your app to during each stage of its deployment. You can access and review the following logs:

*   **Activity:** Maintains a timeline of your app’s deployments, including the commit hash that triggered the build, how long the build took, and the build’s start and end times.
*   **Deployment details:** Contains overview information about a specific deployment, including build duration and the amount of time that was billed during deployment. This page also contains the deployment’s build and deploy logs.
    *   **Build log:** Records the commands and subsequent build processes used to build the app, including any errors or warnings emitted by the software building the app. These can be helpful for identifying issues with the application’s code or dependencies that may need to be addressed before the application can be deployed. These logs are retained for 90 days.
    *   **Deploy log:** Records the deployment of the app to its server, including any errors or warnings emitted from the software being used to host the app. These logs are retained for 90 days.
*   **Runtime log:** Records messages and errors emitted by the app and its components while running. These logs can be useful for troubleshooting issues with the application’s logic or functionality. To retain, configure log forwarding to an external provider.
*   **Crash log:** Records the log output from the instance before it crashed and a potential reason for the crash.

## View Logs Using the Automation[](#view-logs-using-the-automation)

The CLI command and API endpoint used to retrieve an app’s logs require the app’s ID. You can retrieve a list of your apps and their IDs using the `doctl apps list` command or the [/v2/apps endpoint](/reference/api/digitalocean/#operation/apps_list).

How to View Logs Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps logs`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/logs/) for more details:
    
        doctl apps logs <app name or id> <component name (defaults to all components)> [flags]
    
    The following example retrieves the build logs for the app with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6` and the component `web`:
    
        doctl apps logs f81d4fae-7dec-11d0-a765-00a0c91e6bf6 web --type build
    

How to View Logs Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}/components/{component_name}/logs`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_get_logs).

### cURL[](#view-logs-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}/components/{component_name}/logs"

### Python[](#view-logs-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    get_resp = client.apps.get_logs(app_id="4f6c71e2", deployment_id="3aa4d20e", component_name="component")

The `live_url` returned may use either the `https://` or `wss://` protocols and will keep pushing live logs as they become available.

## View Logs Using the Control Panel[](#view-logs-using-the-control-panel)

To view app resource logs, in the [**Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps), click your app.

### Activity Logs[](#activity-logs)

To view the activity for an app, click the **Activity** tab. This displays your app’s timeline of deployments.

![Activity tab displaying app timeline](https://docs.digitalocean.com/screenshots/app-platform/logs-activity-tab2.969007c557df40c0d8e9d8ccaaa21bb1c2a7c05bbd096c9700b68934e2357f75.png)

### Deployment Logs[](#deployment-logs)

To view logs and information for a specific deployment, click the **Activity** tab and then click the **deployment** link in the headline of the deployment you want to review. From here, you can review the deployment’s **Build logs** and **Deploy logs**.

![Deployment log entry screen with build and deploy logs displayed](https://docs.digitalocean.com/screenshots/app-platform/logs-deployment-build.56315ed7941a8bec668eb7b8ee5366be036c9e2b7cb69b3958cff4e40d2ecbda.png)

### Runtime Logs[](#runtime-logs)

To view runtime logs, click the **Runtime Logs** tab, then click a resource to view its logs. The logs show within a few minutes after the app deploys. The logs are updated in real time while the resource is running.

![Runtime logs screen](https://docs.digitalocean.com/screenshots/app-platform/logs-all.21c5170110fcaa2680fcf4dc1d11043ba56f30bdc07edf5cb2c3f6fa9a2cd6be.png)

### Crash Logs[](#crash-logs)

Crash logs are available after a container crashes and restarts. You can only access crash logs using `doctl`, the [official DigitalOcean CLI](/reference/doctl/how-to/install/).

To access the log from before the last crash, run the following command in a terminal, replacing `<your-app-ID>` with your app’s ID:

    doctl apps logs <your-app-ID> --type=run_restarted

To retrieve a list of app IDs, run `doctl apps list`.

Optionally, you can retrieve crash logs for a specific component by adding the component’s name as an additional argument, like this:

    doctl apps logs <your-app-ID> <component-name> --type=run_restarted