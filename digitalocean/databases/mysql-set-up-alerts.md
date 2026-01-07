---
source: https://docs.digitalocean.com/products/databases/mysql/how-to/set-up-alerts/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Set Up MySQL Cluster Monitoring Alerts | DigitalOcean Documentation

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
*   Set Up Monitoring Alerts

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Set Up MySQL Cluster Monitoring Alerts

Validated on 1 Mar 2021 • Last edited on 16 Apr 2025

MySQL is an open source, object-relational database built with speed and reliability in mind. Its large and active developer community has created many third-party applications, tools, and libraries that expand MySQL’s functionality.

You can set alert policies based on your [cluster performance metrics](/products/databases/mysql/how-to/monitor-clusters/). Alert policies notify you when a performance metric rises above or falls below a threshold you set, and again when a metric returns to within the threshold. You can receive notifications via email or Slack.

## Create an Alert Policy[](#create-an-alert-policy)

To create an alert policy, click the name of your database cluster to go its **Overview** page, then click the **Insights** tab.

![The Insights tab of a database cluster](https://docs.digitalocean.com/screenshots/databases/mysql-insights-tab.1fbd57f47463ef75086f6c696d6b9e85cd70564defd4fb07a1729e0558710991.png)

Click the **Manage alert policies** button to open the **Manage alert policies window**.

![Creating an alert policy](https://docs.digitalocean.com/screenshots/databases/alert-policy.f042f2c5c616a26c0c17e825cde1dcadde0421f2d7ce6b4f84c1dcb30aa8f619.png)

Fill out the sections in the **Create alert policy** tab to set up an alert:

1.  **Specify metric & set threshold**. You need to specify three things in this section:
    
    *   The performance metric that you want to create an alert for, like CPU usage or disk usage.
        
    *   The numerical threshold above or below which the alert condition triggers, like above 70% usage or below 50% usage.
        
    *   The length of time a threshold must be breached before the alert notification triggers, like 5 minutes or 1 day. The performance metric you’re alerting on is averaged over this interval to determine if it violates the threshold.
        
2.  **Select Clusters or tags**. Choose the clusters or tags that you want the alert policy to apply to. You can also choose **All clusters**.
    
3.  **Send alerts via**. Choose at least one method of notification. You can receive notifications via email (the email on your account and the email of any [team members](/platform/teams/)) or [Slack](https://slack.com/).
    
    Slack notifications require Slack authentication. Click **Connect Slack** to authenticate. Once you are authenticated to Slack, you can select any Slack team, direct message group, or individual members to which you have access.
    
4.  **Name and create alert policy**. Give the alert policy a descriptive name, and then click **Create alert policy**.
    

It may take up to a few minutes for the newly-created alert policy to start evaluating data.

## Manage Alert Policies and Triggered Alerts[](#manage-alert-policies-and-triggered-alerts)

From the **Insights** tab, click the **Manage alert policies** button to open the **Manage alert policies** window, then click the **Existing alert policies** tab.

You can see all of your existing alert policies here. If an alert is triggered, it appears in a **Triggered Alerts** section of this tab, and untriggered alerts are under **Alert Policies**.

![Triggered alert policy](https://docs.digitalocean.com/screenshots/databases/alert-firing.ed95582bc8257e7a4d83598e5f394c347632bf2b3fd88cadb9c966b41dddaca9.png)

Click an alert policy’s **More** menu and select **Edit** to modify the alert policy. You can also delete an alert policy from the **More** menu, which permanently removes the alert policy without confirmation.

In this article...

*   [Create an Alert Policy](#create-an-alert-policy)
*   [Manage Alert Policies and Triggered Alerts](#manage-alert-policies-and-triggered-alerts)

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