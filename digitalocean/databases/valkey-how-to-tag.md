---
source: https://docs.digitalocean.com/products/databases/valkey/how-to/tag/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                How to Tag Valkey Database Clusters | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/valkey.f170106c44632502ecb41bfb74b6d22d99f94ad223afccd11be669fedac30b18.svg)Valkey](/products/databases/valkey/)
    *   [Getting Started](/products/databases/valkey/getting-started/)
        *   [Quickstart](/products/databases/valkey/getting-started/quickstart/)
        *   [Convert Caching to Valkey](/products/databases/valkey/getting-started/convert/)
    *   [How-Tos](/products/databases/valkey/how-to/)
        *   [Connect to Valkey Clusters](/products/databases/valkey/how-to/connect/)
        *   [Secure Valkey Clusters](/products/databases/valkey/how-to/secure/)
        *   [Migrate Valkey Databases](/products/databases/valkey/how-to/migrate/)
        *   [Schedule Automatic Updates](/products/databases/valkey/how-to/schedule-updates/)
        *   [Choose Eviction Policies](/products/databases/valkey/how-to/choose-eviction-policies/)
        *   [Tag Database Clusters](/products/databases/valkey/how-to/tag/)
        *   [Monitor Cluster Performance](/products/databases/valkey/how-to/monitor-clusters/)
        *   [Add Standby Nodes](/products/databases/valkey/how-to/add-standby-nodes/)
        *   [Set Up Monitoring Alerts](/products/databases/valkey/how-to/set-up-alerts/)
        *   [Relocate Database Clusters](/products/databases/valkey/how-to/relocate/)
        *   [Resize Database Clusters](/products/databases/valkey/how-to/resize/)
        *   [Destroy Database Clusters](/products/databases/valkey/how-to/destroy/)
        *   [Monitor Valkey Performance](/products/databases/valkey/how-to/monitor-databases/)
        *   [Forward Logs](/products/databases/valkey/how-to/forward-logs/)
        *   [Reconfigure Database Clusters](/products/databases/valkey/how-to/reconfigure/)
        *   [Create Valkey Clusters](/products/databases/valkey/how-to/create/)
    *   [Reference](/products/databases/valkey/reference/)
        *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
        *   [CLI Reference](/reference/doctl/reference/databases/)
        *   [MCP Reference](/reference/mcp/)
    *   [Concepts](/products/databases/valkey/concepts/)
        *   [Best Practices](/products/databases/valkey/concepts/best-practices/)
        *   [Migration Strategies](/products/databases/valkey/concepts/migration-strategies/)
        *   [Shared Responsibility Model](/products/databases/valkey/concepts/responsibility-model/)
    *   [Details](/products/databases/valkey/details/)
        *   [Features](/products/databases/valkey/details/features/)
        *   [Pricing](/products/databases/valkey/details/pricing/)
        *   [Availability](/products/databases/valkey/details/availability/)
        *   [Limits](/products/databases/valkey/details/limits/)
        *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)

*   [Valkey](/products/databases/valkey/) 
*   [How-Tos](/products/databases/valkey/how-to/) 
*   Tag Database Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Tag Valkey Database Clusters

Validated on 24 Apr 2025 • Last edited on 17 Jun 2025

Valkey is a high-performance, open-source database that stores key-value data in memory, and is designed for caching, message queues, and primary database use. Fully compatible with Redis, Valkey serves as a drop-in replacement.

Tags are custom labels you can apply to database clusters and other DigitalOcean resources. You can filter tagged databases clusters or [create monitoring alert policies](/products/databases/valkey/how-to/set-up-alerts/) for multiple databases clusters with the same tag.

Choosing terms that describe a database cluster’s function can help you locate and administer clusters that share common roles. For example, you might tag a cluster by:

*   **Environment**, like production, staging or development.
*   **Purpose**, like a project name or any other key term that describes the use of the database cluster.
*   **Person**, like the individual or team responsible for managing the database cluster.

You can add tags to databases during or after creation.

## Limits[](#limits)

*   Tags must be a single word containing only letters, numbers, colons, dashes, and underscores.

## Known Issues[](#known-issues)

*   You cannot edit existing tags. Instead, create a new tag, apply it to the appropriate resources, and delete the old one.
*   Tag names are case stable, which means the capitalization you use when you first create a tag is canonical.
    *   Tagged resources in the control panel always displays the canonical capitalization. For example, if you create a tag named `PROD`, you can tag resources in the control panel by entering `prod`. The tag still displays with its canonical capitalization, `PROD`.
    *   When working with [tags in the API](/reference/api/digitalocean/), you must use the tag’s canonical capitalization. For example, if you create a tag named `PROD`, the URL to add that tag to a resource would be `https://api.digitalocean.com/v2/tags/PROD/resources` (not `/v2/tags/prod/resources`).

## Tag Database Clusters During Creation[](#tag-database-clusters-during-creation)

To add tags while creating a new database cluster, at the bottom of the [database cluster create page](https://cloud.digitalocean.com/databases/new), look for the **Finalize and create** section and click the **Add Tags** link to display the tag input form.

![The Finalize and Create section of the database cluster creation menu, including the expanded Add Tags section.](https://docs.digitalocean.com/screenshots/databases/finalize-and-create-with-tags.8615437a9d58c0015aa9fcc902549a63bc9f28ee62a76bb0351c75824ee711b1.png)

Under the **Add optional tags to your database cluster** header, enter the tags. Add multiple tags by pressing `SPACEBAR` or `ENTER` after each term. Navigate between tags with the arrow keys, and remove the highlighted tag with `BACKSPACE`.

## Tag Existing Database Clusters[](#tag-existing-database-clusters)

To add or modify tags for existing database clusters, use the cluster’s **More** menu and select **Edit tags**.

![The database cluster's More menu](https://docs.digitalocean.com/screenshots/databases/cluster-more-menu.9f0427ae4e7def2a45309eb5fba5ab597bdd4ab4f1be923e6a3bd9ad382df605.png)

On a [project’s dashboard](/products/projects/), you can also hover over an untagged database cluster’s row of information to reveal the **Add tags** link.

No matter which way you navigate, the **Manage Tags** dialog opens.

![The Manage Tags dialog](https://docs.digitalocean.com/screenshots/databases/manage-tags.bb76064e30a6d1d16f684ebf4cd182e22ce6c1e7e8fdd9c62bf087892cd91716.png)

Add tags by pressing `SPACEBAR` or `ENTER` after each term. Navigate between tags with the arrow keys, and remove the highlighted tag with `BACKSPACE`.

When you’re done, click **Save Tags**.

## Filter by Tag[](#filter)

If you click a tag from anywhere in the control panel, like on the dashboard of a project or on the list of database clusters, you go to the list of all resources with that tag.

![An example of a list of resources with a tag. There is 1 database cluster and one Droplet with the tag 'web-team'.](https://docs.digitalocean.com/screenshots/databases/tags-filter-list.19452bd03999eb12d8b2965a6f11adc2ab36328b5cc4ad859f6da09d58996418.png)

Filter lists are limited to a single tag, displayed at the top of the list.

In this article...

*   [Limits](#limits)
*   [Known Issues](#known-issues)
*   [Tag Database Clusters During Creation](#tag-database-clusters-during-creation)
*   [Tag Existing Database Clusters](#tag-existing-database-clusters)
*   [Filter by Tag](#filter)

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
