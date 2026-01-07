---
source: https://docs.digitalocean.com/products/app-platform/how-to/connect-pg-pools/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Connect PostgreSQL to Connection Pools in App Platform

Validated on 6 Jan 2023 • Last edited on 3 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Note

Connecting your App Platform app to a database connection pool is currently only available for PostgreSQL databases.

Instead of forcing database clients to open and close connections each time they send a request, you can set up connection pools that allow clients to open a set number of connections, keep them open, and reuse them over the course of their session with the database. This helps reduce latency, lower resource usage, and create parallelism in your application.

You can create connection pools for your application in App Platform using PostgreSQL and bindable environment variables.

Before adding a PostgreSQL database with a connection pool to your app, you need to complete the following:

*   [Deploy your app](/products/app-platform/how-to/create-apps/) on App Platform.
*   [Create a PostgreSQL database](/products/databases/postgresql/how-to/create/).
*   [Add a connection pool](/products/databases/postgresql/how-to/manage-connection-pools/#creating-a-connection-pool) to the database.

Once you have completed these prerequisites, you can add the database as a component of your app.

## Add Database as a Component[](#add-database-as-a-component)

To add the database as a component of your app, in the [**Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps), click your app. Click **Add components**, then choose **Create or attach database**.

![Create component menu open with Create Attach Database option selected.](https://docs.digitalocean.com/screenshots/app-platform/add-component-create-attach-DB.e92a42eb1f8f3134fb6f57d7a5dc6ae7c6cbb8541fef02cd85c5340e39645c73.png)

On the **Create or attach a database** page, select **Attach existing DigitalOcean database**. In the **Database Cluster** dropdown menu, select the database cluster with the connection pool. After you select the target database, additional dropdown menus appear.

![Configure database page with Previously Created DigitalOcean Database option selected and fields filled out.](https://docs.digitalocean.com/screenshots/app-platform/create-attach-DB.255b1104dcfd739b3dfb3d23db99f307d7fc8861ab7d2bb0e4a58cab6d57f560.png)

Click the **Database** dropdown menu, then select the database that you want the application to connect to. In the **User** dropdown menu, select the database user that you want the application to connect to the database with. After configuring these settings, click **Attach Database**. App Platform redeploys your app with the attached database.

## Configure Bindable Environment Variables[](#configure-bindable-environment-variables)

Once the app redeploys, you can define environment variables that your application can use to connect to the database and its pool. App Platform provides [several bindable environment variables](/products/app-platform/how-to/use-environment-variables/#app-wide-variables) that contain sensitive information about your app and its components. For example, you can use the `${your_database_name.DATABASE_URL}` bindable variable to create an environment variable that contains your database’s URL information. This section explains how to set up bindable environment variables for your database’s URL and the connection pool’s URL.

To add environment variables to your application, first go to the [DigitalOcean Control Panel](https://cloud.digitalocean.com/apps) and select your app from the Apps screen.

From the app’s **Overview** page, click the **Settings** tab and then scroll down to the **App-Level Environment Variables** section.

![App-Level Environment Variables section with new environment variables added.](https://docs.digitalocean.com/screenshots/app-platform/app-db-env-variables.0b9bde9ceea5cd0c036ab626ab56b179633285fafc3232e9a1022178fda79d06.png)

In the **Keys** field, enter a name for the database’s URL environment variable. The name can be anything. In the **Values** field, enter the bindable variable value for the database’s URL in the following syntax, substituting the `your_database_name` placeholder value with your database’s name:

    ${your_database_name.DATABASE_URL}

For example, if your database’s name is `example-db`, the variable value would be:

    ${example-db.DATABASE_URL}

Once you’ve enter the values for each field, click the **+** button to add a second variable.

In **Keys** field, enter a name for the variable. In the **Values** field, enter the value of your database connection pool in the following syntax:

    ${your_database_name.your_database_connection_pool_name.DATABASE_URL}

Once you’ve entered the values for each field, click **Save**. This redeploys the app with the new environment variables.

To verify that the environment variables are now available and referencing the correct information about your database, scroll back to the top of the **Settings** page and then click the **Console** tab.

From the console’s command line, use the `echo` utility to call the variables using the values you entered into the **Keys** fields in the prior step:

    echo $your_database_URL_variable_name $your_database_connection-pool_variable_name

For example, if you named your database URL variable `DATABASE_URL` and the database’s connection pool variable `DATABASE_POOL_URL`, the command would look like this:

    echo $DATABASE_URL $DATABASE_POOL_URL

The command returns the respective value of each environment variable.

You can now use these variables in your application’s code.