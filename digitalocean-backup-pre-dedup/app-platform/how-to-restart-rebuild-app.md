---
source: https://docs.digitalocean.com/products/app-platform/how-to/restart-rebuild-app/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Restart or Force Rebuild Your App

Validated on 20 Nov 2024 • Last edited on 23 Jan 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform provides two options for managing your app’s container: restarting the container or forcing a rebuild. Both options are useful in different situations:

*   **Restart your app’s container:** Redeploys an exact copy of your app’s container without fetching updates from your source code repository. This is useful if your app is stuck in a connection loop or a deadlock. However, restarting your app does not fix issues caused by code or configuration errors.
    
    Restarting your app performs a rolling restart of its [service](/products/app-platform/how-to/manage-services/) and [worker](/products/app-platform/how-to/manage-workers/) components; it does not restart the app’s [jobs](/products/app-platform/how-to/manage-jobs/) or [databases](/products/app-platform/how-to/manage-databases/). You can also restart individual services or workers.
    
*   **Force a rebuild of your app’s container:** Redeploys the app with the latest changes from your source code repository. This is useful if you have made changes to your app’s container image and want to ensure that the changes are reflected in your app.
    

## Restart Your App Using the API or CLI[](#restart-your-app-using-the-api-or-cli)

You can restart all of your app’s components by providing your app’s ID to the restart command or API endpoint. You can also restart individual components by setting the `--components` flag in the command, or the `components` field in the API, and then provide a list of component names as arguments.

How to Restart an App Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps restart`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/restart/) for more details:
    
        doctl apps restart <app id> [flags]
    
    The following example restarts an app with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`. Additionally, the command returns the app’s ID and status:
    
        doctl apps restart f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --format ID,Status
    

How to Restart an App Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/apps/{app_id}/restart`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_restart).

### cURL[](#restart-an-app-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/apps/{app_id}/restart"

### Python[](#restart-an-app-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    create_resp = client.apps.restart(app_id="b6bdf840", body={"components": ["component1", "component2"]})

## Restart Your App Using the Control Panel[](#restart-your-app-using-the-control-panel)

To restart your app’s container from the [control panel](https://cloud.digitalocean.com/apps), click the app you want to restart and then click the **Actions** button. In the **Actions** menu, click **Restart**.

![The Restart or Deploy window with the Restart tab selected.](https://docs.digitalocean.com/screenshots/app-platform/app-restart.c9a232852c6f8a156f478989f903e42edd932a1fd34f5e250d10b1c2d2af1da0.png)

In the **Restart or Deploy** window, select whether to restart all services and workers, or restart individual components. Once you’ve selected which components to restart, click **Restart**. The app redeploys without importing any changes from your source code repository.

## Force Rebuild Your App Using the API or CLI[](#force-rebuild-your-app-using-the-api-or-cli)

You can force a rebuild of your app’s container by creating a new deployment for the app and setting the `force-rebuild` flag in the CLI, or the `force_rebuild` parameter in the API, to `true`. This forces the app to redeploy with the latest changes from your source code repository.

How to Force Rebuild an App Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps create-deployment`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/create-deployment/) for more details:
    
        doctl apps create-deployment <app id> [flags]
    
    The following example creates a deployment for an app with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`. Additionally, the command returns the app’s ID and status:
    
        doctl apps create-deployment f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --format ID,Status
    

How to Force Rebuild an App Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/apps/{app_id}/deployments`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_create_deployment).

### cURL[](#force-rebuild-an-app-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/apps/{app_id}/deployments"

### Python[](#force-rebuild-an-app-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    create_resp = client.apps.create_deployment(app_id="b6bdf840", body={"force_build": True})

## Force a Rebuild of Your App Using the Control Panel[](#force-a-rebuild-of-your-app-using-the-control-panel)

To force a rebuild of your app’s container from the [control panel](https://cloud.digitalocean.com/apps), click the app you want to rebuild and then click the **Actions** button. In the **Actions** menu, click **Force Rebuild and Deploy**.

![The Restart or Deploy window with the Force Rebuild and Deploy tab selected.](https://docs.digitalocean.com/screenshots/app-platform/app-force-rebuild.1977266872fb164880291343974f6df405051ec14d6ada55be72ecef27e9e07d.png)

In the **Restart or Deploy** window, choose whether to clear the build cache, then click **Force Rebuild and Deploy**. The app redeploys after fetching changes from your source code repository.