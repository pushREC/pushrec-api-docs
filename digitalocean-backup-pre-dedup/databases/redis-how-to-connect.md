---
source: https://docs.digitalocean.com/products/databases/redis/how-to/connect/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Connect to Caching Database Clusters | DigitalOcean Documentation

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
*   Connect to Caching Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Connect to Caching Database Clusters

Validated on 5 Dec 2024 • Last edited on 17 Jun 2025

Managed Caching is a database engine that supports Redis, an open source, key-value database built with an in-memory design that emphasizes speed. It supports rich data types, atomic operations, and Lua scripting.

You can connect to DigitalOcean Managed Databases using command line tools and other third-party clients. This guide explains where to find your Caching database’s connection details and how to use them to configure tools and clients.

This method uses [Let’s Encrypt certification](https://letsencrypt.org/how-it-works/), which does not require that you download a CA certificate in order to connect.

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

## View Caching Cluster Connection Details[](#connection-details)

You use your database’s connection details to configure tools, applications, and resources that connect to the database. To view your database’s connection details, click the name of the cluster on [the Databases page](https://cloud.digitalocean.com/databases) to go to its **Overview** page.

![Databases Overview screen showing connection string](https://docs.digitalocean.com/screenshots/databases/redis-connection-details.c2c0657dbdf7598fd73ff90b2fde1430c7501ac1931bba65049fb692f5e1b2ba.png)

You can view customized connection details based on whether you want to connect using the cluster’s public or [private network (VPC)](/products/networking/vpc/) interface. The **Public network** and **Private network** options generate connection details based on if you want to connect via the cluster’s public hostname or the cluster’s private hostname. Only other resources in the same VPC network as the cluster can access it using its private hostname.

You can also choose to view the connection details in three different formats:

*   **Connection parameters:** Database information meant for application configuration, such as configuring connections for Redsmin and Redis Desktop Manager.
    
*   **Connection string:** A condensed string that you can pass to a client on the command line.
    
*   **Flags:** A complete `redli` command that supplies the connection variables as individual flags.
    

We recommend the flags format because the readability can help if you want to customize the way you connect.

By default, the control panel doesn’t reveal the cluster’s password for security reasons. Click **Copy** to copy connection details with the password, or click **show-password** to reveal the password.

## Anatomy of the Flags Format[](#anatomy-of-the-flags-format)

The connection string passes different parameters to `redli` via **Flags**. Here’s a high-level breakdown of what information those flags correspond to:

*   **Hostname and Port**: The hostname is specified with the `-h` flag, and tells your client computer how to reach the cluster. Port is specified with the `-p` flag. If you do not specify a port, the client attempts to use the default Caching port, `6379`.
    
*   **Password**: The password is specified with the `-a` (or `--auth`) flag. If you do not use the `-a` flag, you will have to explicitly use the `AUTH` command once connected.
    
*   **Encryption**: Caching managed databases on DigitalOcean require you to connect using SSL/TLS. To do this with `redli`, specify the encryption with the `--tls` flag.
    
*   **Other Flags**: You can find a more comprehensive list of the flags you can pass to the `redli` command in [the official documentation for `redli`](https://github.com/IBM-Cloud/redli).
    

## Connect to the Database[](#connect-to-the-database)

To connect to Caching database clusters from the command line, you need three things:

*   To add your local computer [to the database’s trusted sources](/products/databases/redis/how-to/secure/#firewalls).
    
*   To install a Redis client on your local computer. We recommend [Redli](https://github.com/IBM-Cloud/redli), a Redis interactive terminal from IBM.
    
    Note
    
    For security, all DigitalOcean database clusters are encrypted with TLS/SSL. For simplicity and ease of use, we recommend Redli, which supports TLS/SSL by default. However, you can also enable TLS/SSL in the default Redis command line client, `redis-cli`, by following the [Redis TLS guide](https://redis.io/docs/latest/operate/oss_and_stack/management/security/encryption/).
    
*   To reference the [database cluster’s connection details](/products/databases/redis/how-to/connect/#connection-details), which tells your client how to connect to the cluster.
    

To connect using the flags format with Redli, paste the entire command from the control panel into your terminal and replace the first term, `redis-cli`, with `redli`:

    $ redli --tls -h redis-test-do-user-4915853-0.db.ondigitalocean.com -a your_password -p 25061

When you connect successfully, you arrive at the Redis prompt, which displays the Redis version number:

    Connected to 5.0.4
    >

From here, you can run CLI commands. Learn more about `redli` on [the official `redli` GitHub](https://github.com/IBM-Cloud/redli) and the [IBM Cloud blog](https://www.ibm.com/cloud/blog/introducing-redli-new-redis-command-line-client). Learn more about `redis-cli` commands on [the official Redis command documentation](https://redis.io/commands).

If you’re having trouble connecting to the database, you can [troubleshoot the connection using our Support page](/support/redis/), or you can reference [Redli’s connection documentation](https://cloud.ibm.com/docs/databases-for-redis?topic=databases-for-redis-connecting-cli-client).

In this article...

*   [Retrieve Database Connection Details Using the CLI](#retrieve-database-connection-details-using-the-cli)
*   [Retrieve Database Connection Details Using the API](#retrieve-database-connection-details-using-the-api)
*   [View Caching Cluster Connection Details](#connection-details)
*   [Anatomy of the Flags Format](#anatomy-of-the-flags-format)
*   [Connect to the Database](#connect-to-the-database)

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

Try using different keywords or
