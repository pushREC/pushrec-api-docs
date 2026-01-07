---
source: https://docs.digitalocean.com/products/databases/kafka/how-to/reconfigure/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Reconfigure Kafka Database Clusters | DigitalOcean Documentation

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
*   Reconfigure Database Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Reconfigure Kafka Database Clusters

Validated on 29 Apr 2024 • Last edited on 10 Dec 2025

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

You can update your database engine’s parameters with the API, such as `compression_type` and `group_min_session_timeout_ms`.

For a full list of the parameters you can edit, see the [control panel](#update-a-databases-configuration-using-the-control-panel) or [API reference](/reference/api/digitalocean/#operation/databases_patch_config), under the **REQUEST BODY SCHEMA** section, click **config**, and then click the **kafka** option. To ensure database stability, you can only edit the parameters listed. To change other Kafka parameters, [contact support](https://cloudsupport.digitalocean.com).

## Update a Database’s Configuration Using the Control Panel[](#update-a-databases-configuration-using-the-control-panel)

To update a database’s configuration from the [control panel](https://cloud.digitalocean.com//networking/databases), click on the database cluster you want to configure, go to the **Settings** tab, scroll down to the **Advanced Configurations** section, and click **Edit**.

![The advanced configurations section](https://docs.digitalocean.com/screenshots/databases/advanced-configurations.20a62a27a281b3fb4921f1b3bbcdccb0b64ab0134001e4454c049874857bc0ec.png)

Browse the list or use the search bar to find the configuration you want to edit, then click the pencil icon. Use the text box or dropdown menu to enter your new configuration, then click **Update** to confirm your changes.

## Update a Database’s Configuration Using the CLI[](#update-a-databases-configuration-using-the-cli)

How to Update a Database’s Configuration Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases configuration update`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/configuration/update/) for more details:
    
        doctl databases configuration update <db-id> [flags]
    
    The following command updates a MySQL database’s time zone:
    
        doctl databases configuration update f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --engine mysql --config-json '{"default_time_zone":"Africa/Maputo"}'
    

## Update a Database’s Configuration Using the API[](#update-a-databases-configuration-using-the-api)

How to Update a Database’s Configuration Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PATCH request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}/config`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_patch_config).

### cURL[](#update-a-databases-configuration-curl)

Using cURL:

    curl -X PATCH \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      -d '{"config": {"sql_mode": "ANSI,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,STRICT_ALL_TABLES","sql_require_primary_key": true}}' \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30/config"

### Python[](#update-a-databases-configuration-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    resp = client.databases.patch_config(database_cluster_uuid="a7aba9d")

In this article...

*   [Update a Database’s Configuration Using the Control Panel](#update-a-databases-configuration-using-the-control-panel)
*   [Update a Database’s Configuration Using the CLI](#update-a-databases-configuration-using-the-cli)
*   [Update a Database’s Configuration Using the API](#update-a-databases-configuration-using-the-api)

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

Try using different keywords or simpl