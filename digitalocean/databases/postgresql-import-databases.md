---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/import-databases/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Import PostgreSQL Databases into DigitalOcean Managed Databases with pg\_dump | DigitalOcean Documentation

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
*   Import Databases

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Import PostgreSQL Databases into DigitalOcean Managed Databases with pg\_dump

Validated on 8 Aug 2019 • Last edited on 17 Jun 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

You can migrate existing PostgreSQL databases to a DigitalOcean Managed Databases cluster. There are two methods of migration:

*   **Continuous migration** establishes a connection with an existing database and replicates its contents to the new database cluster using [logical replication](https://www.postgresql.org/docs/current/logical-replication.html), including any changes being written to the database during the migration, until there is no more data to replicate or you manually stop the replication.
    
    We recommend this strategy when you want to keep the source database operational while transferring data to the target database. You cannot use continuous migration to move an existing DigitalOcean Managed Databases cluster from one DigitalOcean team to another.
    
*   **Importing a dump**, which is a point-in-time snapshot of the database. Any data written to your source database after initiating the dump does not transfer over to the target database.
    
    You must import a dump to migrate an existing DigitalOcean Managed Databases cluster from one DigitalOcean team to another. We also recommend this strategy if you do not have `superuser` permissions on the source database.
    

This article covers importing a dump. For instructions on using continuous migration, see [our how-to on using continuous migration with PostgreSQL databases](/products/databases/postgresql/how-to/import-databases/).

## Prerequisites[](#prerequisites)

If you have a PostgreSQL database that you want to import into DigitalOcean Managed Databases, you need the following:

1.  An export of the existing database, which you can get [using `pg_dump`](#export-an-existing-database) or other utilities.
    
2.  A [PostgreSQL database cluster](/products/databases/postgresql/how-to/create/) created in your DigitalOcean account.
    
3.  An existing database in the database cluster to import your data into. You can use the default database or [create a new database](/products/databases/postgresql/how-to/manage-users-and-databases/).
    

## Export an Existing Database[](#export-an-existing-database)

One method of exporting data from an existing PostgreSQL database is using [`pg_dump`](https://www.postgresql.org/docs/current/app-pgdump.html), a PostgreSQL database backup utility. [`pg_dumpall`](https://www.postgresql.org/docs/current/app-pg-dumpall.html) is a similar utility meant for PostgreSQL database clusters.

To use `pg_dump`, you need specify the connection details (like admin username and database) and [redirect the output of the command](https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-i-o-redirection#stream-redirection) to save the database dump. The command will look like this:

    pg_dump -h <your_host> -U <your_username> -p 25060 -Fc <your_database> > <path/to/your_dump_file.pgsql>

The components of the command are:

*   The `-h` flag to specify the IP address or hostname, if using a remote database.
    
*   The `-U` flag to specify the admin user on the existing database.
    
*   The `-p` flag to specify a connecting port. Our managed databases require connecting to port `25060`.
    
*   The `-Fc` flags to create the dump file in the custom format, compatible with `pg_restore`.
    
*   The name of the database to dump.
    
*   The redirection to save the database dump to a file called `your_dump_file.pgsql`.
    

Learn more in [PostgreSQL’s SQL Dump documentation](https://www.postgresql.org/docs/current/backup-dump.html).

The time to export increases with the size of the database, so a large database will take some time. When the export is complete, you’ll be returned to the command prompt or notified by the client you used.

## Import a Database[](#import-a-database)

To import the new source database, ensure that you can [connect to your target database with psql](/products/databases/postgresql/how-to/connect/). Then, you need to find the connection URI for the target database you want to add the existing data into.

If you want to import to the default target database with the default user, you can use the public network connection string from the cluster’s **Overview** page, under **Connection Details** and in the drop-down menu.

If you want to import to a different target database or with a different user, select your desired specifications using the **User** and **Database/Pool** drop-down menus below.

Click the blue, highlighted `show-password` string to reveal your password, then copy the URI.

![Screenshot of the connection string in the control panel](https://docs.digitalocean.com/screenshots/databases/postgresql-connection-string.362d765c8ff97237ec11f73aab3f2a3edaf898ffbfa5a965323c3278d10d7155.png)

Once you have the connection URI for the source database and user you want to use, note whether your source database is in [custom format](#import-data-in-custom-format) or is a [text format dump](#import-a-text-format-dump), and then follow the applicable steps below. We recommend [exporting dumps in custom format](#export-an-existing-database) for its compression and ability to restore tables selectively.

### Import Data in Custom Format[](#import-data-in-custom-format)

To import a source database in custom format, use the `pg_restore` command:

    pg_restore -d <your_connection_URI> --jobs 4 <path/to/your_dump_file.pgsql>

The components of the command are:

*   The `-d` flag to specify the database name.
*   Your connection URI.
*   The `--jobs` flag to specify the number of concurrent threads to run the import. A higher number accelerates the process, but requires more CPUs.
*   The number of threads to run.
*   The path to your local source database file.

If the database you’re importing has multiple users, you can add the `--no-owner` flag to avoid permissions errors. Even without this command, the import will complete, but you may see a number of error messages.

Reference PostgreSQL’s documentation for more information about its [Backup and Restore functions](https://www.postgresql.org/docs/8.1/backup.html#BACKUP-DUMP-RESTORE).

### Import a Text Format Dump[](#import-a-text-format-dump)

To import a regular text format dump, use the following command:

    psql -d <your_connection_URI> < <path/to/your_dump_file.pgsql>

The components of the command are:

*   The `-d` flag to specify the database name.
*   Your connection URI.
*   The less-than symbol (`<`) to input the following file to your target database.
*   The path to your local source database file.

Reference PostgreSQL’s documentation for more information about its [Backup and Restore functions](https://www.postgresql.org/docs/8.1/backup.html#BACKUP-DUMP-RESTORE).

## After Importing[](#after-importing)

Once the import is complete, you can update the connection information in any applications using the database to use the new database cluster.

We also recommend running the PostgreSQL-specific [`ANALYZE` command](https://www.postgresql.org/docs/current/sql-analyze.html) to generate statistical database information. This helps the [query planner](https://www.postgresql.org/docs/current/planner-optimizer.html) optimize the execution plan, which increases the speed that the database executes SQL queries. Learn more in the [PostgreSQL wiki introduction to VACUUM, ANALYZE, EXPLAIN, and COUNT](https://wiki.postgresql.org/wiki/Introduction_to_VACUUM,_ANALYZE,_EXPLAIN,_and_COUNT#ANALYZE_to_optimize_PostgreSQL_queries).

In this article...

*   [Prerequisites](#prerequisites)
*   [Export an Existing Database](#export-an-existing-database)
*   [Import a Database](#import-a-database)
    *   [Import Data in Custom Format](#import-data-in-custom-format)
    *   [Import a Text Format Dump](#import-a-text-format-dump)
*   [After Importing](#after-importing)

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

Try using different keywords or simplifying you