---
source: https://docs.digitalocean.com/products/databases/mysql/how-to/fork-clusters/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Fork a MySQL Database Cluster | DigitalOcean Documentation

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
*   Fork Database Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Fork a MySQL Database Cluster

Validated on 8 Apr 2024 • Last edited on 17 Jun 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

Forking a database cluster creates a new cluster from an existing cluster based on a specific point in time. Forking is a cluster-level action that replicates all databases, users, and other settings from the original cluster.

You can create a fork to preserve a cluster’s working state past the 7-day limit that DigitalOcean’s [database restoration feature](/products/databases/mysql/how-to/restore-from-backups/) provides. Alternatively, you can [create a dump](/products/databases/mysql/how-to/import-databases/#export-with-mysqldump). However, using a fork gives you the flexibility to alter the configuration of the forked cluster. Forking a cluster is also a low-risk way of using your production data to test applications, move it between datacenter regions, or archive it for later analysis.

## Fork a Database Using the API[](#fork-a-database-using-the-api)

Creating a database from a backup is the same as forking a database in the control panel. To create a new database cluster based on a backup of an existing cluster, send a POST request to `/v2/databases`. In addition to the standard database cluster attributes, the JSON body must include a key named `backup_restore` with the name of the original database cluster and the timestamp of the backup to be restored.

How to Fork a Database Cluster Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/databases`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_create_cluster).

### cURL[](#fork-a-database-cluster-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name": "backend", "engine": "pg", "version": "14", "region": "nyc3", "size": "db-s-2vcpu-4gb", "num_nodes": 2, "storage_size_mib": 61440, "tags": ["production"]}' \
      "https://api.digitalocean.com/v2/databases"

### Go[](#fork-a-database-cluster-go)

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
    
        createRequest := &godo.DatabaseCreateRequest{
            Name:       "backend",
            EngineSlug: "pg",
            Version:    "14",
            Region:     "nyc3",
            SizeSlug:   "db-s-2vcpu-4gb",
            NumNodes:   2,
            StorageSizeMiB : 61440,
        }
    
        cluster, _, err := client.Databases.Create(ctx, createRequest)
    }

### Python[](#fork-a-database-cluster-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    create_req = {
      "name": "backend",
      "engine": "pg",
      "version": "14",
      "region": "nyc3",
      "size": "db-s-2vcpu-4gb",
      "num_nodes": 2,
      "storage_size_mib": 61440,
      "tags": [
        "production"
      ]
    }
    
    create_resp = client.databases.create_cluster(body=create_req)

## Fork a Database Cluster Using the Control Panel[](#fork-a-database-cluster-using-the-control-panel)

To fork a database cluster, find the cluster on the [**Databases** page](https://cloud.digitalocean.com/databases) and open its **More** menu.

![Screenshot of Cluster More menu](https://docs.digitalocean.com/screenshots/databases/mysql-cluster-more-menu.4f550feebdc01a093d86960b19dd815090313e3aa12b41dd8fac192be61f1008.png)

In the **More** menu, click **Fork database cluster** to go to the **Fork database cluster** page. If you don’t see that option, verify that you opened the **More** menu of the cluster’s primary node and not a read-only node.

The **Fork database cluster** page has two sections: choose a state and choose a cluster configuration.

![Screenshot of restore point in time menu](https://docs.digitalocean.com/screenshots/databases/restore-point-in-time.509b932a71d954edf044f8ae636cc5900cea9d6f8d9fb9093b4801da0cac8da1.png)

## Choose a State[](#choose-a-state)

You can choose from two states:

*   **Latest Transaction:** This state creates a copy of your database as of the time you loaded the **Fork database cluster** page. It won’t include transactions which occurred after you loaded the page, so you may want to refresh to capture the most recent transactions in the fork.
    
*   **Point in Time:** This state creates a copy of your database as of a specific point in time within the last 7 days.
    

## Choose a Cluster Configuration[](#choose-a-cluster-configuration)

You can customize the forked cluster’s configuration with the following options:

*   **Configuration plan**: Choose a plan. You can choose any plan, regardless of the original cluster configuration.
    
*   **Storage size**: Choose a storage size. You can choose any storage size, regardless of the original cluster configuration.
    
*   **Standby nodes**: Select the number of standby nodes. You can choose any number, regardless of the original cluster configuration.
    
*   **Choose a datacenter**: You can select the same datacenter or a different datacenter for the fork.
    

The monthly cost and hourly prorate for the new cluster are displayed here. Billing stops when you destroy the cluster.

## Finalize and Create[](#finalize-and-create)

Choose a name for the forked cluster, between 3 and 63 characters. The name must be lowercase and may not contain spaces. All the databases and users will be copied to the fork, including the required `defaultdb` database and `doadmin` user.

When all required fields are complete, click the **Fork Database Cluster** button to initiate the fork. A fork will take longer to provision than a new cluster as the nodes are created and the data is transferred.

In this article...

*   [Fork a Database Using the API](#fork-a-database-using-the-api)
*   [Fork a Database Cluster Using the Control Panel](#fork-a-database-cluster-using-the-control-panel)
*   [Choose a State](#choose-a-state)
*   [Choose a Cluster Configuration](#choose-a-cluster-configuration)
*   [Finalize and Create](#finalize-and-create)

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

Try using different keywords or simplifying y