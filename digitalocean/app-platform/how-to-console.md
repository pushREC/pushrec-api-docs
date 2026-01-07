---
source: https://docs.digitalocean.com/products/app-platform/how-to/console/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Access the Console for an App Platform Component

Validated on 27 Nov 2024 • Last edited on 20 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

The console of an App Platform component is an in-browser command-line terminal whose shell context is a running container instance for a given resource. You can connect to the console of your app’s components (services and workers) to run commands in the component’s container.

By running commands in the console, you can see the active processes that are running inside the container, browse its local file system, monitor resource usage, observe system logs, and more. Connecting to the console is useful for troubleshooting issues, performing maintenance tasks, and running other one-off commands.

This is similar to other container workflows involving logging into the virtualized environment. For example, with containers that have a `bash` shell, you can achieve the same effect locally by running `docker exec -it CONTAINER_ID /bin/bash`.

Warning

Container environments are ephemeral, so any changes you make to your app or files in the container using the console do not persist. Additionally, there is no synchronization between containers, so changes you make in one container do not propagate to other containers.

You can access the console for a component using the DigitalOcean Control Panel, [API](https://docs.digitalocean.com/reference/api/digitalocean/) or the [official CLI](https://docs.digitalocean.com/reference/doctl/), doctl.

## Access a Component’s Console Using the API[](#access-a-components-console-using-the-api)

How to Access the Console Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/apps/{app_id}/components/{component_name}/exec`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_get_exec_active_deployment).

### cURL[](#access-the-console-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/apps/{app_id}/components/{component_name}/exec"

### Python[](#access-the-console-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    get_resp = client.apps.get_exec_active_deployment(app_id="a6adf840", component_name="component")

## Access a Component’s Console Using the CLI[](#access-a-components-console-using-the-cli)

How to Access the Console Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps console`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/console/) for more details:
    
        doctl apps console <app id> <component name> <instance name (optional)> [flags]
    
    The following example initiates a console session for the app with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6` and the component `web`:
    
        doctl apps console f81d4fae-7dec-11d0-a765-00a0c91e6bf6 web. To initiate a console session to a specific instance, append the instance id: doctl apps console f81d4fae-7dec-11d0-a765-00a0c91e6bf6 web sample-golang-5d9f95556c-5f58g
    

## Access a Component’s Console Using the Control Panel[](#access-a-components-console-using-the-control-panel)

To access a component’s console from the [control panel](https://cloud.digitalocean.com/apps), click your app, then click the **Console** tab. In the **Console** tab, select the component that you want access to open its console.

![A screenshot of a console open for an app component named sample-nodejs.](https://docs.digitalocean.com/screenshots/app-platform/app-console.8350cff6080031aeb3f67ca9b14282c803b6d7ee753d77de3e61957748e5d3f9.png)

## Access a Specific Instance[](#access-a-specific-instance)

App Platform components can have multiple running instances. Whenever your app deploys or scales (automatically or manually), it creates a new instance. When accessing the app’s console, App Platform automatically connects you to the first available instance. However, you may want to access the console of another specific instance to debug an issue, using the DigitalOcean API or CLI. For example, if that instance is handling a significantly different workload.

To get a list of an app’s running compute instances:

 CLI

Run the following `doctl` command (requires version v1.129.0 or newer):

    doctl apps list-instances $app_id

 API

Use the following API call:

    curl -X GET \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    "https://api.digitalocean.com/v2/apps/$app_id/instances"

This returns an array of component instances, each with an ephemeral `instance_name` property and `instance_alias` property [mappable to the app’s insights](/products/app-platform/how-to/view-insights/). You can then use an instance’s name to get an exec URL:

 CLI

Run the following `doctl` command (requires version v1.129.0 or newer):

    doctl apps console $app_id $component_name $instance_name

 API

Use the following API call:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    "https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}/components/{component_name}/exec?instance_name={instance_name}"

This returns an exec URL, which you can use to access the instance’s console using the [CLI](#access-a-components-console-using-the-cli) or [API](#access-a-components-console-using-the-api). We recommend [using Aptfile](/products/app-platform/reference/buildpacks/aptfile/) to install tools.

Because instances are ephemeral, do not make any changes to them that need to persist or create any scripts that rely on them.