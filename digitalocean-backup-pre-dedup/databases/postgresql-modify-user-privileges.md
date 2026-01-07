---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/modify-user-privileges/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Modify User Privileges in PostgreSQL Databases | DigitalOcean Documentation

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
*   Modify User Privileges

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Modify User Privileges in PostgreSQL Databases

Validated on 22 Apr 2021 • Last edited on 17 Apr 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

By default, PostgreSQL database clusters come with a user, `doadmin`, which has full access to every database you create. Instead of using `doadmin` to access the database, we recommend creating additional users that only have the privileges they need, following the [principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege).

Additionally by default, every database cluster is publicly accessible. To limit access, you can [add trusted sources](/products/databases/postgresql/how-to/secure/#firewalls) or manage user permissions by following this guide.

You can [create a new user in the control panel](/products/databases/postgresql/how-to/manage-users-and-databases/), but you currently can’t set a user’s privileges in the control panel, so you need to use a command-line PostgreSQL client like [`psql`](https://www.postgresql.org/docs/current/app-psql.html).

## Modify PostgreSQL User Permissions[](#modify-postgresql-user-permissions)

First, [connect to your database cluster](/products/databases/postgresql/how-to/connect/) as the admin user, `doadmin`, by passing the cluster’s connection string to `psql`.

    psql "postgresql://doadmin:[email protected]:25060/defaultdb?sslmode=require"

This brings you into the interactive shell for PostgreSQL, which changes your command prompt to `defaultdb=>`.

From here, connect to the database that you want to modify the user’s privileges on.

    defaultdb=> \connect example_database

Connecting to the database changes the command prompt to the database’s name and displays output like this:

    SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
    You are now connected to database "example_database" as user "doadmin".

From here, the commands you need to execute depend on the permissions you want the user to have. Learn more about [PostgreSQL privileges in their documentation](https://www.postgresql.org/docs/9.1/ddl-priv.html).

As an example, to make a **read-only user**, first revoke all of the user’s default privileges, then give `CONNECT` access. From there, add `SELECT` privileges on the existing tables in the database and set `SELECT` privileges as their default for any other tables created in the future.

    REVOKE ALL ON DATABASE example_database FROM example_user;
    GRANT CONNECT ON DATABASE example_database TO example_user;
    GRANT SELECT ON ALL TABLES IN SCHEMA public TO example_user;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO example_user;

You need to run these commands on each database you want this user to have these privileges on.

You can also modify these commands to give the user different permissions. For example, changing the permissions from `SELECT` to `INSERT, SELECT` will make a user that can both read and write data.

## Check PostgreSQL User Privileges[](#check-postgresql-user-privileges)

Once you’re [connected to your database cluster](/products/databases/postgresql/how-to/connect/), you can use the `\du` command to list users that currently exist and see their roles.

    \du

                                           List of roles
     Role name     |                         Attributes                         | Member of
    ---------------+------------------------------------------------------------+-----------
     \_dodb        | Superuser, Replication                                     | {}
     doadmin       | Create role, Create DB, Replication, Bypass RLS            | {}
     postgres      | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
     example_user  |                                                            | {}

You can verify that a privilege change completed successfully by querying the database privileges table for the user:

    SELECT table_catalog, table_schema, table_name, privilege_type FROM information_schema.table_privileges WHERE grantee = 'example_user';

The output will display the new privileges. For example, if you granted only `SELECT` privileges, the output would look like this:

     table_catalog    | table_schema | table_name | privilege_type
    ------------------+--------------+------------+----------------
     example_database | public       | account    | SELECT

You can also verify that the user’s permissions are changed by logging into the database cluster as the new user, then connecting to the database and testing commands. For example, if you try to `INSERT` into a database as a read-only user, you should receive an error like `ERROR: permission denied for table account`.

In this article...

*   [Modify PostgreSQL User Permissions](#modify-postgresql-user-permissions)
*   [Check PostgreSQL User Privileges](#check-postgresql-user-privileges)

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

Try using different keywords or simplifyin