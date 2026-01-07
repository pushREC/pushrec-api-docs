---
source: https://docs.digitalocean.com/products/databases/opensearch/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

OpenSearch | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/opensearch.2629f480d99bedd31ae31e9fd8269c327373bb1a8ecc38a68f458985e2393b42.svg)OpenSearch](/products/databases/opensearch/)
*   [Getting Started](/products/databases/opensearch/getting-started/)
    *   [Quickstart](/products/databases/opensearch/getting-started/quickstart/)
*   [How-Tos](/products/databases/opensearch/how-to/)
    *   [Create OpenSearch Clusters](/products/databases/opensearch/how-to/create/)
    *   [Forward Logs](/products/databases/opensearch/how-to/forward-logs/)
    *   [Resize Database Clusters](/products/databases/opensearch/how-to/resize/)
    *   [Secure OpenSearch Clusters](/products/databases/opensearch/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/opensearch/how-to/schedule-updates/)
    *   [Manage Users](/products/databases/opensearch/how-to/manage-users/)
    *   [Monitor Cluster Performance](/products/databases/opensearch/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/opensearch/how-to/set-up-alerts/)
    *   [Relocate Database Clusters](/products/databases/opensearch/how-to/relocate/)
    *   [Fork Database Clusters](/products/databases/opensearch/how-to/fork-clusters/)
    *   [Restore from Backups](/products/databases/opensearch/how-to/restore-from-backups/)
    *   [Destroy Clusters](/products/databases/opensearch/how-to/destroy/)
    *   [Tag Database Clusters](/products/databases/opensearch/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/opensearch/how-to/reconfigure/)
*   [Reference](/products/databases/opensearch/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/opensearch/concepts/)
    *   [Best Practices](/products/databases/opensearch/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/opensearch/concepts/responsibility-model/)
*   [Details](/products/databases/opensearch/details/)
    *   [Features](/products/databases/opensearch/details/features/)
    *   [Pricing](/products/databases/opensearch/details/pricing/)
    *   [Availability](/products/databases/opensearch/details/availability/)
    *   [Limits](/products/databases/opensearch/details/limits/)
    *   [Cluster Notifications](/products/databases/opensearch/details/notifications/)
    *   [Supported Plugins](/products/databases/opensearch/details/supported-plugins/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)

*   OpenSearch

[Give Feedback](https://ideas.digitalocean.com/documentation)

# OpenSearch

Generated on 6 Jan 2026

OpenSearch is an open-source search and analytics suite which serves as a centralized location to manage logs forwarded from other resources, such as databases and Droplets.

Most Viewed OpenSearch Articles

1.  [How do I fix the "Connection Timed Out" error when connecting to my database?](/support/how-do-i-fix-the-connection-timed-out-error-when-connecting-to-my-database/ "Add your machine to the database cluster's list of trusted sources in the firewall settings.")
2.  [How do I fix the "Connection Refused" error when connecting to my database?](/support/how-do-i-fix-the-connection-refused-error-when-connecting-to-my-database/ "Verify the connection string, ensure correct port usage, and add your local machine to the database cluster's trusted sources.")
3.  [OpenSearch Pricing](/products/databases/opensearch/details/pricing/ "Pricing for DigitalOcean Managed OpenSearch Clusters.")
4.  [OpenSearch Quickstart](/products/databases/opensearch/getting-started/quickstart/ "Just the essentials to go from zero to working in a few minutes.")
5.  [How to Manage OpenSearch Users](/products/databases/opensearch/how-to/manage-users/ "Create and delete a database cluster's users from the DigitalOcean Control Panel and API.")
6.  [OpenSearch Concepts](/products/databases/opensearch/concepts/ "Explanations and definitions of core concepts in OpenSearch.")
7.  [How to Forward Logs to OpenSearch Clusters](/products/databases/opensearch/how-to/forward-logs/ "Forward logs from managed databases to your Managed OpenSearch cluster.")
8.  [How to Fork an OpenSearch Database Cluster](/products/databases/opensearch/how-to/fork-clusters/ "Fork a database cluster to create a new cluster from an existing cluster based on a specific point in time.")
9.  [How to Monitor OpenSearch Database Cluster Performance](/products/databases/opensearch/how-to/monitor-clusters/ "Access and understand performance metrics for nodes in a database cluster.")
10.  [OpenSearch Details](/products/databases/opensearch/details/ "Features, plans and pricing, availability, limits, known issues, and more.")

[](/products/databases/opensearch/getting-started/)

![](https://docs.digitalocean.com/images/icons/opensearch.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/databases/opensearch/how-to/)

![](https://docs.digitalocean.com/images/icons/opensearch.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/databases/opensearch/reference/)

![](https://docs.digitalocean.com/images/icons/opensearch.svg)

Reference

API and CLI reference documentation for the OpenSearch database service, including example requests and available parameters.

[](/products/databases/opensearch/concepts/)

![](https://docs.digitalocean.com/images/icons/opensearch.svg)

Concepts

Explanations and definitions of core concepts in OpenSearch.

[](/products/databases/opensearch/details/)

![](https://docs.digitalocean.com/images/icons/opensearch.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

## Latest Updates[](#latest-updates)

### 17 September 2025[](#17-september-2025)

*   Now in public preview, you can now enable storage autoscaling on all Managed Database engines. To enable autoscaling, see our resizing guides for [MySQL](/products/databases/mysql/how-to/resize/), [PostgreSQL](/products/databases/postgresql/how-to/resize/), [MongoDB](/products/databases/mongodb/how-to/resize/), [OpenSearch](/products/databases/opensearch/how-to/resize/), and [Kafka](/products/databases/kafka/how-to/resize/).
    
*   Storage autoscaling is now in general availability. Additionally, you can now reduce your cluster’s amount of additional storage, as long as the new storage size is greater than or equal to the latest backup’s size plus any data growth since then and a 25% buffer.
    

### 28 February 2025[](#28-february-2025)

*   All managed databases except MongoDB now support up to 2,000 IP addresses as trusted sources. To add trusted sources, see our guides for [MySQL](/products/databases/mysql/how-to/secure/), [PostgreSQL](/products/databases/postgresql/how-to/secure/), [Caching](/products/databases/redis/how-to/secure/), [MongoDB](/products/databases/mongodb/how-to/secure/), [OpenSearch](/products/databases/opensearch/how-to/secure/), and [Kafka](/products/databases/kafka/how-to/secure/).
    

### 20 December 2024[](#20-december-2024)

*   All Managed Databases are [now available in NYC2](/platform/regional-availability/).
    

For more information, see [all OpenSearch release notes](https://docs.digitalocean.com/release-notes/opensearch/).

In this article...

[OpenSearch](https://docs.digitalocean.com/products/databases/opensearch/)

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

Try using different keywords or simplifying your search t