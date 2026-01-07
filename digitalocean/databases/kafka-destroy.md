---
source: https://docs.digitalocean.com/products/databases/kafka/how-to/destroy/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Destroy Kafka Clusters | DigitalOcean Documentation

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
*   Destroy Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Destroy Kafka Clusters

Validated on 8 Dec 2022 • Last edited on 17 Jun 2025

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

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

![Screenshot of cluster settings page](https://docs.digitalocean.com/screenshots/databases/kafka-settings.f479fbbed8343b4326a720610f41f50789153e910c310dca6b38f96665ae335d.png)

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