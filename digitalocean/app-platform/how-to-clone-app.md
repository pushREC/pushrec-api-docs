---
source: https://docs.digitalocean.com/products/app-platform/how-to/clone-app/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Clone Apps in App Platform

Validated on 9 Dec 2025 • Last edited on 10 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

You can clone an existing App Platform app to duplicate its configuration and components, making it easier to deploy the app to a different environment.

To clone an app, in the [**Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps), select the app you want to clone. Click the **Actions** menu and choose **Clone app**.

![The Actions menu dropdown list with the Clone app option highlighted.](https://docs.digitalocean.com/screenshots/app-platform/actions-clone-app.6c80ad986d1e0a6fe1efe5ac0560b0841fd9f2eae90f949f7d9df1eb408664d1.png)

## Resource Settings[](#resource-settings)

On the **Clone App** screen, the **Resource settings** table shows the settings copied from the original app. Click **Edit** beside any item you want to update.

![The resource settings that were copied over from the original app.](https://docs.digitalocean.com/screenshots/app-platform/clone-app-resource-settings.e9f01a3e67af9f7eff08b5036a7e3ff8324ccebcdca9a81ada453b0091283724.png)

You can update the following settings:

*   **Name:** A unique name for the resource.
    
*   **Instance size and scaling:** Adjust CPU, memory, and autoscaling for the new environment.
    
*   **Build and run commands:** Optional commands to run before or after deployment. Dockerfile apps can override the entrypoint here.
    
*   **Output directory:** For static sites. Specify the path where build assets are located.
    
*   **Ports and routes:** Set public and internal ports and URL paths for web services or static sites.
    
*   **Environment variables:** Set any runtime or build-time variables needed for the cloned app, such as database connection strings, API keys, or the app’s URL. **Encrypted variables are not copied** and must be set up again.
    

## Database Configuration[](#database-configuration)

The database configuration is copied from the original app. Click **Edit** to update any settings that differ for the new environment.

We recommend managed databases for production use. If needed, you can add a managed database after cloning the app. For more information, see [How to Manage Databases in App Platform](/products/app-platform/how-to/manage-databases/).

## App-Level Environment Variables[](#app-level-environment-variables)

When you clone an app, app-level environment variables are copied except for **encrypted values**, which must be set up again.

Click **Edit** to update environment-specific variables, such as database connection strings, API keys or tokens, feature flags, or environment-specific URLs.

Verify that all sensitive credentials and environment-specific variables are correctly set for the cloned app to ensure it runs in the intended environment.

## Datacenter Region[](#datacenter-region)

When you clone an app, the datacenter region and the VPC network setting are copied from the original app.

You can select a different datacenter region if the cloned app runs in a different environment or serves a different user base. To optimize performance and reduce latency, choose a region geographically closest to the cloned app’s end-users.

You can update the VPC network setting if the cloned app belongs to a different environment, needs to connect to resources in a different VPC, or needs to be isolated from the original app’s network.

## Finalize[](#finalize)

In the **Choose a unique app name** field, type a name for the app.

In the **Select a project** dropdown menu, you can select an existing project or create a new project. If you create a new project, you have the option of adding a different environment.

![The Finalize area with an example project tagged as development selected.](https://docs.digitalocean.com/screenshots/app-platform/finalize-app.bb9cfb944ea31e2a653cbf5356e2dbe84a3da9e3f5390a38e16e91b0c777a8d3.png)

After you choose a name and project, review the **Summary** box, and then click **Clone App**. App Platform creates the cloned app using the selected settings and deploys it automatically.

After the cloned app deploys, you can view it using the URL at the top of the app’s **Overview** page. To add a database, click **Add components**, then choose **Create or attach database**.