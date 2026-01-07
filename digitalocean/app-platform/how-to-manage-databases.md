---
source: https://docs.digitalocean.com/products/app-platform/how-to/manage-databases/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Manage Databases in App Platform

Validated on 14 Jan 2022 • Last edited on 3 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Databases come in two forms in App Platform:

*   **Dev databases**, which are limited databases intended for development but not production use.
    
    Dev databases come in one size and do not scale well to handle traffic for your app. Dev database permissions do not allow you to create databases, so you need to use the default database. Dev databases are limited to PostgreSQL.
    
*   **Managed databases**, which are instances of [DigitalOcean Managed Databases](/products/databases/) that you can use in App Platform. We recommend managed databases for production use.
    
    Managed databases have features like standby nodes, upscaling, and read-only nodes that add extra processing and throughput capacity for your database solution, and multiple trusted sources internal and external to DigitalOcean services. Managed databases support multiple database engines.
    

You can add a dev or managed database to your app at any time. You can also upgrade a dev database to a managed database.

## Add a Database to an Existing App[](#add-a-database-to-an-existing-app)

You can create a database during your app’s initial creation or add one later using the DigitalOcean Control Panel. You can also add a database to an app by defining it in your app’s spec file and then submitting the new spec using either the API, CLI, DigitalOcean Control Panel, or the app’s source repo.

Note

Dev databases are located in the same region as your app and cannot be migrated to another region. If you migrate your app to a different region, the app won’t be able to access the associated dev database anymore. If you need to migrate your app and dev database, we recommend either backing up the contents of the database and restoring it after the app’s migration, or using a [DigitalOcean Managed Database](/products/databases/) instead. You can migrate managed databases independently of apps to different regions as needed.

To use a managed database with App platform, you need to create one on your team. From the **Create** menu in the top right of the [control panel](https://cloud.digitalocean.com/databases), click **Databases**. The database you create appears in the **Database Clusters** list when you add a database resource in App Platform.

This section focuses on adding a database to an existing app using various methods.

### Add a Database to an App Using Automation[](#add-a-database-to-an-app-using-automation)

You can add a database to an app using the CLI’s app update command or the API’s app update endpoint. To add a database, update the [app’s spec](/products/app-platform/reference/app-spec/) with the database’s specifications and submit the spec using the following command or endpoint.

How to Add a Database to an App Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl apps update`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/apps/update/) for more details:
    
        doctl apps update <app id> [flags]
    
    The following example updates an app with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6` using an app spec located in a directory called `/src/your-app.yaml`. Additionally, the command returns the updated app’s ID, ingress information, and creation date:
    
        doctl apps update f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --spec src/your-app.yaml --format ID,DefaultIngress,Created
    

How to Add a Database to an App Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/apps/{id}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_update).

### cURL[](#add-a-database-to-an-app-curl)

Using cURL:

    curl -X PUT \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    "https://api.digitalocean.com/v2/apps/{id}" \
    -d '{"alerts":[{"rule":"DEPLOYMENT_FAILED"},{"rule":"DOMAIN_FAILED"}],"domains":[{"domain":"example.com","type":"PRIMARY","zone":"example.com"}],"envs":[{"key":"API_KEY","scope":"RUN_AND_BUILD_TIME","type":"SECRET","value":"EV[1:zqiRIeaaYK/NqctZDYzy6t0pTrtRDez8:wqGpZRrsKN5nPhWQrS479cfBiXT0WQ==]"}],"features":["buildpack-stack=ubuntu-22"],"ingress":{},"name":"example-app","region":"nyc","services":[{"autoscaling":{"max_instance_count":4,"metrics":{"cpu":{"percent":70}},"min_instance_count":2},"git":{"branch":"main","repo_clone_url":"https://github.com/digitalocean/sample-nodejs.git"},"internal_ports":[8080],"log_destinations":[{"name":"your_log_consumer_name","open_search":{"endpoint":"logs.example.com:12345","basic_auth":{"user":"doadmin","password":"1234567890abcdef"},"index_name":"example-index","cluster_name":"example-cluster"}}],"name":"sample-nodejs","run_command":"yarn start","source_dir":"/"}]}'

### Python[](#add-a-database-to-an-app-python)

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

### Add a Database to an App Using the Control Panel[](#add-a-database-to-an-app-using-the-control-panel)

In the [**Apps** section of the DigitalOcean Control Panel](https://cloud.digitalocean.com/apps), click your app. Click **Add components**, then choose **Create or attach database**.

![Component screen](https://docs.digitalocean.com/screenshots/app-platform/add-component-create-attach-DB.e92a42eb1f8f3134fb6f57d7a5dc6ae7c6cbb8541fef02cd85c5340e39645c73.png)

Select your database configuration, choosing from the available engines and plans. You can add a dev database or an existing managed database from your DigitalOcean account.

![Database creation screen](https://docs.digitalocean.com/screenshots/app-platform/components-database-create.6ece4b3060c87d22c9127e72742f3e5514876cc340d062d0191a1d36ee52252b.png)

All DigitalOcean database clusters support apps as trusted sources. Your app is added as a trusted source to the dev database. This creates a secure connection to the database and it accepts traffic only from the app. Similarly, if your existing managed database has trusted sources enabled, the app is automatically added as a trusted source. If trusted source is disabled for your managed database, select the **Add app as a trusted source** option to add the app as a trusted source.

![Managed DB Enable Trusted](https://docs.digitalocean.com/screenshots/app-platform/prod-db-enable-trusted.60a727a026ee5c966016b771e073ebcfbea81a25293a37f30cd8192eab53aad2.png)

Alternatively, you can specify an app in the **Trusted sources** section in the **Settings** tab of the database in the [cloud control panel](https://cloud.digitalocean.com/databases). This starts an app redeployment that enables a connection restricted from that app to the database.

Note

Enabling an app as a trusted source blocks any other connections. You need to add other sources explicitly to the trusted sources list as described in the [managed databases documentation](/products/databases/).

When you are ready to proceed, click **Create and Attach** to confirm your choices.

### Add a Dev Database Using the App Spec[](#add-a-dev-database-using-the-app-spec)

You can also add a database by specifying the database details directly in the [app’s spec file](/products/app-platform/reference/app-spec/) and [submitting the updated spec](/products/app-platform/how-to/update-app-spec/) via the control panel or uploading it to your app’s source repo.

To add a database using the app’s spec, add the following object to root of the spec and update the values as necessary:

`app.yaml`

    databases:
    - engine: PG
      name: db-example
      version: "16"

Using the spec, you can specify the database’s name and version. You cannot specify the version the control panel. The currently available PostgreSQL versions are `13`, `14`, `15`, and `16`.

## Connect to a Dev Database[](#connect-to-a-dev-database)

Go to [control panel](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab.

Click your database to view its details. The connection information for your database is provided in the **Connection Details** section.

![Database detail screen](https://docs.digitalocean.com/screenshots/app-platform/components-database-detail.838ce2fd8cc5684024e4afb2a35c1d35b6d54eb3e7cad2c91211e39d360d59c7.png)

The full connection string for your database is also be available as a runtime environment variable named `DATABASE_URL` which you can use in your application code. You should see this it in the details for your service resource, set to a value such as:

    postgres://${db.USERNAME}:${db.PASSWORD}@${db.HOSTNAME}:${db.PORT}/${db.DATABASE}
    

`DATABASE_URL` wraps several environment variables that you can also access individually, such as `db.USERNAME`, `db.PASSWORD`, and so on.

## Upgrade Dev Database to Managed Database[](#upgrade-dev-database-to-managed-database)

You can upgrade your dev database to a [DigitalOcean Managed Database](/products/databases/postgresql/) at any time. When you upgrade your database, we migrate the existing data to a new managed database.

To upgrade your dev database, go to [the control panel](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab.

Click the dev database you would like to upgrade to a managed database and click the **Upgrade to a Managed Database** button. You can choose the size of the machines that run your database with the **Node Plan** drop-down, and add standby nodes that stay synchronized and provide failover during downtime with the **Standby Nodes** drop-down.

Click **Upgrade Database** to complete the process.

## Upgrade Dev Database Version[](#upgrade-dev-database-version)

You can upgrade your dev database to a different version of PostgreSQL. App Platform supports PostgreSQL `13`, `14`, `15`, and `16`.

To use the commands in these instructions, you need a [DigitalOcean API token](/reference/api/create-personal-access-token/), with App Platform `read` and `write` scopes, saved as an environment variable named `DIGITALOCEAN_TOKEN` in your terminal.

To upgrade a dev database, go to [the control panel](https://cloud.digitalocean.com/apps), click your app, and then click the **Settings** tab. In the **Settings** tab, select the database component you want to upgrade, and then click the copy button beside the database’s UUID.

![Database UUID in the control panel](https://docs.digitalocean.com/screenshots/app-platform/app-db-uuid.1cfaa505b4b9739512193bc8173354847f41ebc51f7b60931ec3838f2f1d8340.png)

Once you have copied the UUID, use the following `curl` command to first install any updates for your database, replacing the `<your_database_uuid>` value with the UUID you copied from the control panel. This is a best practice to ensure a smooth upgrade:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/databases/<your_database_uuid>/install_update"

The update may take a few minutes to complete.

Once the update is complete, use the following `curl` command to upgrade your database to a different version, replacing the `<your_desired_version>` value with the PostgreSQL version you want to upgrade to, and the `<your_database_uuid>` value with the database’s UUID.

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"version":"<your_desired_version>"}' \
      "https://api.digitalocean.com/v2/databases/<your_database_uuid>/upgrade"

The upgrade may take several minutes to complete. If you receive the error `Cannot make changes while the service is undergoing maintenance`, the updates may still be installing and you can try upgrading again later.

To verify that the upgrade was successful, go to the **Settings** tab of your app, and then click **Edit** beside the **App Spec** section. The database’s version is specified in the `databases` object. For example:

`your-app.yaml`

    databases:
    - engine: PG
      name: your-database
      version: "16"

If you want a database that offers more customization and a managed experience, we recommend [upgrading your dev database to a managed database](#upgrade-dev-database-to-managed-database).

## Integrate an Existing Kafka Database (Private Preview)[](#integrate-an-existing-kafka-database-private-preview)

You can create and integrate DigitalOcean Managed Kafka Databases with your App Platform app, but they require an additional step to configure the app’s ability to connect to the database.

App Platform does not currently support connections to Kafka databases that have trusted sources enabled. You must [disable trusted sources](/products/app-platform/how-to/manage-databases/#disable-trusted-sources) on the Kafka database before it can be integrated with an App Platform app.

App Platform provides [bindable environment variables](/products/app-platform/how-to/use-environment-variables/#using-bindable-variables-within-environment-variables) that automatically provide connection details for your Kafka database. To integrate an existing Kafka database, follow the [steps to add the database to your app](#add-a-database-to-an-app-using-the-control-panel), then add the following environment variable key value pairs to your app, replacing `your-kafka-instance-name` with your database cluster’s name:

Example Key

Value Format

Description

KAFKA\_BROKER

${your-kafka-instance-name.HOSTNAME}:${your-kafka-instance-name.PORT}

The hostname and port of the database’s Kafka brokers

KAFKA\_USERNAME

${your-kafka-instance-name.USERNAME}

The username for authenticating with the Kafka database

KAFKA\_PASSWORD

${your-kafka-instance-name.PASSWORD}

The password for authenticating with the Kafka database

KAFKA\_CA\_CERT

${your-kafka-instance-name.CA\_CERT}

The CA certificate for TLS authentication with the Kafka database

You can pass these environment variables to the Kafka client in your app’s code to securely connect to the client.

## Disable Trusted Sources[](#disable-trusted-sources)

App Platform does not support connecting to managed databases with trusted sources enabled during the app’s build process. To allow your app to connect to the database during development, you need to disable trusted sources on the database.

Go to [the control panel](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab.

Click your database to view its details. The trusted sources information for your database is provided in the **Trusted Sources** section. To disable the setting, click **Edit**, uncheck the **Add app as a trusted source** checkbox, and click **Save**.

![Trusted sources setting](https://docs.digitalocean.com/screenshots/app-platform/disable-enable-trusted-setting.c18e5d3c9d63c230e13a6c2420013bd6a8b54ea608169050cdcb71f4b36551ed.png)

## Destroy a Database[](#destroy-a-database)

Go to [the control panel](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab.

Click your database. The details screen for your database has a **Destroy Database** button on the bottom that will destroy your database after you confirm the action.