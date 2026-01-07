---
source: https://docs.digitalocean.com/products/databases/opensearch/details/notifications/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

Types of Cluster Notifications | DigitalOcean Documentation

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

*   [Details](/products/databases/opensearch/details/) 
*   Cluster Notifications

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Types of Cluster Notifications

Validated on 8 Dec 2022 • Last edited on 17 Jun 2024

OpenSearch is an open-source search and analytics suite which serves as a centralized location to manage logs forwarded from other resources, such as databases and Droplets.

We monitor your clusters for issues such as low disk space and automatic failovers. If we detect an issue, we email you and any [team members](/platform/teams/) attached to the account using the account owner’s email address.

This page lists the database cluster issues we send email alerts for. You cannot disable or customize these automatic emails. To receive alerts about issues not covered here (like CPU usage), you can [set up cluster monitoring policies](/products/databases/opensearch/how-to/set-up-alerts/) based on specified parameters that you choose.

## Failover Notifications[](#failover-notifications)

When we detect a performance issue in your cluster, such as problems with the underlying Droplet that the cluster is running on, we start a primary node replacement. You don’t need to take any action, but if you have not set up your cluster for high availability, you may experience downtime.

## Resource Usage Notifications[](#resource-usage-notifications)

We send low resource notifications when your cluster is low on memory or disk space.

*   **Low Disk Space:** We send this notification when your cluster’s disk space usage reaches greater than 90% of available space for one minute or more within the last five minutes. You can free up disk space by removing unnecessary data, such as errant logs, or by increasing the size of your cluster.
    
*   **Out of Memory:** We send this notification when one or more nodes is low on memory and the Out of Memory Killer has stopped two processes in the past six hours.
    

In this article...

*   [Failover Notifications](#failover-notifications)
*   [Resource Usage Notifications](#resource-usage-notifications)

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