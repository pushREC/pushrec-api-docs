---
source: https://docs.digitalocean.com/products/databases/mysql/how-to/connect/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Connect to MySQL Database Clusters | DigitalOcean Documentation

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
*   Connect to MySQL Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Connect to MySQL Database Clusters

Validated on 19 Aug 2020 • Last edited on 17 Jun 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

You can connect to DigitalOcean Managed Databases using command line tools and other third-party clients. This guide explains where to find your MySQL database’s connection details and how to use them to configure tools and clients.

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

## View MySQL Cluster Connection Details[](#connection-details)

You use your database’s connection details to configure tools, applications, and resources that connect to the database. To view your database’s connection details, click the name of the cluster on [the Databases page](https://cloud.digitalocean.com/databases) to go to its **Overview** page.

![Databases Overview screen showing connection string](https://docs.digitalocean.com/screenshots/databases/connection-details.b18206f6861c63d5a396b1c98934b93c5588ce48c46b27582d6f20337d848ccd.png)

You can view customized connection details based on how you want to connect to the database:

*   **Public network** and **Private network** ([VPC](/products/networking/vpc/)) options generate connection details based on if you want to connect via the cluster’s public hostname or the cluster’s private hostname. Only other resources in the same VPC network as the cluster can access it using its private hostname.
    
*   The **Database** field updates the connection details based on which database you want to connect to.
    
*   The **User** field updates the connection details with the [user credentials](/products/databases/mysql/how-to/manage-users-and-databases/) that you would like to connect with.
    

You can also choose to view the connection details in three different formats:

*   **Connection parameters:** Database information meant for application configuration, such as configuring connections for MySQL Workbench and Sequel Ace.
    
*   **Connection string:** A condensed string that you can pass to a client on the command line.
    
*   **Flags:** A complete `mysql` command that supplies the connection variables as individual flags.
    

We recommend the flags format because the readability can help if you want to customize the way you connect. The only required parameter is `sslmode`, but MySQL supports many [options for customizing connections](https://dev.mysql.com/doc/refman/8.0/en/mysql-command-options.html).

By default, the control panel doesn’t reveal the cluster’s password for security reasons. Click **Copy** to copy connection details with the password, or click **show-password** to reveal the password.

## Anatomy of the Flags Format[](#anatomy-of-the-flags-format)

The connection string passes different parameters to MySQL via **Flags**. Here’s a high-level breakdown of what information those flags correspond to:

*   **Hostname and Port**: The hostname is specified with the `-h` flag, and tells your client computer how to reach the cluster. Port is specified with the `-P` flag (notice it’s upper case). If you do not specify a port, the client will attempt to use the default MySQL port, `3306`.
    
*   **Username and Password**: The username and password are specified with the `-u` flag for user and the `-p` flag for password. By default your database has only one accessible user, `doadmin`. If you leave the `-p` flag blank, you will be prompted for the user’s password.
    
*   **Database**: The database is specified with the `-D` flag (notice it’s upper case), this tells the MySQL client which database you want to access.
    
*   **Other Flags**: You can find a more comprehensive list of the flags you can pass to the MySQL command on the official documentation for MySQL at [`mysql` Client Options](https://dev.mysql.com/doc/refman/8.0/en/mysql.html).
    

## Download the SSL Encryption[](#download-the-ssl-encryption)

Each managed database comes with an SSL certificate. You can use this SSL certificate to encrypt connections between your client applications and the database.

To download your database’s SSL certificate, click the name of the cluster on [the Databases page](https://cloud.digitalocean.com/databases) to go to its **Overview** page. In the **Connection Details** section, click **Download CA certificate**.

![Databases connection details with Download CA Certificate selected](https://docs.digitalocean.com/screenshots/databases/dbaas-ssl-certificate.8b2c955e8e43aa8e36b56bc98564bd42da5a9ba716eff506e1c174ca2d678d47.png)

When you configure your client applications, you can use the certificate’s location on your local system. Each client application is configured differently, so check the documentation for the tool you’re using for more detail on setting up SSL connections.

## Connect to the Database[](#connect-to-the-database)

You can connect and manage the database using a command line tool or an application that has a graphic user interface (GUI). In this guide, we show you how to connect to the database using the command line tools, `mysql` and MySQL Shell (`mysqlsh`), and the visual database management application, MySQL Workbench.

`mysql` is an SQL shell with input line editing capabilities, while MySQL Shell has more advanced features, like X DevAPI integration and multi-connection support.

 Connect Using mysql

To connect to MySQL database clusters using `mysql`, you need three things:

*   To add your local computer [to the database’s trusted sources](/products/databases/mysql/how-to/secure/#firewalls).
    
*   To install the MySQL client on your local computer. We recommend either [MySQL version 8 or greater](https://www.digitalocean.com/community/tutorials/how-to-install-the-latest-mysql-on-ubuntu-18-04), which lets you use the `mysql` command in a terminal.
    

Note

MySQL 5.x clients, such as Sequel Pro, are not compatible with the higher password encryption requirements of MySQL 8.x. You can [change the password encryption](/products/databases/mysql/how-to/manage-users-and-databases/#password-encryption) of your database’s users if you are receiving [authentication errors](/support/how-do-i-fix-the-authentication-error-when-connecting-to-mysql/).

*   To reference the [database cluster’s connection details](/products/databases/mysql/how-to/connect/#connection-details), which tells your client how to connect to the cluster.

To connect using the flags format with `mysql` using the `doadmin` user, paste the entire command from the control panel into your terminal:

    $ mysql -u doadmin -p<your_password> -h mysql-test-do-user-4915853-0.db.ondigitalocean.com -P 25060 -D defaultdb

You can also leave the password out when using the above commands and you will be prompted to enter it before you can connect.

To connect using [the database’s SSL certificate](/products/databases/mysql/how-to/connect/#download-the-ssl-certificate), update the flags commands with the `--ssl-ca` flag and the path to the certificate on your local system:

    mysql -u doadmin -p<your_password> -h mysql-test-do-user-4915853-0.db.ondigitalocean.com -P 25060 -D defaultdb --ssl-ca=path/to/your-ssl.crt

When you successfully connect, the shell displays some information about the MySQL server and your prompt changes. Successful `mysql` connections look like this:

Successful connection with mysql

    mysql: [Warning] Using a password on the command line interface can be insecure.
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 151986
    Server version: 8.0.16 Source distribution
    
    Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.
    
    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    mysql>

Once you’re connected, you can manage your MySQL databases via command line. The [official MySQL documentation](https://dev.mysql.com/doc/refman/8.0/en/mysql.html) includes a guide to MySQL commands.

If you’re having trouble connecting to the database, you can [troubleshoot the connection using our Support page](/support/mysql/), or you can reference [MySQL’s connection documentation](https://dev.mysql.com/doc/refman/8.0/en/connecting.html).

 Connect Using MySQL Shell

To connect to MySQL database clusters using MySQL Shell, you need three things:

*   To add your local computer [to the database’s trusted sources](/products/databases/mysql/how-to/secure/#firewalls).
    
*   [To install the MySQL Shell client](https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-install.html) on your local computer, which lets you use the `mysqlsh` command in a terminal.
    

Note

MySQL 5.x clients, such as Sequel Pro, are not compatible with the higher password encryption requirements of MySQL 8.x. You can [change the password encryption](/products/databases/mysql/how-to/manage-users-and-databases/#password-encryption) of your database’s users if you are receiving [authentication errors](/support/how-do-i-fix-the-authentication-error-when-connecting-to-mysql/).

*   To reference the **[database cluster’s connection details](/products/databases/mysql/how-to/connect/#connection-details)**, which tells your client how to connect to the cluster.

To connect with `mysqlsh` using the flags format, paste the entire flags command from the control panel into your terminal and replace the first term, `mysql`, with `mysqlsh`:

    $ mysqlsh -u doadmin -p<your_password> -h mysql-test-do-user-4915853-0.db.ondigitalocean.com -P 25060 -D defaultdb

You can also leave the password out when using the above commands and you will be prompted to enter it before you can connect.

To connect using [the database’s SSL certificate](/products/databases/mysql/how-to/connect/#download-the-ssl-certificate), update the flags commands with the `--ssl-ca` flag and the path to the certificate on your local system:

    mysqlsh -u doadmin -p<your_password> -h mysql-test-do-user-4915853-0.db.ondigitalocean.com -P 25060 -D defaultdb --ssl-ca=path/to/your-ssl.crt

When you successfully connect, the shell displays some information about the MySQL server and your prompt changes. Successful `mysqlsh` connections look like this:

Successful connection with mysqlsh

    MySQL Shell 8.0.16
    
    Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.
    Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
    Other names may be trademarks of their respective owners.
    
    Type '\help' or '\?' for help; '\quit' to exit.
    WARNING: Using a password on the command line interface can be insecure.
    Creating a session to '[email protected]:25060/defaultdb'
    Fetching schema names for autocompletion... Press ^C to stop.
    Your MySQL connection id is 152077
    Server version: 8.0.16 Source distribution
    Default schema set to `defaultdb`.
    
    MySQL  mysql-test-do-user-4915853-0.db.ondigitalocean.com:25060 ssl  defaultdb  JS >

Once you’re connected, you can manage your MySQL databases via command line. The [official MySQL documentation](https://dev.mysql.com/doc/refman/8.0/en/mysql.html) includes a guide to MySQL commands.

If you’re having trouble connecting to the database, you can [troubleshoot the connection using our Support page](/support/mysql/), or you can reference [MySQL Shell’s connection documentation](https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-connections.html).

 Connect with MySQL Workbench

To connect to MySQL database clusters using MySQL Workbench, you need three things:

*   To add your local computer [to the database’s trusted sources](/products/databases/mysql/how-to/secure/#firewalls).
    
*   [To install the MySQL Workbench client](https://dev.mysql.com/downloads/workbench/) on your local computer.
    

Note

MySQL 5.x clients, such as Sequel Pro, are not compatible with the higher password encryption requirements of MySQL 8.x. You can [change the password encryption](/products/databases/mysql/how-to/manage-users-and-databases/#password-encryption) of your database’s users if you are receiving [authentication errors](/support/how-do-i-fix-the-authentication-error-when-connecting-to-mysql/).

*   To reference the **[database cluster’s connection details](/products/databases/mysql/how-to/connect/#connection-details)**, which tells your client how to connect to the cluster.

To connect to your MySQL database using a standard TCP/IP connection, open MySQL Workbench, then click the **Database** drop-down menu and select **Manage Connections…**. Click **New** in the Manage Server Connections window.

In the Manage Server Connections window, create a descriptive name for the connection in the **Connection Name** field, and then select the **Standard (TCP/IP)** option from the **Connection Method** drop-down menu.

![MySQL Workbench Manage Server Connections window with database credentials](https://docs.digitalocean.com/screenshots/databases/mysql-workbench-tcp.3d4226b89b140349f844805064cea3c65b152b4bbfb7e8e69df2833f010a144a.png)

Under the **Parameters** section, use the information from your database’s **[Connection Details](/products/databases/mysql/how-to/connect/#connection-details)** section in the control panel to fill out the necessary fields.

If you want to connect using SSL encryption, click the **SSL** tab. In the **Use SSL** field, select the **Require and Verify CA** option. In the **SSL CA File** field, enter the path to [your database’s SSL certificate](/products/databases/mysql/how-to/connect/#ssl-encryption) on your local system.

![MySQL Workbench Manage Server Connections window with SSL certificate](https://docs.digitalocean.com/screenshots/databases/mysql-workbench-ssl.89fed8e9d8db64272750a218991c4228ff782ba5e64579f9b87fd413b52d7ad1.png)

Once you have entered the details, click **Test Connection**. If you receive the message **Successfully made the MySQL connection**, click **OK** to close the message, and then click **Close** in the **Manage Server Connections** window to save the connection configuration. If you receive an error, recheck that you entered your credentials correctly and then reattempt the test.

To connect to the database, select **Connect to Database…** from the **Database** drop-down menu. Then select your database connection from the **Stored Connection** drop-down menu, and then click **OK**. MySQL Workbench will connect to your database.

If you’re having trouble connecting to the database, you can [troubleshoot the connection using our Support page](/support/mysql/), or you can reference [MySQL Workbench’s connection documentation](https://dev.mysql.com/doc/workbench/en/wb-mysql-connections.html).

In this article...

*   [Retrieve Database Connection Details Using the CLI](#retrieve-database-connection-details-using-the-cli)
*   [Retrieve Database Connection Details Using the API](#retrieve-database-connection-details-using-the-api)
*   [View MySQL Cluster Connection Details](#connection-details)
*   [Anatomy of the Flags Format](#anatomy-of-the-flags-format)
*   [Download the SSL Encryption](#download-the-ssl-encryption)
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

### We can't find any results 
