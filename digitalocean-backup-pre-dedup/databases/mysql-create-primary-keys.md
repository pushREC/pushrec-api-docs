---
source: https://docs.digitalocean.com/products/databases/mysql/how-to/create-primary-keys/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Create Primary Keys for MySQL Database Tables | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/mysql.15f32316da2692011abce02f393a1ee6db469250230cf1ea962c181c0e9e7de5.svg)MySQL](/products/databases/mysql/)
*   [Getting Started](/products/databases/mysql/getting-started/)
    *   [Quickstart](/products/databases/mysql/getting-started/quickstart/)
*   [How-Tos](/products/databases/mysql/how-to/)
    *   [Create MySQL Clusters](/products/databases/mysql/how-to/create/)
    *   [Connect to MySQL Clusters](/products/databases/mysql/how-to/connect/)
    *   [Resize Database Clusters](/products/databases/mysql/how-to/resize/)
    *   [Import Databases](/products/databases/mysql/how-to/import-databases/)
    *   [Secure MySQL Clusters](/products/databases/mysql/how-to/secure/)
    *   [Migrate MySQL Databases](/products/databases/mysql/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/mysql/how-to/schedule-updates/)
    *   [Manage Users and Databases](/products/databases/mysql/how-to/manage-users-and-databases/)
    *   [Modify User Privileges](/products/databases/mysql/how-to/modify-user-privileges/)
    *   [Monitor MySQL Performance](/products/databases/mysql/how-to/monitor-databases/)
    *   [Add Standby Nodes](/products/databases/mysql/how-to/add-standby-nodes/)
    *   [Add Read-Only Nodes](/products/databases/mysql/how-to/add-read-only-nodes/)
    *   [Monitor Cluster Performance](/products/databases/mysql/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/mysql/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/mysql/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/mysql/how-to/fork-clusters/)
    *   [Forward Logs](/products/databases/mysql/how-to/forward-logs/)
    *   [Restore from Backups](/products/databases/mysql/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/mysql/how-to/destroy/)
    *   [Set Global SQL Mode](/products/databases/mysql/how-to/set-sql-mode/)
    *   [Tag Database Clusters](/products/databases/mysql/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/mysql/how-to/reconfigure/)
    *   [Create Primary Keys](/products/databases/mysql/how-to/create-primary-keys/)
*   [Reference](/products/databases/mysql/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/mysql/concepts/)
    *   [Migration Strategies](/products/databases/mysql/concepts/migration-strategies/)
    *   [Sort Buffer Size](/products/databases/mysql/concepts/sort-buffer-size/)
    *   [Best Practices](/products/databases/mysql/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/mysql/concepts/responsibility-model/)
*   [Details](/products/databases/mysql/details/)
    *   [Features](/products/databases/mysql/details/features/)
    *   [Pricing](/products/databases/mysql/details/pricing/)
    *   [Availability](/products/databases/mysql/details/availability/)
    *   [Limits](/products/databases/mysql/details/limits/)
    *   [Cluster Notifications](/products/databases/mysql/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/mysql/support/)

*   [How-Tos](/products/databases/mysql/how-to/) 
*   Create Primary Keys

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create Primary Keys for MySQL Database Tables

Validated on 27 May 2021 • Last edited on 16 Apr 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

Primary keys are a single field or combination of fields that are defined to become a unique identifier for a row in a table, such as a row’s number or a name field combined with a birth date field. Primary keys increase search accuracy and performance, and they enhance cross-reference relationships between tables. A table can have only one primary key, and a primary key field cannot contain a null value.

Note

By default, primary keys are a requirement in all MySQL database tables. This ensures reliable data replication. However, you can turn off a database’s primary key requirement by making a [configuration request](/reference/api/digitalocean/#operation/databases_patch_config) via our API.

## How DigitalOcean Uses Primary Keys[](#how-digitalocean-uses-primary-keys)

We use replication to communicate between cluster nodes to ensure that primary, standby, and read-only nodes remain in sync. In addition, we apply a full replication stream anytime you create a new node based on an existing backup. The service’s following features depend on replication:

*   Restoring a service from backup
*   Automatically recovering from a node failure
*   Forking a new service from an existing service
*   Migrating an existing service to a new datacenter region
*   Scaling an existing service to a larger size
*   Adding standby or read-only nodes to an existing service

## How to Manually Add a Primary Key[](#how-to-manually-add-a-primary-key)

To determine which tables are missing primary keys, copy and paste the following command into the MySQL shell and run it:

    SELECT
        tab.table_schema AS database_name,
        tab.table_name AS table_name,
        tab.table_rows AS table_rows
    FROM information_schema.tables tab
    LEFT JOIN information_schema.table_constraints tco
        ON (tab.table_schema = tco.table_schema
            AND tab.table_name = tco.table_name
            AND tco.constraint_type = 'PRIMARY KEY')
    WHERE
        tab.table_schema NOT IN ('mysql', 'information_schema', 'performance_schema', 'sys')
        AND tco.constraint_type IS NULL
        AND tab.table_type = 'BASE TABLE';

To see the exact table definition for the tables, use the `SHOW` statement, replacing the placeholder values with your own:

    SHOW CREATE TABLE your_database_name.your_table_name;

To add a primary key to an existing table, use the `ALTER TABLE` statement, replacing the placeholder values with your own:

    ALTER TABLE your_table_name ADD PRIMARY KEY (column1, column2, ...);

For example, the command below combines a customer ID column with a customer last name column to create a primary key in a table named `car`.

    ALTER TABLE car ADD PRIMARY KEY (customer_id,LastName);

To add a primary key for a new MySQL table, use the `CREATE TABLE` statement, replacing the placeholder values with your own:

    CREATE TABLE your_table_name
    (
      column1 <column_definition>,
      column2 <column_definition>,
      ...
      PRIMARY KEY (customer_id,LastName)
    );

For example, the command below creates a table that combines the customer ID column with the customer name column to create a primary key.

    CREATE TABLE car (
        customer_id VARCHAR(20) NOT NULL,
        FirstName varchar(255),
        LastName varchar(255),
        PRIMARY KEY (customer_id,LastName)
    );

## Other Tools and Resources[](#other-tools-and-resources)

*   Use [MySQL Workbench](https://dev.mysql.com/doc/workbench/en/wb-table-editor-columns-tab.html) to define primary keys for your tables

In this article...

*   [How DigitalOcean Uses Primary Keys](#how-digitalocean-uses-primary-keys)
*   [How to Manually Add a Primary Key](#how-to-manually-add-a-primary-key)
*   [Other Tools and Resources](#other-tools-and-resources)

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

Try using different keywords or simplifying your se