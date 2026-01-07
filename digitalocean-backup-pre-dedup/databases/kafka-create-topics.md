---
source: https://docs.digitalocean.com/products/databases/kafka/how-to/create-topics/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ow to Create Kafka Topics | DigitalOcean Documentation

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
*   Create Kafka Topics

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create Kafka Topics

Validated on 8 Dec 2022 • Last edited on 23 Jan 2025

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

You can [create](#create), [edit](#edit), and [delete](#delete) Topics for your Kafka cluster in the [control panel](https://cloud.digitalocean.com/databases). Click your Kafka cluster, then click the **Topics & Users** tab.

## Create Topic[](#create)

To create a new Topic, click the **Create Topic** button.

![The Create menu](https://docs.digitalocean.com/screenshots/databases/kafka-create-topic.a9b73090bc9133ce465434126593e35bfe019bd5254d32ba5fcd9ac2abba27ab.png)

This opens the Topic configuration pop-up window. Fill out the following fields with your information:

*   Topic Name: Sets the name of this topic.
*   Partition Count: Splits topics into this many logs, which allows up to the same number of consumers to read each topic simultaneously. Using excessive partitions can make your Kafka cluster inefficient.
*   Replication Factor: Copies all data this many times across your cluster. This value cannot exceed the number of nodes in your cluster.
*   Retention (hours): Maximum time, in hours, before this topic is deleted. If retention in bytes is also set, then the topic is deleted when both conditions apply.
*   Retention (bytes): Maximum data, in bytes, before this topic is deleted. If retention in hours is also set, then the topic is deleted when both conditions apply.

![The Create menu](https://docs.digitalocean.com/screenshots/databases/kafka-topic-config.5d2c8e9a3df0f6d7e2db82d7baa203f4df46b0b554ef4e87ccc2d71062bc5cff.png)

Click **Create Topic** to confirm your configuration. After a few seconds, your **Topics & Users** tab updates to display a list of your cluster’s Topics.

## Edit Topic[](#edit)

To edit an existing Topic, click the **…** icon to the right of a Topic, and click **Edit Topic**. This returns you to the configuration pop-up window, where you can change the Topic’s settings and apply them by clicking **Save**.

![](https://docs.digitalocean.com/screenshots/databases/kafka-edit-topic.dbe3fba9b27820e96227fac4f3ea28f48f9c177b1c8a18c1b8ea2e1797498c40.png)

## Delete Topic[](#delete)

To delete a Topic, click the **…** icon to the right of a Topic, and click **Delete Topic**. This permanently destroys the Topic and all data on it.

![](https://docs.digitalocean.com/screenshots/databases/kafka-delete-topic.6cfadea53f85737cffe212393d7f753a39662436b96a563cbe946f9759af80b3.png)

In this article...

*   [Create Topic](#create)
*   [Edit Topic](#edit)
*   [Delete Topic](#delete)

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