---
source: https://docs.digitalocean.com/products/databases/kafka/how-to/enable-schema-registry/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Enable Schema Registry on Kafka Clusters | DigitalOcean Documentation

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
*   Enable Schema Registry

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Enable Schema Registry on Kafka Clusters

Validated on 7 Jul 2025 • Last edited on 8 Jul 2025

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

Managed Kafka clusters support schema registry, a free service you can enable that protects your cluster when sending or receiving incorrect, modified, or corrupt data. Schema registry copies the schema of all data sent by producers into a local cache, then cross-references that schema with the data’s consumers to ensure there is no mismatch. This allows you to discover and enforce your Kafka cluster’s message structures.

You can only enable schema registry on General Purpose Managed Kafka clusters, not ones with shared CPU plans. If you have enabled schema registry on a Kafka cluster and you later want to downscale it to a shared CPU plan, you must first disable schema registry.

Schema registry is available on port `25065` using the same host.

## Enable Schema Registry using the Control Panel[](#enable-schema-registry-using-the-control-panel)

To enable schema registry, go to the [control panel](https://cloud.digitalocean.com/databases) and click on your Kafka database. Click on the **Settings** tab, then scroll to the **Schema Registry** section and click the toggle to **On**.

![](https://docs.digitalocean.com/screenshots/databases/kafka-enable-schema-registry.a6308bc3a1f735d6a115a90ff5454461116ff67418d5f36b94be4d8259872da6.png)

You can disable schema registry by clicking the same toggle to **Off**.

## Manage Registries and Schemas using the API[](#manage-registries-and-schemas-using-the-api)

Once you have enabled schema registry, you can use the DigitalOcean API to [create a new registry](/reference/api/digitalocean/#tag/Databases/operation/databases_create_kafka_schema), [list schemas](/reference/api/digitalocean/#tag/Databases/operation/databases_list_kafka_schemas), [get a schema by name](/reference/api/digitalocean/#tag/Databases/operation/databases_get_kafka_schema), [get a schema by subject version](/reference/api/digitalocean/#tag/Databases/operation/databases_get_kafka_schema_version), or [delete a schema by subject name](/reference/api/digitalocean/#tag/Databases/operation/databases_delete_kafka_schema).

In this article...

*   [Enable Schema Registry using the Control Panel](#enable-schema-registry-using-the-control-panel)
*   [Manage Registries and Schemas using the API](#manage-registries-and-schemas-using-the-api)

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