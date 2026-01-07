---
source: https://docs.digitalocean.com/products/databases/redis/how-to/create/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Create Caching Database Clusters | DigitalOcean Documentation

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
*   Create Caching Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create Caching Database Clusters

Validated on 31 Mar 2021 • Last edited on 17 Jun 2025

Managed Caching is a database engine that supports Redis, an open source, key-value database built with an in-memory design that emphasizes speed. It supports rich data types, atomic operations, and Lua scripting.

Warning

[DigitalOcean Managed Caching](/products/databases/redis/) is being discontinued on 30 June 2025.

To replace Managed Caching, we are offering [Managed Valkey](/products/databases/valkey/), a Redis-compatible alternative with RDMA and higher throughput. All existing Managed Caching clusters automatically convert to Valkey clusters by 30 June 2025 during your [upgrade window](/products/databases/redis/how-to/schedule-updates/), retaining all data.

You can also [manually convert your Caching cluster to Valkey](/products/databases/valkey/getting-started/convert/).

## Create a Database Cluster Using the CLI[](#create-a-database-cluster-using-the-cli)

To create a database using `doctl`, you need to provide values for the `--engine`, `--region`, and `--size` flags. Use the [`doctl databases options engines`](/reference/doctl/reference/databases/options/engines/), [`doctl databases options regions`](/reference/doctl/reference/databases/options/regions/), and [`doctl databases options slugs`](/reference/doctl/reference/databases/options/slugs/) commands, respectively, to get a list of available values.

How to Create a Database Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/create/) for more details:
    
        doctl databases create <name> [flags]
    
    The following example creates a database cluster named `example-database` in the `nyc1` region with a single 1 GB node:
    
        doctl databases create example-database --region nyc1 --size db-s-1vcpu-1gb --num-nodes 1
    

## Create a Database Cluster Using the API[](#create-a-database-cluster-using-the-api)

To create a database using the API, you need to provide values for the `engine`, `region`, and `size` fields, which specify the database’s engine, its datacenter, and its configuration (number of CPUs, amount of RAM, and hard disk space). Use the [`/v2/databases/options`](/reference/api/digitalocean/#operation/databases_list_options) endpoint to get a list of available values.

How to Create a Database Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/databases`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_create_cluster).

### cURL[](#create-a-database-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name": "backend", "engine": "pg", "version": "14", "region": "nyc3", "size": "db-s-2vcpu-4gb", "num_nodes": 2, "storage_size_mib": 61440, "tags": ["production"]}' \
      "https://api.digitalocean.com/v2/databases"

### Go[](#create-a-database-go)

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

### Python[](#create-a-database-python)

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

## Create a Database Cluster Using the Control Panel[](#create-a-database-cluster-using-the-control-panel)

You can create a Caching database cluster at any time from the **Create** menu by selecting **Databases**. This takes you to the **Create a Database** page.

![The Create menu](https://docs.digitalocean.com/screenshots/create.88f76a2e0fbab47d46467cfdb31a9a9396d289032523120cfbdf1b695f0aac34.png)

In the create menu, click **Databases** to open the database cluster creation page. This is where you choose your database cluster’s configuration, like the number and size of nodes and the datacenter region.

### Choose a datacenter[](#choose-a-datacenter)

In the **Choose a datacenter** section, select the datacenter for your database cluster.

![The datacenter selection portion of the databases create page](https://docs.digitalocean.com/screenshots/databases/choose-a-datacenter.8a85a318bf0c63c34a708273e30550fe7f8424a031dac254ae00dadd5d93d7be.png)

This page lists the datacenters in which you currently have the most resources. The number of resources you have in each datacenter is listed to the right as **X resources**. Hover over this text to see the specific resources you have in that datacenter.

For the best performance, create your database in the same datacenter as your other DigitalOcean resources. After creation, you can [relocate your cluster to another datacenter](/products/databases/redis/how-to/relocate/).

Note

Each region has one or more datacenters, each with a different [VPC](/products/networking/vpc/) network. By including resources in the same datacenter, they all gain access to the same private networking interface, which reduces lag and keeps traffic between them from being routed over the public internet.

### Choose a database engine[](#choose-a-database-engine)

In the **Choose a database engine** section, choose Caching.

![The database engine selection portion of the databases create page](https://docs.digitalocean.com/screenshots/databases/redis-database-engine.9878f91edaacc12406d545c8d8f52824173d405a845c29287b07c0d562e1d5cd.png)

We currently support Caching 7. You cannot change the Caching version after creating a cluster.

### Choose a cluster configuration[](#choose-a-cluster-configuration)

In the **Choose a cluster configuration** section, select a Droplet plan and quantity of nodes for the cluster. Each option lists its combined monthly cost, equivalent hourly cost, and node specifications. For more options, click **Additional product plans**.

![The Choose a cluster configuration section of the Create a database page displaying the node size, standby nodes, and monthly cost](https://docs.digitalocean.com/screenshots/databases/redis-cluster-configuration.a6f1d47dc1dd7f533534b049b3a08e7f2a932f781849a63b740dcd9754431206.png)

If you select any node plan _besides_ the smallest (`1 vCPU / 1 GiB RAM / 10 GiB SSD`), you can also add one or two standby nodes to your cluster. Standby nodes ensure that your data stays available by giving your cluster [high availability and failover](/products/databases/#high-availability).

Caching has memory overhead requirements, so the amount of available, usable memory in Caching nodes is less than their total amount of memory. For a chart of usable memory per plan, see [Caching memory usage](/products/databases/redis/details/memory-usage/).

You can [increase the number or size of database nodes](/products/databases/redis/how-to/resize/) at any time. However, you cannot downsize nodes to have less storage than the current storage the cluster is currently using.

Note

On Caching, each CPU in your cluster can handle up to 200 new connections per second. Any additional connection attempts within the second fail and users must try again.

To work around this limitation, we recommend using connection pooling, which caches database connections and improves performance. DigitalOcean Caching clusters do not support connection pooling natively; however, most clients used to connect to Caching do. Alternatively, you can [resize your database clusters](/products/databases/redis/how-to/resize/) to add more CPUs.

### Finalize and Create[](#finalize-and-create)

In the last section, **Finalize and Create**, choose the name for the cluster, the project to add it to, and any tags you want to use.

![The Finalize and Create section of the Create a database page](https://docs.digitalocean.com/screenshots/databases/finalize-and-create.f9c53777d46a3fd47e903b632bcb639e8d26b1bfacda7058c55eb322caeeb5c0.png)

There are three sub-headers in this section:

*   **Choose a name**: You can leave the automatically-generated name for the database or choose a custom name. Names must be unique, be between 3 and 63 characters long, and only contain alphanumeric characters, dashes, and periods.
    
*   **Select a project**: You can leave the default project or choose another one.
    
*   **Tags**: You can add a tag by typing it into the text box and pressing enter. Tags can only contain letters, numbers, colons, dashes, and underscores.
    

After creation, you can always [edit the database’s tags](/products/databases/redis/how-to/tag/) or move it to another project; however, its name cannot be changed.

When you’re ready, click the **Create a Database Cluster** button.

Clusters typically take five minutes or more to provision, but you can complete important configuration tasks such as [restricting inbound connections](/products/databases/redis/how-to/secure/#firewalls) while you wait.

In this article...

*   [Create a Database Cluster Using the CLI](#create-a-database-cluster-using-the-cli)
*   [Create a Database Cluster Using the API](#create-a-database-cluster-using-the-api)
*   [Create a Database Cluster Using the Control Panel](#create-a-database-cluster-using-the-control-panel)
    *   [Choose a datacenter](#choose-a-datacenter)
    *   [Choose a database engine](#choose-a-database-engine)
    *   [Choose a cluster configuration](#choose-a-cluster-configuration)
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

Try using different keywords or simplifying your se
