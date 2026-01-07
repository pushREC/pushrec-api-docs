---
source: https://docs.digitalocean.com/products/kubernetes/how-to/set-up-autoscaling/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                DigitalOcean Gradient™ AI Bare Metal GPUs vs DigitalOcean Gradient™ AI GPU Droplets | DigitalOcean Documentation

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

*   [Concepts](/products/bare-metal-gpus/concepts/) 
*   Bare Metal GPUs vs GPU Droplets

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DigitalOcean Gradient™ AI Bare Metal GPUs vs DigitalOcean Gradient™ AI GPU Droplets

Validated on 23 May 2025 • Last edited on 15 Aug 2025

DigitalOcean Gradient™ AI Bare Metal GPUs are dedicated, single-tenant servers with 8 GPUs of various models that can operate standalone or in multi-node clusters.

Bare metal GPUs and [GPU Droplets](/products/droplets/how-to/gpu/) both provide compute resources tailored to AI/ML workloads, but they’re each suited for different use cases.

GPU Droplets

Bare metal GPUs

**Virtual machines**. GPU Droplets have the convenience and ease of deployment that comes with managed infrastructure, but VM configuration is constrained by the hypervisor and shared OS layer.

**Physical servers**. Bare metal GPUs are physical servers either without virtualization or with an LXC layer, so you can set up advanced orchestration layers, containers, operating systems, and other deep configuration directly on the hardware.

**Shared infrastructure**. GPU Droplets share physical resources, so there may be minor resource fluctuations that don’t significantly impact tasks like fine-tuning and inferencing.

**Single tenant hardware**. Bare metal GPUs are in isolated environments, which are best for use cases requiring full data isolation or highly consistent performance.

**On-demand instances with per-hour billing**. Pricing for GPU Droplets is flexible and low commitment, so GPU Droplets are best for variable usage or rapid scalability.

**Contract-based billing and provisioning**. Pricing for bare metal GPUs is more cost effective, but meant for long-term use with intensive, prolonged workloads that need stable performance.

GPU Droplets are best for small- to medium-scale tasks, including:

*   Fine-tuning (adjusting models with specific data sets)
*   Inference (running predictions with high-speed responses for production applications)
*   Moderate data processing (lightweight analytics or video processing that benefit from GPU acceleration but don’t demand full hardware dedication)

Bare metal GPUs are best for advanced and custom workloads, including:

*   Model training at scale (training foundational models and handling large datasets with optimal performance)
*   Complex inference needs (running real-time inference for high-throughput applications)
*   Custom orchestration and HPC (like Kubernetes clusters, multi-node setups, or high-frequency trading)

In this article...

[DigitalOcean Gradient™ AI Bare Metal GPUs vs DigitalOcean Gradient™ AI GPU Droplets](https://docs.digitalocean.com/products/bare-metal-gpus/concepts/gpu-product-comparison/)

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
