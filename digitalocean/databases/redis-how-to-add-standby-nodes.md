---
source: https://docs.digitalocean.com/products/databases/redis/how-to/add-standby-nodes/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Add Standby Nodes to Caching Database Clusters | DigitalOcean Documentation

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
*   Add Standby Nodes

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Add Standby Nodes to Caching Database Clusters

Validated on 2 Oct 2019 • Last edited on 17 Jun 2025

Managed Caching is a database engine that supports Redis, an open source, key-value database built with an in-memory design that emphasizes speed. It supports rich data types, atomic operations, and Lua scripting.

In a database cluster, standby nodes maintain a copy of the primary node. If the primary node fails, a standby node is automatically promoted to replace it. Caching clusters can have up to one standby node. Additionally, standby nodes can direct routing for read traffic.

You can add standby nodes during cluster creation in the [cluster configuration section](/products/databases/redis/how-to/create/#choose-a-cluster-configuration) of the create page.

You can also add standby nodes to an existing database cluster. From the **Databases** page, click the name of the cluster to go to its **Overview** page, then click the **Settings** tab.

![Screenshot of Caching cluster settings page](https://docs.digitalocean.com/screenshots/databases/redis-cluster-settings.9341f02990081a1657fd73293ece2b52737552ed58ddd1211e088b2e9c63c168.png)

On the **Settings** page, in the **Cluster configuration** section, click **Edit**. Open the **Standby Nodes** drop-down and choose the number of standby nodes.

Note

Due to the memory requirements of replication, standby nodes are only supported for plans with 2GB of RAM or more.

![Screenshot of Add Standby Nodes](https://docs.digitalocean.com/screenshots/databases/cluster-add-standby.d95b2161700329cac18221112ebe3be363fc9bc78f2e79078f4e919b94b6ce4e.png)

When you’re done, click **Save** to immediately provision the standby nodes. The time to complete varies depending on the size of the primary node and its data, but we recommend allowing at least 5 minutes.

## Use Standby Nodes for Reads[](#use-standby-nodes-for-reads)

You can also use standby nodes for reads, to improve your cluster’s performance. However, doing so can result in the standby nodes being too overwhelmed to properly replace the primary node in case of failure.

To use standby nodes for reads, you can find the standby nodes’ hostname via the API.

How to Retrieve an Existing Database Cluster Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_get_cluster).

### cURL[](#retrieve-an-existing-database-cluster-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

### Go[](#retrieve-an-existing-database-cluster-go)

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
    
        cluster, _, err := client.Databases.Get(ctx, "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30")
    }

### Python[](#retrieve-an-existing-database-cluster-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    get_resp = client.databases.get_cluster(database_cluster_uuid="a7a89a")

And you can find the standby nodes’ IP addresses by querying DNS. To connect to the standby node, add the `replica-` prefix to the primary cluster connection URL. For example:

    dig +short A replica-db-redis-tutorial-redis-watch-local-do-user-0.c.db.ondigitalocean.com
    123.45.67.89
    123.456.78.901

Traffic you send to multiple standby nodes is not load balanced. In order to load balance this traffic, you can either use a client that does it natively or look up the IPs with a tool such as `dig`.

In this article...

*   [Use Standby Nodes for Reads](#use-standby-nodes-for-reads)

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
