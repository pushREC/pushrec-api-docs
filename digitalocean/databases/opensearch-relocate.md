---
source: https://docs.digitalocean.com/products/databases/opensearch/how-to/relocate/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Relocate Database Clusters | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/opensearch.2629f480d99bedd31ae31e9fd8269c327373bb1a8ecc38a68f458985e2393b42.svg)OpenSearch](/products/databases/opensearch/)
*   [Getting Started](/products/databases/opensearch/getting-started/)
    *   [Quickstart](/products/databases/opensearch/getting-started/quickstart/)
*   [How-Tos](/products/databases/opensearch/how-to/)
    *   [Create OpenSearch Clusters](/products/databases/opensearch/how-to/create/)
    *   [Forward Logs](/products/databases/opensearch/how-to/forward-logs/)
    *   [Resize Database Clusters](/products/databases/opensearch/how-to/resize/)
    *   [Secure OpenSearch Clusters](/products/databases/opensearch/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/opensearch/how-to/schedule-updates/)
    *   [Manage Users](/products/databases/opensearch/how-to/manage-users/)
    *   [Monitor Cluster Performance](/products/databases/opensearch/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/opensearch/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/opensearch/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/opensearch/how-to/fork-clusters/)
    *   [Restore from Backups](/products/databases/opensearch/how-to/restore-from-backups/)
    *   [Destroy Clusters](/products/databases/opensearch/how-to/destroy/)
    *   [Tag Database Clusters](/products/databases/opensearch/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/opensearch/how-to/reconfigure/)
*   [Reference](/products/databases/opensearch/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/opensearch/concepts/)
    *   [Best Practices](/products/databases/opensearch/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/opensearch/concepts/responsibility-model/)
*   [Details](/products/databases/opensearch/details/)
    *   [Features](/products/databases/opensearch/details/features/)
    *   [Pricing](/products/databases/opensearch/details/pricing/)
    *   [Availability](/products/databases/opensearch/details/availability/)
    *   [Limits](/products/databases/opensearch/details/limits/)
    *   [Cluster Notifications](/products/databases/opensearch/details/notifications/)
    *   [Supported Plugins](/products/databases/opensearch/details/supported-plugins/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)

*   [How-Tos](/products/databases/opensearch/how-to/) 
*   Relocate Database Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Relocate Database Clusters

Validated on 2 Feb 2022 • Last edited on 17 Jun 2025

OpenSearch is an open-source search and analytics suite which serves as a centralized location to manage logs forwarded from other resources, such as databases and Droplets.

Relocating a database cluster changes which DigitalOcean datacenter hosts it. We recommend hosting your DigitalOcean resources in the same datacenter. This minimizes the latency in connections between them and helps improve performance.

## Relocate a Database Cluster Using the CLI[](#relocate-a-database-cluster-using-the-cli)

Note

To migrate a database cluster using `doctl`, you need to provide a value for the `--region` flag. Use the [`doctl databases options regions`](/reference/doctl/reference/databases/options/regions/) command to get a list of available values.

How to Migrate a Database Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases migrate`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/migrate/) for more details:
    
        doctl databases migrate <database-cluster-id> [flags]
    

How to Relocate a Database Cluster Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases migrate`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/migrate/) for more details:
    
        doctl databases migrate <database-cluster-id> [flags]
    

## Relocate a Database Cluster Using the API[](#relocate-a-database-cluster-using-the-api)

How to Relocate a Database Cluster Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/migrate`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_update_region).

### cURL[](#relocate-a-database-cluster-curl)

Using cURL:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"region":"lon1"}' \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/migrate"

### Go[](#relocate-a-database-cluster-go)

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
    
        migrateRequest := &godo.DatabaseMigrateRequest{
            Region: "lon1",
        }
    
        _, err := client.Databases.Migrate(ctx, "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", migrateRequest)
    }

### Python[](#relocate-a-database-cluster-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "region": "lon1"
    }
    
    update_resp = client.databases.update_region(database_cluster_uuid="a7a8bas", body=req)

## Relocate a Database Cluster using the Control Panel[](#relocate-a-database-cluster-using-the-control-panel)

To relocate a database cluster from the control panel, select your database cluster from the [**Databases** page](https://cloud.digitalocean.com/databases). Click the name of the cluster to go to its **Overview** page, then click the **Settings** tab.

![Cluster settings page.](https://docs.digitalocean.com/screenshots/databases/opensearch-cluster-settings.7ee943e6ce7661412dd4119ddffdc2abe1e3f37dda773097227e032fa0589a01.png)

On the **Settings** page, in the **Cluster datacenter** section, click **Edit**. Select the region and datacenter to which you want to relocate your cluster.

![Datacenter selection screen.](https://docs.digitalocean.com/screenshots/databases/cluster-datacenters.389564ba23f9de7d528e089b33776fa717a3cf15e07498d1936a8c98644aa11e.png)

Click **Save** to begin the relocation process. The time to complete the relocation varies depending on the size of the cluster and its data.

In this article...

*   [Relocate a Database Cluster Using the CLI](#relocate-a-database-cluster-using-the-cli)
*   [Relocate a Database Cluster Using the API](#relocate-a-database-cluster-using-the-api)
*   [Relocate a Database Cluster using the Control Panel](#relocate-a-database-cluster-using-the-control-panel)

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

Try using different keywords or simplifying your search ter