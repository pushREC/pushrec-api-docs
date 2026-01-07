---
source: https://docs.digitalocean.com/products/monitoring/how-to/install-metrics-agent/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/monitoring/how-to/install-metrics-agent/
domain: docs.digitalocean.com
---
                How to Install the DigitalOcean Metrics Agent | DigitalOcean Documentation

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
*   Install the Metrics Agent

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Install the DigitalOcean Metrics Agent

Validated on 4 Nov 2025 • Last edited on 4 Nov 2025

DigitalOcean Monitoring is a free, opt-in service that lets you track Droplet resource usage in real time, visualize performance metrics, and receive alerts via email or Slack to proactively manage your infrastructure’s health.

The DigitalOcean metrics agent is an open-source Go utility that collects system-level metrics and forwards them to DigitalOcean. It enables extended Droplet monitoring features, including usage graphs, alerting, and custom metrics.

Note

**Data Collection Disclosure:** The DigitalOcean metrics agent collects and sends system telemetry data for the purpose of performance monitoring and alerting. No Customer Content is collected or transmitted. Historical data remains in our database for 90 days after uninstalling the agent, after which it is automatically deleted.

For GPU Droplets created via the control panel using our **AI/ML Ready** image, the metrics agent option is selected by default. To uninstall the metrics agent, read [How to Uninstall the DigitalOcean Metrics Agent](/products/monitoring/how-to/uninstall-metrics-agent/).

The metrics agent is supported on Ubuntu 14.04 or later, CentOS 6 or later, Debian 8 or later, and Fedora 27 or later. You can install it during [Droplet creation](#install-during-creation), [manually afterward using a script](#install), [by configuring repositories directly](/products/monitoring/how-to/install-metrics-agent-repository/), or [run it as a Docker container](https://github.com/digitalocean/do-agent#run-as-a-docker-container). To stop using the agent, you can [uninstall it at any time](/products/monitoring/how-to/uninstall-metrics-agent/).

The metrics agent runs as an unprivileged user and only has access to the following directories:

*   **`/proc`**: collects system state data
*   **`/var/opt`**: stores authentication information
*   **`/opt/digitalocean`**: stores the agent binary

The agent reports process names to help guide product development but does not report environment variables or process arguments. You can [opt out of process name collection](/support/how-do-i-disable-process-name-collection-in-my-metrics-agent/), if needed.

The agent uses only outbound network connections on ports:

*   **80**, which contacts the DigitalOcean metadata service to obtain an authentication token.
*   **443**, which sends encrypted metrics data to the backend.

The agent uses only outbound connections and does not open any ports, so it does not interfere with existing services or workloads.

## Enable the Metrics Agent During Droplet Creation[](#install-during-creation)

You can enable monitoring when you [create a Droplet](/products/droplets/how-to/create/#recommended-and-advanced-options) under the **We recommend these options** section, by clicking **Enable Monitoring**.

Alternatively, you can enable monitoring via the DigitalOcean API or CLI by:

*   Setting the `monitoring` parameter to `true` when [creating a Droplet via API](/products/droplets/how-to/create/#create-a-droplet-using-the-api), or
*   Adding the `--enable-monitoring` flag when [creating a Droplet using the CLI](/products/droplets/how-to/create/#create-a-droplet-using-the-cli).

## Install the Metrics Agent Manually Using the Script[](#install)

The installation script detects your operating system, configures the correct DigitalOcean package repository, installs the `do-agent` package using your system’s package manager, and enables the service.

To begin installing the metrics agent, go to the [**DigitalOcean Control Panel Droplet** page](https://cloud.digitalocean.com/droplets) and find the Droplet where you want to install the metrics agent for.

Afterwards, beside the Droplet, click its **More** menu, and then click **Access Console** to open the Droplet’s **Access** page. On the **Access** page, under the **Droplet Console** section, log in as `root`, and then click **Launch Droplet Console** to open the Droplet’s **DigitalOcean Droplet Web Console**.

You can [run the script directly](#download-run) or [review it before executing](#download-inspect-run).

### Download and Run Script[](#download-run)

To install the agent in a single step, download the metrics agent installation script and run it immediately:

    curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash

After you run the command, the script verifies compatibility, installs system dependencies, adds the appropriate package repositories, and installs the metrics agent. The script returns output similar to the following:

    Cleaning up old sources...OK
    Verifying machine compatibility...OK
    Verifying compatibility with script...OK
    Installing apt repository...
    ...
    Installing gpg key...Selecting previously unselected package do-agent.
    ...
    Preparing to unpack .../do-agent_3.17.1_amd64.deb ...
    Unpacking do-agent (3.17.1) ...
    Setting up do-agent (3.17.1) ...
    Detecting SELinux
    SELinux not enforced
    enable systemd service
    Created symlink '/etc/systemd/system/multi-user.target.wants/do-agent.service' → '/etc/systemd/system/do-agent.service'.
    ...

After you run the script, [verify the agent is running](#verify-install).

### Download, Inspect, and Run Script[](#download-inspect-run)

Alternatively, you can review the script before running it to audit the changes it makes to your system. This helps maintain transparency, especially in production environments or when internal security policies require script review.

To review the script before running it, save the script to `/tmp/install.sh`:

    curl -sSL https://repos.insights.digitalocean.com/install.sh -o /tmp/install.sh

This command produces no output. To confirm the file was downloaded successfully, check that it exists and has content using the following command:

    ls -lh /tmp/install.sh

If the download was successful, the command returns output similar to this, confirming that the file exists at `/tmp/install.sh`:

    -rw-r--r-- 1 root root 7.2K ... /tmp/install.sh

Then, run a `less` command to view the script contents:

    less /tmp/install.sh

After reviewing the script, type `q` to exit the viewer.

If you prefer not to use the installation script, you can [install the agent manually using the repository](/products/monitoring/how-to/install-metrics-agent-repository/).

After reviewing the script, run the script manually with administrative privileges, completing the installation:

    sudo bash /tmp/install.sh

The output confirms that the script verified compatibility, installed the `do-agent` package, and enabled the agent service to start on boot, like this:

    Cleaning up old sources...OK
    Verifying machine compatibility...OK
    Verifying compatibility with script...OK
    Installing apt repository...
    Installing gpg key...Selecting previously unselected package do-agent.
    (Reading database ... 76045 files and directories currently installed.)
    Preparing to unpack .../do-agent_3.17.1_amd64.deb ...
    Unpacking do-agent (3.17.1) ...
    Setting up do-agent (3.17.1) ...
    Detecting SELinux
    SELinux not enforced
    useradd: user 'do-agent' already exists
    enable systemd service
    Created symlink '/etc/systemd/system/multi-user.target.wants/do-agent.service' → '/etc/systemd/system/do-agent.service'.
    ...

After installation, [verify that the agent is running](#install-verify).

In the control panel, go to your Droplet’s **Graphs** tab to view metrics. The metrics data appears a few minutes after the agent starts and begins reporting data.

## Verify the Metrics Agent is Running[](#install-verify)

To check if the status of the `do-agent` systemd service is active, run:

    systemctl status do-agent

If your metrics agent is active, you see output confirming that the agent is installed, actively running, and set to start automatically on boot:

    ● do-agent.service - The DigitalOcean Monitoring Agent
         Loaded: loaded (/etc/systemd/system/do-agent.service; enabled; preset: enabl>
         Active: active (running) since Wed 2025-06-18 19:14:50 UTC; 35s ago
     Invocation: da1c6db71e3b46f7919b61a295db71c1
       Main PID: 4675 (do-agent)
          Tasks: 4 (limit: 4655)
         Memory: 3.7M (peak: 4.1M)
            CPU: 51ms
         CGroup: /system.slice/do-agent.service
                 └─4675 /opt/digitalocean/bin/do-agent --syslog

Next, check if the agent process is running directly by searching for any running processes with the name `do-agent`:

    ps aux | grep do-agent

If your metrics agent is running, you should see output that includes a line confirming the agent is running as a background process, like this:

    do-agent    4675  0.0  0.3 1237180 14712 ?       Ssl  19:14   0:00 /opt/digitalocean/bin/do-agent --syslog
    root        4733  0.0  0.0   7156  2144 pts/0    S+   19:15   0:00 grep --color=auto do-agent

If the service is not running or these commands return no output, [contact DigitalOcean support](https://cloudsupport.digitalocean.com) for help troubleshooting the installation.

In this article...

*   [Enable the Metrics Agent During Droplet Creation](#install-during-creation)
*   [Install the Metrics Agent Manually Using the Script](#install)
    *   [Download and Run Script](#download-run)
    *   [Download, Inspect, and Run Script](#download-inspect-run)
*   [Verify the Metrics Agent is Running](#install-verify)

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

Try using different keywords or simplif