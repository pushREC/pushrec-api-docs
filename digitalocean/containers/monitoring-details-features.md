---
source: https://docs.digitalocean.com/products/monitoring/details/features/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/monitoring/details/features/
domain: docs.digitalocean.com
---
                Monitoring Features | DigitalOcean Documentation

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

*   [Details](/products/monitoring/details/) 
*   Features

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Monitoring Features

Validated on 3 Nov 2025 • Last edited on 10 Nov 2025

DigitalOcean Monitoring is a free, opt-in service that lets you track Droplet resource usage in real time, visualize performance metrics, and receive alerts via email or Slack to proactively manage your infrastructure’s health.

## GPU Observability[](#gpu-observability)

GPU Observability extends DigitalOcean Insights to display GPU-level metrics for DOKS clusters that include GPU node pools created with AI/ML Ready images for AMD and NVIDIA GPUs. It provides a monitoring experience for GPU workloads, so you can track utilization, temperature, memory usage, and performance directly in the **Insights** tab.

`do-agent` automatically detects the GPU type on each node and enables the correct exporter (`DCGM` for NVIDIA GPUs or `ROCm` for AMD GPUs). Metrics are collected locally on each GPU worker node.

GPU Observability is available on DOKS 1.33.1-do.5 or higher and is automatically enabled when you select **Improved metrics and monitoring** during cluster creation.

For security, GPU exporters listen only on `127.0.0.1` to prevent external access.

*   **AI/ML Ready Droplets:** GPU metrics are enabled automatically when you select **Improved Metrics and Monitoring** during Droplet creation.
*   **Basic Images:** GPU metrics are not enabled by default. For **Basic Images**, you can enable GPU metrics by [manually installing the exporter](/products/droplets/how-to/gpu/enable-metrics/), binding it to `127.0.0.1`, reconfiguring `do-agent` to scrape it, and restarting `do-agent`.

## Droplet Graphs[](#droplet-graphs)

Droplet graphs provide visual representations of system-level metrics. Use them to monitor resource usage over time and understand how it correlates to performance.

By default, Droplet graphs show public and private bandwidth usage, CPU usage, and disk I/O. By installing the [DigitalOcean metrics agent](/products/monitoring/how-to/install-metrics-agent/), you also gain access to load averages (1-, 5-, and 15-minute), memory usage, and disk usage.

## Alert Policies[](#alert-policies)

[Alert policies](/products/monitoring/how-to/manage-alerts/) let you define thresholds for resource usage. When usage exceeds these thresholds, notifications are sent through email or [Slack](https://slack.com/).

You can set alerts for total CPU usage, incoming and outgoing bandwidth, disk read and write operations, memory usage, and disk usage.

In this article...

*   [GPU Observability](#gpu-observability)
*   [Droplet Graphs](#droplet-graphs)
*   [Alert Policies](#alert-policies)

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

Try using different keywords or simplifying your search t