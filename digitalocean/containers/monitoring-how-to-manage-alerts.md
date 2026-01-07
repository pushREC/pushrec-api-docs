---
source: https://docs.digitalocean.com/products/monitoring/how-to/manage-alerts/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/monitoring/how-to/manage-alerts/
domain: docs.digitalocean.com
---
                How to Create, Edit, and Delete Resource Alerts | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/monitoring.76945ea4a7d45a01469c36e1133e112e8cf2b800c56b8106f31d27b146221b0f.svg)Monitoring](/products/monitoring/)
*   [Getting Started](/products/monitoring/getting-started/)
    *   [Quickstart](/products/monitoring/getting-started/quickstart/)
*   [How-Tos](/products/monitoring/how-to/)
    *   [Install the Metrics Agent](/products/monitoring/how-to/install-metrics-agent/)
    *   [Install the Metrics Agent via Metrics Agent Repository](/products/monitoring/how-to/install-metrics-agent-repository/)
    *   [Uninstall the Metrics Agent](/products/monitoring/how-to/uninstall-metrics-agent/)
    *   [Manage Resource Alerts](/products/monitoring/how-to/manage-alerts/)
    *   [Upgrade Your Legacy Agent](/products/monitoring/how-to/upgrade-legacy-agent/)
*   [Reference](/products/monitoring/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/monitoring)
    *   [CLI Reference](/reference/doctl/reference/monitoring/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/monitoring/concepts/)
    *   [Metrics](/products/monitoring/concepts/metrics/)
*   [Details](/products/monitoring/details/)
    *   [Features](/products/monitoring/details/features/)
    *   [Pricing](/products/monitoring/details/pricing/)
    *   [Availability](/products/monitoring/details/availability/)
    *   [Limits](/products/monitoring/details/limits/)
*   [Support](/products/monitoring/support/)

*   [How-Tos](/products/monitoring/how-to/) 
*   Manage Resource Alerts

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Create, Edit, and Delete Resource Alerts

Validated on 3 Nov 2025 • Last edited on 10 Nov 2025

DigitalOcean Monitoring is a free, opt-in service that lets you track Droplet resource usage in real time, visualize performance metrics, and receive alerts via email or Slack to proactively manage your infrastructure’s health.

Resource alerts help you monitor your Droplets by sending notifications when key metrics like CPU usage, memory, and bandwidth exceed or fall below thresholds you define. Alerts are delivered through Slack, email, or both so you can respond as needed.

When an alert triggers, it appears in the DigitalOcean Control Panel with the alert name, affected Droplet(s), and links to their pages. You receive a notification with usage details and alert parameters, followed by another notification when the issue resolves. This helps you respond to issues immediately and confirm when the system returns to normal.

These alerts use data from the [DigitalOcean metrics agent](/products/monitoring/), a lightweight open source service that runs on Droplets of your choosing. To use resource alerts, you must [install the metrics agent](/products/monitoring/how-to/install-metrics-agent/#install) on the Droplets or tags you want to monitor. Kubernetes worker nodes include the metrics agent by default.

## Create a Resource Alert Using the Control Panel[](#create-control)

You can create a resource alert in the DigitalOcean Control Panel to monitor your Droplets and receive notifications when they exceed a defined usage threshold.

To create a resource alert, go to the [**DigitalOcean Monitoring Resource Alerts** page](https://cloud.digitalocean.com/monitors/resource-alerts), then on the **Resource Agents** page, click **Create Resource Agent** to open the **Create Resource Alert** page.

### Select the Metric[](#select-the-metric)

In the **Select Metric & Set Threshold** section, choose the **Metric Type** you want to monitor.

Here are the available metrics you can monitor and what each one measures:

Metric

Definition

1 Minute Load Average

Average number of processes running or waiting in the past 1 minute

5 Minute Load Average

Average number of processes running or waiting in the past 5 minutes

15 Minute Load Average

Average number of processes running or waiting in the past 15 minutes

Memory Utilization Percent

Total memory in use on the Droplet

Disk Utilization Percent

Root disk storage in use on the Droplet

CPU Utilization Percent

Total CPU capacity in use on the Droplet

Disk Read I/O (Mbps)

Read activity on the Droplet’s disk

Disk Write I/O (Mbps)

Write activity on the Droplet’s disk

Public Inbound Bandwidth (Mbps)

Incoming public network traffic to the Droplet

Public Outbound Bandwidth (Mbps)

Outgoing public network traffic from the Droplet

Private Inbound Bandwidth (Mbps)

Incoming private network traffic to the Droplet

Private Outbound Bandwidth (Mbps)

Outgoing private network traffic from the Droplet

For more details about each metric, see the [metrics concepts page](/products/monitoring/concepts/metrics/).

### Set the Rule[](#set-the-rule)

A rule defines the condition that determines when an alert should trigger. It triggers when the selected metric is above or below the threshold for the alert to trigger. The rule works together with the [threshold](#set-the-threshold) and [duration](#set-the-duration) settings to define when and how the alert is triggered.

Set the **Rule** by clicking the dropdown menu, then choosing either **is above** or **is below** based on what you want to detect. Use **is above** when high usage signals a problem, such as CPU or memory exceeding safe limits. Use **is below** when low values may indicate an issue, like a sudden drop in bandwidth or stalled disk activity.

### Set the Threshold[](#set-the-threshold)

A threshold is the value that a metric must exceed or fall below to trigger an alert. It defines the point at which the system considers the usage abnormal or potentially problematic.

We recommend reviewing historical metrics in your Droplet’s **Graphs** tab to understand typical usage patterns. This helps you set thresholds that reflect sustained performance issues and avoid false alerts from short spikes or idle periods. Additionally, avoid setting thresholds too close to normal peak or idle values to reduce noise and prevent unnecessary alerts.

Use different thresholds for different Droplets based on their roles. For example, a database server may need a lower CPU threshold than a cache server.

To set the threshold, in the **Threshold** sub-section, type the value that triggers the alert. Thresholds are either percentages (for metrics like CPU, memory, or disk usage) or usage rates (for metrics like bandwidth or disk I/O).

We recommend the following starting points when setting thresholds:

*   **CPU, memory, or disk usage**, set the threshold to 70 percent. Usage above this level can lead to degraded performance.
*   **Load averages**, use a value near or slightly above your Droplet’s vCPU count. You can find the vCPU count by viewing the **Resources** section on the Droplet’s page.
*   **Bandwidth and disk I/O**, base the threshold on the Droplet’s typical activity. You can review this data in your Droplet’s **Graphs** tab.

You can adjust thresholds over time based on how often alerts trigger and whether they correspond to real performance concerns.

### Set the Duration[](#set-the-duration)

The duration is how long the metric must remain above or below the threshold before the alert triggers. You can set the duration to:

*   5 minutes
*   10 minutes
*   30 minutes
*   1 hour

This helps ensure alerts are triggered by sustained conditions rather than brief spikes or dips.

*   **Shorter durations** are best for critical services where delayed response could cause downtime or data loss. They provide faster alerts but may increase false positives from momentary spikes.
*   **Longer durations** help reduce noise from short-term fluctuations or bursty workloads. They improve reliability but may delay notification. For systems with variable usage, consider pairing a more aggressive threshold with a longer duration.

Review and adjust the duration over time based on how often the alert triggers and whether it reflects actual performance issues.

### Assign Droplets or Tags[](#assign-droplets-or-tags)

In the **Select Droplets or Tags** section, choose how you want to assign the alert. You can apply the alert to a specific Droplet, a tag, or **All Droplets**. Only Droplets with the DigitalOcean metrics agent installed are available for selection. If the agent is not installed for one of or any of the Droplets you want to track, [install the metrics agent](/products/monitoring/how-to/install-metrics-agent/#install) before continuing.

There are two ways to assign alerts:

*   **By Droplet**, select individual Droplets to monitor specific resources, or
*   **By tag**, apply the alert to all Droplets with a shared tag. This is useful for managing alerts across groups of similar Droplets.

For Kubernetes worker nodes, we recommend assigning alerts by tag rather than by Droplet name. Worker nodes may be recycled and do not retain consistent names, which can cause alerts tied to specific names to stop working. Tags like the cluster name remain consistent through recycling and help ensure alerts continue to apply.

### Select Alert Notification Method[](#select-alert-notification-method)

To receive notifications when your alert triggers, go to the **Select alert notification method** section and either choose email, Slack, or both. These methods work independently, so you can configure both and send alerts to multiple destinations. You must select at least one notification method, and you can update your preferences at any time.

 Email

If you choose email notifications, click the **email** checkbox, then under the **Add one or more email addresses…** field, type the email(s) you want to send the notifications to. The default recipient is the email address associated with your DigitalOcean account, but you can add other [team members](/platform/teams/how-to/manage-membership/) as long as their email addresses are verified and belong to the same team.

 Slack

If you choose Slack notifications, click the **Slack** checkbox, then click **Connect Slack**. This opens Slack’s **DigitalOcean is requesting permission to access the DigitalOcean Slack workspace** authorization window.

In this authorization window, under the **What will DigitalOcean be able to view?** section, review the permissions to see what access you’re granting. Then, under the **Where should DigitalOcean post?** section, use the dropdown to select a public or private channel, a direct message to an individual (such as yourself), or a Slackbot. After you choose where to send alerts, click **Allow** to complete the authorization.

This action authorizes DigitalOcean to send alert notifications to your selected Slack workspace and channel or direct message. You return to the alert creation page after completing authorization.

Warning

If the Slack team name includes non-UTF-8 characters, such as emojis, Slack alerts may fail and return a 500 error. We are currently working to support additional character sets.

After setup, under the **Slack** checkbox, select the authorized Slack channel or direct message to start receiving alert notifications.

You can connect multiple Slack destinations and manage them at any time. To add more, click **Add additional Slack connections** under the **Slack** checkbox. This reopens the authorization window so you can repeat the process and add another channel or direct message.

To unlink a Slack channel or direct message, under the **Slack** checkbox, next to the Slack entry you want to remove, click **Unlink**. This immediately removes it from your notification options.

### Finalize[](#finalize)

In the **Finalize** section, name your resource alert or use the auto-generated one. The name doesn’t need to be unique, but a specific name helps you identify it later.

Then, click **Create Resource Alert** to activate it. The alert appears under the **Resource Alerts** section on the [**Monitoring**](https://cloud.digitalocean.com/monitoring) page and begins monitoring after a brief activation period.

The alert continuously averages recent data points over the time window you set. This helps filter out short spikes or dips. If the average exceeds the threshold, the alert triggers. It resolves automatically once usage returns to normal.

## Create a Resource Alert Using the API[](#create-api)

To create a resource alert using the API, send a request to the [Create Alert Policy](/reference/api/digitalocean/#operation/monitoring_create_alertPolicy) endpoint with the required metric, comparison, threshold, and action.

How to Create a Resource Alert Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/monitoring/alerts`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/monitoring_create_alertPolicy).

### cURL[](#create-a-resource-alert-curl)

Using cURL:

    curl -X POST \                                                                                                                              
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/monitoring/alerts" \
      --data '{"alerts":{"email":["[email protected]"]},"compare":"GreaterThan","description":"CPU Alert","enabled":true,"entities":["12345678"],"tags":["droplet_tag"],"type":"v1/insights/droplet/cpu","value":80,"window":"5m"}'

### Python[](#create-a-resource-alert-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "alerts": {
        "email": [
          "[email protected]"
        ],
        "slack": [
          {
            "channel": "Production Alerts",
            "url": "https://hooks.slack.com/services/T1234567/AAAAAAAA/ZZZZZZ"
          }
        ]
      },
      "compare": "GreaterThan",
      "description": "CPU Alert",
      "enabled": True,
      "entities": [
        "192018292"
      ],
      "tags": [
        "droplet_tag"
      ],
      "type": "v1/insights/droplet/cpu",
      "value": 80,
      "window": "5m"
    }
    
    resp = client.monitoring.create_alert_policy(body=req)

Once created, the alert policy monitors the specified Droplet or resource and triggers notifications when thresholds are met. You can retrieve a list of your alert policies using the [List Alert Policies](/reference/api/digitalocean/#operation/monitoring_list_alertPolicy) endpoint, and details of your new alert policy using the [Get Alert Policy](/reference/api/digitalocean/#operation/monitoring_get_alertPolicy) endpoint.

## Edit a Resource Alert Using the Control Panel[](#edit-control)

You can edit an existing resource alert at any time to adjust thresholds, change notification settings, or update which Droplets it applies to. This is useful if your workload changes, your resource usage patterns shift, or you want to fine-tune alerts to reduce false positives or catch issues earlier.

To edit a resource alert, go to the [**DigitalOcean Monitoring Resource Alerts** page](https://cloud.digitalocean.com/monitors/resource-alerts), then on the **Resource Agents** page, find the resource alert you want to edit, on the right of it, click **…**, then click **Edit**.

You can [edit any of the attributes you used to create your resource alert](#create-a-resource-alert), including the monitored metric, threshold, rule, duration, assigned Droplets or tags, and notification methods.

## Edit a Resource Alert Using the API[](#edit-api)

To edit a resource alert using the API, send a request to the [Update Alert Policy](/reference/api/digitalocean/#operation/monitoring_update_alertPolicy) endpoint with the alert policy ID and the updated configuration.

You can find the alert policy ID using the [List Alert Policies](/reference/api/digitalocean/#operation/monitoring_list_alertPolicy) endpoint.

How to Edit a Resource Alert Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a PUT request to [`https://api.digitalocean.com/v2/monitoring/alerts/{uuid}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/%25!s\(%3Cnil%3E\)).

After editing, the updated policy immediately takes effect for all monitored resources.

## Delete a Resource Alert Using the Control Panel[](#delete-control)

You can delete a resource alert at any time if it’s no longer needed. Deleting an alert stops all notifications and removes it from your [**DigitalOcean Monitoring Resource Alerts** page](https://cloud.digitalocean.com/monitors/resource-alerts). This action is permanent and cannot be undone.

To delete a resource alert, go to the [**DigitalOcean Monitoring Resource Alerts** page](https://cloud.digitalocean.com/monitors/resource-alerts), then on the **Resource Agents** page, find the alert you want to delete, then on the right of that alert, click **…**, then click **Delete** to open the **Destory Resource Alert** window.

In the **Destroy Resource Alert** window, type the name of the resource alert you want to delete, then click **Destroy** to confirm deletion.

## Delete a Resource Alert Using the API[](#delete-api)

To delete a resource alert using the API, send a request to the [Delete Alert Policy](/reference/api/digitalocean/#operation/monitoring_delete_alertPolicy) endpoint with the alert policy ID.

You can retrieve the alert policy ID using the [List Alert Policies](/reference/api/digitalocean/#operation/monitoring_list_alertPolicy) endpoint.

How to Delete a Resource Alert Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a DELETE request to [`https://api.digitalocean.com/v2/monitoring/alerts/{uuid}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/%25!s\(%3Cnil%3E\)).

Deleting the alert policy stops any future notifications for the associated resource.

In this article...

*   [Create a Resource Alert Using the Control Panel](#create-control)
    *   [Select the Metric](#select-the-metric)
    *   [Set the Rule](#set-the-rule)
    *   [Set the Threshold](#set-the-threshold)
    *   [Set the Duration](#set-the-duration)
    *   [Assign Droplets or Tags](#assign-droplets-or-tags)
    *   [Select Alert Notification Method](#select-alert-notification-method)
    *   [Finalize](#finalize)
*   [Create a Resource Alert Using the API](#create-api)
*   [Edit a Resource Alert Using the Control Panel](#edit-control)
*   [Edit a Resource Alert Using the API](#edit-api)
*   [Delete a Resource Alert Using the Control Panel](#delete-control)
*   [Delete a Resource Alert Using the API](#delete-api)

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

Try using different keyword