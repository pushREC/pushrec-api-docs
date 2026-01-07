---
source: https://docs.digitalocean.com/products/databases/opensearch/details/limits/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                OpenSearch Limits | DigitalOcean Documentation

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
*   Limits

[Give Feedback](https://ideas.digitalocean.com/documentation)

# OpenSearch Limits

Validated on 17 Jun 2024 • Last edited on 19 Nov 2025

OpenSearch is an open-source search and analytics suite which serves as a centralized location to manage logs forwarded from other resources, such as databases and Droplets.

## Managed Database Cluster Limits[](#managed-database-cluster-limits)

*   By default, you are limited to 10 clusters per account or team. If you reach this limit but need to create more clusters, you can submit a request to increase the limit by clicking **Request Increase** on the window that shows when you attempt to create another cluster.
    
*   You cannot delete the default database and user.
    
*   VPC networks are only available to resources, accounts, and teams in the same region as the VPC network.
    
*   You cannot currently add DigitalOcean Cloud Firewalls to a database cluster’s trusted sources.
    
*   You cannot migrate databases from clusters inside of DigitalOcean to other clusters inside of DigitalOcean using the online migration feature.
    

*   By default, database clusters only support up to 2,000 IP addresses as trusted sources. Different types of resources add varying numbers of IP addresses to your cluster. For example, Droplets typically have two IP addresses, one public and one private, both of which count towards the 2,000-address maximum. To add more than 2,000 IP addresses, [contact support](https://cloudsupport.digitalocean.com).

## OpenSearch Limits[](#opensearch-limits)

*   You cannot currently manage users on Managed OpenSearch. You only have access to the `doadmin` user generated when you create a new OpenSearch cluster.

## Known Issues[](#known-issues)

### Managed Database Cluster Known Issues[](#managed-database-cluster-known-issues)

*   Point-in-time-recovery (PITR) operations are limited to the last 7 days. The date picker doesn’t restrict you from choosing an earlier date; you receive an error if you try to recover from a date outside of the 7-day window.
    
*   You can’t use DigitalOcean’s Cloud Firewalls with managed databases. Until support is available, you can restrict access to nodes by their incoming IPv4 addresses. You can also add Droplets and other resources by their names or [tags](/products/databases/opensearch/how-to/tag/) to a cluster’s [trusted sources](/products/databases/opensearch/how-to/secure/).
    

### Managed OpenSearch Known Issues[](#managed-opensearch-known-issues)

*   Your OpenSearch cluster’s [trusted sources](/products/databases/opensearch/how-to/secure/) settings can prevent you from forwarding certain logs to it. You can only forward logs from a MongoDB cluster if you add its node IPs to the OpenSearch cluster’s trusted sources. You cannot currently forward logs from App Platform or Kubernetes if your OpenSearch cluster has trusted sources enabled. However, you can still add an OpenSearch cluster with trusted sources enabled to an App Platform app as a regular database connection (not as a log destination).

In this article...

*   [Managed Database Cluster Limits](#managed-database-cluster-limits)
*   [OpenSearch Limits](#opensearch-limits)
*   [Known Issues](#known-issues)
    *   [Managed Database Cluster Known Issues](#managed-database-cluster-known-issues)
    *   [Managed OpenSearch Known Issues](#managed-opensearch-known-issues)

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

Try using different keywords or simplifying y
