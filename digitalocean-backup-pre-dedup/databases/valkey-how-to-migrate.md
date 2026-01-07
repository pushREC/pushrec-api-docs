---
source: https://docs.digitalocean.com/products/databases/valkey/how-to/migrate/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Migrate Valkey Databases | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/valkey.f170106c44632502ecb41bfb74b6d22d99f94ad223afccd11be669fedac30b18.svg)Valkey](/products/databases/valkey/)
    *   [Getting Started](/products/databases/valkey/getting-started/)
        *   [Quickstart](/products/databases/valkey/getting-started/quickstart/)
        *   [Convert Caching to Valkey](/products/databases/valkey/getting-started/convert/)
    *   [How-Tos](/products/databases/valkey/how-to/)
        *   [Connect to Valkey Clusters](/products/databases/valkey/how-to/connect/)
        *   [Secure Valkey Clusters](/products/databases/valkey/how-to/secure/)
        *   [Migrate Valkey Databases](/products/databases/valkey/how-to/migrate/)
        *   [Schedule Automatic Updates](/products/databases/valkey/how-to/schedule-updates/)
        *   [Choose Eviction Policies](/products/databases/valkey/how-to/choose-eviction-policies/)
        *   [Tag Database Clusters](/products/databases/valkey/how-to/tag/)
        *   [Monitor Cluster Performance](/products/databases/valkey/how-to/monitor-clusters/)
        *   [Add Standby Nodes](/products/databases/valkey/how-to/add-standby-nodes/)
        *   [Set Up Monitoring Alerts](/products/databases/valkey/how-to/set-up-alerts/)
        *   [Relocate Database Clusters](/products/databases/valkey/how-to/relocate/)
        *   [Resize Database Clusters](/products/databases/valkey/how-to/resize/)
        *   [Destroy Database Clusters](/products/databases/valkey/how-to/destroy/)
        *   [Monitor Valkey Performance](/products/databases/valkey/how-to/monitor-databases/)
        *   [Forward Logs](/products/databases/valkey/how-to/forward-logs/)
        *   [Reconfigure Database Clusters](/products/databases/valkey/how-to/reconfigure/)
        *   [Create Valkey Clusters](/products/databases/valkey/how-to/create/)
    *   [Reference](/products/databases/valkey/reference/)
        *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
        *   [CLI Reference](/reference/doctl/reference/databases/)
        *   [MCP Reference](/reference/mcp/)
    *   [Concepts](/products/databases/valkey/concepts/)
        *   [Best Practices](/products/databases/valkey/concepts/best-practices/)
        *   [Migration Strategies](/products/databases/valkey/concepts/migration-strategies/)
        *   [Shared Responsibility Model](/products/databases/valkey/concepts/responsibility-model/)
    *   [Details](/products/databases/valkey/details/)
        *   [Features](/products/databases/valkey/details/features/)
        *   [Pricing](/products/databases/valkey/details/pricing/)
        *   [Availability](/products/databases/valkey/details/availability/)
        *   [Limits](/products/databases/valkey/details/limits/)
        *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)

*   [Valkey](/products/databases/valkey/) 
*   [How-Tos](/products/databases/valkey/how-to/) 
*   Migrate Valkey Databases

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Migrate Valkey Databases

Validated on 24 Apr 2025 • Last edited on 5 Nov 2025

Valkey is a high-performance, open-source database that stores key-value data in memory, and is designed for caching, message queues, and primary database use. Fully compatible with Redis, Valkey serves as a drop-in replacement.

You can migrate existing on-premise or cloud hosted Valkey databases to clusters in your DigitalOcean account. Migrating a database establishes a connection with an existing database and replicates its contents to the new database cluster. If the existing database is continuously being written to, the migration process continues until there is no more data to replicate or you manually stop the migration.

We do not currently support migrating managed database clusters on DigitalOcean to other managed database clusters on DigitalOcean using continuous migration. For example, you cannot migrate a managed database cluster from one DigitalOcean account to another. However, you can migrate with a dump.

## Prerequisites[](#prerequisites)

To migrate an existing database to a DigitalOcean database cluster, you need to reference the source database’s connection credentials and to disable or update any firewalls between the databases.

Warning

Before migrating a database, ensure that the source’s Valkey version is not newer than the target cluster’s. This can result in an error that causes migration to fail.

### Reference Source Database’s Credentials[](#reference-source-databases-credentials)

Before migrating an existing database, you need the following information about the source database:

*   **Hostname or connection string** - The public hostname, connection string, or IP address used to connect to the database.
*   **Port** - The port used to connect to the database. DigitalOcean clusters connect on port `25061` by default.
*   **Username** - The username used to connect to the database. The username should have sufficient permissions to access the data you want to migrate.
*   **Password** - The password used to connect to the database.

Reference your database provider’s documentation for details on how to locate this information.

### Update or Disable Firewalls[](#update-or-disable-firewalls)

To migrate an existing database, you also need to update or temporarily disable any firewalls protecting the databases to allow the databases to connect to each other.

To do this on the target DigitalOcean database, we recommend you [add the source database to its trusted sources](/products/databases/valkey/how-to/secure/#add-a-trusted-source-using-the-control-panel). Alternatively, you can [remove all trusted sources](/products/databases/valkey/how-to/secure/#firewalls) from the database cluster, exposing it to the public internet.

For the source database outside of DigitalOcean, you may need to update or temporarily disable any firewalls protecting the database before attempting migration. Please refer to your database provider’s documentation to see how to do this.

## Migrate a Database Using the API[](#migrate-a-database-using-the-api)

How to Migrate a Database Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/online-migration`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_update_onlineMigration).

### cURL[](#migrate-a-database-curl)

Using cURL:

    curl -X PUT \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    -d '{"source":{"host":"source-do-user-6607903-0.b.db.ondigitalocean.com","dbname":"defaultdb","port":25060,"username":"doadmin","password":"paakjnfe10rsrsmf"},"disable_ssl":false,"ignore_dbs":["db0","db1"]}' \
    "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/online-migration"

### Python[](#migrate-a-database-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "source": {
        "host": "source-do-user-6607903-0.b.db.ondigitalocean.com",
        "dbname": "defaultdb",
        "port": 25060,
        "username": "doadmin",
        "password": "paakjnfe10rsrsmf"
      },
      "disable_ssl": False
      "ignore_dbs": ["db0","db1"]
    }
    
    update_resp = client.databases.update_online_migration(database_cluster_uuid="a7a8bas", body=req)

## Migrate a Database Cluster Using the Control Panel[](#migrate-a-database-cluster-using-the-control-panel)

To migrate a Valkey database from the [DigitalOcean Control Panel](https://cloud.digitalocean.com), click **Databases** and then select the database you want to migrate to from your list of databases.

From the database’s **Overview** page, click the **Actions** button and then select **Set Up Migration**.

![Action menu with Set Up Migration highlighted](https://docs.digitalocean.com/screenshots/databases/valkey-set-up-migration.a54448a73f20b86c8514f59b2e04d0bf5ab25d7c9aabf88995fe80d05d0fd081.png)

In the **Valkey migration** window, click **Continue**, then enter the source database’s credentials. Once you have entered the source database’s credentials, click **Start Migration**. A migration status banner opens at the top of the **Overview** page and your target database’s data begins to transfer.

![Valkey migration with credentials](https://docs.digitalocean.com/screenshots/databases/valkey-migration.9cb57dc15954992821f9e90d4d11783b47cacd2f2618a1cf99231c48ab91bfb9.png)

You can stop the migration at any time by clicking the **Stop Migration** button in the migration status banner. If you stop migration, the database retains any migrated data.

Warning

Migrations automatically stop after two weeks. We do not recommend leaving migrations ongoing in order to keep two database clusters in sync.

During migration, you can still write to the target database, but avoid the following actions because they may result in conflicts and replication issues:

*   Do not manually alter the source database’s replication configuration.
*   Do not make changes to either database that could prevent the source and target database from connecting with each other. This includes updating or enabling firewalls/trusted sources on either database.

In this article...

*   [Prerequisites](#prerequisites)
    *   [Reference Source Database’s Credentials](#reference-source-databases-credentials)
    *   [Update or Disable Firewalls](#update-or-disable-firewalls)
*   [Migrate a Database Using the API](#migrate-a-database-using-the-api)
*   [Migrate a Database Cluster Using the Control Panel](#migrate-a-database-cluster-using-the-control-panel)

##### Company

*   [About](https://www.digitalocean.com/about)
*   [Careers](https://www.digitalocean.com/careers)
*   [Blog](https://www.digitalocean.com/blog)

##### Docs

*   [Docs Home](https://docs.digitalocean.com)
*   [API Reference](https://docs.digitalocean.com/reference/api)
*   [CLI Reference](https://docs.digitalocean.com/reference/doctl)
*   [Release Notes](https://docs.digitalocean.com/release-notes)
*   [Trust Platform](https://www.digitalocean.com/trust)

##### Community

*   [Tutorials](https://www.digitalocean.com/community/tutorials)
*   [Q&A](https://www.digitalocean.com/community/questions)
*   [Write for DOnations](https://www.digitalocean.com/community/pages/write-for-digitalocean)
*   [Currents Research](https://www.digitalocean.com/currents)
*   [Legal](https://www.digitalocean.com/legal)
*   [Code of Conduct](https://www.digitalocean.com/community/pages/code-of-conduct)

##### Support

*   [Support Center](/support)
*   [Report Abuse](https://www.digitalocean.com/company/contact/abuse)

* * *

© 2025 DigitalOcean, LLC. All rights reserved

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https://www.linkedin.com/company/digitalocean)[](https://github.com/digitalocean)

### We can't find any results for your search.

Try using different keywords or sim
