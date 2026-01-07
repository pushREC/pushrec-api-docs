---
source: https://docs.digitalocean.com/products/app-platform/how-to/view-insights/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to View Insights in App Platform

Validated on 19 Feb 2024 • Last edited on 19 Feb 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

DigitalOcean App Platform includes metrics visualizations so you can monitor your app’s performance and health.

## View Insights Using the Control Panel[](#view-insights-using-the-control-panel)

Your app’s Insights tab displays metrics about your app’s resource usage, including the following:

*   **CPU usage**. This tracks the percentage of CPU power your app is using.
*   **Memory usage**. This tracks the percentage of memory your app is using in the container. This metrics may differ slightly from the memory usage reported by the operating system as App Platform always allots slightly more memory to your app. App redeployments and DigitalOcean maintenance operations do not contribute to this metric.
*   **Restart count**. This tracks the number of times your app has been restarted. Restarts often indicate that your application has crashed or exited.
*   **CDN ingress bandwidth**. This tracks the bandwidth transmitted by our edge CDN network on behalf of your app. This includes both cache requests served by the CDN and non-cached requests forwarded to your application instance.
*   **CDN ingress average latency by status code**. This tracks the average latency of requests to your app from the CDN, by status code.
*   **CDN ingress throughput (requests) by status code**. This tracks the number of requests to your app from the CDN, by status code.

To view your app’s insights from the [control panel](https://cloud.digitalocean.com/apps), click your app and then click the **Insights** tab. From here, you can click a resource to filter insights by resource.

![Insights screen with time interval drop-down visible](https://docs.digitalocean.com/screenshots/app-platform/app-insights.22efee0ede1e7a6b353a88a51c9b3f8eb8c56211e2f504f6643a49d5058d8f31.png)

Use the **Select Object** drop-down to select insights for specific components in your app. Use the **Select Period** drop-down to select the time interval for which insights are being displayed.

Additionally, you can [create alerts](/products/app-platform/how-to/create-alerts/) for your app and its resources.

## View Insights Using the API[](#view-insights-using-the-api)

You can view the following metrics using the DigitalOcean API:

How to Get App CPU Percentage Metrics Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/monitoring/metrics/apps/cpu_percentage`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/monitoring_get_appCPUPercentageMetrics).

### cURL[](#get-app-cpu-percentage-metrics-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/monitoring/metrics/apps/cpu_percentage?app_id=2db3c021-15ad-4088-bfe8-99dc972b9cf6&app_component=sample-application&start=1636051668&end=1636051668"

How to Get App Memory Percentage Metrics Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/monitoring/metrics/apps/memory_percentage`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/monitoring_get_appMemoryPercentageMetrics).

### cURL[](#get-app-memory-percentage-metrics-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/monitoring/metrics/apps/memory_percentage?app_id=2db3c021-15ad-4088-bfe8-99dc972b9cf6&app_component=sample-application&start=1636051668&end=1636051668"

How to Get App Restart Count Metrics Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/monitoring/metrics/apps/restart_count`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/monitoring_get_appRestartCountMetrics.yml).

### cURL[](#get-app-restart-count-metrics-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/monitoring/metrics/apps/restart_count?app_id=2db3c021-15ad-4088-bfe8-99dc972b9cf6&app_component=sample-application&start=1636051668&end=1636051668"

How to Retrieve App Daily Bandwidth Metrics Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/apps/{app_id}/metrics/bandwidth_daily`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/apps_get_metrics_bandwidth_daily).

### cURL[](#retrieve-app-daily-bandwidth-metrics-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/apps/{id}/metrics/bandwidth_daily"

### Python[](#retrieve-app-daily-bandwidth-metrics-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    get_resp = client.apps.get_metrics_bandwidth_daily(app_id="4f6c71e2")