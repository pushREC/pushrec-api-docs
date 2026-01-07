---
source: https://docs.digitalocean.com/products/databases/mysql/how-to/secure/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Secure MySQL Managed Database Clusters | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/mysql.15f32316da2692011abce02f393a1ee6db469250230cf1ea962c181c0e9e7de5.svg)MySQL](/products/databases/mysql/)
*   [Getting Started](/products/databases/mysql/getting-started/)
    *   [Quickstart](/products/databases/mysql/getting-started/quickstart/)
*   [How-Tos](/products/databases/mysql/how-to/)
    *   [Create MySQL Clusters](/products/databases/mysql/how-to/create/)
    *   [Connect to MySQL Clusters](/products/databases/mysql/how-to/connect/)
    *   [Resize Database Clusters](/products/databases/mysql/how-to/resize/)
    *   [Import Databases](/products/databases/mysql/how-to/import-databases/)
    *   [Secure MySQL Clusters](/products/databases/mysql/how-to/secure/)
    *   [Migrate MySQL Databases](/products/databases/mysql/how-to/migrate/)
    *   [Schedule Automatic Updates](/products/databases/mysql/how-to/schedule-updates/)
    *   [Manage Users and Databases](/products/databases/mysql/how-to/manage-users-and-databases/)
    *   [Modify User Privileges](/products/databases/mysql/how-to/modify-user-privileges/)
    *   [Monitor MySQL Performance](/products/databases/mysql/how-to/monitor-databases/)
    *   [Add Standby Nodes](/products/databases/mysql/how-to/add-standby-nodes/)
    *   [Add Read-Only Nodes](/products/databases/mysql/how-to/add-read-only-nodes/)
    *   [Monitor Cluster Performance](/products/databases/mysql/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/mysql/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/mysql/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/mysql/how-to/fork-clusters/)
    *   [Forward Logs](/products/databases/mysql/how-to/forward-logs/)
    *   [Restore from Backups](/products/databases/mysql/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/mysql/how-to/destroy/)
    *   [Set Global SQL Mode](/products/databases/mysql/how-to/set-sql-mode/)
    *   [Tag Database Clusters](/products/databases/mysql/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/mysql/how-to/reconfigure/)
    *   [Create Primary Keys](/products/databases/mysql/how-to/create-primary-keys/)
*   [Reference](/products/databases/mysql/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/mysql/concepts/)
    *   [Migration Strategies](/products/databases/mysql/concepts/migration-strategies/)
    *   [Sort Buffer Size](/products/databases/mysql/concepts/sort-buffer-size/)
    *   [Best Practices](/products/databases/mysql/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/mysql/concepts/responsibility-model/)
*   [Details](/products/databases/mysql/details/)
    *   [Features](/products/databases/mysql/details/features/)
    *   [Pricing](/products/databases/mysql/details/pricing/)
    *   [Availability](/products/databases/mysql/details/availability/)
    *   [Limits](/products/databases/mysql/details/limits/)
    *   [Cluster Notifications](/products/databases/mysql/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/mysql/support/)

*   [How-Tos](/products/databases/mysql/how-to/) 
*   Secure MySQL Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Secure MySQL Managed Database Clusters

Validated on 1 Mar 2021 • Last edited on 17 Jun 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

Data in MySQL database clusters is encrypted at rest with LUKS (Linux Unified Key Setup) and in transit with SSL. However, there are additional steps you can take to ensure that your data is safe.

## Restrict Incoming Connections[](#firewalls)

You can greatly decrease the likelihood of a security breach by restricting which DigitalOcean resources or external IP addresses are allowed to access the nodes in a cluster. This prevents brute force password and denial-of-service attacks from any server not explicitly permitted to connect.

Typically, only the application servers are allowed to connect to the database cluster. Users access the public-facing site, and the public-facing server authenticates and manages database connections in turn.

## Add a Trusted Source Using the CLI[](#add-a-trusted-source-using-the-cli)

How to Add a Trusted Source Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases firewalls append`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/firewalls/append/) for more details:
    
        doctl databases firewalls append <database-cluster-id> --rule <type>:<value> [flags]
    
    The following example appends a firewall rule to a database cluster with the ID `ca9f591d-f38h-5555-a0ef-1c02d1d1e35` that allows any resources with the `example-tag` to access the database:
    
        doctl databases firewalls append ca9f591d-f38h-5555-a0ef-1c02d1d1e35 --rule tag:example-tag
    

## Add a Trusted Source Using the API[](#add-a-trusted-source-using-the-api)

How to Add or Remove a Trusted Source Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/firewall`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_update_firewall_rules).

### cURL[](#add-or-remove-a-trusted-source-curl)

Using cURL:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"rules": [{"type": "ip_addr","value": "192.168.1.1"},{"type": "droplet","value": "163973392"},{"type": "k8s","value": "ff2a6c52-5a44-4b63-b99c-0e98e7a63d61"},{"type": "tag","value": "backend"}]}' \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/firewall"

### Go[](#add-or-remove-a-trusted-source-go)

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
    
        req := godo.DatabaseUpdateFirewallRulesRequest{
          Rules: []*godo.DatabaseFirewallRule{
            {
             Type:  "ip_addr",
             Value: "192.168.1.1",
           },
            {
             Type:  "droplet",
             Value: "163973392",
           },
            {
             Type:  "k8s",
             Value: "ff2a6c52-5a44-4b63-b99c-0e98e7a63d61",
            },
          },
        }
        _, err := client.Databases.UpdateFirewallRules(ctx, dbID, &req)
    }

### Python[](#add-or-remove-a-trusted-source-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "rules": [
        {
          "type": "ip_addr",
          "value": "192.168.1.1"
        },
        {
          "type": "k8s",
          "value": "ff2a6c52-5a44-4b63-b99c-0e98e7a63d61"
        },
        {
          "type": "droplet",
          "value": "163973392"
        },
        {
          "type": "tag",
          "value": "backend"
        }
      ]
    }
    update_resp = client.databases.update_firewall_rules(database_cluster_uuid="a7a8bas", body=req)

## Add a Trusted Source using the Control Panel[](#add-a-trusted-source-using-the-control-panel)

To restrict access to a database cluster, click the name of the cluster in the control panel to go to its **Overview** page, then click the **Settings** tab.

![Screenshot of cluster settings page](https://docs.digitalocean.com/screenshots/databases/mysql-cluster-settings.488ffff00c3371397115f53a0ac7c13f25254636a58e80d5adf3efb0f9fdb999.png)

In the section titled **Trusted Sources**, click **Edit** to open the **Add trusted sources** text box.

![The open Trusted Sources section of the settings page](https://docs.digitalocean.com/screenshots/databases/trusted-sources.d160aa387bd895e79d0b13cfc701007609f7df56fa3f973f3727e317616a71d9.png)

You can enter Droplets, Kubernetes clusters, tags, apps, or specific IP addresses. Entering a tag provides access to the database for any Droplets or Kubernetes nodes containing that tag. At this time, DigitalOcean Cloud Firewalls are not supported.

Warning

You currently cannot add IPv6 rules to a database cluster’s trusted sources.

## Use Encrypted Connections[](#use-encrypted-connections)

By default, you must use SSL to transmit data because it prevents eavesdropping on administrative usernames and passwords as well as the data itself as it is transmitted. However, SSL doesn’t protect against man-in-the-middle (MITM) attacks or impersonation.

Learn more about [configuring MySQL to use encrypted connections](https://dev.mysql.com/doc/refman/8.0/en/using-encrypted-connections.html).

In this article...

*   [Restrict Incoming Connections](#firewalls)
*   [Add a Trusted Source Using the CLI](#add-a-trusted-source-using-the-cli)
*   [Add a Trusted Source Using the API](#add-a-trusted-source-using-the-api)
*   [Add a Trusted Source using the Control Panel](#add-a-trusted-source-using-the-control-panel)
*   [Use Encrypted Connections](#use-encrypted-connections)

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