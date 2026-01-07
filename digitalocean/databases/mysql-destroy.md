---
source: https://docs.digitalocean.com/products/databases/mysql/how-to/destroy/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Destroy MySQL Database Clusters | DigitalOcean Documentation

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
*   Destroy Database Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Destroy MySQL Database Clusters

Validated on 1 Mar 2021 • Last edited on 17 Jun 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

Deleting a database cluster permanently and irreversibly destroys the cluster, its contents, and its automated backups.

## Destroy a Database Cluster Using the CLI or API[](#destroy-a-database-cluster-using-the-cli-or-api)

How to Create a Database Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases delete`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/delete/) for more details:
    
        doctl databases delete <database-cluster-id> [flags]
    
    The following example deletes the database cluster with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`:
    
        doctl databases delete f81d4fae-7dec-11d0-a765-00a0c91e6bf6
    

How to Destroy a Database Cluster Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a DELETE request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_destroy_cluster).

### cURL[](#destroy-a-database-cluster-curl)

Using cURL:

    curl -X DELETE \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30" 

### Go[](#destroy-a-database-cluster-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "github.com/digitalocean/godo"
    )
    
    func main() {
        pat := "mytoken"
    
        client := godo.NewFromToken(pat)
        ctx := context.TODO()
    
        _, err := client.Databases.Delete(ctx, "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30")
    }

### Python[](#destroy-a-database-cluster-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    delete_resp = client.databases.destroy_cluster(database_cluster_uuid="a7abba8")

## Destroy a Database Cluster Using the Control Panel[](#destroy-a-database-cluster-using-the-control-panel)

To destroy a database cluster from the control panel, open the cluster’s **More** menu. Click **Destroy** to go to the cluster’s **Settings** page.

![Screenshot of cluster settings page](https://docs.digitalocean.com/screenshots/databases/mysql-cluster-settings.488ffff00c3371397115f53a0ac7c13f25254636a58e80d5adf3efb0f9fdb999.png)

In the **Destroy this database cluster** section at the bottom of the page, click the **Destroy** button. This opens a **Destroy database cluster** confirmation window.

![Screenshot of the destroy cluster warning](https://docs.digitalocean.com/screenshots/databases/destroy-cluster-warning.fa56c3f2990f3a2e7d45c017fef6c0c1e2d824c3e3affceabdbe59cf62df8a41.png)

To permanently destroy the cluster, type or copy and paste the name of the database cluster into the text field, then click **Destroy**.

Warning

Destroying a database cluster destroys the backups of that database. Make sure you download any important data before you destroy a cluster.

In this article...

*   [Destroy a Database Cluster Using the CLI or API](#destroy-a-database-cluster-using-the-cli-or-api)
*   [Destroy a Database Cluster Using the Control Panel](#destroy-a-database-cluster-using-the-control-panel)

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

Try using different keywords or simplifying your sear