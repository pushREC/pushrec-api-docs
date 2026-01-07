---
source: https://docs.digitalocean.com/products/app-platform/how-to/create-alerts/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Create Alerts and Set Up Monitoring in App Platform

Validated on 18 Aug 2021 • Last edited on 30 Jul 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

In addition to [viewing insights](/products/app-platform/how-to/view-insights/), you can monitor and set up alerts for certain events. App Platform provides the following app-level and resource-level alerts:

*   **App alerts**: The following events can trigger app-level alerts:
    
    *   Failed deployment
    *   Successful deployment
    *   Failed domain configuration
    *   Successful domain configuration
    *   Autoscale failed
    *   Autoscale succeeded
*   **Metric alerts for app resources**: The following metrics can trigger resource-level alerts:
    
    *   CPU
    *   Memory
    *   Restart count
*   **Metric alerts for Functions**: The following metrics can trigger Function-level alerts:
    
    *   Activation count
    *   Average duration
    *   Average wait time
    *   Error count
    *   Error rate per minute
    *   Memory consumption rate (in GB per second)

By default, when you create a new app, App Platform creates email alerts for failed deployments and failed domain configurations.

![Default app-level alerts](https://docs.digitalocean.com/screenshots/app-platform/app-alerts-default.3d148fb0114da040add7a64099982987a8f68c61d28eb589f67ab76434be41d4.png)

Note

App Platform sometimes redeploys apps for infrastructure maintenance purposes. If you have alerts configured to trigger on deployments, you may occasionally receive alerts when App Platform re-deploys an app due to maintenance.

## Set Up App Alerts[](#set-up-app-alerts)

To manage your alert policies, go to [https://cloud.digitalocean.com/apps](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab. In the **Alerts Policies** section, click **Edit**. You can enable or disable an alert or set the notification method to be email and/or Slack. Click the alert to expand it, make your selections and click **Save**.

![Edit app-level alerts](https://docs.digitalocean.com/screenshots/app-platform/edit-app-alerts.008a8d702d1b876b67af41058e638243316f5850b5af5dcfca0eba9c2ef35e11.png)

## Monitor Resource Metrics[](#monitor-resource-metrics)

You can configure resources to trigger alerts based on metrics such as CPU and memory usage, and number of restarts. The alert triggers when the metric is above or below a certain threshold and for a certain time duration. You can configure the alert to apply to all or specific app resources. To set a metric alert:

1.  Select your app or an app resource in the **Settings** tab and click **Create Alert Policy**.
2.  Select the metric in the **Metric** drop-down list.
3.  Select **Above** or **Below** in the **Above or Below** drop-down list.
4.  Enter a threshold in the **Threshold %** field.
5.  Specify the time duration in the **Duration** drop-down list.
6.  Select **Email** or **Connect Slack** as the **Delivery Method** for receiving alert notifications.
7.  Select the checkboxes for the resources you want to set the alert for.
8.  Click **Save** to save the alert.

![Create new metric alert](https://docs.digitalocean.com/screenshots/app-platform/new-metric-alert.803bb4300178b828e8c2c72e5a089b1469e8bd5b28df0007326cf4b0db1403f8.png)