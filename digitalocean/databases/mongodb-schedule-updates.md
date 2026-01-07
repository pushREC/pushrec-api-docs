---
source: https://docs.digitalocean.com/products/databases/mongodb/how-to/schedule-updates/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Schedule Automatic Software Updates for MongoDB Database Clusters | DigitalOcean Documentation

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
*   Schedule Automatic Updates

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Schedule Automatic Software Updates for MongoDB Database Clusters

Validated on 28 Jun 2021 • Last edited on 17 Jun 2025

MongoDB is a source-available cross-platform document-oriented database program for high-volume storage. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.

DigitalOcean fully manages database software updates for database clusters on your behalf. During the update process, we create a new cluster with OS-level or `db_engine` updates applied, replicate the existing cluster’s data, and then update DNS (which changes the cluster’s underlying IP address).

There is no downtime associated with these updates, but there may be brief periods of latency during the maintenance window. Updates are necessary for security and stability, so you can’t disable them, but you can customize the maintenance window or manually initiate an available update.

## Set a Maintenance Window Using the CLI[](#set-a-maintenance-window-using-the-cli)

How to Set a Maintenance Window Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases maintenance-window update`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/maintenance-window/update/) for more details:
    
        doctl databases maintenance-window update <database-cluster-id> [flags]
    
    The following example updates the maintenance window for a database cluster with the ID `ca9f591d-f38h-5555-a0ef-1c02d1d1e35`:
    
        doctl databases maintenance-window update ca9f591d-f38h-5555-a0ef-1c02d1d1e35 --day tuesday --hour 16:00
    

## Set a Maintenance Window Using the API[](#set-a-maintenance-window-using-the-api)

How to Set a Maintenance Window Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/maintenance`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_update_maintenanceWindow).

### cURL[](#set-a-maintenance-window-curl)

Using cURL:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"day": "tuesday", "hour": "14:00"}' \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/maintenance"

### Go[](#set-a-maintenance-window-go)

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
    
        maintenanceRequest := &godo.DatabaseUpdateMaintenanceRequest{
            Day:  "thursday",
            Hour: "16:00",
        }
    
        _, err := client.Databases.UpdateMaintenance(ctx, "88055188-9e54-4f21-ab11-8a918ed79ee2", maintenanceRequest)
    }

### Python[](#set-a-maintenance-window-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "day": "tuesday",
      "hour": "14:00"
    }
    
    update_resp = client.databases.update_maintenance_window(database_cluster_uuid="a7a8bas", body=req)

## Set a Maintenance Window Using the Control Panel[](#set-a-maintenance-window-using-the-control-panel)

Note

The maintenance window for a cluster applies to its primary node and any standby nodes. Each read-only node has its own maintenance window that is independent of the cluster and other read-only nodes.

You can view or edit a cluster or read-only node’s current maintenance window from its **Settings** page, in the **Maintenance Window** section.

![Screenshot of cluster settings page](https://docs.digitalocean.com/screenshots/databases/generic-cluster-settings.a7c5acfcf3078021df22347b3d28813722197b6ddf68b6ade6f1487d3ff74feb.png)

Software updates may begin at any time in the 4-hour period after the maintenance window’s start time. For example, a maintenance window defined for Sundays at 7 PM will have updates at any time between 7 PM and 11 PM.

To change a cluster or read-only node’s maintenance window, click **Edit**.

![Screenshot of maintenance scheduler window](https://docs.digitalocean.com/screenshots/databases/maintenance-window.be88476517219da1f64585dfbad9995547840fb6395c10053c9188a73c3fab19.png)

Choose the day of the week and the start time for the 4-hour maintenance window, then click **Save**.

## Update Manually[](#update-manually)

When new updates are available, cluster and read-only node **Overview** pages have a banner with basic information on the update.

![The maintenance banner on a database overview page](https://docs.digitalocean.com/screenshots/databases/maintenance-banner.c3ab284b8816b43d450ec53dd75a7f9a21a07d418c7e415842b4d99c60c9ccd0.png)

Click **Update Now** to open the **Required maintenance** window. This window specifies when the updates will be automatically applied.

![The Required maintenance window with the Start Maintenance button visible](https://docs.digitalocean.com/screenshots/databases/required-maintenance-window.73c5cc5b38656c51d4ba6fabf233ac1c610e42747e1fa86aa1747bb5b4440f69.png)

If you want to initiate the update immediately ahead of the scheduled maintenance window, click the **Start Maintenance** button. To manually update read-only nodes, you need to repeat this process for each individual node.

In this article...

*   [Set a Maintenance Window Using the CLI](#set-a-maintenance-window-using-the-cli)
*   [Set a Maintenance Window Using the API](#set-a-maintenance-window-using-the-api)
*   [Set a Maintenance Window Using the Control Panel](#set-a-maintenance-window-using-the-control-panel)
*   [Update Manually](#update-manually)

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

Try using different keywords or simplifying you