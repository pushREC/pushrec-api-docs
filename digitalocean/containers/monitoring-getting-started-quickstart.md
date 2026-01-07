---
source: https://docs.digitalocean.com/products/monitoring/getting-started/quickstart/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/monitoring/getting-started/quickstart/
domain: docs.digitalocean.com
---
                Monitoring Quickstart | DigitalOcean Documentation

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

*   [Getting Started](/products/monitoring/getting-started/) 
*   Quickstart

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Monitoring Quickstart

Validated on 3 Nov 2025 • Last edited on 10 Nov 2025

DigitalOcean Monitoring is a free, opt-in service that lets you track Droplet resource usage in real time, visualize performance metrics, and receive alerts via email or Slack to proactively manage your infrastructure’s health.

DigitalOcean Monitoring collects system-level data like CPU, memory, disk, and load averages using the open-source `do-agent` metrics agent, written in Go. The agent is not installed by default. You need to opt in during [Droplet creation](/products/droplets/how-to/create/#recommended-and-advanced-options) or [install it manually](#upgrade-the-metrics-agent).

We support Ubuntu 14.04 or later, CentOS 6 or later, Debian 8 or later, and Fedora 27 or later. Once installed, the agent enables enhanced graphs and lets you set up monitoring alerts. Once installed, the agent collects and sends metrics to the Monitoring service to help you track resource usage and troubleshoot performance issues.

After installation, we recommend you [set up resource alerts](#set-up-alerts) to stay ahead of issues and keep your infrastructure healthy.

Info

A separate Droplet agent maintained by the Droplet team is installed by default on all Droplets, but it is different from `do-agent` and does not collect metrics.

To use the metrics agent, first [create a Droplet](/products/droplets/how-to/create/). You can enable monitoring during Droplet creation, which installs the metrics agent automatically.

    If you create an **AI/ML Ready GPU Droplet**, selecting **Improved Metrics and Monitoring** also enables [GPU Observability](/products/monitoring/details/features/#gpu-observability), which extends **Monitoring** to include GPU metrics such as utilization, temperature, power, and throttling.
    

## Upgrade the Metrics Agent[](#upgrade-the-metrics-agent)

1.  Go to the [**DigitalOcean Control Panel Droplet** page](https://cloud.digitalocean.com/droplets) and find the Droplet where you want to upgrade or reinstall the metrics agent. Click the **More** menu beside the Droplet, then click **Access Console** to open the Droplet’s **Access** page.
    
2.  On the **Access** page, under the **Droplet Console** section, log in as `root`, then click **Launch Droplet Console** to open the Droplet’s **DigitalOcean Droplet Web Console**.
    
3.  In the console, run the following command to install or upgrade the metrics agent:
    
        curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash
    
    If the installation is successful, the command returns output confirming that the system is updated, dependencies like GnuPG and curl are upgraded, and the `do-agent` monitoring service is installed or upgraded without restarting containers, users, or VMs.
    
4.  After installation, run the following command to confirm the metrics agent is active:
    
        systemctl status do-agent
    
    If the agent is running successfully, the output looks like this:
    
        ● do-agent.service - The DigitalOcean Monitoring Agent
            Loaded: loaded (/etc/systemd/system/do-agent.service; enabled; preset: enabled)
            Active: active (running) since Thu 2025-04-17 17:07:44 UTC; 47s ago
        ...
    
    This confirms that the agent is installed, runs in the background, and starts automatically on boot.
    
5.  After installing and verifying the metrics agent, navigate to your Droplet’s page. In the **Graphs** section, you should see the graphs starting to populate with data.
    

We recommend [setting up resource alerts](#set-up-alerts) to get notified when your metrics agent detects unusual behavior on your Droplet.

## Set Up Alerts[](#set-up-alerts)

1.  Go to the [**DigitalOcean Monitoring Resource Alerts** page](https://cloud.digitalocean.com/monitors/resource-alerts), then on the **Resource Agents** page, click **Create Resource Agent** to open the **Create Resource Alert** page.
    
2.  In the **Select Metric & Set Threshold** section, choose the **Metric Type** you want to monitor.
    
    You can select either **1, 5, or 15 Minute Load Average**, **Memory Utilization Percent**, **Disk Utilization Percent**, **CPU Utilization Percent**, **Disk Read I/O**, **Disk Write I/O**, **Public Inbound Bandwidth**, **Private Inbound Bandwidth**, **Public Outbound Bandwidth**, or **Private Outbound Bandwidth**.
    
    For definitions of each metric, see our [metrics definitions](/products/monitoring/concepts/metrics/).
    
3.  Set the rule.
    
    You can choose **is above** or **is below** to define the alert condition. Use **is above** when high usage indicates a problem, like CPU usage exceeding a safe limit. Use **is below** when low values may signal issues, such as a drop in bandwidth.
    
4.  Set the threshold value that triggers the alert.
    
    For CPU, memory, or disk usage, we recommend starting with a threshold of 70%, as usage above that level may lead to degraded performance.
    
    For load averages, choose a number near or just above your Droplet’s vCPU count. For bandwidth and disk I/O metrics, select a value based on your Droplet’s typical usage patterns.
    
5.  Set the duration for how long the condition must persist before the alert triggers.
    
    You can choose between 5 minutes, 10 minutes, 30 minutes, or 1 hour. Use shorter durations for critical services where immediate response matter, and longer durations to avoid triggering alerts due to short-lived spikes.
    
6.  In the **Select Droplets or Tags** section, choose a specific Droplet, a tag, or **All Droplets** to apply the alert. Only Droplets that have the metrics agent installed are available for selection.
    
7.  In the **Select alert notification method** section, choose whether to receive alerts by verified email addresses or Slack channels. You can update this notification method at any time.
    
8.  In the **Finalize** section, name your resource alert or use the auto-generated name.
    
9.  When you’re ready, click **Create Resource Alert**.
    
10.  After you create your new alert, it appears on the **Monitoring** page under the **Resource Alerts** section.
    

## Uninstall Metrics Agent[](#uninstall-metrics-agent)

1.  Go to the [**DigitalOcean Control Panel Droplet** page](https://cloud.digitalocean.com/droplets) and find the Droplet you want to remove a metrics agent from, click the **More** menu beside the Droplet, then click **Access Console** to open the Droplet’s **Access** page.
    
2.  On the **Access** page, under the **Droplet Console** section, log in as `root`, then click **Launch Droplet Console** to open the Droplet’s **DigitalOcean Droplet Web Console**.
    
3.  In the console, run the following command to uninstall the metrics agent:
    
        sudo apt-get purge do-agent
    
    If the command runs successfully, it returns output like this:
    
        Reading package lists... Done
        Building dependency tree... Done
        Reading state information... Done
        The following packages will be REMOVED:
          do-agent*
        0 upgraded, 0 newly installed, 1 to remove and 132 not upgraded.
        After this operation, 13.1 MB disk space will be freed.
        Do you want to continue? [Y/n] 
    
    This confirms the system removes the metrics agent package and shows how much disk space it frees.
    
4.  Type `Y` to confirm the agent’s removal. This deletes its systemd and cron files, and purges its configuration.
    
    You may see warning messages like this:
    
        Failed to stop do-agent.service: Unit do-agent.service not loaded.
        Failed to disable unit: Unit do-agent.service does not exist
    
    These messages mean the agent was already stopped and its service file was already removed. The uninstallation still completes successfully.
    
5.  To confirm that the agent is fully removed, run the following command:
    
        systemctl status do-agent
    
    If the uninstallation succeeded, the output includes this message:
    
        Unit do-agent.service could not be found.
    
    This confirms that the service is no longer installed. If you still see the agent listed, [repeat the uninstallation steps](#uninstall-metrics-agent) or [contact support](https://cloudsupport.digitalocean.com).
    

In this article...

*   [Upgrade the Metrics Agent](#upgrade-the-metrics-agent)
*   [Set Up Alerts](#set-up-alerts)
*   [Uninstall Metrics Agent](#uninstall-metrics-agent)

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

Try using different keywords or simpl