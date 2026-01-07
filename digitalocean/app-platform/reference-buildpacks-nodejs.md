---
source: https://docs.digitalocean.com/products/app-platform/reference/buildpacks/nodejs/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 1.30.5-do.1

Validated on 30 Sep 2024 • Last edited on 8 Aug 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

*   Rebuilt the Debian base image for GPU worker nodes with `nvidia-container-toolkit` version 1.16.2-1 to address [CVE-2024-0132](https://security-tracker.debian.org/tracker/CVE-2024-0132).