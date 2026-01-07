---
source: https://docs.digitalocean.com/products/databases/postgresql/how-to/forward-logs/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Forward Logs from a PostgreSQL Cluster | DigitalOcean Documentation

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
*   Forward Logs

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Forward Logs from a PostgreSQL Cluster

Validated on 11 Jun 2024 • Last edited on 17 Jun 2025

PostgreSQL is an open source, object-relational database built for extensibility, data integrity, and speed. Its concurrency support makes it fully ACID-compliant, and it supports dynamic loading and catalog-driven operations to let users customize its data types, functions, and more.

Log forwarding allows you to transmit log data from any number of sources to a centralized database cluster. You can do so by creating and managing log sinks for your database clusters via the [control panel](#forward-logs-using-the-control-panel) or the [API](#create-a-log-sink-using-the-api). PostgreSQL supports forwarding to OpenSearch, Elasticsearch, and Rsyslog. You can 1-Click deploy these tools to a Droplet from [the Databases section of the DigitalOcean Marketplace](https://marketplace.digitalocean.com/category/databases).

When forwarding logs to or from Managed Databases, all default configuration options, such as the default logging message level, are determined by the forwarding database engine.

## Create a Log Sink Using the API[](#create-a-log-sink-using-the-api)

To forward logs from managed database clusters, you need to create a log sink using the DigitalOcean API.

Note

To create a log sink using the API, you need to provide values for the `sink_name`, `sink_type`, and `config` fields, which specify the name of the log sink, its type (`rsyslog`, `elasticsearch`, or `opensearch`), and your desired URL or server/port configuration, respectively.

How to Create a Log Sink Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/logsink`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_create_logsink).

### cURL[](#create-a-log-sink-curl)

Using cURL:

    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"sink_name": "logsink", "sink_type": "rsyslog", "config": {"server": "192.168.10.1", "port": 514, "tls": false, "format": "rfc5424"}}' \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/logsink"

## Forward Logs Using the Control Panel[](#forward-logs-using-the-control-panel)

To forward logs from a database cluster in the control panel, go to the [**Databases** page](https://cloud.digitalocean.com/databases), then select your database cluster. Click the name of the cluster to go to its **Overview** page, then click the **Settings** tab.

![Cluster settings page.](https://docs.digitalocean.com/screenshots/databases/postgresql-settings.ecb4f46d6b8fc5b1a228a403693b264f36a3297ccfef1bfa7e41e2f938271e4d.png)

On the **Settings** page, in the **Log forwarding** section, click **Edit**. Select the service you want to forward logs to.

![Log forwarding service selection screen.](https://docs.digitalocean.com/screenshots/databases/log-forwarding-services.bbbade08490db3970b371fdeb218f6a71124cc8ef885ea6178b967b2c202d074.png)

For OpenSearch and Elasticsearch, enter your destination name, endpoint URL, and index prefix. You can also click **Show advanced configuration options** to edit the log sink’s maximum days to store logs, request timeout (in seconds), and CA certificate for authentication. To confirm your changes, click **Add destination**.

For Rsyslog, enter your destination name, endpoint URL, endpoint port, and message format (RFC5424, RFC3164, or custom). You can also click **Show advanced configuration options** to edit the log sink’s structured data, CA certificate, client key, and client certificate. To confirm your changes, click **Add destination**.

![Forward logs to OpenSearch popup.](https://docs.digitalocean.com/screenshots/databases/forward-logs-to-opensearch.d46b2b9299c4f0c7a12a7398b3ece165caa4fab083414fb2874f9e0d8fc8a081.png)

### Customize Rsyslog Format[](#customize-rsyslog-format)

If you choose a custom message format for your logsink to Rsyslog, you can use the following tags in limited Rsyslog style templating (`%tag%`): `HOSTNAME`, `app-name`, `msg`, `msgid`, `pri`, `procid`, `structured-data`, `timestamp`, and `timestamp:::date-rfc3339`.

For a list of examples, see the official [Rsyslog documentation](https://www.rsyslog.com/doc/configuration/examples.html).

In this article...

*   [Create a Log Sink Using the API](#create-a-log-sink-using-the-api)
*   [Forward Logs Using the Control Panel](#forward-logs-using-the-control-panel)
    *   [Customize Rsyslog Format](#customize-rsyslog-format)

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