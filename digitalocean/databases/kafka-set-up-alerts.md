---
source: https://docs.digitalocean.com/products/databases/kafka/how-to/set-up-alerts/
scraped: 2026-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

How to Set Up Kafka Cluster Monitoring Alerts | DigitalOcean Documentation

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
*   Set Up Monitoring Alerts

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Set Up Kafka Cluster Monitoring Alerts

Validated on 8 Dec 2022 • Last edited on 23 Jan 2025

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

You can set alert policies based on your [cluster performance metrics](/products/databases/kafka/how-to/monitor-clusters/). Alert policies notify you when a performance metric rises above or falls below a threshold you set, and again when a metric returns to within the threshold. You can receive notifications via email or Slack.

## Create an Alert Policy[](#create-an-alert-policy)

To create an alert policy, click the name of your database cluster to go its **Overview** page, then click the **Insights** tab.

![The Insights tab of a database cluster](https://docs.digitalocean.com/screenshots/databases/kafka-insights-tab.37d966e3f3cda8cbfa8e5937a943834c3115f70b871ba4de91e08bb428e3fe3e.png)

Click the **Manage alert policies** button to open the **Manage alert policies window**.

![Creating an alert policy](https://docs.digitalocean.com/screenshots/databases/alert-policy.f042f2c5c616a26c0c17e825cde1dcadde0421f2d7ce6b4f84c1dcb30aa8f619.png)

Fill out the sections in the **Create alert policy** tab to set up an alert:

1.  **Specify metric & set threshold**. You need to specify three things in this section:
    
    *   The performance metric that you want to create an alert for, like CPU usage or disk usage.
        
    *   The numerical threshold above or below which the alert condition triggers, such as above 70% usage or below 50% usage.
        
    *   The length of time a threshold must be breached before the alert notification triggers, like 5 minutes or 1 day. The performance metric you’re alerting on is averaged over this interval to determine if it violates the threshold.
        
2.  **Select Clusters or tags**. Choose the clusters or tags that you want the alert policy to apply to. You can also choose **All clusters**.
    
3.  **Send alerts via**. Choose at least one method of notification. You can receive notifications via email (the email on your account and the email of any [team members](/platform/teams/)) or [Slack](https://slack.com/).
    
    Slack notifications require Slack authentication. Click **Connect Slack** to authenticate. Once you are authenticated to Slack, you can select any Slack team, direct message group, or individual members to which you have access.
    
4.  **Name and create alert policy**. Give the alert policy a descriptive name, and then click **Create alert policy**.
    

It may take up to a few minutes for the newly-created alert policy to start evaluating data.

## Manage Alert Policies and Triggered Alerts[](#manage-alert-policies-and-triggered-alerts)

From the **Insights** tab, click the **Manage alert policies** button to open the **Manage alert policies** window, then click the **Existing alert policies** tab.

All of your existing alert policies here. If an alert is triggered, it appears in a **Triggered Alerts** section of this tab, and untriggered alerts are under **Alert Policies**.

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

Try using different keywords or simplifying your search