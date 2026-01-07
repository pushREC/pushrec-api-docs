---
source: https://docs.digitalocean.com/products/databases/kafka/how-to/resize/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Resize Kafka Clusters | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/kafka.6e5f03a9446ce8ef1cb8ff94d5cfc2174c6a0778b884650e64476af3a9d0888b.svg)Kafka](/products/databases/kafka/)
*   [Getting Started](/products/databases/kafka/getting-started/)
    *   [Quickstart](/products/databases/kafka/getting-started/quickstart/)
*   [How-Tos](/products/databases/kafka/how-to/)
    *   [Create Kafka Clusters](/products/databases/kafka/how-to/create/)
    *   [Connect to Kafka Clusters](/products/databases/kafka/how-to/connect/)
    *   [Create Kafka Topics](/products/databases/kafka/how-to/create-topics/)
    *   [Resize Database Clusters](/products/databases/kafka/how-to/resize/)
    *   [Secure Kafka Clusters](/products/databases/kafka/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/kafka/how-to/schedule-updates/)
    *   [Manage Users and Privileges](/products/databases/kafka/how-to/manage-users-and-privileges/)
    *   [Monitor Kafka Performance](/products/databases/kafka/how-to/monitor-databases/)
    *   [Monitor Cluster Performance](/products/databases/kafka/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/kafka/how-to/set-up-alerts/)
    *   [Forward Logs](/products/databases/kafka/how-to/forward-logs/)
    *   [Destroy Clusters](/products/databases/kafka/how-to/destroy/)
    *   [Enable Schema Registry](/products/databases/kafka/how-to/enable-schema-registry/)
    *   [Tag Database Clusters](/products/databases/kafka/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/kafka/how-to/reconfigure/)
*   [Reference](/products/databases/kafka/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/kafka/concepts/)
    *   [Best Practices](/products/databases/kafka/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/kafka/concepts/responsibility-model/)
*   [Details](/products/databases/kafka/details/)
    *   [Features](/products/databases/kafka/details/features/)
    *   [Pricing](/products/databases/kafka/details/pricing/)
    *   [Availability](/products/databases/kafka/details/availability/)
    *   [Limits](/products/databases/kafka/details/limits/)
    *   [Cluster Notifications](/products/databases/kafka/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)

*   [How-Tos](/products/databases/kafka/how-to/) 
*   Resize Database Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Resize Kafka Clusters

Validated on 8 Dec 2022 • Last edited on 2 Oct 2025

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

You can resize existing Kafka clusters at any time to add more or less CPUs, RAM, and storage.

## Resize a Database Cluster Using the CLI[](#resize-a-database-cluster-using-the-cli)

To resize a database cluster using `doctl`, you need to provide a value for the `--size` flag, which specifies the cluster’s new configuration (number of CPUs, amount of RAM, and hard disk space). Use the [`doctl databases options slugs`](/reference/doctl/reference/databases/options/slugs/) command to get a list of available values.

How to Resize a Database Cluster Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases resize`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/resize/) for more details:
    
        doctl databases resize <database-cluster-id> [flags]
    
    The following example resizes a PostgreSQL or MySQL database to have two nodes, 16 vCPUs, 64 GB of memory, and 2048 GiB of storage space:
    
        doctl databases resize ca9f591d-9999-5555-a0ef-1c02d1d1e352 --num-nodes 2 --size db-s-16vcpu-64gb --storage-size-mib 2048000 --wait true
    

## Resize a Database Cluster Using the API[](#resize-a-database-cluster-using-the-api)

To resize a database cluster using the API, you need to provide a value for the `size` field, which specifies the cluster’s configuration (number of CPUs, amount of RAM, and hard disk space). Use the [`/v2/databases/options`](/reference/api/digitalocean/#operation/databases_list_options) endpoint to get a list of available values.

How to Resize a Database Cluster Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/resize`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_update_clusterSize).

### cURL[](#resize-a-database-cluster-curl)

Using cURL:

    curl -X PUT \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
    -d '{"size":"db-s-4vcpu-8gb", "num_nodes":3, "storage_size_mib":163840}' \
    "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/resize" 

### Go[](#resize-a-database-cluster-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "github.com/digitalocean/godo"
    )
    
    func main() {
        pat := "mytoken"
    
        client := godo.NewFromToken(pat)
        ctx := context.TODO()
    
        resizeRequest := &godo.DatabaseResizeRequest{
            SizeSlug: "db-s-4vcpu-8gb",
            NumNodes: 3,
            StorageSizeMib: 163840,
        }
    }

### Python[](#resize-a-database-cluster-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "size": "db-s-4vcpu-8gb",
      "num_nodes": 3,
      "storage_size_mib": 163840
    }
    
    update_resp = client.databases.update_cluster_size(database_cluster_uuid="a7a8bas", body=req)

## Resize a Kafka Cluster Using the Control Panel[](#resize-a-kafka-cluster-using-the-control-panel)

To resize a Kafka database cluster, click the name of the cluster in the control panel to go to its **Overview** page, then click the **Settings** tab.

In the **Cluster configuration** section, click **Edit**. Select your cluster configuration and CPU option.

![Cluster configuration section with additional nodes selected](https://docs.digitalocean.com/screenshots/databases/kafka-cluster-configuration.f3495732ad5926cdf82eaed6f772ec823970d46f1067481e2f1df74d85e85062.png)

Then, select your storage size. If you select a Dedicated CPU plan, you can also customize the number of nodes in the cluster to 3, 6, 9, or 15 nodes.

![](https://docs.digitalocean.com/screenshots/databases/dbaas-choose-storage-size.3f7414c89a29f123c45ba0f1c4350ee6b2264c6d810faa1fba245f8ed3f3a7a0.png)

The **Autoscale storage** section lets you check a box to automatically increase storage when disk capacity reaches a set percentage threshold. The system bills this increase as [additional storage](/products/databases/kafka/details/pricing/). If you click **Customize**, you can type your own percentage threshold and storage increment.

Autoscaling takes several minutes, depending on the cluster size. It runs without downtime, and you do not need to take any action.

![The storage autoscaling section](https://docs.digitalocean.com/screenshots/databases/storage-autoscaling.6d5c7dd5a6f82be81b30a1a473c89daaf982b4de7e4424a1d9f1e61a8e62b952.png)

Once you have selected your new configuration and size, click **Save** to provision the new configuration. The provisioning takes several minutes but the total time depends on the size of the cluster.

Your cluster’s state changes from **Active** to **Resizing** until the process is done. You can expect no downtime and do not need to take action.

In this article...

*   [Resize a Database Cluster Using the CLI](#resize-a-database-cluster-using-the-cli)
*   [Resize a Database Cluster Using the API](#resize-a-database-cluster-using-the-api)
*   [Resize a Kafka Cluster Using the Control Panel](#resize-a-kafka-cluster-using-the-control-panel)

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