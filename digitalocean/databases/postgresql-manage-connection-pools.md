---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/manage-connection-pools/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Manage Connection Pools for PostgreSQL Database Clusters | DigitalOcean Documentation

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
*   Manage Connection Pools

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Manage Connection Pools for PostgreSQL Database Clusters

Validated on 8 Aug 2019 • Last edited on 17 Jun 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

When a client connects directly to a PostgreSQL database, the server forks a process to handle the connection. PostgreSQL databases have a fixed maximum number of connections, and once that limit is hit, additional clients can’t connect. Additionally, each active connection uses about 10 MB of RAM.

You can mitigate potential performance issues from PostgreSQL’s connection limits and memory requirements by using connection pooling. A connection pool may be useful if your database:

*   Typically handles a large number of idle connections,
*   Has wide variability in the possible number of connections at any given time,
*   Drops connections due to max connection limits, or
*   Experiences performance issues due to high CPU usage.

Connection pooling funnels client connections into a pooling application, which reduces the number of processes a database has to handle at any given time. The pooling application passes on a limited number of connections to the database and queues additional connections for delivery when space becomes available.

Note

The _client connection_ is the connection between a database client and either the database cluster itself or the database cluster’s connection pool. The _backend connection_ is the connection between a connection pool and a database cluster.

Connection pooling also lets you manage how many processes are available to each database within a cluster. By using multiple connection pools with different process limits, you can prioritize databases based on their requirements.

DigitalOcean’s PostgreSQL database clusters use [PgBouncer](https://wiki.postgresql.org/wiki/PgBouncer) for connection pooling. Clusters provide 25 connections per 1 GiB of RAM. 3 connections per cluster are reserved for maintenance, and all remaining connections can be allocated to connection pools.

## Create a Connection Pool Using the CLI[](#create-a-connection-pool-using-the-cli)

How to Create a Connection Pool Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases pool create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/pool/create/) for more details:
    
        doctl databases pool create <database-cluster-id> <pool-name> [flags]
    
    The following example creates a connection pool named `example-pool` for a database cluster with the ID `ca9f591d-f38h-5555-a0ef-1c02d1d1e35`. The command uses the `--size` flag to set the pool size to 10 and sets the user to the database’s default user:
    
        doctl databases pool create ca9f591d-f38h-5555-a0ef-1c02d1d1e35 example-pool --size 10
    

## Create a Connection Pool Using the API[](#create-a-connection-pool-using-the-api)

How to Create a Connection Pool Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/pools`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_add_connectionPool).

### cURL[](#create-a-connection-pool-curl)

Using cURL:

    curl -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    -d '{"name": "backend-pool","mode": "transaction","size": 10,"db": "defaultdb","user": "doadmin"}' \
    "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/pools" 

### Go[](#create-a-connection-pool-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "github.com/digitalocean/godo"
    )
    
    func main() {
        pat := "mytoken"
    
        client := godo.NewFromToken(pat)
        ctx := context.TODO()
    
        createPoolReq := &godo.DatabaseCreatePoolRequest{
            Name:     "backend-pool",
            Database: "defaultdb",
            Size:     10,
            User:     "doadmin",
            Mode:     "transaction",
        }
    
        pool, _, err := client.Databases.CreatePool(ctx, "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", createPoolReq)
    }

### Python[](#create-a-connection-pool-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    add_conn_pool_req = {
      "name": "backend-pool",
      "mode": "transaction",
      "size": 10,
      "db": "defaultdb",
      "user": "doadmin"
    }    
    
    add_conn_pool_resp = client.databases.add_connection_pool(database_cluster_uuid="9cc10173", body=add_conn_pool_req)

## Create a Connection Pool Using the Control Panel[](#create-a-connection-pool-using-the-control-panel)

To add a connection pool to a database cluster, from the [**Databases** page](https://cloud.digitalocean.com/databases), click the name of the cluster to go to its **Overview** page. From there, click the **Connection Pools** tab at the top, then click **Create a Pool** to open the **Create Connection Pool** window.

![Screenshot of pool creation form](https://docs.digitalocean.com/screenshots/databases/connection-pool-settings.75967cc15e6a18c303cff168887ae7c85b3e5799fffbad0f8fda4ea581755042.png)

This opens a **Create Connection Pool** window to fill out settings for the pool:

*   **Pool name**, as well as the database and user the pool will use.
*   **Pool mode**, which is how the backend server connections are managed.
*   **Pool size**, which determines how many backend server connections are available.

### Pool Name[](#pool-name)

The **Pool Name** doesn’t affect how your pool functions, but it must be unique and it cannot be edited once the pool is created. To rename a pool, you must delete it, create a new one, and update the connection information in your application.

Once you’ve named the pool, select the database you’re creating the pool for and the database user that the pool will use to authenticate.

### Pooling Modes[](#pooling-modes)

Next, select the **mode** of your connection pool. There are three options: transaction, session, and statement.

Transaction mode is the most common option and is selected for you by default. This setting cannot be modified after creation, so if you’re not sure which to choose, we recommend transaction mode for the general use case.

*   **Transaction mode** lets each client to use the pool for the duration of a single transaction at a time. If there are not enough available connections in the pool to handle the transactions sent, the additional transactions are queued to run once connections are available.
    
    Transaction mode is useful when you have a large number of clients that maintain idle connections. They can maintain their connection to the pool without taking up a connection with PostgreSQL, providing all the benefits of a low number of active connections while avoiding the need to terminate idle clients.
    
*   **Session mode** lets clients continue issuing requests until they disconnect from the database, which maintains the client’s connection the entire time. If there are not enough available connections in the pool to handle all the connecting clients, the additional clients are queued up to connect once an existing client disconnects.
    
    Session mode is useful when your application uses prepared statements, advisory locks, listen/notify, or other features which operate on a session level rather than a transaction level.
    
*   **Statement mode** is the most restrictive and only allows a single statement at a time before moving on to the next in the queue. This means queries with multiple statements are not allowed and will fail.
    
    Statement mode is useful when you force autocommit for each client, meaning each transaction is already limited to a single statement.
    

### Pool Size[](#pool-size)

The pool size is the minimum number of connections the pool can handle. The maximum pool size varies based on the size of the cluster.

There’s no perfect formula to determine how large your pool should be, but we recommend a few guidelines:

*   A large pool will stress your database at similar levels as that number of clients would alone.
    
*   A pool that’s much smaller than the number of clients communicating with the database can act as a bottleneck, reducing the rate at which your database receives and responds to transactions.
    

We recommend starting with a pool size of about half your available connections and adjusting later based on performance. If you see slow query responses, check the CPU usage on the database’s **Overview** tab. We recommend decreasing your pool size if CPU usage is high, and increasing your pool size if it’s low.

### Create Pool[](#create-pool)

When you’re ready, click **Create Pool**. Once a pool exists, you’ll see the number of backend server connections remaining and a table of all the pools that exist and their settings.

![Screenshot of pool creation form](https://docs.digitalocean.com/screenshots/databases/connection-pool-example.dc6ae67386050bf99c6a1450b7eeb1008c411ffc0e6e69bae0348a5f282e40d9.png)

## Connecting to the Pool[](#connecting-to-the-pool)

Once you’ve created a connection pool, you must use its specific information to force clients to connect to it. This is available by clicking the **Connection details** link, which provides the data in three formats: Connection parameters, Connection string, and Flags.

Warning

Your database user and password is a plaintext part of the connection settings, so ensure it’s not exposed publicly.

![Screenshot of pool creation form](https://docs.digitalocean.com/screenshots/databases/connection-details.b18206f6861c63d5a396b1c98934b93c5588ce48c46b27582d6f20337d848ccd.png)

For more information on SSL modes, see [How to Secure Clusters](/products/databases/postgresql/how-to/secure/#ssl-modes). Learn more about PostgreSQL connection pools in [PostgreSQL’s documentation on Connection Pools and Data Sources](https://www.postgresql.org/docs/7.4/jdbc-datasource.html) and [the PostgreSQL wiki’s article on Replication, Clustering, and Connection Pooling](https://wiki.postgresql.org/wiki/Replication,_Clustering,_and_Connection_Pooling).

Warning

Using `pg_dump` on a connection pool causes errors when `pool_mode` is set to `transaction`. We recommend you use `pg_dump` directly against your database cluster, bypassing its connection pool(s).

In this article...

*   [Create a Connection Pool Using the CLI](#create-a-connection-pool-using-the-cli)
*   [Create a Connection Pool Using the API](#create-a-connection-pool-using-the-api)
*   [Create a Connection Pool Using the Control Panel](#create-a-connection-pool-using-the-control-panel)
    *   [Pool Name](#pool-name)
    *   [Pooling Modes](#pooling-modes)
    *   [Pool Size](#pool-size)
    *   [Create Pool](#create-pool)
*   [Connecting to the Pool](#connecting-to-the-pool)

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

Try using different