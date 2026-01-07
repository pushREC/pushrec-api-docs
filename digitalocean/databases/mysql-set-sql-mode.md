---
source: https://docs.digitalocean.com/products/databases/mysql/how-to/set-sql-mode/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Set Global SQL Mode on MySQL Clusters | DigitalOcean Documentation

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
*   Set Global SQL Mode

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Set Global SQL Mode on MySQL Clusters

Validated on 16 Dec 2025 • Last edited on 16 Dec 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

MySQL can operate in different SQL modes. Global SQL modes affect the SQL syntax MySQL supports and the data validation checks it performs. You can add and remove modes as needed, or remove all modes from your cluster if desired.

## Set Global SQL Mode Using the CLI[](#set-global-sql-mode-using-the-cli)

How to Set Global SQL Mode Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases sql-mode set`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/sql-mode/set/) for more details:
    
        doctl databases sql-mode set <database-cluster-id> <sql-mode-1> ... <sql-mode-n> [flags]
    
    The following example sets the SQL mode ALLOW\_INVALID\_DATES for an existing database cluster with the ID `ca9f591d-f38h-5555-a0ef-1c02d1d1e35`. The cluster already has the modes `NO_ZERO_DATE`, `NO_ZERO_IN_DATE`, `STRICT_ALL_TABLES` set, but they must be included in the command to avoid being overwritten by the additional mode:
    
        doctl databases sql-mode set ca9f591d-f38h-5555-a0ef-1c02d1d1e35 NO_ZERO_DATE NO_ZERO_IN_DATE STRICT_ALL_TABLES ALLOW_INVALID_DATES
    

## Set Global SQL Mode Using the API[](#set-global-sql-mode-using-the-api)

How to Set Global SQL Mode Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/sql_mode`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_update_sql_mode).

### cURL[](#set-global-sql-mode-curl)

Using cURL:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"sql_mode":"ANSI,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE"}' \
      "https://api.digitalocean.com/v2/databases/9cdb64e5-61e4-4b30-b711-11ef66d84558/sql_mode"

### Go[](#set-global-sql-mode-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "os"
    
        "github.com/digitalocean/godo"
    )
    
    func main() {
        token := os.Getenv("DIGITALOCEAN_TOKEN")
    
        client := godo.NewFromToken(token)
        ctx := context.TODO()
    
        sqlMode := "ANSI,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE"
        _, err := client.Databases.SetSQLMode(ctx, "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", sqlMode)
    }

### Python[](#set-global-sql-mode-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "sql_mode": "ANSI,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE"
    }
    
    update_resp = client.databases.update_sql_mode(database_cluster_uuid="a7a8bas", body=req)

## Set Global SQL Mode using the Control Panel[](#set-global-sql-mode-using-the-control-panel)

To set the global SQL mode for a MySQL cluster, find the cluster on the [**Databases** page](https://cloud.digitalocean.com/databases) and then click the cluster’s name. From the database’s Overview page, click the **Settings** tab to view the settings for the cluster.

![Screenshot of MySQL Cluster settings page](https://docs.digitalocean.com/screenshots/databases/dbaas-mysql-settings.267a347d52f77661e2067115175c9ad52b580df70a114e12a1185711e0d86b17.png)

In the **Global SQL mode** section, you can see the current SQL modes in use. To add or remove modes, click **Edit**.

Select an available SQL mode from the drop-down menu or start typing the name of a mode to select from the results that match. When finished, click the **Save** button to apply the changes or the **Cancel** button to cancel editing. You can click the **Reset to the default MySQL 8 SQL modes** links to revert to the default settings.

![Screenshot of MySQL SQL Mode edit](https://docs.digitalocean.com/screenshots/databases/dbaas-sql-mode-edit.6775b5d8eb8d7d5ed1fe1e383268bae13d41d71051d4c1f2feda32254df1620f.png)

To remove modes, mouse over the mode you want to remove and then click the “x” icon to remove it from your cluster.

![Screenshot of MySQL SQL Mode removal](https://docs.digitalocean.com/screenshots/databases/mysql-remove-mode.7fb4d3856bb56f90792b836dfbee090a01e92ef8aaefa884fec0204b62ee066b.png)

The default SQL modes for MySQL on managed databases are as follows:

*   `ANSI_QUOTES`
*   `ERROR_FOR_DIVISION_BY_ZERO`
*   `IGNORE_SPACE`
*   `NO_ENGINE_SUBSTITUTION`
*   `NO_ZERO_DATE`
*   `NO_ZERO_IN_DATE`
*   `ONLY_FULL_GROUP_BY`
*   `PIPES_AS_CONCAT`
*   `REAL_AS_FLOAT`
*   `STRICT_ALL_TABLES`

In certain cases, you may also want to adjust the `sql_require_primary_key`, which determines whether [primary keys](/products/databases/mysql/how-to/create-primary-keys/) are a requirement. When set to `True` (default), primary keys are required. When set to `False`, primary keys are optional. However, we do not currently support adjusting this mode in the control panel. Instead, you can set this mode by making a [configuration request](/reference/api/digitalocean/#operation/databases_patch_config) via our API.

Warning

For clusters with more than one node, we strongly recommend keeping `sql_require_primary_key` as `True`. Setting it to `False` may severely impact replication and cause issues.

See the official MySQL 8 documentation for a [full list of supported SQL modes](https://dev.mysql.com/doc/refman/8.0/en/sql-mode.html#sql-mode-full).

In this article...

*   [Set Global SQL Mode Using the CLI](#set-global-sql-mode-using-the-cli)
*   [Set Global SQL Mode Using the API](#set-global-sql-mode-using-the-api)
*   [Set Global SQL Mode using the Control Panel](#set-global-sql-mode-using-the-control-panel)

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

Try using different keywords or simplifying your