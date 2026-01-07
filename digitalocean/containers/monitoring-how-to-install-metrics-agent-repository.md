---
source: https://docs.digitalocean.com/products/monitoring/how-to/install-metrics-agent-repository/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/monitoring/how-to/install-metrics-agent-repository/
domain: docs.digitalocean.com
---
                How to Install the DigitalOcean Metrics Agent Using the Metrics Agent Repository | DigitalOcean Documentation

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
*   Install the Metrics Agent via Metrics Agent Repository

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Install the DigitalOcean Metrics Agent Using the Metrics Agent Repository

Validated on 4 Nov 2025 • Last edited on 4 Nov 2025

DigitalOcean Monitoring is a free, opt-in service that lets you track Droplet resource usage in real time, visualize performance metrics, and receive alerts via email or Slack to proactively manage your infrastructure’s health.

The DigitalOcean metrics agent is an open-source Go utility that collects system-level metrics and forwards them to DigitalOcean. It enables extended Droplet monitoring features, including usage graphs, alerting, and custom metrics.

Note

**Data Collection Disclosure:** The DigitalOcean metrics agent collects and sends system telemetry data for the purpose of performance monitoring and alerting. No Customer Content is collected or transmitted. Historical data remains in our database for 90 days after uninstalling the agent, after which it is automatically deleted.

For GPU Droplets created via the control panel using our AI/ML Ready image, the metrics agent option is selected by default. To uninstall the metrics agent, read [How to Uninstall the DigitalOcean Metrics Agent](/products/monitoring/how-to/uninstall-metrics-agent/).

You can install the metrics agent by manually configuring the DigitalOcean package repository instead of using the [automated installation script](/products/monitoring/how-to/install-metrics-agent/). Use this option for more control over your system’s package sources or to audit and manage repository configuration directly.

## Check Which Operating System Your Droplet Uses[](#check-which-operating-system-your-droplet-uses)

The package manager used to install the metrics agent repository depends on your operating system. For example, Ubuntu and Debian use `apt`, while CentOS and Fedora use `yum`. Each package manager requires its own repository format and configuration process.

To check which operating system your Droplet is running, use the following command:

    cat /etc/os-release

For example, if your Droplet is uses Ubuntu, you should see output similar to this:

    NAME="Ubuntu"
    VERSION="22.04.4 LTS (Jammy Jellyfish)"
    ID=ubuntu
    ID_LIKE=debian
    PRETTY_NAME="Ubuntu 22.04.4 LTS"
    VERSION_ID="22.04"

## Install Metrics Agent Repository[](#install-metrics-agent-repository)

Installing the DigitalOcean metrics agent repository depends on your operating system. After you [check which operating system your Droplet uses](#check-which-operating-system-your-droplet-uses), follow the steps for your system to add the repository, verify the GPG key, and install the `do-agent` package.

 Ubuntu and Debian

To add the metrics agent repository, open a new file using a text editor of your choice (for example, `nano`) to define the DigitalOcean repository source:

    sudo nano /etc/apt/sources.list.d/digitalocean-agent.list

This command opens a blank file in the `nano` editor. Then, add the following line to the file.

    deb https://repos.insights.digitalocean.com/apt/do-agent/ main main

This line adds the DigitalOcean APT repository to your package sources so your system can locate the `do-agent` package.

Afterwards, save the changes and exit the file.

After creating the configuration file, download and add the DigitalOcean GPG key for the DigitalOcean repository. This verifies the authenticity of the packages you install:

    curl https://repos.insights.digitalocean.com/sonar-agent.asc | sudo apt-key add -

The command returns output confirming the key was added:

    | sudo apt-key add -
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100  1688  100  1688    0     0  34163      0 --:--:-- --:--:-- --:--:-- 34448
    Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
    OK

To confirm that the GPG key is present, run the following command to see if your key is listed:

    sudo apt-key list | grep -i digitalocean

If you see similar output like below, then the GPG key is present in your Droplet:

    uid           [ unknown] DigitalOcean Insights Engineering <[email protected]>

Restart your system’s package list so that it includes the DigitalOcean repository and its available packages:

    sudo apt-get update

You should see output confirming a successful connection to the repositories. If you see warnings about duplicate entries, it means the same repository is listed more than once. These warnings are safe to ignore as long as your `.list` file contains the correct, non-duplicated entry, which you confirmed earlier.

    Hit:1 http://mirrors.digitalocean.com/ubuntu oracular InRelease
    Hit:2 http://mirrors.digitalocean.com/ubuntu oracular-updates InRelease          
    Hit:3 https://repos.insights.digitalocean.com/apt/do-agent main InRelease  
    ...
    Reading package lists... Done
    W: Target Packages (main/binary-amd64/Packages) is configured multiple times ... 
    ...

Lastly, install the metrics agent by installing the `do-agent` package from the DigitalOcean repository using your system’s package manager:

    sudo apt-get install do-agent

The command returns output confirming the agent was successfully downloaded, installed, and enabled to start automatically using `systemd` like below:

    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following NEW packages will be installed:
      do-agent
    ...
    Selecting previously unselected package do-agent.
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

 CentOS and Fedora

To create the repository configuration file, open a new `.repo` file using a text editor of your choice (for example, `nano`) where you define the DigitalOcean package repository:

    sudo nano /etc/yum.repos.d/digitalocean-agent.repo

This command creates and opens a blank file in the `nano` editor. Add the following contents to define the repository configuration, like this:

    [sonar]
    name=do agent
    baseurl=https://repos.insights.digitalocean.com/yum/do-agent/$basearch
    failovermethod=priority
    enabled=1
    gpgcheck=1
    gpgkey=https://repos.insights.digitalocean.com/sonar-agent.asc

This configuration block defines the DigitalOcean repository:

*   `baseurl`: where your system fetches the package
*   `gpgcheck=1`: ensures that package signatures is verified
*   `gpgkey`: location of the key used for verification

After pasting the contents of the config file, save and exit the file.

Then, download and add the DigitalOcean GPG key to ensure that the install package is trusted and not tampered with:

    sudo rpm --import https://repos.insights.digitalocean.com/sonar-agent.asc

This command does not produce any output if successful. To confirm the key was added, run the following command, which lists all installed GPG keys and filters for one associated with DigitalOcean, like this:

    rpm -qa gpg-pubkey --qf "%{NAME}-%{VERSION}-%{RELEASE}\n" | xargs -I{} rpm -qi {} | grep -i digitalocean

If the key was added successfully, the command outputs a confirmation that the DigitalOcean GPG key is present and trusted by your system:

    Summary     : DigitalOcean Agent Signing Key

Lastly, install the metrics agent via the `do-agent` package from the DigitalOcean repository using your system’s package manager:

    sudo yum install do-agent

You should see output showing the system is ready to install the `do-agent` package, listing its size and origin. When prompted with `Is this ok [y/N]:`, type `y`, and then press `ENTER` to confirm you want to proceed with the installation.

    Updating and loading repositories:
     do agent                                                        100% | 105.7 KiB/s |   7.8 KiB |  00m00s
    Repositories loaded.
    Package                           Arch      Version                           Repository             Size
    Installing:
     do-agent                         x86_64    3.17.1-1                          sonar              12.5 MiB
    
    Transaction Summary:
     Installing:         1 package
    
    Total size of inbound packages is 5 MiB. Need to download 5 MiB.
    After this operation, 13 MiB extra will be used (install 13 MiB, remove 0 B).
    Is this ok [y/N]: 

After you confirm the installation, the system completes the remaining steps. The output shows the agent being installed and prepared to run:

    [1/1] do-agent-0:3.17.1-1.x86_64                                 100% |  44.6 MiB/s |   4.8 MiB |  00m00s
    ...
    [3/3] Installing do-agent-0:3.17.1-1.x86_64                      100% |   2.3 MiB/s |  12.5 MiB |  00m05s
    Complete!

After installing the metrics agent, [verify that it is active and running](/products/monitoring/how-to/install-metrics-agent/#install-verify).

In the [DigitalOcean Control Panel](https://cloud.digitalocean.com), go to your Droplet’s **Graphs** tab to view its metrics. Data appears a few minutes after the metrics agent is activated and begins reporting.

In this article...

*   [Check Which Operating System Your Droplet Uses](#check-which-operating-system-your-droplet-uses)
*   [Install Metrics Agent Repository](#install-metrics-agent-repository)

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

Try using different keywords or simplifying 