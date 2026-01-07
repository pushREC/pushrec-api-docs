---
source: https://docs.digitalocean.com/products/app-platform/how-to/manage-deployments/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Manage Deployments in App Platform

Validated on 27 Feb 2025 • Last edited on 3 Mar 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

You can view a deployment’s logs to check for error messages and rollback deployments as needed.

## View Your App’s Deployment Logs Using Automation[](#view-your-apps-deployment-logs-using-automation)

To retrieve logs for a specific deployment using the CLI or API, you need to provide deployment’s ID. You can retrieve a list of deployments and their IDs using the CLI’s `doctl apps list-deployments` command or the [`/v2/apps/{app_id}/deployments` endpoint](/reference/api/digitalocean/#operation/apps_list_deployments)

How to View a Deployment’s Logs Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps logs`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/logs/) for more details:
    
        doctl apps logs <app name or id> <component name (defaults to all components)> [flags]
    
    The following example retrieves the build logs for the app with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6` and the component `web`:
    
        doctl apps logs f81d4fae-7dec-11d0-a765-00a0c91e6bf6 web --type build
    

How to View a Deployment’s Logs Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}/logs`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_get_logs_aggregate).

### cURL[](#view-a-deployments-logs-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}/logs"

### Python[](#view-a-deployments-logs-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    get_resp = client.apps.get_logs_aggregate(app_id="b6bdf840", deployment_id="a6adf840")

## View Your App’s Deployments Logs Using the Control Panel[](#view-your-apps-deployments-logs-using-the-control-panel)

To review your app deployments in the [control panel](https://cloud.digitalocean.com/apps), click your app and then click the **Activity** tab to view your app’s history of deployment activity. Click the **Deployment** link for any active deployment to view its real-time logs.

![Deployments screen](https://docs.digitalocean.com/screenshots/app-platform/deployments-all.8c5c944440678ab5c9697a74ec3862f0a3fea36ddd44a281bdebd642babf5861.png)

The deployment marked as “LIVE” is the one currently being served at the live URL for your app. You can click the commit link to go to the commit that triggered a deployment or hover over the `-m` flag to see the commit message.

To manually redeploy your app, click the **Action** button in the top right corner, then click **Deploy** in the drop-down menu. This pulls the latest code from the resource’s associated source repo and runs a build and deploy process.

If your Node.JS app fails to build because of issues with `node_modules` caching, you can [force clear the cache and start a new build](/products/app-platform/reference/buildpacks/nodejs/#clearing-the-cache).

## Roll Back to a Previous Deployment Using the Control Panel[](#roll-back-to-a-previous-deployment-using-the-control-panel)

You can undo a faulty deployment by rolling back the app to a previous deployment. This lets you recover from accidentally deploying code with errors or an app spec that causes failures. You can roll back to the ten most recent successful deployments.

To roll back an app to a previous deployment, the deployment must be in the same region as the app and must have the same database resources and configuration.

Rolling back an app restores the app’s code, configuration, and app spec, but not any database data. To roll back a database’s data, restore it from a backup as described in the [managed databases documentation](/products/databases/).

### Roll Back a Deployment Using the API[](#roll-back-a-deployment-using-the-api)

To rollback a deployment using the API, you need to provide app’s ID and the ID of the deployment you want rollback to. Use the `/v2/apps` to retrieve a list of apps and their respective IDs, and use the `/v2/apps/{app_id}/deployments` endpoint to retrieve a list of deployments for a specified app.

How to Rollback a Deployment Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/apps/{app_id}/rollback`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_create_rollback).

### cURL[](#rollback-a-deployment-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{ "deployment_id": "3aa4d20e-5527-4c00-b496-601fbd22520a" }' \
      "https://api.digitalocean.com/v2/apps/{app_id}/rollback"

### Python[](#rollback-a-deployment-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    create_resp = client.apps.create_rollback(app_id="b6bdf840")

### Roll Back a Deployment Using the Control Panel[](#roll-back-a-deployment-using-the-control-panel)

To roll back an app, go to [the **Apps** page](https://cloud.digitalocean.com/apps) and click your app, then click the **Activity** tab.

In the **Activity** tab, click the **Rollback** link for the deployment you want to roll back. The **Rollback** window that opens displays a comparison between the current deployment and the selected deployment:

*   Expand the app resource name under **Global Settings Changed** to see whether the source code or resource settings have changed. For source code changes, you can use the commit link to go to the commit that triggered the deployment you want to roll back to. You can also hover over the `-m` flag to see the commit message.
    
*   Expand **ALL SETTINGS DIFF** to see the diff between your current and previous deployment’s app spec. Any additions and deletions to the spec are displayed using + and -.
    

![App rollback](https://docs.digitalocean.com/screenshots/app-platform/rollback-app.233fbefa8130fd2d72d1a4044ddd95f63348aea625f406952a8e25f7fe244658.png)

Click **Rollback** to start the rollback deployment. The rollback deployment duplicates the old deployment and contains the same code and configurations.