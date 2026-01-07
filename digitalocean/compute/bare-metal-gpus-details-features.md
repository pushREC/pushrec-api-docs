---
source: https://docs.digitalocean.com/products/bare-metal-gpus/details/features/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
igitalOcean Gradient™ AI Bare Metal GPU Features | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/bare-metal-gpus.7498b79d7a8142afb95399794d7f631c490388aa4fb5b30d9021292dca01d125.svg)Bare Metal GPUs](/products/bare-metal-gpus/)
*   [How-Tos](/products/bare-metal-gpus/how-to/)
    *   [Create Bare Metal GPUs](/products/bare-metal-gpus/how-to/create/)
    *   [Mount NFS File Shares](/products/bare-metal-gpus/how-to/mount-nfs-file-shares/)
*   [Concepts](/products/bare-metal-gpus/concepts/)
    *   [Bare Metal GPUs vs GPU Droplets](/products/bare-metal-gpus/concepts/gpu-product-comparison/)
*   [Details](/products/bare-metal-gpus/details/)
    *   [Features](/products/bare-metal-gpus/details/features/)
    *   [Pricing](/products/bare-metal-gpus/details/pricing/)
    *   [Availability](/products/bare-metal-gpus/details/availability/)
    *   [Legal Agreements](https://www.digitalocean.com/legal/bare-metal-gpu-agreements)
    *   [Limits](/products/bare-metal-gpus/details/limits/)
*   [Support](/products/bare-metal-gpus/support/)
    *   [Contact Form](/products/bare-metal-gpus/support/contact/)

*   [Details](/products/bare-metal-gpus/details/) 
*   Features

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DigitalOcean Gradient™ AI Bare Metal GPU Features

Validated on 26 Jun 2025 • Last edited on 12 Dec 2025

DigitalOcean Gradient™ AI Bare Metal GPUs are dedicated, single-tenant servers with 8 GPUs of various models that can operate standalone or in multi-node clusters.

## Bare Metal GPUs vs GPU Droplets[](#bare-metal-gpus-vs-gpu-droplets)

Bare metal GPUs and [GPU Droplets](/products/droplets/how-to/gpu/) both provide compute resources for AI and ML workloads, but they serve different use cases.

[](/products/bare-metal-gpus/concepts/gpu-product-comparison/)

![](https://docs.digitalocean.com/images/icons/bare-metal-gpus.svg)

Bare Metal GPUs vs GPU Droplets

Learn the difference between bare metal GPUs and GPU Droplets to choose the product that suits your use case.

## Hardware[](#hardware)

Bare metal GPUs have the following hardware specifications.

### AMD MI300X GPUs[](#amd-mi300x-gpus)

Name

Description

Quantity

GPU module

AMD MI300X 8-GPU OAM 192GB 750W GPUs Assembly

8

CPU

Intel Xeon Platinum 8568Y+

2

Memory

64GB RDIMM, 5600 MT/s, Dual Rank

32

NVMe SSD storage

7.68 TB NVMe

8

Network card

Nvidia ConnectX-7 Single Port Infiniband/Ethernet VPI 400 GbE/NDR OSFP

8

Network card

Broadcom Thor 2x 100GE QSFP28

2

### H100 Bare Metal GPUs[](#h100-bare-metal-gpus)

Name

Description

Quantity

GPU module

NVIDIA HGX H100 80GB 700W SXM5 GPUs, fully interconnected with NVIDIA NVLink technology

8

CPU

Intel Xeon Platinum 8468

2

Memory

64GB

32

NVMe SSD storage

7TB 2.5-inch NVMe SSD drives

8

Network card

Mellanox Network Adapter; Mellanox Technologies MT2910 Family \[ConnectX-7\]; link speed 400 Gbps

8

Network card

Mellanox Technologies MT2892 Family \[ConnectX-6 Dx\] ; link speed 100 Gbps

4

### H200 Bare Metal GPUs[](#h200-bare-metal-gpus)

Name

Description

Quantity

GPU module

NVIDIA HGX H200 141GB 700W SXM5 GPUs, fully interconnected with NVIDIA NVLink technology

8

CPU

Intel Xeon Platinum 8592+

2

Memory

64GB DDR5-5600MHz

32

NVMe SSD storage

7.68TB NVMe

8

Network card

Mellanox Network Adapter; Mellanox Technologies MT2910 Family \[ConnectX-7\]; link speed 400 Gbps

8

Network card

Mellanox Technologies MT2892 Family \[ConnectX-6Dx\] ; link speed 100 Gbps

4

## Networking[](#networking)

Bare metal GPUs have the following network configuration:

Network

Details

Public network

1 public IP address (1:1 NAT)

Private network

1 private IP address, layer 2 isolation

Public network bandwidth

North/South internet access up to 40 Gbps

Private network bandwidth

East/West (VPC/private network) up to 400 Gbps

GPU networking

1 IPv6 auto-assigned for GPU RDMA (ConnectX-7 network)

GPU interconnect speed

3.2 Tbps

## Software[](#software)

Bare metal GPUs come preconfigured with one of the following software options:

Software

AMD

NVIDIA Option 1

NVIDIA Option 2

Operating system

Ubuntu 22.04

Ubuntu 22.04

Ubuntu 24.04

SSH remote access

Preloaded SSH keys

Preloaded SSH keys

Preloaded SSH keys

Driver versions

Preinstalled AMD ROCm drivers

Preinstalled NVIDIA CUDA drivers

Preinstalled NVIDIA CUDA drivers

You can install your own driver versions, but we recommend using the preinstalled versions for stability. Support for custom or untested drivers is limited.

In this article...

*   [Bare Metal GPUs vs GPU Droplets](#bare-metal-gpus-vs-gpu-droplets)
*   [Hardware](#hardware)
    *   [AMD MI300X GPUs](#amd-mi300x-gpus)
    *   [H100 Bare Metal GPUs](#h100-bare-metal-gpus)
    *   [H200 Bare Metal GPUs](#h200-bare-metal-gpus)
*   [Networking](#networking)
*   [Software](#software)

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

Try using different keywords or simplifying your sear
