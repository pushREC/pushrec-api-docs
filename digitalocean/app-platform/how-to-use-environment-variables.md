---
source: https://docs.digitalocean.com/products/app-platform/how-to/use-environment-variables/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Use Environment Variables in App Platform

Validated on 16 Jun 2022 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Environment variables in App Platform provide a way to store environment information at the container or application levels that your app can access at build or runtimes. We also provide many bindable app-specific and component-level variables, such as the app’s URL or database CA certificate values.

## Define Runtime Variables During App Creation[](#define-runtime-variables-during-app-creation)

When [creating an app](/products/app-platform/how-to/create-apps/), specify environment variables on the **Environment** screen. Click the **Encrypt** checkbox to obscure the variable’s values from all build, deployment, and application logs.

You can also declare runtime variables in the app specification for your app by setting the `scope` to `RUN_TIME`. See [the example below](#define-build-time-environment-variables) or [the app specification reference](/products/app-platform/reference/app-spec/) for more details.

## Define Runtime Variables After App Creation[](#define-runtime-variables-after-app-creation)

In [the **Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps), click your app, then click the **Settings** tab. Click the component for which you’d like to provide runtime variables. Click the checkbox labeled **Encrypt** to obscure the variable’s values from all build, deployment, and application logs.

![Setting an example environment variable in the control panel.](https://docs.digitalocean.com/screenshots/app-platform/set-environment-variables.f549a855756989a9208ad0f60422e3db940e8a05d2e6e86eb4e74ef71394bd86.png)

## Define Build Time Environment Variables[](#define-build-time-environment-variables)

To define environment variables that will be accessible at build time, define the variable in the app’s specification with the `scope` set to `BUILD_TIME`.

Here’s an example of build time and runtime environment variables in a specification.

    services:
      - name: web
        instance_count: 4
        instance_size_slug: apps-s-1vcpu-1gb
        git:
          repo: "https://github.com/example/repo"
          branch: master
        build_command: "go build ./"
        run_command: "/app/server"
        envs:
        - key: BUILD_ONLY_VAR
          scope: BUILD_TIME
          value: hello world
        - key: RUNTIME_ONLY_VAR
          scope: RUN_TIME
          value: i'm a little teapot

See [the app specification reference](/products/app-platform/reference/app-spec/) for more details.

### Set Build Time Variables for Dockerfiles[](#set-build-time-variables-for-dockerfiles)

If you are using a Dockerfile to deploy your app on App Platform, [environment variables](/products/app-platform/how-to/use-environment-variables/) are only available at build time if you have set them using the `--build-arg` [option in Docker](https://docs.docker.com/engine/reference/commandline/build/#build-arg) before deploying the app.

For example, to access the variable `EXAMPLE=your-value` during build time, set it in the image using the `docker` CLI like this:

    docker build --build-arg EXAMPLE=your-value

You cannot use this method to access [bindable variables](/products/app-platform/how-to/use-environment-variables/#using-bindable-variables-within-environment-variables) at build time. If you are supplying a Dockerfile, bindable variables are only available at runtime.

## Define App-Level Environment Variables[](#define-app-level-environment-variables)

Unlike runtime and build time variables which are component-specific, app-level variables can be accessed by all components in your app. App-level variables are available at both build and runtime. If any component-level environment variables (such as runtime or build time variables) have the same name as an app-level environment variable, the component-level variable “wins” as it is considered more specific.

Specify app-level variables on the **Environment** screen when [creating an app](/products/app-platform/how-to/create-apps/). For existing apps, go to [the **Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps). Click your app, then click the **Settings** tab. Next to the **App-Level Environment Variables** heading, click the **Edit** link.

## Encrypt Environment Variables[](#encrypt-environment-variables)

Similar to [GitHub secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions), App Platform can store sensitive variables as encrypted values, such as passwords, API keys, and other sensitive information. When you choose the Encrypt option beside an environment variable, App Platform encrypts the value you entered and stores it in the [app’s spec](/products/app-platform/how-to/update-app-spec/).

Note

Encrypted variables are decrypted in your application’s runtime environment. They can be visible to other team members who can access the application’s console or other users who can change the app’s code or configuration. For example, a user on your team could use the console to view the value of an encrypted variable, or modify the app’s configuration or code to export the decrypted value from the runtime environment.

To ensure that your application’s encrypted variables are secure, we recommend giving [**Owner** and **Member** roles](/platform/teams/how-to/manage-membership/) only to trusted team members who require access to the application’s console. We also recommend enforcing pull request reviews for all code and configuration changes to your app.

To encrypt an environment variable, click the **Encrypt** checkbox next to any variable.

## Using Bindable Variables within Environment Variables[](#using-bindable-variables-within-environment-variables)

Bindable variables allow environment variables to reference dynamic app-specific values on build and deploy. These values are provided by DigitalOcean and are [app-wide](#app-wide-variables) or [component-specific](#component-specific-variables).

To set a bindable variable as an environment variable, go to [the **Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps). Click your app, then click the **Settings** tab. Next to the **App-Level Environment Variables** heading, click the **Edit** link.

In the **KEYS** field, enter a unique name for the new environment variable. In the **Values** field, enter the bindable variable you would like to reference.

For example, to set the app’s URL as an environment variable, set the **KEY** value to `URL` and its value to `${APP_URL}`.

![Bindable variables set as environmental variables](https://docs.digitalocean.com/screenshots/app-platform/app-environment-variables.cb5a565dec821dca18ac296f000c34a080cde536f573eef6663cd412474dad7e.png)

Once you enter the bindable variable, click **Save**. The app redeploys.

You can check that the environment variable works by opening the app’s **Console** tab and running:

    echo $<name-of-environment-variable>

![Console echo command running inside of it.](https://docs.digitalocean.com/screenshots/app-platform/app-echo-variable.9b6748bbdfb4de4b29bb8369a988e64419d8022fee9b1ae05de68fe4452b69b8.png)

### App-Wide Variables[](#app-wide-variables)

These variables can be indicated in the format of `${BINDABLE_NAME}`.

*   `${APP_DOMAIN}`: Application’s primary domain.
*   `${APP_URL}`: Application’s primary domain in http format (for example, `https://my-domain.com`).
*   `${APP_ID}`: Application’s ID.

### Component-Specific Variables[](#component-specific-variables)

Component-specific variables need to be prefixed by the component name, for example `${my-service.BINDABLE_NAME}`. The `_self` prefix can be used to reference the _current_ component, for example `${_self.BINDABLE_NAME}`.

#### Services[](#services)

*   `${_self.PRIVATE_DOMAIN}`: Internally used domain name used for communication between multiple services.
*   `${_self.PRIVATE_URL}`: Internally used domain in HTTP format suffixed with the port.
*   `${_self.PRIVATE_PORT}`: Internally used HTTP port.
*   `${_self.COMMIT_HASH}`: `git` commit hash used for this build.
*   `${_self.PUBLIC_ROUTE_PATH}`: Routable path used for this service publicly.
*   `${_self.PUBLIC_URL}`: public URL of this component in http format including the public route.

#### Static Sites[](#static-sites)

*   `${_self.COMMIT_HASH}`: `git` commit hash used for this build.
*   `${_self.PUBLIC_ROUTE_PATH}`: Public routable path used for this service.
*   `${_self.PUBLIC_URL}`: Public URL of this component in HTTP format, including the public route.

#### Workers[](#workers)

*   `${_self.COMMIT_HASH}`: `git` commit hash used for this build.

#### Databases[](#databases)

Database values are not available during build time but are available at runtime.

*   `${use_your_database_name.HOSTNAME}`: Fully qualified host name to the database.
*   `${use_your_database_name.PORT}`: Port to the database.
*   `${use_your_database_name.USERNAME}`: Username for the database.
*   `${use_your_database_name.PASSWORD}`: Password for the database user.
*   `${use_your_database_name.DATABASE}`: The database name used by the user.
*   `${use_your_database_name.DATABASE_URL}`: The database connection string.
*   `${use_your_database_name.JDBC_DATABASE_URL}`: The database connection string prefixed with `jdbc:` for Java.
*   `${use_your_database_name.REDIS_URL}`: The Redis connection string (Redis only).
*   `${use_your_database_name.CA_CERT}`: CA certificate for the managed databases in the users account.

Additionally, you can use these same variable names to refer to your database [connection pool](/products/databases/postgresql/how-to/manage-connection-pools/) (PostgreSQL only). To do so, use the syntax `${<database component name>.<connection pool name>.VARIABLE_NAME}`. For example, to create a bindable variable for a pool’s connection string, you can use `${mydb.mypool.DATABASE_URL}`.

#### Log Forwarding[](#log-forwarding)

*   `${_self.FUNCTIONS_LOG_DESTINATION_JSON}`: A JSON string with details of all configured log forwarding destinations.

#### Functions[](#functions)

*   `${_self.COMMIT_HASH}`: `git` commit hash used for this build.
*   `${_self.PUBLIC_ROUTE_PATH}`: : Public routable path used for this service.
*   `${_self.PUBLIC_URL}`: Public URL of this resource in HTTP format, including the public route.
*   `${_self.FUNCTIONS_LOG_DESTINATION_JSON}`: JSON-serialized version of the [`log_destinations` field in the app spec](/products/app-platform/reference/app-spec/).