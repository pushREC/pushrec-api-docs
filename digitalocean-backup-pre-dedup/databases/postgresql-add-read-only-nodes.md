---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/add-read-only-nodes/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Add Read-Only Nodes to PostgreSQL Database Clusters | DigitalOcean Documentation

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
*   Add Read-Only Nodes

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Add Read-Only Nodes to PostgreSQL Database Clusters

Validated on 8 Aug 2019 • Last edited on 17 Jun 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

[Read-only nodes](/products/databases/#cluster-configuration) are replicas of a cluster’s primary node located in additional geographical regions. Using read-only nodes reduces latency for users connecting from those regions.

Communication between primary and read-only nodes is SSL-encrypted and sent over the public network.

Note

Read-only nodes differ from [standby nodes](/products/databases/postgresql/how-to/add-standby-nodes/), which are exact copies of the primary node that are automatically moved into place in the event of a primary node failure.

## Create a Read-Only Node Using the CLI[](#create-a-read-only-node-using-the-cli)

Note

To create a read-only node using `doctl`, you need to provide values `--region` and `--size` flags, which specify the node’s datacenter and its configuration (number of CPUs, amount of RAM, and hard disk space). Use the [`doctl databases options regions`](/reference/doctl/reference/databases/options/regions/) and [`doctl databases options slugs`](/reference/doctl/reference/databases/options/slugs/) commands, respectively, to get a list of available values.

How to Create a Read-Only Node Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases replica create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/replica/create/) for more details:
    
        doctl databases replica create <database-cluster-id> <replica-name> [flags]
    
    The following example creates a read-only replica named `example-replica` for a database cluster with the ID `ca9f591d-f38h-5555-a0ef-1c02d1d1e35`:
    
        doctl databases replica create ca9f591d-f38h-5555-a0ef-1c02d1d1e35 example-replica --size db-s-1vcpu-1gb
    

## Create a Read-Only Node Using the API[](#create-a-read-only-node-using-the-api)

Note

To create a read-only node using the API, you need to provide values for the `region` and `size` fields, which specify the new node’s datacenter and its configuration (number of CPUs, amount of RAM, and hard disk space). Use the [`/v2/databases/options`](/reference/api/digitalocean/#operation/databases_list_options) endpoint to get a list of available values.

How to Create a Read-Only Node Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/replicas`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_create_replica).

### cURL[](#create-a-read-only-node-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name":"read-nyc3-01", "region":"nyc3", "size": "db-s-2vcpu-4gb", "storage_size_mib": 61440}' \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/replicas"

### Go[](#create-a-read-only-node-go)

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
    
        replicaRequest := &godo.DatabaseCreateReplicaRequest{
    
            Name:   "read-nyc3-01",
            Region: "nyc3",
            Size:   "db-s-2vcpu-4gb",
            StorageSizeMiB : 61440,
        }
    
        replica, _, err := client.Databases.CreateReplica(ctx, "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", replicaRequest)
    }

### Python[](#create-a-read-only-node-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    create_req = {
      "name": "read-nyc3-01",
      "region": "nyc3",
      "size": "db-s-2vcpu-4gb",
      "storage_size_mib": 61440,
    }
    
    create_resp = client.databases.create_replica(database_cluster_uuid="9cc10173", body=create_req)

## Create a Read-Only using the Control Panel[](#create-a-read-only-using-the-control-panel)

To add a read-only node, click the name of the cluster to go to its **Overview**. At the bottom of the page, in the **Read Only Nodes** section, click the **Add a read-only node** link.

![The read only nodes section of the overview page](https://docs.digitalocean.com/screenshots/databases/read-only-nodes.a000dedadde28e8a72029bed94174164449e3ab73469265900f474e4b6400b54.png)

Select the size, which must be equal to or larger than the primary node, then select the datacenter and name the node. When you’re done, click **Create a read-only node** to provision the node.

Like primary nodes, you can [limit access to a read-only nodes](/products/databases/postgresql/how-to/secure/#firewalls) to trusted sources and access read-only nodes using a command-line client and the connection string in the node’s **Overview** page.

## Promote a Read-Only Node to Become a Primary Node[](#promote-a-read-only-node-to-become-a-primary-node)

You can promote an existing read-only node to become the primary node of a new database cluster, essentially creating a fork or replica of its former database cluster. However, these two clusters are independent and do not remain in sync, so any changes you make to one are not copied to the other.

You can also promote a read-only node to create a new database cluster in a different datacenter region. This option can help you maintain uptime if a cluster is experiencing issues in another region.

How to Promote a Read-Only Node Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases replica promote`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/replica/promote/) for more details:
    
        doctl databases replica promote <database-cluster-id> <replica-name> [flags]
    
    The following example promotes a read-only replica named `example-replica` for a database cluster with the ID `ca9f591d-f38h-5555-a0ef-1c02d1d1e35`:
    
        doctl databases replica promote ca9f591d-f38h-5555-a0ef-1c02d1d1e35 example-replica
    

How to Promote a Read-Only Node Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/replicas/{replica_name}/promote`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_promote_replica).

### cURL[](#promote-a-read-only-node-curl)

Using cURL:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/replicas/read-nyc3-01/promote"

### Go[](#promote-a-read-only-node-go)

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
    
        _, err := client.Databases.PromoteReplicaToPrimary(ctx, "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "read-nyc3-01")
    }

### Python[](#promote-a-read-only-node-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    resp = client.databases.promote_replica(database_cluster_uuid="a7a8bas", replica_name="ba8ab22")

In this article...

*   [Create a Read-Only Node Using the CLI](#create-a-read-only-node-using-the-cli)
*   [Create a Read-Only Node Using the API](#create-a-read-only-node-using-the-api)
*   [Create a Read-Only using the Control Panel](#create-a-read-only-using-the-control-panel)
*   [Promote a Read-Only Node to Become a Primary Node](#promote-a-read-only-node-to-become-a-primary-node)

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