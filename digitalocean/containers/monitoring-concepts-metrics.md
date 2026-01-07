---
source: https://docs.digitalocean.com/products/monitoring/concepts/metrics/
scraped: 2025-01-07
tags: [digitalocean, containers, registry, functions, monitoring, api-docs]
---

tool: bright-data-skill
source_url: https://docs.digitalocean.com/products/monitoring/concepts/metrics/
domain: docs.digitalocean.com
---
                Monitoring Metrics | DigitalOcean Documentation

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

*   [Concepts](/products/monitoring/concepts/) 
*   Metrics

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Monitoring Metrics

Validated on 3 Nov 2025 • Last edited on 10 Nov 2025

DigitalOcean Monitoring is a free, opt-in service that lets you track Droplet resource usage in real time, visualize performance metrics, and receive alerts via email or Slack to proactively manage your infrastructure’s health.

DigitalOcean Monitoring tracks your Droplet’s resource usage over time, including CPU, memory, disk I/O, and GPU metrics for utilization, throttling, power, and ECC errors. This helps you understand performance trends and troubleshoot potential issues. You can view these metrics in real time or analyze historical data to identify patterns, spot bottlenecks, and improve overall reliability.

Monitoring works by [installing the metrics agent on your Droplet](/products/monitoring/how-to/install-metrics-agent/#install). Once installed, the agent collects system metrics and sends them to the DigitalOcean Control Panel, where you can view the data in charts and [set up alerts based on custom thresholds](/products/monitoring/how-to/manage-alerts/#create-control).

Note

GPU metrics are available only for AI/ML Ready Images on NVIDIA and AMD GPU Droplets and Kubernetes clusters (DOKS). Basic images do not include GPU monitoring by default.

## GPU Occupancy[](#gpu-occupancy)

GPU occupancy measures how busy the GPU’s compute units are over time, expressed as a percentage (%). It shows how efficiently your workload uses the GPU’s parallel processing cores.

A sustained GPU Occupancy (%) of 100% means your workload is fully using the GPU’s compute resources. Brief spikes are normal during burst activity and don’t necessarily indicate an issue.

Note

GPU Occupancy (%) measures compute unit activity, while GPU Utilization (%) in tools like `nvidia-smi` measures total active time.

## Tensor Utilization[](#tensor-utilization)

Tensor utilization measures how frequently the GPU’s tensor cores are active, expressed as a percentage (%). Tensor cores handle specialized matrix and AI/ML computations, making this metric especially useful for monitoring deep learning workloads.

Higher Tensor Utilization (%) means your workload is taking advantage of tensor core acceleration. If the value stays consistently low during ML or inference tasks, your model may not be optimized to use tensor operations efficiently.

## GPU Memory Utilization[](#gpu-memory-utilization)

GPU memory utilization measures how much of the GPU’s total memory (VRAM) is currently in use, expressed as a percentage (%). It helps you track memory pressure and determine whether your workload fits within available GPU memory.

![GPU Memory Utilization graph](https://docs.digitalocean.com/screenshots/monitoring/gpu-memory-utilization-graph.caebf39b4fbd4671fb00ec9c39fe001714fa71e4dee1426684ca177b041c29ab.png)

A high GPU Memory Utilization (%) indicates that most of the GPU’s memory is in use. If the value approaches 100%, the GPU may run out of memory, causing errors or reduced performance. Consider using smaller batch sizes or models if you see frequent out-of-memory errors.

## GPU Core Temperature[](#gpu-core-temperature)

GPU core temperature measures the heat level of the GPU’s main processing die, expressed in degrees Celsius (°C). It helps you detect overheating that can lead to throttling or reduced performance.

![GPU Core Temperature graph](https://docs.digitalocean.com/screenshots/monitoring/gpu-core-temperature-graph.37287fb978840283d320e5c076c3eb3e4d9f76e6fbc07d9ac18ebb76f7d0b04c.png)

A stable core temperature within your GPU’s rated range indicates normal operation. Consistently high temperatures may lead to performance throttling, which can decrease workload efficiency.

## GPU Memory Temperature[](#gpu-memory-temperature)

GPU memory temperature measures the heat of the GPU’s onboard memory modules (VRAM), expressed in degrees Celsius (°C). Monitoring memory temperature helps detect potential heat buildup that could affect memory reliability and overall performance.

![GPU Memory Temperature graph](https://docs.digitalocean.com/screenshots/monitoring/gpu-memory-temperature-graph.902de1d977719c8cb67ac2794dc9e7d6158ba22b5c8da0db8974dc9c3f4ff5c4.png)

Sustained high memory temperatures can cause throttling or reduced throughput in memory-intensive workloads. Consistently elevated temperatures may decrease performance efficiency.

## GPU Power Usage[](#gpu-power-usage)

GPU power usage measures the GPU’s current power draw in watts (W). It helps you understand how much electrical power your workload consumes and whether the GPU is operating near its designed power limits.

![GPU Power Usage graph](https://docs.digitalocean.com/screenshots/monitoring/gpu-power-usage-graph.24b33f956e586b6dc4f4f953752cf28b1529119eb7fd338c103e568648ac7c6e.png)

Power usage fluctuates based on workload intensity. A steady increase in power draw typically indicates sustained GPU activity, while sudden drops or spikes may suggest throttling, idle periods, or transitions between GPU tasks.

Monitoring this metric alongside temperature and throttling data helps identify whether performance limits are due to power or thermal constraints.

## PCIe Throughput[](#pcie-throughput)

PCIe throughput measures the data transfer rate between the GPU and the host system over the PCI Express (PCIe) bus, expressed in gigabits per second (Gbps). It helps you understand how much data moves between the GPU and CPU during workload execution.

![GPU PCIe Throughput graph](https://docs.digitalocean.com/screenshots/monitoring/gpu-pcie-throughput-graph.816f2fd6f89128ee73b9079389e8d3cb632c9caeb260602aa4b1f0934bd89079.png)

Higher PCIe throughput typically indicates frequent data movement between the GPU and CPU, such as when loading models, transferring tensors, or exchanging intermediate results. If throughput remains consistently high, consider optimizing data transfer or increasing batch sizes to reduce PCIe overhead.

## NVLink / XGMI Throughput[](#nvlink--xgmi-throughput)

NVLink (for NVIDIA GPUs) and XGMI (for AMD GPUs) throughput measure peer-to-peer data transfer between multiple GPUs, expressed in gigabits per second (Gbps). This metric shows how efficiently GPUs exchange data in multi-GPU configurations.

![GPU Interconnect Throughput graph](https://docs.digitalocean.com/screenshots/monitoring/gpu-interconnect-throughput-graph.0e94466cf78cfd9dd52055ddb82314138ca1f57505743b6f29a73b91d76b6c8b.png)

Consistently high NVLink or XGMI throughput indicates strong communication between GPUs, such as during distributed training or large-scale parallel computations. If these values drop unexpectedly, check for workload imbalance or driver configuration issues that could limit multi-GPU performance.

## Power Throttling[](#power-throttling)

Power throttling measures the amount of time the GPU spends reducing performance to stay within its power limits, expressed as a percentage (%). This metric helps you identify when workloads push the GPU beyond its configured power envelope.

![GPU Power Throttling graph](https://docs.digitalocean.com/screenshots/monitoring/gpu-power-throttling-graph.466079b81746820a910ab1967b0bb9fd42878d189f948ac75dcd3f5f1ec1b587.png)

Short bursts of power throttling are normal under heavy load, but sustained or frequent power limit violations may indicate that the GPU is operating near its maximum design power. If this metric increases over time, review your workload’s power draw and consider reducing GPU utilization or enabling power management options.

## Thermal Throttling[](#thermal-throttling)

Thermal throttling measures the amount of time the GPU reduces performance to prevent overheating, expressed as a percentage (%). This metric helps detect temperature-related throttling that may affect sustained GPU performance.

![GPU Thermal Throttling graph](https://docs.digitalocean.com/screenshots/monitoring/gpu-power-usage-graph.24b33f956e586b6dc4f4f953752cf28b1529119eb7fd338c103e568648ac7c6e.png)

Brief thermal throttling may occur during intensive workloads, but consistent or long-duration throttling indicates that the GPU is overheating. Review your workload intensity if thermal throttling durations rise over time.

## GPU ECC Error Count[](#gpu-ecc-error-count)

GPU ECC error count measures the number of double-bit memory errors detected by the GPU’s error-correcting code (ECC) system. It helps you identify potential memory instability or data integrity issues that may affect workload reliability.

![GPU Uncorrectable ECC Errors graph](https://docs.digitalocean.com/screenshots/monitoring/gpu-uncorrectable-ecc-errors-graph.515a4f38c78491a2513e3fa20109d39ca9003f8eea0e643b333047c6ee377449.png)

A small number of ECC errors can occur naturally over time, especially under sustained or memory-intensive workloads. However, frequent or recurring ECC errors may indicate hardware degradation, excessive heat, or unstable power delivery.

If the count continues to increase, consider monitoring temperature trends, checking power stability, or replacing the GPU to prevent data corruption.

## Load Average[](#load-average)

Load average shows how many processes use or wait to use the CPU over time, but it does not consider how many vCPUs a Droplet has. For example, a load average of two on a single vCPU Droplet means one process uses the CPU and another waits, which shows the Droplet is over capacity. On a Droplet with four vCPUs, the same load means the system uses only half of its available CPU power.

The metrics agent reports 1, 5, and 15 minute load averages using data from `/proc/loadavg`, which tracks the number of processes that are either running or waiting for CPU time during those intervals.

![Load averages graph](https://docs.digitalocean.com/screenshots/monitoring/load-averages-graph.67ac422228765aa1977568b25c7ab0fa12b44f2b4e0c255b9e824d007fad65e5.png)

We recommend comparing the load average to the number of vCPUs to understand how efficiently your Droplet uses its CPU resources. If the load average is higher than the vCPU count for an extended period, the Droplet may not have enough resources for the workload. To monitor this, use the 15 minute load average metric to see if your Droplet consistently exceeds the number of vCPUs. Brief spikes in the one and five minute averages usually reflect short-term activity and aren’t a concern.

## Memory Utilization[](#memory-utilization)

Memory utilization shows the percentage of physical memory in use. We calculate this using data from `/proc/meminfo`, which provides detailed information about total, free, and cached memory available on the system.

![Memory utilization graph](https://docs.digitalocean.com/screenshots/monitoring/memory-utilization-graph.a86ccc4b76972158612d2e34edb98db4cd5a8b5fe382d5e169d2b24b79c2bcdb.png)

We calculate used memory by subtracting both free and cached memory from the total. This is because Linux uses unused memory for disk caching to improve performance, but frees that memory when it’s needed by processes. Since cached memory is effectively available, we don’t count it as used. As a result, tools like `htop` and `top` may show higher usage because they include cached memory in their used memory calculations.

## CPU Utilization[](#cpu-utilization)

CPU utilization measures the percentage of total processing power the Droplet is using. Alert policies track total CPU usage without distinguishing between the system time (kernel-level instructions) and user time (everything outside the kernel).

![CPU utilization graph](https://docs.digitalocean.com/screenshots/monitoring/cpu-utilization-graph.81076b7e943213819bdba43b849637f659884757bb2ed05e6ea0423ee7b9b9cd.png)

We represent total usage across all CPUs as 100%. However, some tools report 100% per CPU core, so a system with two cores may show 200%, and a system with four cores may show 400%.

## Disk Utilization[](#disk-utilization)

Disk utilization shows the percentage of total disk space in use. This includes the Droplet’s root storage and any attached block storage devices. We combine all storage into a single value that reflects total usage.

![Disk utilization graph](https://docs.digitalocean.com/screenshots/monitoring/disk-utilization-graph.ecaaea85ab760ed03a2aeffdbaf90578b020ce50f4fcb3297c2be78d57e2a9a1.png)

Alert policies also use this combined total when monitoring disk space.

## Disk I/O[](#disk-io)

Disk I/O measures how much data the Droplet reads from and writes to its disks. High disk I/O can signal performance issues caused by intensive read or write operations.

![Disk I/O graph](https://docs.digitalocean.com/screenshots/monitoring/disk-io-graph.6e081c4104b60d7e1ed4cc201ab1da677fdb9000816a9f6911a6f5e37fb8ae78.png)

You can set alert policies to monitor read activity and get notified if usage exceeds your thresholds. You can also create alert policies to monitor write activity and detect potential spikes or bottlenecks.

## Bandwidth[](#bandwidth)

Bandwidth measures the amount of incoming and outgoing network traffic on a Droplet. High usage may indicate heavy network activity or unusual traffic patterns.

These graphs split bandwidth into public and private traffic. Public bandwidth measures traffic sent and received through the Droplet’s public network interface, while private bandwidth tracks traffic between your Droplets in the same datacenter. Each graph includes separate lines for inbound and outbound traffic.

![Bandwidth graph](https://docs.digitalocean.com/screenshots/monitoring/bandwidth-graph.38ee4be64e04966b4d64bd39ccf7d8903915119b8a1267358a2e40cd249bde3b.png)

In this article...

*   [GPU Occupancy](#gpu-occupancy)
*   [Tensor Utilization](#tensor-utilization)
*   [GPU Memory Utilization](#gpu-memory-utilization)
*   [GPU Core Temperature](#gpu-core-temperature)
*   [GPU Memory Temperature](#gpu-memory-temperature)
*   [GPU Power Usage](#gpu-power-usage)
*   [PCIe Throughput](#pcie-throughput)
*   [NVLink / XGMI Throughput](#nvlink--xgmi-throughput)
*   [Power Throttling](#power-throttling)
*   [Thermal Throttling](#thermal-throttling)
*   [GPU ECC Error Count](#gpu-ecc-error-count)
*   [Load Average](#load-average)
*   [Memory Utilization](#memory-utilization)
*   [CPU Utilization](#cpu-utilization)
*   [Disk Utilization](#disk-utilization)
*   [Disk I/O](#disk-io)
*   [Bandwidth](#bandwidth)

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

Try using differe