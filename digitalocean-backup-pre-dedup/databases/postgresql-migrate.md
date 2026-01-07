---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/migrate/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Migrate PostgreSQL Databases to DigitalOcean using Continuous Migration | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/postgresql.855c43f1f82e98a24a05998729b39a9937438c7f77af3dc0c22da5a5739f5eb7.svg)PostgreSQL](/products/databases/postgresql/)
*   [Getting Started](/products/databases/postgresql/getting-started/)
    *   [Quickstart](/products/databases/postgresql/getting-started/quickstart/)
*   [How-Tos](/products/databases/postgresql/how-to/)
    *   [Create PostgreSQL Clusters](/products/databases/postgresql/how-to/create/)
    *   [Connect to PostgreSQL Cluster](/products/databases/postgresql/how-to/connect/)
    *   [Resize Database Clusters](/products/databases/postgresql/how-to/resize/)
    *   [Import Databases](/products/databases/postgresql/how-to/import-databases/)
    *   [Secure PostgreSQL Clusters](/products/databases/postgresql/how-to/secure/)
    *   [Migrate External Databases](/products/databases/postgresql/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/postgresql/how-to/schedule-updates/)
    *   [Manage Users and Databases](/products/databases/postgresql/how-to/manage-users-and-databases/)
    *   [Modify User Privileges](/products/databases/postgresql/how-to/modify-user-privileges/)
    *   [Monitor PostgreSQL Performance](/products/databases/postgresql/how-to/monitor-databases/)
    *   [Add Standby Nodes](/products/databases/postgresql/how-to/add-standby-nodes/)
    *   [Add Read-Only Nodes](/products/databases/postgresql/how-to/add-read-only-nodes/)
    *   [Manage Connection Pools](/products/databases/postgresql/how-to/manage-connection-pools/)
    *   [Monitor Cluster Performance](/products/databases/postgresql/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/postgresql/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/postgresql/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/postgresql/how-to/fork-clusters/)
    *   [Forward Logs](/products/databases/postgresql/how-to/forward-logs/)
    *   [Restore from Backups](/products/databases/postgresql/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/postgresql/how-to/destroy/)
    *   [Tag Database Clusters](/products/databases/postgresql/how-to/tag/)
    *   [Upgrade PostgreSQL](/products/databases/postgresql/how-to/upgrade-version/)
    *   [Reconfigure Database Clusters](/products/databases/postgresql/how-to/reconfigure/)
*   [Reference](/products/databases/postgresql/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/postgresql/concepts/)
    *   [Best Practices](/products/databases/postgresql/concepts/best-practices/)
    *   [Migration Strategies](/products/databases/postgresql/concepts/migration-strategies/)
    *   [Shared Buffers](/products/databases/postgresql/concepts/shared-buffers/)
    *   [Shared Responsibility Model](/products/databases/postgresql/concepts/responsibility-model/)
*   [Details](/products/databases/postgresql/details/)
    *   [Features](/products/databases/postgresql/details/features/)
    *   [Pricing](/products/databases/postgresql/details/pricing/)
    *   [Availability](/products/databases/postgresql/details/availability/)
    *   [Limits](/products/databases/postgresql/details/limits/)
    *   [Supported Extensions](/products/databases/postgresql/details/supported-extensions/)
    *   [Cluster Notifications](/products/databases/postgresql/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/postgresql/support/)

*   [How-Tos](/products/databases/postgresql/how-to/) 
*   Migrate External Databases

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Migrate PostgreSQL Databases to DigitalOcean using Continuous Migration

Validated on 9 Apr 2025 • Last edited on 5 Nov 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

You can migrate existing non-DigitalOcean PostgreSQL databases to a DigitalOcean Managed Databases cluster. There are two methods of migration:

*   **Continuous migration** establishes a connection with an existing database and replicates its contents to the new database cluster using [logical replication](https://www.postgresql.org/docs/current/logical-replication.html), including any changes being written to the database during the migration, until there is no more data to replicate or you manually stop the replication.
    
    We recommend this strategy when you want to keep the source database operational while transferring data to the target database. You cannot use continuous migration to move an existing DigitalOcean Managed Databases cluster from one DigitalOcean team to another.
    
*   **Importing a dump**, which is a point-in-time snapshot of the database. Any data written to your source database after initiating the dump does not transfer over to the target database.
    
    You must import a dump to migrate an existing DigitalOcean Managed Databases cluster from one DigitalOcean team to another. We also recommend this strategy if you do not have `superuser` permissions on the source database.
    

This article covers continuous migration. For instructions on importing a dump, see [our how-to on importing PostgreSQL databases with `pg_dump`](/products/databases/postgresql/how-to/import-databases/).

## Prerequisites[](#prerequisites)

To migrate an existing non-DigitalOcean PostgreSQL database into a DigitalOcean Managed Databases cluster, you need to:

1.  [Get the source database’s credentials](#get-source-databases-credentials).
2.  [Check the PostgreSQL versions](#check-postgresql-versions) of both databases.
3.  [Have `superuser` permissions](#have-superuser-permissions) on the source database.
4.  [Update networking](#update-networking) to make the databases accessible to each other.

### Get Source Database’s Credentials[](#get-source-databases-credentials)

You need the following information about the source database:

*   **Hostname or connection string**: The public hostname, connection string, or IP address used to connect to the database.
*   **Port**: The port used to connect to the database. DigitalOcean clusters connect on port `25061` by default.
*   **Username**: The username used to connect to the database. The username needs the `superuser` permission to access the data you want to migrate and cannot be the default `postgres` user.
*   **Password**: The password used to connect to the database.

Reference your database provider’s documentation for details on how to locate this information.

### Update or Disable Firewalls[](#update-or-disable-firewalls)

To migrate an existing database, you also need to update or temporarily disable any firewalls protecting the databases to allow the databases to connect to each other.

To do this on the target DigitalOcean database, we recommend you [add the source database to its trusted sources](/products/databases/postgresql/how-to/secure/#add-a-trusted-source-using-the-control-panel). Alternatively, you can [remove all trusted sources](/products/databases/postgresql/how-to/secure/#firewalls) from the database cluster, exposing it to the public internet.

For the source database outside of DigitalOcean, you may need to update or temporarily disable any firewalls protecting the database before attempting migration. Please refer to your database provider’s documentation to see how to do this.

### Check PostgreSQL Versions[](#check-postgresql-versions)

The source database’s PostgreSQL version must not be newer than the target cluster’s version. This can result in an error that causes migration to fail.

If the target DigitalOcean Managed Databases cluster is on an older version, [upgrade it](/products/databases/postgresql/how-to/upgrade-version/).

### Have Superuser Permissions[](#have-superuser-permissions)

To use continuous migration, you need `superuser` permissions on the source database.

How to Verify Whether You Have `superuser` Permissions

To verify whether you have `superuser` permissions, use the `\du` command from the PostgreSQL (`psql`) terminal:

    \du

The command line returns a table of the database’s roles (usernames), their respective attributes (permissions), and the groups they belong to:

    Role name |                      Attributes                            |                 Member of                         
    ----------+------------------------------------------------------------+-----------------------------------------
    _dodb     | Superuser, Replication                                     | {}
    example   | Create role, Create DB, Replication, Bypass RLS            | {pg_read_all_stats,pg_stat_scan_tables,pg_signal_backend}
    postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}

If your role name does not have the `Superuser` attribute, you can request it from your system admin or consider [migrating by importing a dump](/products/databases/postgresql/how-to/import-databases/).

### Update Networking[](#update-networking)

To use continuous migration, the source database’s hostname or IP address must be accessible from the public internet, and any firewalls protecting the databases must allow the databases to connect to each other.

On the target DigitalOcean database cluster, [remove any trusted sources](/products/databases/postgresql/how-to/secure/#firewalls) from the database cluster to leave the database open to all incoming connections. To keep your databases secure after migration, add the trusted sources back to the database. Public connection information for DigitalOcean databases are in [the database’s connection details in the control panel](/products/databases/postgresql/how-to/connect/#connection-details).

For the source database outside of DigitalOcean, you may need to confirm its accessibility to the public internet and update or temporarily disable any firewalls. Refer to your database provider’s documentation for information.

## Prepare the Source Database for Migration[](#prepare-the-source-database-for-migration)

Once the prerequisites are satisfied, you need to prepare the source database itself for migration by:

1.  [Allowing remote connections](#allow-remote-connections).
2.  [Enabling logical replication](#enable-logical-replication).
3.  [Setting the maximum replication slots](#change-max-replication-slots) equal to or greater than the number of databases in the PostgreSQL server.
4.  [Restarting your PostgreSQL server](#restart-the-server).

Migration using the control panel migrates all databases, and therefore requires replication permissions on all databases.

Migration using the control panel requires that you grant replication permissions to all databases. However, you can exclude databases in [the **PostgreSQL migration** window](#using-the-control-panel) or by changing the [parameter `ignore_dbs`](/reference/api/digitalocean/#operation/databases_update_onlineMigration) using the DigitalOcean API. In this case, only databases selected with the parameter need replication permissions.

### Allow Remote Connections[](#allow-remote-connections)

First, verify that your database is allowing all remote connections. This is determined by your database’s `listen_addresses` variable, which allows all remote connections when its value is set to `*`. To check its current value, run the following query in the PostgreSQL (`psql`) terminal:

    SHOW listen_addresses;

If enabled, the command line returns:

    listen_addresses
    -----------
    *
    (1 row)

If the output is different, allow remote connections in your database by running the following query:

    ALTER SYSTEM SET listen_addresses = '*';

You also need to change your local IPv4 connection to allow all incoming IPs. To do this, find the configuration file `pg_hba.conf` with the following query:

    SHOW hba_file;

Open `pg_hba.conf` in your text editor of choice, such as `nano`:

    nano pg_hba.conf

Under `IPv4 local connections`, find and replace the IP address with `0.0.0.0/0`, which allows all IPv4 addresses:

pg\_hba.conf

    # TYPE  DATABASE        USER            ADDRESS                 METHOD
    
    # IPv4 local connections:
    host    all             all             0.0.0.0/0               md5
    # IPv6 local connections:
    host    all             all             ::/0                    md5

For a full description of the configuration file’s syntax, see the [official documentation](https://www.postgresql.org/docs/15/auth-pg-hba-conf.html).

### Enable Logical Replication[](#enable-logical-replication)

Most cloud database providers have logical replication enabled by default. If you are migrating a database from an on-premises server, logical replication may not be enabled. If your database is not set up for logical replication, the migration process will not work because the database can only move your schemas, not your data.

To verify that logical replication has been enabled, run the following query in the PostgreSQL (`psql`) terminal:

    SHOW wal_level;

If enabled, the command line returns:

    wal_level
    -----------
    logical
    (1 row)

If the output is different, enable logical replication in your database by setting `wal_level` to `logical`:

    ALTER SYSTEM SET wal_level = logical;

Enable Logical Replication with `aiven_extras`

Alternately, you can enable logical replication using the third-party extension, `aiven_extras`. To do this, first connect to your source database and enable the extension:

    CREATE EXTENSION aiven_extras CASCADE;

Create a publication for the tables you want to replicate:

    CREATE PUBLICATION pub_source_tables
    FOR TABLE test_table,test_table_2,test_table_3
    WITH (publish=‘insert,update,delete’);

Export the table definitions from the source database by generating a schema file, replacing `SRC_CON_URI` with your source database’s connection string:

    pg_dump --schema-only --no-publications \
    SRC_CONN_URI              \
    -t test_table -t test_table_2 -t test_table_3 > origin-database-schema.sql

Then, connect to the target database and enable the `aiven_extras` extension:

    CREATE EXTENSION aiven_extras CASCADE;

Import the table definitions from the schema you created earlier:

    \i origin-database-schema.sql

Finally, create a subscription to the source publication, replacing `SRC_HOST`, `SRC_PORT`, `SRC_DATABASE`, `SRC_USER`, and `SRC_PASSWORD` with your source database’s connection details.

    SELECT * FROM
    aiven_extras.pg_create_subscription(
     ‘dest_subscription’,
     ‘host=SRC_HOST password=SRC_PASSWORD port=SRC_PORT dbname=SRC_DATABASE user=SRC_USER’,
     ‘pub_source_tables’,
     ‘dest_slot’,
     TRUE,
     TRUE);

Verify the subscription to ensure the replication is working correctly:

    SELECT subdbid, subname, subowner, subenabled, subslotname
    FROM aiven_extras.pg_list_all_subscriptions();

### Change Max Replication Slots[](#change-max-replication-slots)

After enabling logical replication, you need to verify that your database’s `max_replication_slots` value is equal to or greater than the number of databases you have in your PostgreSQL server. To check your current value, run the following query in the PostgreSQL (`psql`) terminal:

    SHOW max_replication_slots;

The command line returns:

    max_replication_slots
    -----------
    <number of slots, e.g. 8>
    (1 row)

If `<number of slots>` is smaller than the number of databases in your PostgreSQL server, adjust it by running the following query, where `use_your_number` is the number of databases in your server:

    ALTER SYSTEM SET max_replication_slots = use_your_number;

### Restart the Server[](#restart-the-server)

To make your changes in this section take effect, restart your PostgreSQL server:

    sudo service postgresql stop
    sudo service postgresql start

## Initiate the Migration[](#initiate-the-migration)

### Using the Control Panel[](#using-the-control-panel)

To migrate a PostgreSQL database from the [DigitalOcean Control Panel](https://cloud.digitalocean.com), in the left menu, click **Databases**, then select the database you want to migrate to from your list of databases.

From the database’s **Overview** page, click the **Actions** button and then select **Set Up Migration**.

![Action menu with Set Up Migration highlighted](https://docs.digitalocean.com/screenshots/databases/dbaas-pg-set-up-migration.4f76785fc5d8ef486681b3aa61628c3d0321d9522d48440b7436c6a8d949b3fb.png)

In the **PostgreSQL migration** window, click **Continue**, then select a connection type between public host, public connection string, or private host. Enter the source database’s credentials, the source database’s credentials, any databases you want to exclude, and your credentials. Then, click **Start Migration**. A migration status banner opens at the top of the **Overview** page and your target database’s data begins to transfer.

![PostgreSQL migration with credentials](https://docs.digitalocean.com/screenshots/databases/postgresql-migration.273ca0777857480378bd343bc19a7db930f8d5b0432a6d7e851533241acca377.png)

You can stop the migration at any time by clicking the **Stop Migration** button in the migration status banner. If you stop migration, the database retains any migrated data.

### Using the API[](#using-the-api)

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

## During Migration[](#during-migration)

During migration, you can still write to the target database, but avoid the following actions because they may result in conflicts and replication issues:

*   Do not write to any tables on the target database that the migration is already editing.
*   Do not manually alter the source database’s replication configuration, change `wal_level`, or reduce `max_replication_slots`.
*   Do not make changes to either database that could prevent the source and target database from connecting with each other. This includes modifying the source database’s listen address and updating or enabling firewalls/trusted sources on either database.

Migrations automatically stop after two weeks. We do not recommend leaving migrations ongoing in order to keep two database clusters in sync. Instead, we recommend [adding a read-only node](/products/databases/postgresql/how-to/add-read-only-nodes/) to your cluster.

In this article...

*   [Prerequisites](#prerequisites)
    *   [Get Source Database’s Credentials](#get-source-databases-credentials)
    *   [Update or Disable Firewalls](#update-or-disable-firewalls)
    *   [Check PostgreSQL Versions](#check-postgresql-versions)
    *   [Have Superuser Permissions](#have-superuser-permissions)
    *   [Update Networking](#update-networking)
*   [Prepare the Source Database for Migration](#prepare-the-source-database-for-migration)
    *   [Allow Remote Connections](#allow-remote-connections)
    *   [Enable Logical Replication](#enable-logical-replication)
    *   [Change Max Replication Slots](#change-max-replication-slots)
    *   [Restart the Server](#restart-the-server)
*   [Initiate the Migration](#initiate-the-migration)
    *   [Using the Control Panel](#using-the-control-panel)
    *   [Using the API](#using-the-api)
*   [During Migration](#during-migration)

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

### We can't find any results for your sear