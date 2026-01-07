---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/manage-users-and-databases/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Manage PostgreSQL Users and Databases in a Database Cluster | DigitalOcean Documentation

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
*   Manage Users and Databases

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Manage PostgreSQL Users and Databases in a Database Cluster

Validated on 8 Aug 2019 • Last edited on 17 Jun 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

PostgreSQL database clusters come configured with a default database (`defaultdb`) and a default administrative user (`doadmin`). These defaults are necessary for cluster replication and administration, so you can’t delete them, but you can add additional users and databases.

By default, every database cluster is publicly accessible. To limit access, you can [add trusted sources](/products/databases/postgresql/how-to/secure/#firewalls) or [manage user permissions](/products/databases/postgresql/how-to/modify-user-privileges/).

Tip

If you connect to the database cluster with preconfigured connection details from the cluster’s **Overview** page, you can edit them to use a different user and password or a different database.

## Create or Delete a Database User Using the CLI[](#create-or-delete-a-database-user-using-the-cli)

How to Create a Database User Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases user create`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/user/create/) for more details:
    
        doctl databases user create <database-cluster-id> <user-name> [flags]
    
    The following example creates a new user with the username `example-user` for a database cluster with the ID `ca9f591d-f38h-5555-a0ef-1c02d1d1e35`:
    
        doctl databases user create ca9f591d-f38h-5555-a0ef-1c02d1d1e35 example-user
    

How to Delete a Database User Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases user delete`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/user/delete/) for more details:
    
        doctl databases user delete <database-cluster-id> <user-id> [flags]
    
    The following example deletes the user with the username `example-user` for a database cluster with the ID `ca9f591d-f38h-5555-a0ef-1c02d1d1e35`:
    
        doctl databases user delete ca9f591d-f38h-5555-a0ef-1c02d1d1e35 example-user
    

## Create, Update, or Delete a Database User Using the API[](#create-update-or-delete-a-database-user-using-the-api)

How to Create a Database User Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/users`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_add_user).

### cURL[](#create-a-database-user-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"name": "app-01"}' \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/users"

### Go[](#create-a-database-user-go)

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
    
        addUserRequest := &godo.DatabaseCreateUserRequest{
            Name: "app-01",
        }
    
        user, _, err := client.Databases.CreateUser(ctx, "88055188-9e54-4f21-ab11-8a918ed79ee2", addUserRequest)
    
    }

### Python[](#create-a-database-user-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    add_user_resp = client.databases.add_user(database_cluster_uuid="ab7bb7a", body={"name": "app-01"})

How to Update a Database User Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/users/{username}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_update_user).

### cURL[](#update-a-database-user-curl)

Using cURL:

    curl -X PUT \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"settings": {"acl": [{"topic": "events", "permission": "produce"}]}}' \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/users"

### Go[](#update-a-database-user-go)

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
        userName := "test-user"
    
        updateUserRequest := &godo.DatabaseUpdateUserRequest{
          Settings: {
            ACL: [
              {
                Permssion: "consume",
                Topic: "events",
              }
              {
                Permission: "produce",
                Topic: "metrics",
              }
            ]
          }
        }
    
        user, _, err := client.Databases.UpdateUser(ctx, "88055188-9e54-4f21-ab11-8a918ed79ee2", userName, updateUserRequest)
    }

How to Delete a Database User Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a DELETE request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/users/{username}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_delete_user).

### cURL[](#delete-a-database-user-curl)

Using cURL:

    curl -X DELETE \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/users/app-01"

### Go[](#delete-a-database-user-go)

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
    
        _, err := client.Databases.DeleteUser(ctx, "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30", "app-01")
    }

### Python[](#delete-a-database-user-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    delete_resp = client.databases.delete_user(database_cluster_uuid="aba134a", username="backend_user1")

## Add or Delete a Database User Using the Control Panel[](#add-or-delete-a-database-user-using-the-control-panel)

To add or delete users or databases to a database cluster, click the name of the database to go to its **Overview** page, then select the **Users & Databases** tab.

![Screenshot of Users and Databases screen](https://docs.digitalocean.com/screenshots/databases/users-and-databases.a1bc65ba581618cfa9a6619a13e96966adc5fbb23de192b137716c5086ff2325.png)

Create a new database in the **Databases** section by entering a name in the **Add new database** field and clicking **Save**. You can also delete a database here by opening its **More** menu, clicking **Delete**, and then confirming the deletion.

Create new users in the **Users** section by entering a name in the **Add new user** field and clicking **Save**. New users receive minimal permissions by default. You can then [add user privileges](/products/databases/postgresql/how-to/modify-user-privileges/) using third-party tools like [psql](https://www.postgresql.org/docs/9.3/app-psql.html). However, you cannot grant users some superuser permissions.

You can also delete a user here by opening the user’s **More** menu, clicking **Delete**, and then confirming the deletion. Similarly, to reset a user’s password, open the user’s **More** menu and select **Reset password**. If you have any services that depend on that user’s credentials, such as log forwarding, resetting the password may break that service.

In this article...

*   [Create or Delete a Database User Using the CLI](#create-or-delete-a-database-user-using-the-cli)
*   [Create, Update, or Delete a Database User Using the API](#create-update-or-delete-a-database-user-using-the-api)
*   [Add or Delete a Database User Using the Control Panel](#add-or-delete-a-database-user-using-the-control-panel)

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