---
source: https://docs.digitalocean.com/products/databases/mongodb/concepts/responsibility-model/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
hared Responsibility Model | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/mongodb.15f32316da2692011abce02f393a1ee6db469250230cf1ea962c181c0e9e7de5.svg)MongoDB](/products/databases/mongodb/)
*   [Getting Started](/products/databases/mongodb/getting-started/)
    *   [Quickstart](/products/databases/mongodb/getting-started/quickstart/)
    *   [Serverless Jamstack Site](/products/functions/getting-started/serverless-jamstack/)
*   [How-Tos](/products/databases/mongodb/how-to/)
    *   [Create MongoDB Clusters](/products/databases/mongodb/how-to/create/)
    *   [Resize Database Clusters](/products/databases/mongodb/how-to/resize/)
    *   [Connect to MongoDB Clusters](/products/databases/mongodb/how-to/connect/)
    *   [Import MongoDB Data](/products/databases/mongodb/how-to/import-collections/)
    *   [Secure MongoDB Clusters](/products/databases/mongodb/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/mongodb/how-to/schedule-updates/)
    *   [Tag Database Clusters](/products/databases/mongodb/how-to/tag/)
    *   [Manage Users and Databases](/products/databases/mongodb/how-to/manage-users-and-databases/)
    *   [Upgrade Database Clusters](/products/databases/mongodb/how-to/upgrade/)
    *   [Add Standby Nodes](/products/databases/mongodb/how-to/add-standby-nodes/)
    *   [Monitor Cluster Performance](/products/databases/mongodb/how-to/monitor-clusters/)
    *   [Forward Logs](/products/databases/mongodb/how-to/forward-logs/)
    *   [Set Up Monitoring Alerts](/products/databases/mongodb/how-to/set-up-alerts/)
    *   [Fork Database Clusters](/products/databases/mongodb/how-to/fork-clusters/)
    *   [Reconfigure Database Clusters](/products/databases/mongodb/how-to/reconfigure/)
    *   [Restore from Backups](/products/databases/mongodb/how-to/restore-from-backups/)
    *   [Destroy Database Clusters](/products/databases/mongodb/how-to/destroy/)
*   [Reference](/products/databases/mongodb/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/mongodb/concepts/)
    *   [Best Practices](/products/databases/mongodb/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/mongodb/concepts/responsibility-model/)
*   [Details](/products/databases/mongodb/details/)
    *   [Features](/products/databases/mongodb/details/features/)
    *   [Pricing](/products/databases/mongodb/details/pricing/)
    *   [Availability](/products/databases/mongodb/details/availability/)
    *   [Limits](/products/databases/mongodb/details/limits/)
    *   [Cluster Notifications](/products/databases/mongodb/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)
*   [Support](/products/databases/mongodb/support/)

*   [Concepts](/products/databases/mongodb/concepts/) 
*   Shared Responsibility Model

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Shared Responsibility Model

Validated on 5 Jan 2023 • Last edited on 17 Jun 2025

MongoDB is a source-available cross-platform document-oriented database program for high-volume storage. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.

As a managed service provider, DigitalOcean provides stability and security to your database clusters. However, some best practices for database management still fall under the user’s responsibility. For example, while DigitalOcean takes full responsibility for hosting physical infrastructure and ensuring network security, users are responsible for managing client-side encryption, the database firewall, and access to data.

To ensure the security of your database clusters, the following shared responsibility model describes exactly which operations and security measures users are responsible for and which DigitalOcean is responsible for:

User’s Responsibilities

DigitalOcean’s Responsibilities

Manage users and their permissions

Ensure physical security of servers and OS

Control network access through trusted sources

Provide backup and recovery options (PITR, restore from backup, fork databases)

Monitor database performance by creating alert policies

Monitoring via health checkups and auditing database logs

Add high availability and scalability

Provide standby and read-only nodes, automated failover

Protect cluster’s data (unauthorized access, data validation)

Encrypt data at rest (LUKS) and in transit (SSL)

Optimize databases and queries

Provide data durability and redundancy

Change variables via the DO API

Restart databases

In this article...

[Shared Responsibility Model](https://docs.digitalocean.com/products/databases/mongodb/concepts/responsibility-model/)

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

Try using different keywords or simplifying your se