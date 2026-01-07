---
source: https://docs.digitalocean.com/products/databases/mongodb/how-to/create/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Create MongoDB Database Clusters | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/mongodb.15f32316da2692011abce02f393a1ee6db469250230cf1ea962c181c0e9e7de5.svg)MongoDB](/products/databases/mongodb/)
*   [Getting Started](/products/databases/mongodb/getting-started/)
    *   [Quickstart](/products/databases/mongodb/getting-started/quickstart/)
    *   [Serverless Jamstack Site](/products/functions/getting-started/serverless-jamstack/)
*   [How-Tos](/products/databases/mongodb/how-to/)
    *   [Create MongoDB Clusters](/products/databases/mongodb/how-to/create/)
    *   [Resize Database Clusters](/products/databases/mongodb/how-to/resize/)
    *   [Connect to MongoDB Clusters](/products/databases/mongodb/how-to/connect/)
    *   [Import MongoDB Data](/products/databases/mongodb/how-to/import-collections/)
    *   [Secure MongoDB Clusters](/products/databases/mongodb/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/mongodb/how-to/schedule-updates/)
    *   [Tag Database Clusters](/products/databases/mongodb/how-to/tag/)
    *   [Manage Users and Databases](/products/databases/mongodb/how-to/manage-users-and-databases/)
    *   [Upgrade Database Clusters](/products/databases/mongodb/how-to/upgrade/)
    *   [Add Standby Nodes](/products/databases/mongodb/how-to/add-standby-nodes/)
    *   [Monitor Cluster Performance](/products/databases/mongodb/how-to/monitor-clusters/)
    *   [Forward Logs](/products/databases/mongodb/how-to/forward-logs/)
    *   [Set Up Monitoring Alerts](/products/databases/mongodb/how-to/set-up-alerts/)
    *   [Fork Database Clusters](/products/databases/mongodb/how-to/fork-clusters/)
    *   [Reconfigure Database Clusters](/products/databases/mongodb/how-to/reconfigure/)
    *   [Restore from Backups](/products/databases/mongodb/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/mongodb/how-to/destroy/)
*   [Reference](/products/databases/mongodb/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/mongodb/concepts/)
    *   [Best Practices](/products/databases/mongodb/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/mongodb/concepts/responsibility-model/)
*   [Details](/products/databases/mongodb/details/)
    *   [Features](/products/databases/mongodb/details/features/)
    *   [Pricing](/products/databases/mongodb/details/pricing/)
    *   [Availability](/products/databases/mongodb/details/availability/)
    *   [Limits](/products/databases/mongodb/details/limits/)
    *   [Cluster Notifications](/products/databases/mongodb/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/mongodb/support/)

*   [How-Tos](/products/databases/mongodb/how-to/) 
*   Create MongoDB Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create MongoDB Database Clusters

Validated on 18 Mar 2024 • Last edited on 2 Oct 2025

MongoDB is a source-available cross-platform document-oriented database program for high-volume storage. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.

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

## Create a MongoDB Database Using the Control Panel[](#create-a-mongodb-database-using-the-control-panel)

You can create a MongoDB database cluster at any time from the **Create** menu by selecting **Databases**. This takes you to the **Create a Database** page.

![The Create menu](https://docs.digitalocean.com/screenshots/create.88f76a2e0fbab47d46467cfdb31a9a9396d289032523120cfbdf1b695f0aac34.png)

In the create menu, click **Databases** to open the database cluster creation page. This is where you choose your database cluster’s configuration, like the number and size of nodes and the datacenter region.

### Choose a datacenter[](#choose-a-datacenter)

In the **Choose a datacenter** section, select the datacenter for your database cluster.

![The datacenter selection portion of the databases create page](https://docs.digitalocean.com/screenshots/databases/choose-a-datacenter.8a85a318bf0c63c34a708273e30550fe7f8424a031dac254ae00dadd5d93d7be.png)

This page lists the datacenters in which you currently have the most resources. The number of resources you have in each datacenter is listed to the right as **X resources**. Hover over this text to see the specific resources you have in that datacenter.

For the best performance, create your database in the same datacenter as your other DigitalOcean resources. After creation, you cannot relocate your cluster to another datacenter.

Note

Each region has one or more datacenters, each with a different [VPC](/products/networking/vpc/) network. By including resources in the same datacenter, they all gain access to the same private networking interface, which reduces lag and keeps traffic between them from being routed over the public internet.

### Choose a database engine[](#choose-a-database-engine)

In the **Choose a database engine** section, choose MongoDB.

![The database engine selection portion of the databases create page](https://docs.digitalocean.com/screenshots/databases/mongodb-database-engine.04e76bf49d52badccc8eda067da54916e0b309ce70a3b6e31964c82eac806ba5.png)

We currently support versions 6.0, 7.0, and 8.0. You cannot change the MongoDB version after creating a cluster.

### Choose a cluster configuration[](#choose-a-cluster-configuration)

In the **Choose a cluster configuration** section, select a Droplet plan and quantity of nodes for the cluster.

Each option lists its combined monthly cost, equivalent hourly cost, and node specifications. For more options, click **Additional product plans**.

![The Choose a cluster configuration section of the Create a database page displaying the node size, standby nodes, and monthly cost](https://docs.digitalocean.com/screenshots/databases/mongodb-cluster-configuration.2abd7edd599ca7565d98f5f7cfc3a853cd6704abcf55d6ca54ef657a796d23dc.png)

You can also add up to two standby nodes to your cluster. Standby nodes ensure that your data stays available by giving your cluster [high availability and failover](/products/databases/#high-availability).

You can [increase the number or size of database nodes](/products/databases/mongodb/how-to/resize/) at any time. However, you cannot downsize nodes to have less storage than the current storage the cluster is currently using.

### Choose a storage size[](#choose-a-storage-size)

In the **Choose a storage size** section, you can increase your storage by clicking the up arrow or entering your desired storage amount, in increments of 10 GB, up to the maximum listed in the storage range. Additional storage you add to the cluster costs $0.21 per GiB per month.

![](https://docs.digitalocean.com/screenshots/databases/dbaas-choose-storage-size.3f7414c89a29f123c45ba0f1c4350ee6b2264c6d810faa1fba245f8ed3f3a7a0.png)

You can [increase or decrease your storage](/products/databases/mongodb/how-to/resize/) at any time.

### Enable storage autoscaling[](#enable-storage-autoscaling)

The **Autoscale storage** section lets you check a box to automatically increase storage when disk capacity reaches a set percentage threshold. The system bills this increase as [additional storage](/products/databases/mongodb/details/pricing/). If you click **Customize**, you can type your own percentage threshold and storage increment.

Autoscaling takes several minutes, depending on the cluster size. It runs without downtime, and you do not need to take any action.

![The storage autoscaling section](https://docs.digitalocean.com/screenshots/databases/storage-autoscaling.6d5c7dd5a6f82be81b30a1a473c89daaf982b4de7e4424a1d9f1e61a8e62b952.png)

### Finalize and Create[](#finalize-and-create)

In the last section, **Finalize and Create**, choose the name for the cluster, the project to add it to, and any tags you want to use.

![The Finalize and Create section of the Create a database page](https://docs.digitalocean.com/screenshots/databases/finalize-and-create.f9c53777d46a3fd47e903b632bcb639e8d26b1bfacda7058c55eb322caeeb5c0.png)

There are three sub-headers in this section:

*   **Choose a name**: You can leave the automatically-generated name for the database or choose a custom name. Names must be unique, be between 3 and 63 characters long, and only contain alphanumeric characters, dashes, and periods.
    
*   **Select a project**: You can leave the default project or choose another one.
    
*   **Tags**: You can add a tag by typing it into the text box and pressing enter. Tags can only contain letters, numbers, colons, dashes, and underscores.
    

After creation, you can always [edit the database’s tags](/products/databases/mongodb/how-to/tag/) or move it to another project; however, its name cannot be changed.

When you’re ready, click the **Create a Database Cluster** button.

Clusters typically take five minutes or more to provision, but you can complete important configuration tasks such as [restricting inbound connections](/products/databases/mongodb/how-to/secure/#firewalls) while you wait.

In this article...

*   [Create a Database Cluster Using the CLI](#create-a-database-cluster-using-the-cli)
*   [Create a Database Cluster Using the API](#create-a-database-cluster-using-the-api)
*   [Create a MongoDB Database Using the Control Panel](#create-a-mongodb-database-using-the-control-panel)
    *   [Choose a datacenter](#choose-a-datacenter)
    *   [Choose a database engine](#choose-a-database-engine)
    *   [Choose a cluster configuration](#choose-a-cluster-configuration)
    *   [Choose a storage size](#choose-a-storage-size)
    *   [Enable storage autoscaling](#enable-storage-autoscaling)
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
