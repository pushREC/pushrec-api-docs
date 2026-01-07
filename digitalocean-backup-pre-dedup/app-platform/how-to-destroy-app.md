---
source: https://docs.digitalocean.com/products/app-platform/how-to/destroy-app/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Destroy Apps in App Platform

Validated on 17 Feb 2023 • Last edited on 24 Jan 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Deleting an app permanently and irreversibly destroys the app and its components. If you need to re-deploy the app, you can download the app specification file before deleting the app and [use the saved spec to build the app again](/support/can-i-stop-pause-or-disable-my-app-on-app-platform/).

## Destroy an App Using Automation[](#destroy-an-app-using-automation)

The destroy app CLI command and API endpoint require the app’s ID. You can retrieve a list of your apps and their IDs using the `doctl apps list` command or the [`/v2/apps` endpoint](/reference/api/digitalocean/#operation/apps_list) endpoint.

How to Destroy an App Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps delete`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/delete/) for more details:
    
        doctl apps delete <app id> [flags]
    
    The following example deletes an app with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`:
    
        doctl apps delete f81d4fae-7dec-11d0-a765-00a0c91e6bf6
    

How to Destroy an App Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a DELETE request to [`https://api.digitalocean.com/v2/apps/{id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_delete).

### cURL[](#destroy-an-app-curl)

Using cURL:

    curl -X DELETE \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/apps/{id}"

### Python[](#destroy-an-app-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    delete_resp = client.apps.delete(id="b7d64052")

## Destroy an App Using the Control Panel[](#destroy-an-app-using-the-control-panel)

To destroy an app from the [DigitalOcean Control Panel](https://cloud.digitalocean.com), click **Apps** from the left menu and the click the app you want to destroy.

From the app’s overview page, click the **Settings** tab. Scroll down to the Destroy section and then click the **Destroy** button. In the **Destroy app and associated components** window, enter the app’s name into the field to confirm that you want to destroy the app and then click **Destroy**. The app is deleted from your account.