---
source: https://docs.digitalocean.com/products/databases/mongodb/how-to/connect/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                How to Connect to MongoDB Database Clusters | DigitalOcean Documentation

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
*   Connect to MongoDB Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Connect to MongoDB Database Clusters

Validated on 25 May 2022 • Last edited on 17 Jun 2025

MongoDB is a source-available cross-platform document-oriented database program for high-volume storage. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.

You can connect to DigitalOcean Managed Databases using command line tools and other third-party clients. This guide explains where to find your MongoDB database’s connection details and how to use them to configure tools and clients.

## Retrieve Database Connection Details Using the CLI[](#retrieve-database-connection-details-using-the-cli)

How to Retrieve Database Connection Details Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases connection`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/connection/) for more details:
    
        doctl databases connection <database-cluster-id> [flags]
    
    The following example retrieves the connection details for a database cluster with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`:
    
        doctl databases connection f81d4fae-7dec-11d0-a765-00a0c91e6bf6
    

## Retrieve Database Connection Details Using the API[](#retrieve-database-connection-details-using-the-api)

This API call retrieves the information about your database, including its connection details. The connection details are located in the returned `connection` JSON object.

How to Retrieve Database Connection Details Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_get_cluster).

### cURL[](#retrieve-database-connection-details-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

### Go[](#retrieve-database-connection-details-go)

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

### Python[](#retrieve-database-connection-details-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    get_resp = client.databases.get_cluster(database_cluster_uuid="a7a89a")

## View MongoDB Cluster Connection Details[](#connection-details)

You use your database’s connection details to configure tools, applications, and resources that connect to the database. To view your database’s connection details, click the name of the cluster on [the Databases page](https://cloud.digitalocean.com/databases) to go to its **Overview** page.

![MongoDB Database Overview screen showing connection string](https://docs.digitalocean.com/screenshots/databases/mongodb-connection-overview.2f05d94488bc23243b1e5c061b3fdb4c897f0b5f37ce46fdc63a88f1f45bee73.png)

You can view customized connection details based on how you want to connect to the database:

*   **Public network** and **Private network** ([VPC](/products/networking/vpc/)) options generate connection details based on if you want to connect via the cluster’s public hostname or the cluster’s private hostname. Only other resources in the same VPC network as the cluster can access it using its private hostname.
    
*   The **Database** field updates the connection details based on which database you want to connect to.
    
*   The **User** field updates the connection details with the [user credentials](/products/databases/mongodb/how-to/manage-users-and-databases/) that you would like to connect with.
    

You can also choose to view the connection details in three different formats:

*   **Connection parameters:** Database information meant for application configuration, such as Studio 3T.
    
*   **Connection string:** A condensed string that you can pass to a client, such as MongoDB Compass.
    
*   **Flags:** A complete `mongo` command that supplies the connection variables as individual flags.
    

We recommend the flags format because the readability can help if you want to customize the way you connect.

By default, the control panel doesn’t reveal the cluster’s password for security reasons. Click **Copy** to copy connection details with the password, or click **show-password** to reveal the password. Once you create a password for a user, you can only view it during the session you created it. We recommend storing your database passwords locally. You can [reset a user password at any time](/products/databases/mongodb/how-to/manage-users-and-databases/).

Note

Cluster hostnames do not resolve using standard [`dig` requests](https://www.digitalocean.com/community/tutorials/how-to-retrieve-dns-information-using-dig) to the hostname in the connection string. MongoDB clusters are hosted on multiple nodes and each has its own hostname. To retrieve the node hostnames of a cluster using `dig`, you must specify the `srv` record type in the request and prepend `_mongodb._tcp.` to the hostname in the connection string like this:

    dig srv _mongodb._tcp.<cluster-hostname>

A properly formatted `dig` request looks like this:

    dig srv _mongodb._tcp.db-mongodb-nyc3-73883-4aef1b0f.mongo.ondigitalocean.com

## Connect to the Database[](#connect-to-the-database)

You can connect and manage the database using a command line tool or an application that has a graphical user interface (GUI). In this guide, we show you how to connect to the database using the `mongo` command line tool and the visual database management application, MongoDB Compass.

Any client you use to connect to your cluster must support MongoDB 4.2 or above in order to secure the connection using TLS. Clients that do not support at least MongoDB 4.2 or above will not connect to the cluster.

 Connect Using mongo CLI

To connect to MongoDB database clusters using the `mongo` CLI, you need three things:

*   To add your local computer [to the database’s trusted sources](/products/databases/mongodb/how-to/secure/#firewalls).
    
*   To install [`mongo`](https://docs.mongodb.com/manual/administration/install-community/) on your local computer.
    
*   To reference the [database cluster’s connection details](/products/databases/mongodb/how-to/connect/#connection-details), which tells your client how to connect to the cluster.
    

Your cluster’s connection details come with a preconfigured connection command that you can copy and paste into a terminal and use to connect to the cluster. The command contains your cluster’s network information and database user credentials.

To connect using this command, click the name of the cluster you want to connect to on [the Databases page](https://cloud.digitalocean.com/databases) to go to its **Overview** page. In the **CONNECTION DETAILS** section, select **Flags** from the drop-down menu, then copy and paste the entire command from the control panel into your terminal. An example command looks like this:

    mongo "mongodb+srv://doadmin:<replace-with-your-password>@db-mongodb-nyc3-73883-4aef1b0f.mongo.ondigitalocean.com/admin?authSource=admin&replicaSet=db-mongodb-nyc3-73883" --tls

You need to manually edit the connection command to include the user password. We only display user passwords for a short time after user creation. You can [reset a user’s password](/products/databases/mongodb/how-to/manage-users-and-databases/) at any time.

A completed connection command looks like this:

    mongo "mongodb+srv://doadmin:76U12GRb0HCg4W85@db-mongodb-nyc3-73883-4aef1b0f.mongo.ondigitalocean.com/admin?authSource=admin&replicaSet=db-mongodb-nyc3-73883" --tls

Tip

To save time when formatting the connection command in the future, we recommend storing the cluster’s password as an [environment variable](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-linux) on your local machine and then substituting the password value for the variable name in the connection command.

When you connect successfully, your terminal changes to the MongoDB prompt, which displays the name of the database you’re connected to, like `db-mongodb-nyc3-73883:>`.

Once connected to the database, you can change databases or users, execute queries, and perform other database administration tasks.

 Connect Using MongoDB Compass

To connect to MongoDB database clusters using MongoDB Compass, you need three things:

*   To add your local computer [to the database’s trusted sources](/products/databases/mongodb/how-to/secure/#firewalls).
    
*   To install [MongoDB Compass](https://www.mongodb.com/try/download/compass) on your local computer.
    
*   To copy the **[database cluster’s connection string](/products/databases/mongodb/how-to/connect/#connection-details)**, which tells the client how to connect to the cluster.
    

To connect to your MongoDB database, open MongoDB Compass, then click **New Connection** in the left menu.

![MongoDB Compass New Connection screen with connection string pasted into field](https://docs.digitalocean.com/screenshots/databases/mongodb-compass-connect.74e18e59ed80c8b96fbb685760d6362ef7a1d79ae59de64c76b06faf1a82ba51.png)

In the **Paste your connection string** field, paste the connection string provided by DigitalOcean into the field. You may need to manually edit the connection string to include the user password as we only display user passwords for a short time after user creation. You can [reset a user’s password](/products/databases/mongodb/how-to/manage-users-and-databases/) at any time.

Once you have entered your connection string, click **Connect**.

Once connected to the database, you can change databases or users, execute queries, and perform other database administration tasks.

## Connect to Standby Nodes as Read-Only Nodes[](#connect-to-standby-nodes-as-read-only-nodes)

MongoDB allows you to connect to the primary node and shift your connection’s read traffic to the secondary nodes. This can lighten the workload of your primary node.

To connect to your cluster’s standby nodes and use them as read-only nodes, pass the [cluster’s connection string](/products/databases/mongodb/how-to/connect/#connection-details) with the `readPreference` option set to `secondary`, like this:

    mongo "mongodb+srv://doadmin:76U12GRb0HCg4W85@db-mongodb-nyc3-73883-4aef1b0f.mongo.ondigitalocean.com/admin?authSource=admin&replicaSet=db-mongodb-nyc3-73883&readPreference=secondary" --tls

The client connects to the primary node, but directs read queries to the standby nodes.

Note

When directing your queries to the standby nodes, there is a small chance that the standby nodes may be out of sync with the primary node and the latest data may not be available on the standby nodes yet.

If you’re having trouble connecting to the database, you can [troubleshoot the connection using our Support page](/support/mongodb/), or you can reference [MongoDB’s official documentation](https://docs.mongodb.com/manual/core/read-preference/).

In this article...

*   [Retrieve Database Connection Details Using the CLI](#retrieve-database-connection-details-using-the-cli)
*   [Retrieve Database Connection Details Using the API](#retrieve-database-connection-details-using-the-api)
*   [View MongoDB Cluster Connection Details](#connection-details)
*   [Connect to the Database](#connect-to-the-database)
*   [Connect to Standby Nodes as Read-Only Nodes](#connect-to-standby-nodes-as-read-only-nodes)

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

Try using diffe
