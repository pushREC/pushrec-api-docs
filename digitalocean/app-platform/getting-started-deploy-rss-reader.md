---
source: https://docs.digitalocean.com/products/app-platform/getting-started/deploy-rss-reader/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 Deploy a Sample RSS Reader to App Platform

Validated on 31 May 2024 • Last edited on 17 Jun 2024

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App-Platform allows you to deploy and host web applications and websites by pulling code directly from your repository service, such as GitHub. This tutorial’s purpose is to help familiarize you with how App Platform deploys multi-component applications from a repo service.

In this tutorial, you will:

*   Deploy a Django-based API backend for an RSS reader using App Platform
*   Configure the app’s backend API
*   Add a frontend React component that serves as the app’s UI

## Prerequisites[](#prerequisites)

*   Fork the [RSS reader’s API app](https://github.com/do-community/rss-reader-api) into your GitHub account
*   Fork the [RSS reader’s frontend app](https://github.com/do-community/rss-reader-frontend) into your GitHub account

## Step 1: Deploy RSS Reader API[](#step-1-deploy-rss-reader-api)

To begin deploying the RSS reader app, you need to deploy its backend API first. The API receives user and RSS subscription information in the final app.

To start deploying the API from the [DigitalOcean Control Panel](https://cloud.digitalocean.com), click **Create** and then select **App Platform**.

On the **Create Resource From Source Code** screen, select GitHub, then select the `rss-reader-api` repo that you forked into your GitHub account from the **Repository** menu (`<username>/rss-reader-api`). If this is your first time using App Platform with GitHub, GitHub prompts you to give DigitalOcean read access to the repository.

Leave the **Branch** selection as **main** and make sure **Autodeploy** is checked, then click **Next**.

### Configure the API Component[](#configure-the-api-component)

App Platform detects the API and displays it as a component of the app on the **Resources** page. Here, you can configure various properties of the app and its container, including its resource size, run commands, and HTTP port.

The API component requires a custom name, a run command to build a temporary working directory, and an HTTP route for the API to listen on. To add these things, click the **Edit** button beside the component.

In the **Name** section, click **Edit** and enter the following name into the field:

    rss

In the **Run Command** section, enter the following command into the **Run Command** field:

    gunicorn --worker-tmp-dir /dev/shm rss_reader.wsgi

In the **HTTP Request Routes** section, enter following route into the **Routes** field:

    /api

Once you have updated the app’s configuration, click the **Back** button.

### Add Database[](#add-database)

The app requires a PostgreSQL database to store RSS URLs and user credential information. To add a database, click **Add Resource (Optional)**, select the **Database** option, and then click **Add**. On the **Configure your database** page, ensure the **Dev Database** option is selected and leave the name of the database as `db`. Then click **Create and Attach**.

This automatically adds a `DATABASE_URL` variable to the component’s configuration with the database connection string. The app uses the variable to connect to the database.

After adding the database, leave the rest of the options on their default settings and then click **Next**.

### Configure Environment Variables[](#configure-environment-variables)

The RSS reader app requires environment variables to configure the app with its URI path information, the hostnames allowed to access the API, and whether the app runs in debug mode or not.

To add the necessary environment variables on the **Environment** page, click **Edit** beside the `rss` component and add the following keys and values to their respective fields.

KEYS

VALUES

`DEBUG`

`False`

`DJANGO_ALLOWED_HOSTS`

`${APP_DOMAIN}`

`APP_PLAT_ROUTE`

`/api`

The `${APP_DOMAIN}` value is a [bindable placeholder variable](/products/app-platform/how-to/use-environment-variables/#using-bindable-variables-within-environment-variables) that provides the component with the app’s public URL information.

Once you have entered the variables, click **Save** and then click **Next**.

### Deploy the API and Database Components[](#deploy-the-api-and-database-components)

On the **Info** screen, you can change the app’s name, project, and region. Once you have reviewed these settings, click **Next**.

On the **Review** screen, review the app’s configuration and then click **Create Resources**.

The app begins to deploy onto DigitalOcean and a progress bar appears at the top of the app’s dashboard screen.

## Step 2: Configure the RSS App API[](#step-2-configure-the-rss-app-api)

Once the app has deployed, set up the tables in the app’s database that store the user credentials you will use to access the app and the RSS feed subscription information that you will input into it. We have provided a Python script in the app that migrates the necessary tables into the database.

To migrate the necessary tables into the app’s database, click the **Console** tab from the app’s dashboard. The console connects you to the app environment’s command line where you can further configure it.

To migrate the necessary tables into the database, run:

    python manage.py migrate

The script applies several updates to the app’s database.

After the tables have migrated, you can verify that they migrated correctly by logging in to the database and listing the tables using the PostgreSQL shell. To do this, run the following command in the console:

    python manage.py dbshell

Once logged in to the database cluster, the command prompt changes to `db=>`. To verify that the database tables migrated correctly, run the following command to connect to the `db` database:

    \c db

Then run:

    \dt

The command returns a list of tables in the `db` database like this:

    List of relations
    Schema |            Name            | Type  | Owner 
    --------+----------------------------+-------+-------
    public | auth_group                 | table | db
    public | auth_group_permissions     | table | db
    public | auth_permission            | table | db
    public | auth_user                  | table | db
    public | auth_user_groups           | table | db
    public | auth_user_user_permissions | table | db
    public | authtoken_token            | table | db
    public | django_admin_log           | table | db
    public | django_content_type        | table | db
    public | django_migrations          | table | db
    public | django_session             | table | db
    public | rss_category               | table | db
    public | rss_rssfeed                | table | db
    public | rss_rssfeed_categories     | table | db
    (14 rows)

Run `\q` to exit the database prompt and return to the app’s command line.

Next, create a super user that you can log in to the app with. From the command prompt, run the Python script again with the `createsuperuser` argument:

`python manage.py createsuperuser`

The app prompts you for your email address and to create a new password.

Once you’ve created a super user, you can verify the API component’s configuration by logging in to it with the username and password you created. To log in to the API component, click the app’s URL at the top of the dashboard and then add `/admin` to the end of the URL path. The final URL should look like this: `https://<default-app-url>.app/api/admin`

This opens the app’s administration page.

![The app's login page with user fields filled out](https://docs.digitalocean.com/screenshots/app-platform/app-rss-tutorial-login.b82864eb7723a86dfd0e5af9fd91819eddba54e4d731122215a8c7014b942ea9.png)

On the administration page, enter the super user credentials you created in the prior step, then click **Log In**. A rough, text-version of the app loads in your browser.

![A rough text version of the app in-browser](https://docs.digitalocean.com/screenshots/app-platform/app-rss-tutorial-rough.4a03c9ef5a15b2a2c6d28a66363cf742162680566e2ad5caa095fff7c8cd08df.png)

## Step 3: Deploy Front End Component[](#step-3-deploy-front-end-component)

On App Platform, you can add and deploy additional components of your app at anytime. The next steps outline how to add a React static website that connects to the API component you deployed in the previous section.

To deploy the static site from the app’s dashboard page in the control panel, click the blue **Create** button and then select **Create Resources From Source Code**.

On the **Create Resource From Source Code** page, click **GitHub**, then select the `<your-username>/rss-reader-frontend` repository from the **Repository** menu. Leave the branch field as **master**, then click **Next**.

On the **Resources** page, click **Edit** beside the `rss-reader-frontend` component. On the component’s settings page, change the name of the component to:

    frontend

Then change the **Resource Type** to **Static Site** and update the **HTTP Request Routes** field to:

    /

These changes deploy the site as a static site and place it at the root of the subdomain provided to the app.

Once you’ve changed and saved the settings, click **Back** and then click **Next** to review the app’s environment variables.

![The Configure your static site page with the applicable fields filled out](https://docs.digitalocean.com/screenshots/app-platform/app-rss-tutorial-frontend-config.f808ae16118878b5052b742aed5acab5e692ca20633792c64bf755f852316d99.png)

On the **Environment** screen, click **Edit** beside the `frontend` component and then add a variable called `REACT_APP_API_URL` with a value of `${rss.PUBLIC_URL}`. Once you’ve saved the variable, click **Next**.

On the **Review** screen, review the component’s configuration and then click **Create Resources**. The app deploys with the new component.

## Step 4: Verify that the Site Works[](#step-4-verify-that-the-site-works)

Once the static site has finished deploying, verify that it works by clicking the app’s URL at the top of the dashboard.

![Complete RSS app in browser at login screen](https://docs.digitalocean.com/screenshots/app-platform/app-rss-tutorial-frontend-login.310a3e7de09b5301a40652d9365780d84301933735f7bb9e521f4e0f01ec6cc1.png)

On the login page, log in to the RSS reader using the user credentials you created in Step 2.

Once logged in to the app, click the **SUBSCRIBE** button and paste an RSS feed (such as DigitalOcean’s blog RSS feed `https://www.digitalocean.com/blog/rss/?`) into the **Add a Feed** field, then click **SUBSCRIBE**.

A link to the RSS feed appears on the app’s home page. Click the link to view an RSS feed from the URL you specified.

![Complete RSS app in browser with DigitalOcean RSS feed displayed](https://docs.digitalocean.com/screenshots/app-platform/app-rss-tutorial-frontend-result.928563422a7b1aa1375db31b5e2f89472e5b4ddd0fe015928f21d7b1da5532ed.png)

## Summary[](#summary)

In this tutorial, you:

*   Deployed a backend API with a PostgreSQL database onto App Platform.
*   Imported tables into the database to receive, store, and send data.
*   Configured environment variables to connect a frontend UI to the backend API.
*   Deployed the frontend UI to App Platform.

Any changes you commit and push to your repository trigger a new deployment.

While this RSS reader app is a rudimentary example and your app may have a broader scope, the deployment process remains relatively the same as the steps taken in this tutorial.

## What’s Next?[](#whats-next)

Once you have deployed the RSS reader app and used it, you can [delete the application](/products/app-platform/getting-started/quickstart/#destroy-an-app) or [deploy other sample applications](/products/app-platform/reference/buildpacks/).