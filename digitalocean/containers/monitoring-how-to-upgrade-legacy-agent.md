---
source: https://docs.digitalocean.com/products/monitoring/how-to/upgrade-legacy-agent/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/monitoring/how-to/upgrade-legacy-agent/
domain: docs.digitalocean.com
---
                How to Upgrade Your Legacy Metrics Agent | DigitalOcean Documentation

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
*   Upgrade Your Legacy Agent

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Upgrade Your Legacy Metrics Agent

Validated on 3 Jul 2025 • Last edited on 14 Jul 2025

DigitalOcean Monitoring is a free, opt-in service that lets you track Droplet resource usage in real time, visualize performance metrics, and receive alerts via email or Slack to proactively manage your infrastructure’s health.

As of 8 April 2019, all new metrics agent installations use our [Prometheus-based metrics agent](https://github.com/digitalocean/do-agent). This new agent is a lightweight, Prometheus-compatible monitoring agent that collects Droplet-level system metrics and reports them under the **DigitalOcean Monitoring** section.

As of 8 July 2019, we deprecated the legacy metrics agent. It was the monitoring agent used before we adopted the Prometheus-based agent. The legacy agent doesn’t support our newer metrics and also uses more system resources. Droplets still using this agent no longer show extended metrics in the DigitalOcean Control Panel or API.

Upgrading to the Prometheus-based agent ensures that you continue to receive extended metrics such as disk I/O, bandwidth, and CPU utilization. The newer agent also offers improved stability, lower resource usage, and compatibility with current monitoring features.

If you do not upgrade your metrics agent, your Droplet stops receiving extended metrics. This reduces visibility into resource usage and may interfere with your alerting and monitoring setup.

## Check If Your Using the Legacy Agent[](#check-if-your-using-the-legacy-agent)

Before upgrading your metrics agent, check if your Droplet is still using the legacy agent by running the following command:

    ps aux | grep do-agent

If the output includes `/opt/digitalocean/bin/do-agent`, you’re using the Prometheus-based agent. If it shows `/usr/bin/droplet-agent`, another path without Prometheus references, or returns no output, you’re likely using the legacy agent and need to [upgrade your agent](#upgrade), or the agent is not running.

Alternatively, you can run the following command to check the installed agent version:

    /opt/digitalocean/bin/do-agent --version

If this command fails or returns a version number below 3.x, you’re likely using the legacy agent and should [upgrade your agent](#upgrade).

## Upgrade Your Legacy Metrics Agent to the New Agent[](#upgrade)

To upgrade your legacy metrics agent to our [Prometheus-based metrics agent](https://github.com/digitalocean/do-agent), [uninstall the legacy metrics agent](/products/monitoring/how-to/uninstall-metrics-agent/). After removing the legacy metrics agent, install the Prometheus-based metrics agent by [downloading the installation script, inspecting it, and running it manually](/products/monitoring/how-to/install-metrics-agent/#download-inspect-run).

If you want to upgrade multiple Droplets at once, use the [`upgrade-droplets.sh` script provided in the `do-agent` GitHub repository](https://github.com/digitalocean/do-agent/blob/master/scripts/upgrade-droplets.sh). You need an [SSH key](/products/droplets/how-to/add-ssh-keys/) and a [DigitalOcean API token](/reference/api/create-personal-access-token/). Alternatively, an [Ansible-based batch upgrade](https://galaxy.ansible.com/andrewsomething/do-agent) is available on Ansible Galaxy.

After upgrading the legacy agent, [verify if the installation was successful](/products/monitoring/how-to/install-metrics-agent/#install-verify). If upgrading your metrics agent fails these checks, see the [do-agent GitHub issues page](https://github.com/digitalocean/do-agent/issues) for community-reported solutions or [open a support ticket](https://cloudsupport.digitalocean.com).

In this article...

*   [Check If Your Using the Legacy Agent](#check-if-your-using-the-legacy-agent)
*   [Upgrade Your Legacy Metrics Agent to the New Agent](#upgrade)

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

Try using different keywords or simplifying your 