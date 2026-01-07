---
source: https://docs.digitalocean.com/products/app-platform/how-to/manage-functions/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Manage Functions in App Platform

Validated on 23 May 2022 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

[Functions](/products/functions/) are blocks of code that run on demand without the need to manage any infrastructure. You can develop on your local machine, test your code from the command line using `doctl`, then deploy to App Platform — no servers required.

## Add a Function to an App Using Automation[](#add-a-function-to-an-app-using-automation)

You can add a function to an app using the CLI’s app update command or the API’s app update endpoint. To add a function, update the [app’s spec](/products/app-platform/reference/app-spec/) with the function’s specifications and submit the spec using the following command or endpoint.

How to Add a Function to an App Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps update`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/update/) for more details:
    
        doctl apps update <app id> [flags]
    
    The following example updates an app with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6` using an app spec located in a directory called `/src/your-app.yaml`. Additionally, the command returns the updated app’s ID, ingress information, and creation date:
    
        doctl apps update f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --spec src/your-app.yaml --format ID,DefaultIngress,Created
    

How to Add a Function to an App Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/apps/{id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_update).

### cURL[](#add-a-function-to-an-app-curl)

Using cURL:

    curl -X PUT \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    "https://api.digitalocean.com/v2/apps/{id}" \
    -d '{"alerts":[{"rule":"DEPLOYMENT_FAILED"},{"rule":"DOMAIN_FAILED"}],"domains":[{"domain":"example.com","type":"PRIMARY","zone":"example.com"}],"envs":[{"key":"API_KEY","scope":"RUN_AND_BUILD_TIME","type":"SECRET","value":"EV[1:zqiRIeaaYK/NqctZDYzy6t0pTrtRDez8:wqGpZRrsKN5nPhWQrS479cfBiXT0WQ==]"}],"features":["buildpack-stack=ubuntu-22"],"ingress":{},"name":"example-app","region":"nyc","services":[{"autoscaling":{"max_instance_count":4,"metrics":{"cpu":{"percent":70}},"min_instance_count":2},"git":{"branch":"main","repo_clone_url":"https://github.com/digitalocean/sample-nodejs.git"},"internal_ports":[8080],"log_destinations":[{"name":"your_log_consumer_name","open_search":{"endpoint":"logs.example.com:12345","basic_auth":{"user":"doadmin","password":"1234567890abcdef"},"index_name":"example-index","cluster_name":"example-cluster"}}],"name":"sample-nodejs","run_command":"yarn start","source_dir":"/"}]}'

### Python[](#add-a-function-to-an-app-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    req = {
    "spec": {
        "name": "web-app-01",
        "region": "nyc",
        "domains": [
            {
                "domain": "app.example.com",
                "type": "DEFAULT",
                "wildcard": True,
                "zone": "example.com",
                "minimum_tls_version": "1.3",
            }
        ],
        "services": [],
        "static_sites": [
            {
                "cors": {
                    "allow_origins": [
                        {"exact": "https://www.example.com"},
                        {"regex": "^.*example.com"},
                    ],
                    "allow_methods": [
                        "GET",
                        "OPTIONS",
                        "POST",
                        "PUT",
                        "PATCH",
                        "DELETE",
                    ],
                    "allow_headers": ["Content-Type", "X-Custom-Header"],
                    "expose_headers": ["Content-Encoding", "X-Custom-Header"],
                    "max_age": "5h30m",
                    "allow_credentials": False,
                },
                "routes": [{"path": "/api", "preserve_path_prefix": True}],
            }
        ],
        "jobs": [
            {
                "name": "api",
                "gitlab": {
                    "branch": "main",
                    "deploy_on_push": True,
                    "repo": "digitalocean/sample-golang",
                },
                "image": {
                    "registry": "registry.hub.docker.com",
                    "registry_type": "DOCR",
                    "repository": "origin/master",
                    "tag": "latest",
                },
                "dockerfile_path": "path/to/Dockerfile",
                "build_command": "npm run build",
                "run_command": "bin/api",
                "source_dir": "path/to/dir",
                "envs": [
                    {
                        "key": "BASE_URL",
                        "scope": "BUILD_TIME",
                        "type": "GENERAL",
                        "value": "http://example.com",
                    }
                ],
                "environment_slug": "node-js",
                "log_destinations": {
                    "name": "my_log_destination",
                    "papertrail": {
                        "endpoint": "https://mypapertrailendpoint.com"
                    },
                    "datadog": {
                        "endpoint": "https://mydatadogendpoint.com",
                        "api_key": "abcdefghijklmnopqrstuvwxyz0123456789",
                    },
                    "logtail": {
                        "token": "abcdefghijklmnopqrstuvwxyz0123456789"
                    },
                   "open_search": {
                        "endpoint": "https://myopensearchendpoint.com:9300"
                        "index_name": "logs"
                        "basic_auth": {
                            "user": "doadmin",
                            "password": "password"
                        }
                    },
                },
                "instance_count": 2,
                "instance_size_slug": "apps-s-1vcpu-0.5gb",
                "kind": "PRE_DEPLOY",
            }
        ],
        "workers": [
            {
                "name": "api",
                "gitlab": {
                    "branch": "main",
                    "deploy_on_push": True,
                    "repo": "digitalocean/sample-golang",
                },
                "image": {
                    "registry": "registry.hub.docker.com",
                    "registry_type": "DOCR",
                    "repository": "origin/master",
                    "tag": "latest",
                },
                "dockerfile_path": "path/to/Dockerfile",
                "build_command": "npm run build",
                "run_command": "bin/api",
                "source_dir": "path/to/dir",
                "envs": [
                    {
                        "key": "BASE_URL",
                        "scope": "BUILD_TIME",
                        "type": "GENERAL",
                        "value": "http://example.com",
                    }
                ],
                "environment_slug": "node-js",
                "log_destinations": {
                    "name": "my_log_destination",
                    "papertrail": {
                        "endpoint": "https://mypapertrailendpoint.com"
                    },
                    "datadog": {
                        "endpoint": "https://mydatadogendpoint.com",
                        "api_key": "abcdefghijklmnopqrstuvwxyz0123456789",
                    },
                    "logtail": {
                        "token": "abcdefghijklmnopqrstuvwxyz0123456789"
                    },
                   "open_search": {
                        "endpoint": "https://myopensearchendpoint.com:9300"
                        "index_name": "logs"
                        "basic_auth": {
                            "user": "doadmin",
                            "password": "password"
                        }
                    },
                },
                "instance_count": 2,
                "instance_size_slug": "apps-s-1vcpu-0.5gb",
            }
        ],
        "functions": [
            {
                "cors": {
                    "allow_origins": [
                        {"exact": "https://www.example.com"},
                        {"regex": "^.*example.com"},
                    ],
                    "allow_methods": [
                        "GET",
                        "OPTIONS",
                        "POST",
                        "PUT",
                        "PATCH",
                        "DELETE",
                    ],
                    "allow_headers": ["Content-Type", "X-Custom-Header"],
                    "expose_headers": ["Content-Encoding", "X-Custom-Header"],
                    "max_age": "5h30m",
                    "allow_credentials": False,
                },
                "routes": [{"path": "/api", "preserve_path_prefix": True}],
                "name": "api",
                "source_dir": "path/to/dir",
                "alerts": [
                    {
                        "rule": "CPU_UTILIZATION",
                        "disabled": False,
                        "operator": "GREATER_THAN",
                        "value": 2.32,
                        "window": "FIVE_MINUTES",
                    }
                ],
                "envs": [
                    {
                        "key": "BASE_URL",
                        "scope": "BUILD_TIME",
                        "type": "GENERAL",
                        "value": "http://example.com",
                    }
                ],
                "gitlab": {
                    "branch": "main",
                    "deploy_on_push": True,
                    "repo": "digitalocean/sample-golang",
                },
                "log_destinations": {
                    "name": "my_log_destination",
                    "papertrail": {
                        "endpoint": "https://mypapertrailendpoint.com"
                    },
                    "datadog": {
                        "endpoint": "https://mydatadogendpoint.com",
                        "api_key": "abcdefghijklmnopqrstuvwxyz0123456789",
                    },
                    "logtail": {
                        "token": "abcdefghijklmnopqrstuvwxyz0123456789"
                    },
                   "open_search": {
                        "endpoint": "https://myopensearchendpoint.com:9300"
                        "index_name": "logs"
                        "basic_auth": {
                            "user": "doadmin",
                            "password": "password"
                        }
                    },
                },
            }
        ],
        "databases": [
            {
                "cluster_name": "cluster_name",
                "db_name": "my_db",
                "db_user": "superuser",
                "engine": "PG",
                "name": "prod-db",
                "production": True,
                "version": "12",
            }
        ],
        “vpc”: {
            “id”: “c22d8f48-4bc4-49f5-8ca0-58e7164427ac”,
        }
    }
    update_resp = client.apps.update(id="bb245ba", body=req)

## Create Functions Using the Control Panel[](#create-functions-using-the-control-panel)

In the [**Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps), select your app. Click **Add components**, then choose **Create resources from source code** to add a Function.

![Resources screen](https://docs.digitalocean.com/screenshots/app-platform/add-components-from-source-code.d64ab3dbe5c2f4fafd9bca394589bef31dca5eb78890ff966e684b17c8601889.png)

On the **Choose a deployment source** screen, select the code repository service your app resides on. If you have not previously created an app on App Platform, the repository service prompts you to provide DigitalOcean with read permissions to your account.

![Build and deploy your app in the cloud with App Platform.](https://docs.digitalocean.com/screenshots/app-platform/app-choose-source-repo.a71047582805446db9a850f2812b69caa6ec321229fcf671074a586792a19fb8.png)

Select the app's repo from the **Repository** drop-down and then select the branch to deploy from in the **Branch** drop-down menu.

The **Source Directory** is the directory inside the repo from which to build the app. The default is the repo's root directory. If you're deploying from a monorepo or a container image registry, see [Deploy from a Monorepo](/products/app-platform/how-to/deploy-from-monorepo/) or [How to Deploy from Container Images](/products/app-platform/how-to/deploy-from-container-images/) for more information on how to deploy apps using these options.

You can choose to opt out of auto-deploying code changes. Uncheck the **Autodeploy** box to disable App Platform from redeploying the app when it detects changes in the app's repo.

Once you have selected the app's repo and branch, click **Next**. App Platform retrieves your app's code.

App Platform inspects the code and app resources and selects an appropriate runtime environment (such as Node or Ruby). If you need to override this, upload a [Dockerfile](https://docs.docker.com/engine/reference/builder/) to your branch and restart the app creation process.

![Create function](https://docs.digitalocean.com/screenshots/app-platform/create-function.c7ebea80a0d88b8f177b1a40fd76b7230ddb2c8c2858010eb61505d04e80a72f.png)

You cannot change a Function to another resource type. To change the Function specifications, click the edit icon to open the **Settings** page of the Function. Here, you can edit the name, and the request route. Click **Expand** in the **Functions** section to see the packages and functions to be deployed. Click **Save** to confirm your changes.

![Create function settings](https://docs.digitalocean.com/screenshots/app-platform/create-functions-settings.c77e0fb4b3d6bd83aeec5385cb7c3b1a433ba8897cb8135035ba88dca140676b.png)

4.  Optionally, to specify additional resources, click the **Add Additional Resource From Source** link, repeat the procedure, and click **Next**.
    
5.  To use environment variables, click **Edit** to the right of the resource name and enter them. Click the **Encrypt** checkbox to obscure a variable’s value in all build, deploy, and application logs.
    
    To specify an app-level environment variable, click **Edit** to the right of **Global**. Click **Save** and then click **Next**.
    
    For Functions components only, you must also add the environment variables to your function’s `project.yml` configuration file. The `project.yml` file must be in the component’s **Source Directory**, if specified in step 3.
    
    See [the Templating section of the Functions project configuration documentation](/products/functions/reference/project-configuration/#templating) for examples and more information on configuring App Platform environment variables in `project.yml`.
    
    Also see [How to Use Environment Variables in App Platform](/products/app-platform/how-to/use-environment-variables/) for more information on setting and using environment variables in App Platform.
    
    ![Resources env variables](https://docs.digitalocean.com/screenshots/app-platform/resources-env-var.366967af69d7d5e92fcd96eaaec5d7c9a6073c3958e1e2a1da82a04d53fa17cf.png)
6.  Review the resources, environment variables, and pricing, and click **Create Resources**.
    

## Edit Functions[](#edit-functions)

In the [**Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps), select your app and click the **Settings** tab. Click the Function you'd like to edit.

You can use the configuration settings you see here to change the Function's scaling behavior, modify environment variables, edit commands, and more.

## Get Function URLs[](#get-function-urls)

To find the live URL of each function in your Function component, click to the **Settings** tab of your app and click the Function component you’d like to inspect.

![Function settings](https://docs.digitalocean.com/screenshots/app-platform/functions-settings.7d00dd92d116d836cd3f468b71516e47264d0be04dc6c4f793a288907c426edc.png)

The _Functions_ table displays information about all of the functions deployed in the component. The **Name** of each function is a clickable link that opens the function’s URL in a new window in your browser.

Note

Opening the live URL of a function directly in your browser can result in errors if your function is expecting input parameters. Use API testing tools like Postman, `curl`, or your programming language’s HTTP client library to test the URL with properly formatted HTTP requests.

You can also click the _Copy_ button next to the function name to copy the live URL to your clipboard.

## Enable Trusted Sources[](#enable-trusted-sources)

Functions in App Platform supports trusted sources with DigitalOcean Managed Databases. You can add your app as a trusted source on managed database clusters to enable secure connection from the app to the database.

When you [add an app as a trusted source for a database](/products/app-platform/how-to/manage-databases/), all components of the app, including any functions components, have secure access to the database cluster.

Note

When you remove an App Platform app from your database’s trusted sources, the app’s Functions components remain trusted until the entire app is redeployed. You must redeploy your app to complete the process.

To configure the functions component to connect to the database cluster, [set environment variables](/products/app-platform/how-to/use-environment-variables/) from the managed database configuration:

*   `DATABASE_URL` for the connection URL.
*   `DATABASE_PASSWORD` for the password.
*   `DATABASE_USER` for the username to use to connect.
*   `DATABASE_NAME` for the name of the database cluster.

When using functions to connect to databases, we recommend reusing the database connection across multiple function invocations or closing the connection with every invocation to avoid hitting the database’s connection limit. The function environment is reused across function invocations, so you can initialize the connection in a persistent global variable.

We do not currently support trusted sources with MongoDB or Postgres connection pools.

## Log Forwarding[](#log-forwarding)

Functions components on App Platform can forward console and error logs to a third-party logging service. We currently support Logtail and Datadog:

*   For Datadog, the configuration requires an **Endpoint** and an **API Key**.
*   For Logtail, [create an HTTP source](https://docs.logtail.com/integrations/rest-api) and use the resulting **Token** for the configuration.

Note

We currently do not support [Managed OpenSearch](/products/databases/opensearch/) or Papertrail as a log forwarding provider for function components in App Platform.

Enabling log forwarding requires two steps:

*   First, configure a log forwarding destination, using either the control panel interface or by updating your app’s app spec file.
*   Then, update your function’s `project.yml` file to properly handle the `LOG_DESTINATIONS` environment variable.

### Configure the Log Forwarding Destination[](#configure-the-log-forwarding-destination)

You can configure log forwarding for function components using the control panel interface or by updating your app’s app spec file.

 Control Panel

To configure a function component’s log forwarding through the control panel, you need to navigate to the component’s **Settings** page. Start at the [Apps](https://cloud.digitalocean.com/apps) page, then click the App you’d like to update. Select **Settings** and click the function component.

Click the **Edit** button in the **Log Forwarding** section, then press the **Add Destination** button. This opens the **Add Log Destination** dialog:

![Screenshot of the Add Log Destination dialog with fields for a name, log destination type, token, and buttons for canceling and adding the log destination](https://docs.digitalocean.com/screenshots/app-platform/functions-add-log-destination.f3051cf33c28502d64a7b53691a6b412b8834ed1b2f7b583fdada94942d05dbc.png)

Fill out a **Name**, select your **Log Destination Type**, and then fill in the details needed for your destination type. Press **Add Log Destination** to complete the process.

Adding a log forwarding destination to your function component also adds an environment variable to your component with the key of `LOG_DESTINATIONS`. You can view this new environment variable in the **Environment Variables** section of your function component’s settings page. If you remove this environment variable, log forwarding for your function stops working.

 App Spec

You can add log forwarding destinations to function components by updating the App’s app spec file. See the `log_destinations` section of the [App Spec reference](/products/app-platform/reference/app-spec/) for details. Here is an example Logtail destination:

    log_destinations:
    - name: <example-destination>
      logtail: 
        token: <your-token>

Place the log forwarding destination in the portion of your app spec that configures the function component you’re enabling log forwarding for.

Additionally, in the same component section, add the following environment variable:

      envs:
      - key: LOG_DESTINATIONS
        scope: RUN_AND_BUILD_TIME
        value: ${_self.FUNCTIONS_LOG_DESTINATION_JSON}

The value of `${_self.FUNCTIONS_LOG_DESTINATION_JSON}` is provided by App Platform. It is a JSON structure with configuration details for log forwarding destinations.  

### Update Your `project.yml` File[](#update-your-projectyml-file)

To complete the setup, add the `LOG_DESTINATIONS` environment variable to your function’s `project.yml` file:

    environment:
      LOG_DESTINATIONS: ${LOG_DESTINATIONS}

This passes the component-level `LOG_DESTINATIONS` environment variable to the actual Function process. After you update `project.yml`, redeploy your function component.

## Destroy Functions[](#destroy-functions)

In the [**Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps), select your app and click the **Settings** tab. Click the Function you'd like to destroy.

You can destroy the Function by clicking the **Destroy Component** button on the bottom of the page and entering its name to confirm your selection.

## Function Limits[](#function-limits)

All [Functions product](/products/functions/) limits also apply to function components in App Platform. See the following link for details.

[](/products/functions/details/limits/)

![](https://docs.digitalocean.com/images/icons/functions.svg)

Functions Limits

Limits and known issues for DigitalOcean Functions.