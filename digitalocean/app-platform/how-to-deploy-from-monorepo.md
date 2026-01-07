---
source: https://docs.digitalocean.com/products/app-platform/how-to/deploy-from-monorepo/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Deploy from Monorepos

Validated on 2 Jun 2022 • Last edited on 5 Jan 2026

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Note

You must have an [**Owner** or **Maintainer** permissions-role](https://docs.github.com/en/organizations/managing-peoples-access-to-your-organization-with-roles/roles-in-an-organization) in any GitHub repository that you want to access from App Platform.

## Deploy Using Monorepo as the Source[](#deploy-using-monorepo-as-the-source)

1.  Visit [the **Apps** page](https://cloud.digitalocean.com/apps) and click **Create App**.
    
2.  Select the GitHub repository that contains your source code and specify the branch or tag in your repository that contains your app’s source code.
    
3.  In the **Source Directory** field, specify the folder that contains the source. ![](https://docs.digitalocean.com/screenshots/app-platform/monorepo-source-dir.514e18af2b84a0006ae0ba25d0c234f35db7b88f8093886727a12388652de192.png)
    
    If your app needs to access files outside of its subdirectory at runtime, use `/` as the source directory.
    
    At the beginning of the build, the entire repo is cloned to `/workspace`. When you specify a source directory, it is used as the working directory for the entire build instead of `/workspace`. Files outside of the selected source directory are accessible only during the build. At runtime, only files inside the source directory are accessible. Therefore, if your app needs to access files outside its subdirectory at runtime, you should not specify a source directory and instead adjust the build and run commands using `cd <subdirectory>` directives as needed.
    
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

## Deploy Apps from Node.js Monorepo[](#deploy-apps-from-nodejs-monorepo)

For Node.js monorepos, you need to configure the build and run commands as follows when creating the app:

*   For YARN Workspaces:
    
    1.  Edit the **Build Command** section and add the following:
    
        cd <path-to-source-subdirectory>
        yarn build
    
    2.  Edit the **Run Command** section and add the following:
    
        cd <path-to-source-subdirectory>
        yarn serve
    
*   For Lerna and npm, Lerna and YARN, or Lerna and YARN Workspaces:
    
    1.  Add `lerna bootstrap` to the `scripts` property in the `package.json` file:
    
        "scripts": {
            "bootstrap": "lerna bootstrap",
            "postinstall": "lerna bootstrap"
        }
    
    2.  Edit the **Build Command** section and add the following:
    
        yarn bootstrap
        cd <path-to-source-subdirectory>
        yarn build
    
    3.  Edit the **Run Command** section and add the following:
    
        cd <path-to-source-subdirectory>
        npm run serve
    

![](https://docs.digitalocean.com/screenshots/app-platform/monorepo-build-run-cmds.028d1ff4c5c24090bbe89d065e0b94159c6d0836bb6a00e3ebe15bbfbcc13395.png)

## Sample Monorepos[](#sample-monorepos)

We provide the following sample monorepos that you can deploy using App Platform:

*   [`sample-monorepo`](https://github.com/digitalocean/sample-monorepo): A sample monorepo GitHub repository where each subdirectory is an independent app.