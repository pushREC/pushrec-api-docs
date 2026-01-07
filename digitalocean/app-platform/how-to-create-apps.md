---
source: https://docs.digitalocean.com/products/app-platform/how-to/create-apps/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Create Apps in App Platform

Validated on 10 May 2024 • Last edited on 24 Nov 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform retrieves your app’s code from your linked repository or container registry, detects the type of language the app is written in, and deploys the app into an appropriate container environment. App Platform hosts the app at a public URL provided by DigitalOcean and can automatically redeploy the app when it detects changes in the repo.

App Platform supports deployment from the following source code management services:

*   GitHub
*   GitLab
*   Bitbucket
*   [DOCR](/products/container-registry/)
*   Docker Hub
*   GitHub Container Registry

Creating an App Platform app involves two steps:

1.  Choose a deployment source.
2.  Review and configure resource settings (such as the app’s name, region, size, instance type, instance sizes, environment variables, and HTTP routes).

You can change the configuration and add more services, static sites, and databases after you create the app.

Note

You must have an [**Owner** or **Maintainer** permissions-role](https://docs.github.com/en/organizations/managing-peoples-access-to-your-organization-with-roles/roles-in-an-organization) in any GitHub repository that you want to access from App Platform.

## Create Resource From Source Code Using Automation[](#create-resource-from-source-code-using-automation)

To create an app using the CLI or API, provide a path to an [app spec file](/products/app-platform/reference/app-spec/) (JSON or YAML) as the argument for the `--spec` flag using the CLI, or provide a spec as a JSON object in the `spec` field of the App Create API request.

How to Create an App Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/create/) for more details:
    
        doctl apps create [flags]
    
    The following example creates an app in a project named `example-project` using an app spec located in a directory called `/src/your-app.yaml`. Additionally, the command returns the new app’s ID, ingress information, and creation date:
    
        doctl apps create --spec src/your-app.yaml --format ID,DefaultIngress,Created
    

How to Create an App Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/apps`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_create).

### cURL[](#create-an-app-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/apps"
      -d '{"spec":{"name":"web-app","region":"nyc", \
      "services":[{"name":"api","github":{"branch":"main",\
      "deploy_on_push":true,"repo":"digitalocean/sample-golang"}, \
      "run_command":"bin/api","environment_slug":"node-js", \
      "instance_count":2,"instance_size_slug":"apps-s-1vcpu-0.5gb", \
      "routes":[{"path":"/api"}]}]}}'

### Python[](#create-an-app-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    create_resp = client.apps.create(
        {
            "spec": {
                "name": "web-app",
                "region": "nyc",
                "services": [
                    {
                        "name": "api",
                        "github": {},
                        "run_command": "bin/api",
                        "environment_slug": "node-js",
                        "instance_count": 2,
                        "instance_size_slug": "apps-s-1vcpu-0.5gb",
                        "routes": [],
                    }
                ],
            }
        }
    )

## Create Resource From Source Code Using the Control Panel[](#create-resource-from-source-code-using-the-control-panel)

To start creating an app using the [DigitalOcean Control Panel](https://cloud.digitalocean.com), click the **Create** button and then select **App Platform** from the drop-down menu.

On the **Choose a deployment source** screen, select the code repository service your app resides on. If you have not previously created an app on App Platform, the repository service prompts you to provide DigitalOcean with read permissions to your account.

![Build and deploy your app in the cloud with App Platform.](https://docs.digitalocean.com/screenshots/app-platform/app-choose-source-repo.a71047582805446db9a850f2812b69caa6ec321229fcf671074a586792a19fb8.png)

Select the app’s repo from the **Repository** drop-down and then select the branch to deploy from in the **Branch** drop-down menu.

The **Source Directory** is the directory inside the repo from which to build the app from. The default is the repo’s root directory. If you’re deploying from a monorepo or a container image registry, see [Deploy from a Monorepo](/products/app-platform/how-to/deploy-from-monorepo/) or [How to Deploy from Container Images](/products/app-platform/how-to/deploy-from-container-images/) for more information on how to deploy app’s using these options.

You can choose to opt out of auto-deploying code changes. Uncheck the **Autodeploy** box to disable App Platform from redeploying the app when it detects changes in the app’s repo.

Once you have selected the app’s repo and branch, click **Next**. App Platform retrieves your app’s code.

App Platform inspects the code and app resources, and selects an appropriate runtime environment (such as Node, or Ruby). If you need to override this, upload a [Dockerfile](https://docs.docker.com/engine/reference/builder/) to your branch and restart the app creation process.

## Resources[](#resources)

Resources are deployable runtime apps and databases. Each app resource contains a list of its components, which can be web services, workers, jobs, or static sites. Web services, workers, and jobs are built from source code repositories or container images and are hosted in containers. Static sites are built from a directory of static files and hosted on DigitalOcean’s CDN.

App Platform automatically detects and imports resources from selected repositories during creation.

## Configure Resource Settings[](#configure-component-settings)

Each component in an app has its own settings that determine its deployment configuration, including its instance size, build and run commands, and available HTTP ports. To configure the settings for a component, click **Edit** beside the component you want to change on the **Resource settings** table.

![App configuration options](https://docs.digitalocean.com/screenshots/app-platform/app-config-options.12ca98dc05f39b05fb91849e9fe38d3c116fc66f9aa1a1c19c2b4819afc5bc3c.png)

App Platform displays the settings for the component, several of which may be auto-filled by App Platform’s detection system. You can configure the following settings for your app:

*   **Name:** A unique name for the component.
    
*   **Resource Type:** The type of app to be deployed, either a web service, static site, or worker service. This field determines which additional configuration options are available for your app on this screen.
    
*   **Instance Size:** The amount of memory (RAM), number of CPUs, and bandwidth allocated to the component. You can select a size that uses either shared or dedicated CPUs. Shared CPUs share their processing power with other DigitalOcean users. Dedicated CPUs are dedicated solely to your app. We recommend dedicated CPUs for more resource-intensive applications that require consistent high performance and autoscaling.
    
*   **Containers:** You can also configure your app’s scaling settings in this section. Depending on what instance size you select determines the scaling options available to the component. For more information about scaling, see [How to Scale Apps in App Platform](/products/app-platform/how-to/scale-app/).
    
*   **Build Strategy:** Add a custom build command to run before the app is deployed. This is useful for compiling assets, installing dependencies, or running tests before deployment.
    
*   **Run Command:** For web and worker services only. You can specify custom run commands for the application to run after deployment. If no run commands are specified, the default run command for your app’s language is used, such as `npm start` for a Node.js app. For Dockerfile-based builds, entering a run command overrides the Dockerfile’s entrypoint.
    
*   **Public HTTP Port:** For web services only. The port that the app receives HTTP requests on. The default port is `8080`.
    
*   **Internal Ports:** For web services only. The port that the app receives internal requests on.
    
*   **HTTP Request Routes:** For web services and static sites only. The URL path where the app can be accessed, such as `your-app-v3cl4.ondigitalocean.app/api`. If not specified, the app is accessible from the provided hostname’s root.
    
*   **Output Directory:** For static sites only. An optional path to where the build assets are located, relative to the build context. If not set, App Platform automatically scans for these directory names: `_static`, `dist`, `public`, `build`.
    

App Platform uses cloud-native buildpacks to build your app and uses the buildpack’s default build and run commands. Refer to the [cloud-native buildpack reference](/products/app-platform/reference/buildpacks/) for more information about specific buildpacks.

## Environment[](#environment)

If your app requires environment variables, such as the app’s URL or database connection strings, you can define them in this section. These can be runtime and build time environment variables. We also provide several [app-specific dynamic environment variables](/products/app-platform/how-to/use-environment-variables/#using-bindable-variables-within-environment-variables) that the app can reference. App-level variables can be accessed by all resources in your app.

In the **App-level environment variables** box, click the corresponding **Edit** link to specify app-level or component-level environment variables. Click the **Encrypt** checkbox to obscure the variable’s values from all build, deployment, and application logs.

Once you configure the environment variables, click **Close**.

## Region[](#region)

In the **Region** section, you can choose the datacenter region to deploy your app into.

Click **Edit** beside the **Region** field to specify app’s datacenter region. For performance purposes, it is best to select the region geographically closest to the app’s user base.

You cannot select a region for static sites. Static resources are served on DigitalOcean’s [global CDN](/platform/regional-availability/#app-platform-availability).

## Finalize[](#finalize)

On the **Finalize** screen, you can specify that app’s name and project.

Enter the name of your app in the **Choose a unique app name** text box. The name can only contain lowercase alphanumeric characters and dashes.

Then, use the dropdown menu to select your app’s project.

Once you enter a name for your app and select a region, click **Create app**.

Once your app deploys, you can view the app at the URL at the top of the app’s **Overview** page.

![The app's provided URL above the Overview page](https://docs.digitalocean.com/screenshots/app-platform/app-url2.584c8d47bebf53cfc21cc06efea5ae9d1a4214620a44b379a9c0e530dbb7162d.png)