---
source: https://docs.digitalocean.com/products/app-platform/getting-started/deploy-sample-apps/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# Deploy Sample Apps to App Platform

Validated on 12 Aug 2024 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform offers sample applications that you can add to your GitHub account and then deploy on App Platform. Each app deploys a basic “Hello, world!” style website that you can view in your browser after deployment. This can help you learn how App Platform works and test different languages on the service.

Along with the application itself, each app contains a [spec file](/products/app-platform/reference/app-spec/) and a [file native to its programming language](/products/app-platform/details/intro-faq/#how-does-app-platform-work) that App Platform uses to detect the app’s language. For example, in the [Node.js sample app](https://github.com/digitalocean/sample-nodejs/blob/main/README.md), App Platform uses the app spec file (`.do/app.yaml`) to configure the app for deployment, and the `package.json` file to determine that the app uses the Node.js framework. These files are important for understanding how App Platform works.

For a list of available languages, see our [list of sample apps](#sample-app-list).

## Deploy a Sample App[](#deploy-a-sample-app)

To deploy a sample app in App Platform, open the [DigitalOcean Control Panel](https://cloud.digitalocean.com), click the **Create** button, and then select **Apps** from the drop-down menu.

On the **Create resources from source** screen, select the **Sample app** tab.

![A screenshot of the control panel with the Create new repository option selected.](https://docs.digitalocean.com/screenshots/app-platform/app-fork-deploy-frameworks.f9a699a66603b389036d2def28cc9c612c7e02121727f1561afa888d725da4b5.png)

In the **Choose popular languages or frameworks** section, select the language of the sample app you want to deploy. You can use the search bar to locate specific language or framework options.

Once you’ve chosen an app, in the **Clone or deploy from source repository** section, select whether to create a new repository in your GitHub account with the sample app, or deploy the app directly from the sample app’s repository. We recommend creating a new repository for the app so that you can customize it later and redeploy it as needed.

 Create new repository

If you choose to create a new repository, click the **Create New Repository** option. GitHub prompts you to select an owner and name for the repository in a new window. Once you’ve configured these settings, click **Create Repository** in GitHub. This creates a new repository in your GitHub account from DigitalOcean’s template repo and the sample app is now stored in your account.

![A screenshot of the control panel with the GitHub option selected and the new sample app repo selected under Repository](https://docs.digitalocean.com/screenshots/app-platform/app-sample-app-repo-selection.4e147e40a7000b9cb012e2eae2644d8d818b5a7a2be7dace642f91bd97aa1dce.png)

Once you’ve created the repository, return to the **Create App** page, refresh it, and then select **GitHub** from the **Service Provider** list. The new sample app repository is now available as an option in the **Repository** field and you can continue to create the app using the normal workflow.

 Deploy directly from template repository

If you choose to the **Deploy directly from template repository** option, the app deploys directly from the sample app’s repository and you do not need to provide any additional information.

Once you’ve selected your option, click **Next**.

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

## List of Available Sample Apps[](#sample-app-list)

We offer sample apps for the following languages and frameworks. Each link opens the sample app’s repository in GitHub.

We provide the following sample apps:

*   [Docker](https://github.com/digitalocean/sample-dockerfile/blob/main/README.md)
*   [Asp .Net using Docker](https://github.com/digitalocean/sample-aspnet/blob/main/README.md)
*   [Spring Boot using Docker](https://github.com/digitalocean/sample-spring-boot/blob/main/README.md)
*   [Express.js](https://github.com/digitalocean/sample-expressjs/blob/main/README.md)
*   [Flask](https://github.com/digitalocean/sample-flask/blob/main/README.md)
*   [Gatsby](https://github.com/digitalocean/sample-gatsby/blob/main/README.md)
*   [Go](https://github.com/digitalocean/sample-golang/blob/main/README.md)
*   [Gin](https://github.com/digitalocean/sample-gin/blob/main/README.md)
*   [Hugo](https://github.com/digitalocean/sample-hugo/blob/main/README.md)
*   [Laravel](https://github.com/digitalocean/sample-laravel/blob/main/README.md)
*   [Next.js](https://github.com/digitalocean/sample-nextjs/blob/main/README.md)
*   [Node.js](https://github.com/digitalocean/sample-nodejs/blob/main/README.md)
*   [Nuxt.js](https://github.com/digitalocean/sample-nuxtjs/blob/main/README.md)
*   [PHP](https://github.com/digitalocean/sample-php/blob/main/README.md)
*   [Python](https://github.com/digitalocean/sample-python/blob/main/README.md)
*   [React](https://github.com/digitalocean/sample-react/blob/main/README.md)
*   [Ruby](https://github.com/digitalocean/sample-ruby/blob/main/README.md)
*   [Static assets](https://github.com/digitalocean/sample-html/blob/main/README.md)
*   [Ruby on Rails](https://github.com/digitalocean/sample-rails/blob/main/README.md)
*   [Apt](https://github.com/digitalocean/sample-apt-golang/blob/main/README.md)