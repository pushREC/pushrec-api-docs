---
source: https://docs.digitalocean.com/products/databases/kafka/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                Kafka | DigitalOcean Documentation

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

*   Kafka

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Kafka

Generated on 6 Jan 2026

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

Most Viewed Kafka Articles

1.  [How do I fix the "Connection Timed Out" error when connecting to my database?](/support/how-do-i-fix-the-connection-timed-out-error-when-connecting-to-my-database/ "Add your machine to the database cluster's list of trusted sources in the firewall settings.")
2.  [How do I fix the "Connection Refused" error when connecting to my database?](/support/how-do-i-fix-the-connection-refused-error-when-connecting-to-my-database/ "Verify the connection string, ensure correct port usage, and add your local machine to the database cluster's trusted sources.")
3.  [How to Connect to Kafka Clusters](/products/databases/kafka/how-to/connect/ "Connect to Kafka clusters from the command line or other applications.")
4.  [Kafka Concepts](/products/databases/kafka/concepts/ "Explanations and definitions of core concepts in Kafka.")
5.  [Kafka Details](/products/databases/kafka/details/ "Features, plans and pricing, availability, limits, known issues, and more.")
6.  [How to Create Kafka Clusters](/products/databases/kafka/how-to/create/ "Create a Kafka cluster from the DigitalOcean Control Panel.")
7.  [Kafka Pricing](/products/databases/kafka/details/pricing/ "Pricing for DigitalOcean Managed Kafka Clusters.")
8.  [How to Create Kafka Topics](/products/databases/kafka/how-to/create-topics/ "Create a Kafka Topic from the DigitalOcean Control Panel.")
9.  [How to Monitor Kafka Database Cluster Performance](/products/databases/kafka/how-to/monitor-clusters/ "Access and understand performance metrics for nodes in a database cluster.")
10.  [How to Monitor Kafka Database Performance](/products/databases/kafka/how-to/monitor-databases/ "Access and interpret Kafka database performance metrics.")

[](/products/databases/kafka/getting-started/)

![](https://docs.digitalocean.com/images/icons/kafka.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/databases/kafka/how-to/)

![](https://docs.digitalocean.com/images/icons/kafka.svg)

How-Tos

Guides on how to get started with Kafka managed clusters, how to modify users and databases, and how to improve performance and high availability.

[](/products/databases/kafka/reference/)

![](https://docs.digitalocean.com/images/icons/kafka.svg)

Reference

API and CLI reference documentation for the Kafka database service, including example requests and available parameters.

[](/products/databases/kafka/concepts/)

![](https://docs.digitalocean.com/images/icons/kafka.svg)

Concepts

Explanations and definitions of core concepts in Kafka.

[](/products/databases/kafka/details/)

![](https://docs.digitalocean.com/images/icons/kafka.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

## Latest Updates[](#latest-updates)

### 17 September 2025[](#17-september-2025)

*   Now in public preview, you can now enable storage autoscaling on all Managed Database engines. To enable autoscaling, see our resizing guides for [MySQL](/products/databases/mysql/how-to/resize/), [PostgreSQL](/products/databases/postgresql/how-to/resize/), [MongoDB](/products/databases/mongodb/how-to/resize/), [OpenSearch](/products/databases/opensearch/how-to/resize/), and [Kafka](/products/databases/kafka/how-to/resize/).
    
*   Storage autoscaling is now in general availability. Additionally, you can now reduce your cluster’s amount of additional storage, as long as the new storage size is greater than or equal to the latest backup’s size plus any data growth since then and a 25% buffer.
    

### 7 July 2025[](#7-july-2025)

*   You can now [enable a Kafka cluster’s schema registry](/products/databases/kafka/how-to/enable-schema-registry/), ensuring compatibility between producers and consumers and preventing schema mismatches.
    

### 28 February 2025[](#28-february-2025)

*   All managed databases except MongoDB now support up to 2,000 IP addresses as trusted sources. To add trusted sources, see our guides for [MySQL](/products/databases/mysql/how-to/secure/), [PostgreSQL](/products/databases/postgresql/how-to/secure/), [Caching](/products/databases/redis/how-to/secure/), [MongoDB](/products/databases/mongodb/how-to/secure/), [OpenSearch](/products/databases/opensearch/how-to/secure/), and [Kafka](/products/databases/kafka/how-to/secure/).
    

For more information, see [all Kafka release notes](https://docs.digitalocean.com/release-notes/kafka/).

In this article...

[Kafka](https://docs.digitalocean.com/products/databases/kafka/)

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
