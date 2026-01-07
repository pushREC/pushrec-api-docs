---
source: https://docs.digitalocean.com/products/app-platform/getting-started/deploy-etherpad/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# Deploy the Etherpad Collaborative Web Editor to App Platform

Validated on 29 Sep 2021 • Last edited on 23 Jan 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

[Etherpad](https://etherpad.org/) is an open-source web application that enables real-time collaborative text editing in the browser. It is written in Node.js and can use a variety of databases for its backend storage. This tutorial will show you how to deploy the official Etherpad Docker image to [DigitalOcean’s App Platform](https://www.digitalocean.com/products/app-platform/) and connect it to a [managed PostgreSQL database](https://www.digitalocean.com/products/managed-databases-postgresql/).

In this tutorial, you will:

1.  Create a new App Platform App
2.  Create a PostgreSQL database
3.  Configure Etherpad to connect to the database
4.  Deploy Etherpad and the database
5.  Learn more about customizing and configuring the Etherpad app

## Prerequisites[](#prerequisites)

Before starting this tutorial you will need:

*   a DigitalOcean account. To create a new account, go to the [DigitalOcean account registration page](https://cloud.digitalocean.com/registrations/new). To log in to an existing account, visit our [login page](https://cloud.digitalocean.com/login) instead.

## Step 1: Creating a New App on App Platform[](#step-1-creating-a-new-app-on-app-platform)

First, go to the [new app page](https://cloud.digitalocean.com/apps/new) of the DigitalOcean Control Panel. You can also get there by clicking on the **Apps** tab in the left menu, then create a new app.

You will be prompted to select the source for your application. You’ll be using a Docker image that is published to Docker Hub, so click **Docker Hub**.

![Control panel interface indicating step 1 of 4. 'Choose Source' is the headline and there are options for GitHub, GitLab, and Docker Hub. 'Docker Hub' is highlighted](https://docs.digitalocean.com/screenshots/app-platform/etherpad-tutorial/1-choose-source-start.8cc4966bbbc9a6000971d313652c9bdc591c0c795c510c837b048ff6ac3c6904.png)

You will then be asked for details about which Docker repository and tag to use. Fill in `etherpad/etherpad` as the **Repository** and leave the **Tag** field blank to default to the `latest` tag:

![Control panel interface with text boxes for 'Repository' and 'Tag' information](https://docs.digitalocean.com/screenshots/app-platform/etherpad-tutorial/2-choose-source-docker.723fcea03b0e69bf2b3f3ef5158f7139c6c1ddf44cfd296029145663e29a8a60.png)

Click **Next** to continue to the next step, where you’ll add a database and configure your app.

## Step 2: Adding a Database and Configuring the Etherpad App[](#step-2-adding-a-database-and-configuring-the-etherpad-app)

In this step you’ll add a managed PostgreSQL database to your app, then add environment variables to the app’s Etherpad component to tell it how to connect to the database.

You should be at the “Configure your app” screen at this point:

![Control panel interface, step 2 of 4, headline is 'Configure your app'. There are configuration options for a container image, and a button at the bottom for 'Add a Database'](https://docs.digitalocean.com/screenshots/app-platform/etherpad-tutorial/3-configure-your-app.f3960982da84efe7291110e7af423e1c8ed3f13e2e58f477e4419f6559310513.png)

First, click the **Add a Database** button.

A database configuration screen will pop up. The defaults are fine for now. This will create a development database called `db`. It will be sufficient for light use, and you can always upgrade in the future.

Press **Add Database** to finish your selection and return to the configuration screen.

Next, click **Edit** in the **Environment Variables** section of your container component:

![Control panel interface, the 'Edit' button in the 'Environment Variables' section is highlighted](https://docs.digitalocean.com/screenshots/app-platform/etherpad-tutorial/4-configure-env.af9669f8be3735677eba9c4c8d4a01fcd054ceecbb5474180574499a1ab24e4d.png)

You’ll be presented with a text box for **Keys** and a text box for **Values**. Click the **+** plus symbol on the right to add more key/value text boxes, then fill in the keys and values for the following eight environment variables:

Key

Value

Explanation

`TRUST_PROXY`

`true`

Sets up correct headers and logging when Etherpad is behind a load balancer or proxy

`PGSSLMODE`

`no-verify`

Allows Etherpad to connect to databases with self-signed SSL certificates

`DB_TYPE`

`postgres`

Sets the database type to PostgreSQL

`DB_HOST`

`${db.HOSTNAME}`

Sets the database hostname

`DB_PORT`

`${db.PORT}`

Sets the database port number

`DB_USER`

`${db.USERNAME}`

Sets the database username

`DB_PASS`

`${db.PASSWORD}`

Sets the database password

`DB_NAME`

`${db.DATABASE}`

Sets the database name

Note the use of special [App Platform _bindable variables_](/products/app-platform/how-to/use-environment-variables/#using-bindable-variables-within-environment-variables) such as `${db.HOSTNAME}`. These are variables that allow App Platform to reference dynamic values during build and deployment. In this case, App Platform will automatically inject the correct database information into the environment variables that Etherpad needs to configure its database connection.

After you’ve filled in all eight environment variables, scroll down to the bottom of the page and click **Next** to continue to step 3.

## Step 3: Name the App and Choose a Region[](#step-3-name-the-app-and-choose-a-region)

In step 3 of the workflow you’ll name your app and choose which datacenter region to use.

By default your Etherpad service will have an auto-generated name based on the Docker image name, in this case `etherpad-etherpad`. You may change this to something more meaningful, or leave it as is.

Next, pick the datacenter region you’d like to deploy to. The default region shown in the drop-down will be nearest to your current location.

When you’re done selecting, click **Next** to move to the final deployment step.

## Step 4: Finalizing Details and Deploying Etherpad[](#step-4-finalizing-details-and-deploying-etherpad)

You’ll now need to choose your App Platform plan and your container sizes, then deploy the app.

The default **Basic** plan should be fine for now, and you can always upgrade later. Compare the available features and choose your plan.

Next, choose your container size. The default install of Etherpad should run fine in a container with 512MB of RAM, but additional plugins or traffic may require more memory and CPU power. This setting can be changed later as well.

Review the monthly cost, then click the **Launch Basic App** button to complete the process.

You’ll be taken to the new app’s dashboard, and should see a status notification with build information in it. Your app container will be created, then your database, and eventually the status will update to indicate a successful deployment:

![Dashboard interface of a successfully deployed app, with the app name and a green 'success' status box. A 'Live App' button is highlighted](https://docs.digitalocean.com/screenshots/app-platform/etherpad-tutorial/5-deployed.b7bbdd1c1d35cd7e1f1b6a702fca6efed2b259ba020df3def3b47022466b58bd.png)

You can click your app’s URL or the **Live App** button to open your new Etherpad instance in your browser:

![The Etherpad app index page with a 'New Pad' button and a textbox for creating a named pad](https://docs.digitalocean.com/screenshots/app-platform/etherpad-tutorial/6-etherpad-index.d0a3fcffe022fd7641af6003c8af23ad35dff417c7a99bb147151d9ed5e429aa.png)

With that, you’ve successfully deployed Etherpad on App Platform. Next we’ll look at how to customize Etherpad.

## Step 5: Customizing Etherpad with Environment Variables[](#step-5-customizing-etherpad-with-environment-variables)

The official Etherpad Docker image exposes many configuration options via environment variables. The [Etherpad docker image documentation](https://github.com/ether/etherpad-lite/blob/develop/doc/docker.adoc) lists all the available options, including the ability to customize the visual theme and install [Etherpad plugins](https://static.etherpad.org/index.html).

To update your environment variables, first go to the **Settings** tab of your app. Click your Etherpad component, then click **Edit** next to **Environment Variables**:

![Control panel interface, highlighting the 'Edit' button in the 'Environment Variables' section of the app settings](https://docs.digitalocean.com/screenshots/app-platform/etherpad-tutorial/7-settings-environment-variables.80e98e94d6e16013b4bd5ab1a02105407fcdf700beb38f220bd3798a324828e4.png)

Try updating the title of your Etherpad instance by setting a `TITLE` environment variable:

![Environment variable configuration interface, with a new 'TITLE' variable and 'Sammy's Pad' as the associated value](https://docs.digitalocean.com/screenshots/app-platform/etherpad-tutorial/8-environment-variables-save.968a084a697448b789a6c1172c04d9a91fb9936d06fe614e999516861a013bc9.png)

Press **Save**. The variable will be saved and your Etherpad container will be re-deployed. After reloading Etherpad in your browser, you should see an updated title in your browser window.

## Summary[](#summary)

In this tutorial you:

*   deployed the Etherpad Docker image to App Platform
*   created a PostgreSQL database
*   created environment variables to configure Etherpad’s database connection
*   connected to your live Etherpad instance with your browser
*   learned how to further customize Etherpad through environment variables

## What’s Next?[](#whats-next)

Your Etherpad app is ready to be used, but there are a few additional steps you may want to take soon:

*   If you want to replace the temporary `https://etherpad-etherpad-2ybz7.ondigitalocean.app/` domain with your own, take a look at our [How to Manage Domains in App Platform](/products/app-platform/how-to/manage-domains/) documentation.
*   To further customize Etherpad, please visit their [Etherpad docker image documentation](https://github.com/ether/etherpad-lite/blob/develop/doc/docker.adoc) to find a list of every configurable environment variable.
*   To upgrade your database to something more production-ready, see the [Upgrade Dev Database](/products/app-platform/how-to/manage-databases/#upgrade-dev-database-to-managed-database) section of our App Platform database documentation.

Finally, for more information on Etherpad itself, beyond Docker-specific configuration, please visit the [Etherpad wiki on GitHub](https://github.com/ether/etherpad-lite/wiki).