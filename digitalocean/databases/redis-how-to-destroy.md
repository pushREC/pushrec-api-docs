---
source: https://docs.digitalocean.com/products/databases/redis/how-to/destroy/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Destroy Caching Database Clusters | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/redis.213385ebd06d3cd436657564821380f108a92109b568f05c3313d87fc0bc0c96.svg)Caching](/products/databases/redis/)
*   [Getting Started](/products/databases/redis/getting-started/)
    *   [Quickstart](/products/databases/redis/getting-started/quickstart/)
*   [How-Tos](/products/databases/redis/how-to/)
    *   [Create Caching Clusters](/products/databases/redis/how-to/create/)
    *   [Connect to Caching Clusters](/products/databases/redis/how-to/connect/)
    *   [Secure Caching Clusters](/products/databases/redis/how-to/secure/)
    *   [Migrate Caching Databases](/products/databases/redis/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/redis/how-to/schedule-updates/)
    *   [Choose Eviction Policies](/products/databases/redis/how-to/choose-eviction-policies/)
    *   [Tag Database Clusters](/products/databases/redis/how-to/tag/)
    *   [Monitor Cluster Performance](/products/databases/redis/how-to/monitor-clusters/)
    *   [Add Standby Nodes](/products/databases/redis/how-to/add-standby-nodes/)
    *   [Set Up Monitoring Alerts](/products/databases/redis/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/redis/how-to/relocate/)
    *   [Resize Database Clusters](/products/databases/redis/how-to/resize/)
    *   [Destroy Database Clusters](/products/databases/redis/how-to/destroy/)
    *   [Monitor Caching Performance](/products/databases/redis/how-to/monitor-databases/)
    *   [Forward Logs](/products/databases/redis/how-to/forward-logs/)
    *   [Reconfigure Database Clusters](/products/databases/redis/how-to/reconfigure/)
*   [Reference](/products/databases/redis/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/redis/concepts/)
    *   [Best Practices](/products/databases/redis/concepts/best-practices/)
    *   [Migration Strategies](/products/databases/redis/concepts/migration-strategies/)
    *   [Shared Responsibility Model](/products/databases/redis/concepts/responsibility-model/)
*   [Details](/products/databases/redis/details/)
    *   [Features](/products/databases/redis/details/features/)
    *   [Pricing](/products/databases/redis/details/pricing/)
    *   [Availability](/products/databases/redis/details/availability/)
    *   [Limits](/products/databases/redis/details/limits/)
    *   [Cluster Notifications](/products/databases/redis/details/notifications/)
    *   [Memory Usage](/products/databases/redis/details/memory-usage/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/redis/support/)

*   [How-Tos](/products/databases/redis/how-to/) 
*   Destroy Database Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Destroy Caching Database Clusters

Validated on 21 Jul 2021 • Last edited on 17 Jun 2025

Managed Caching is a database engine that supports Redis, an open source, key-value database built with an in-memory design that emphasizes speed. It supports rich data types, atomic operations, and Lua scripting.

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

Deleting a database cluster permanently and irreversibly destroys the cluster, its contents, and its automated backups.

To destroy a database cluster from the control panel, open the cluster’s **More** menu. Click **Destroy** to go to the cluster’s **Settings** page.

![Screenshot of cluster settings page](https://docs.digitalocean.com/screenshots/databases/redis-cluster-settings-page.dd7218ccf27855f42776abf426707ad2ef216e9d108d96356ffc6a5f0f1cbd3f.png)

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

Try using different keywords or simplifying your search
