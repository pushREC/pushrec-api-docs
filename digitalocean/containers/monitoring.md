---
source: https://docs.digitalocean.com/products/monitoring/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/monitoring/
domain: docs.digitalocean.com
---
                Monitoring | DigitalOcean Documentation

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

*   Monitoring

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Monitoring

Generated on 6 Jan 2026

DigitalOcean Monitoring is a free, opt-in service that lets you track Droplet resource usage in real time, visualize performance metrics, and receive alerts via email or Slack to proactively manage your infrastructure’s health.

Most Viewed Monitoring Articles

1.  [How to Install the DigitalOcean Metrics Agent](/products/monitoring/how-to/install-metrics-agent/ "Install the DigitalOcean metrics agent to enable extended Droplet monitoring.")
2.  [Monitoring Metrics](/products/monitoring/concepts/metrics/ "Understand the key metrics (CPU, memory, disk, and bandwidth) used by Monitoring to track your Droplet's performance and overall health.")
3.  [How to Create, Edit, and Delete Resource Alerts](/products/monitoring/how-to/manage-alerts/ "Create, edit, view, and delete resource alerts to monitor your Droplets and receive notifications when key metrics exceed or fall below thresholds you define.")
4.  [Monitoring Quickstart](/products/monitoring/getting-started/quickstart/ "Just the essentials to go from zero to working in a few minutes.")
5.  [How can I allowlist the DigitalOcean metrics agent with my firewall?](/support/how-can-i-allowlist-the-digitalocean-metrics-agent-with-my-firewall/ "Configure your firewall to allow outgoing traffic through ports 80 and 443.")
6.  [How Do I Disable Process Name Collection in My Metrics Agent?](/support/how-do-i-disable-process-name-collection-in-my-metrics-agent/ "Modify your metrics agent's configuration on `systemctl` or `initctl` systems to disable process name collection.")
7.  [Monitoring Concepts](/products/monitoring/concepts/ "Explanations and definitions of core concepts in Monitoring.")
8.  [How to Uninstall the DigitalOcean Metrics Agent](/products/monitoring/how-to/uninstall-metrics-agent/ "Uninstall the DigitalOcean metrics agent from your Droplet to stop monitoring and remove related system resources.")
9.  [Monitoring Pricing](/products/monitoring/details/pricing/ "DigitalOcean Monitoring is provided at no additional cost.")
10.  [Monitoring Availability](/products/monitoring/details/availability/ "Regional datacenter availability for DigitalOcean Monitoring.")

[](/products/monitoring/getting-started/)

![](https://docs.digitalocean.com/images/icons/monitoring.svg)

Getting Started

Quickstarts and intermediate tutorials to get started.

[](/products/monitoring/how-to/)

![](https://docs.digitalocean.com/images/icons/monitoring.svg)

How-Tos

How to accomplish specific tasks in detail, like creation/deletion, configuration, and management.

[](/products/monitoring/reference/)

![](https://docs.digitalocean.com/images/icons/monitoring.svg)

Reference

Native and third-party tools, troubleshooting, and answers to frequently asked questions.

[](/products/monitoring/concepts/)

![](https://docs.digitalocean.com/images/icons/monitoring.svg)

Concepts

Explanations and definitions of core concepts in Monitoring.

[](/products/monitoring/details/)

![](https://docs.digitalocean.com/images/icons/monitoring.svg)

Details

Features, plans and pricing, availability, limits, known issues, and more.

[](/products/monitoring/support/)

![](https://docs.digitalocean.com/images/icons/monitoring.svg)

Support

Get help with technical support and answers to frequently asked questions.

## Latest Updates[](#latest-updates)

### 3 November 2025[](#3-november-2025)

*   DigitalOcean Insights now supports [GPU-level observability for AMD and NVIDIA GPU Droplets](/products/monitoring/details/features/#gpu-observability) and for GPU-enabled [Kubernetes clusters (DOKS)](/products/kubernetes/how-to/monitor-basic/) running DOKS 1.33.1-do.5 or higher.
    

### 20 August 2021[](#20-august-2021)

*   Released [v1.64.0 of doctl](https://github.com/digitalocean/doctl/releases/tag/v1.64.0), the official DigitalOcean CLI. This release includes support for managing App Platform alerts.
    

### 9 August 2021[](#9-august-2021)

*   Released [v1.63.0 of doctl](https://github.com/digitalocean/doctl/releases/tag/v1.63.0), the official DigitalOcean CLI. This release includes a number of new features:
    
    *   The `database firewall` sub-commands now support apps as trusted sources
    *   New `monitoring alert` sub-commands for creating and managing alert policies
    *   The `--droplet-agent` flag was added to the `compute droplet create` sub-command to optionally disable installing the agent for the Droplet web console
    

For more information, see [all Monitoring release notes](https://docs.digitalocean.com/release-notes/monitoring/).

In this article...

[Monitoring](https://docs.digitalocean.com/products/monitoring/)

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

Try using different keywords or simplifying your search ter