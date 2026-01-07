---
source: https://docs.digitalocean.com/products/app-platform/getting-started/quickstart/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# App Platform Quickstart

Validated on 3 May 2021 • Last edited on 5 Jan 2026

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## Create an App[](#create-an-app)

1.  Go to [DigitalOcean Control Panel](https://cloud.digitalocean.com/apps) and click **Create App**.
    
2.  Select the source for your app. You can choose a GitHub, GitLab, or Bitbucket repository. You can also select a container image you [uploaded to DigitalOcean Container Registry](/products/container-registry/getting-started/quickstart/), Docker Hub, or GitHub Container Registry. When the source is a GitLab respository, to prevent a cloning error, you must first [enable HTTPS and SSH protocols](https://docs.gitlab.com/administration/settings/visibility_and_access_controls/#configure-enabled-git-access-protocols) on it.
    
3.  Select the repository that contains your source code and specify the branch or tag in your repository that contains your app’s source code.
    
    *   For a monorepo, specify the folder that contains the source. See [Deploy from a Monorepo](/products/app-platform/how-to/deploy-from-monorepo/) for more information on how App Platform builds apps from monorepos.
    
    App Platform inspects the code and app resources, and selects an appropriate runtime environment (such as Node, Ruby, etc). If you need to override this, upload a [Dockerfile](https://docs.docker.com/engine/reference/builder/) to your branch and restart the app creation process.
    
    If you’d like to automatically re-deploy your app when pushing to this branch/tag, select **Autodeploy** and click **Next**.
    
4.  Configure resources for your app.
    
    *   On the **Resources** page, click the **Edit** link beside app resource components to configure their details such as the component’s instance size (the container size and its cost), HTTP routes, the run command, or the HTTP port. App Platform displays build and run commands that it detected, which you can customize as needed. Refer to the cloud-native buildpacks for instructions for specific buildpacks. For Dockerfile-based builds, entering a run command overrides the Dockerfile’s entrypoint.
    *   Add additional resources by expanding the **Add Resource (Optional)** section and selecting the **Detect from Source Code** option. Then, click **Add**. If your app needs a database, select the **Database** option to add a dev database or an existing managed database from your DigitalOcean account. The connection details for your database are accessible via environment variables so that you can access them in your code.
    
    Click **Next**.
    
5.  If you want to use resource- and app-level environment variables, on the **Environment** page, click **Edit** to supply them. Click the **Encrypt** checkbox to ensure a variable’s value is encrypted in the App Spec. Click **Next**.
    
6.  If you want to change the default name or project for your app, or choose the region where you would like your app to be hosted, click **Edit** on the **Info** page. Click **Save** and then click **Next**.
    
    *   The option to select a region is not available for static sites. Static components are served on DigitalOcean’s [global CDN](/platform/regional-availability/#app-platform-availability).
7.  Review your app’s resources, environment variables and billing information on the **Review** page and then click **Create Resources**.
    

Once your app deploys, you can view the app at the URL at the top of the app’s **Overview** page.

## Scale an App[](#scale-an-app)

1.  Go to [https://cloud.digitalocean.com/apps](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab.
2.  Click the resource you’d like to scale and click the **Edit** link next to the **Scaling** heading.
3.  Scale your application horizontally by increasing the number of containers, or vertically by increasing the container size.
4.  Click **Save**.

## Add a Database to an App[](#add-a-database-to-an-app)

1.  Go to [https://cloud.digitalocean.com/apps](https://cloud.digitalocean.com/apps) and click your app.
2.  Click the **Create** button and choose the **Create/Attach Database** option.
3.  Give your database a name, select an engine, and select a plan.
4.  Click **Create and Attach**.
5.  View connection details for your database by clicking on your new database resource.

## Register a Custom Domain[](#register-a-custom-domain)

1.  Go to [https://cloud.digitalocean.com/apps](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab.
2.  Then click the **Edit** link to the right of **Domains**, then click **Add Domain**.
3.  Enter your domain name at the top of the screen, then follow the onscreen instructions to create a CNAME record with your DNS provider.
4.  Click **Add Domain**.

## Destroy an App[](#destroy-an-app)

1.  Go to [https://cloud.digitalocean.com/apps](https://cloud.digitalocean.com/apps), and click your app.
2.  Click the **Settings** tab, and scroll down to the red **Destroy** button.
3.  Enter the app name to confirm you’d like to delete the app and all its associated resources. Then click **Destroy**.