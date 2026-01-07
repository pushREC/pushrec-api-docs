---
source: https://docs.digitalocean.com/products/kubernetes/details/security/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                DigitalOcean Kubernetes Security Information | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/kubernetes.5c9f5538fc3c9db4ddd19b3b4c2166c4e06a899c3582345cc892b570bd214072.svg)Kubernetes](/products/kubernetes/)
*   [Getting Started](/products/kubernetes/getting-started/)
    *   [Quickstart](/products/kubernetes/getting-started/quickstart/)
    *   [Deploy Image to Cluster](/products/kubernetes/getting-started/deploy-image-to-cluster/)
    *   [Set Up Operational Readiness](/products/kubernetes/getting-started/operational-readiness/)
*   [How-Tos](/products/kubernetes/how-to/)
    *   [Create Clusters](/products/kubernetes/how-to/create-clusters/)
    *   [Connect to a Cluster](/products/kubernetes/how-to/connect-to-cluster/)
    *   [Add Node Pools](/products/kubernetes/how-to/add-node-pools/)
    *   [Enable Autoscaling](/products/kubernetes/how-to/autoscale/)
    *   [Configure Multi-Node GPU Nodes](/products/kubernetes/how-to/configure-multinode-gpus/)
    *   [Manage 1-Click Apps](/products/kubernetes/how-to/manage-1click-apps/)
    *   [Back Up Managed Kubernetes Resources](/products/snapshooter/how-to/back-up-doks/)
    *   [Destroy Clusters](/products/kubernetes/how-to/destroy-clusters/)
    *   [Enable High Availability](/products/kubernetes/how-to/enable-high-availability/)
    *   [Integrate with Container Registry](/products/kubernetes/how-to/integrate-with-docr/)
    *   [Add Volumes](/products/kubernetes/how-to/add-volumes/)
    *   [Delete Volumes](/products/kubernetes/how-to/delete-volumes/)
    *   [Restore Volumes](/products/kubernetes/how-to/restore-volumes/)
    *   [Use NFS Storage](/products/kubernetes/how-to/use-nfs-storage/)
    *   [Import DigitalOcean Snapshots](/products/kubernetes/how-to/import-snapshot/)
    *   [Create Snapshots](/products/kubernetes/how-to/create-snapshots/)
    *   [Add Load Balancers](/products/kubernetes/how-to/add-load-balancers/)
    *   [Configure Load Balancers](/products/kubernetes/how-to/configure-load-balancers/)
    *   [Migrate Load Balancers](/products/kubernetes/how-to/migrate-load-balancers/)
    *   [Delete Load Balancers](/products/kubernetes/how-to/delete-load-balancers/)
    *   [Use Routing Agent](/products/kubernetes/how-to/use-routing-agent/)
    *   [Use Spaces](/products/kubernetes/how-to/use-spaces/)
    *   [Customize Cluster DNS Settings](/products/kubernetes/how-to/customize-coredns/)
    *   [Enable Push-to-Deploy](/products/kubernetes/how-to/deploy-using-github-actions/)
    *   [View Basic Metrics](/products/kubernetes/how-to/monitor-basic/)
    *   [Use Cilium Hubble](/products/kubernetes/how-to/use-cilium-hubble/)
    *   [Set Up Advanced Monitoring](/products/kubernetes/how-to/monitor-advanced/)
    *   [Forward Logs](/products/kubernetes/how-to/forward-logs/)
    *   [Upgrade Clusters](/products/kubernetes/how-to/upgrade-cluster/)
    *   [Add Control Plane Firewallsprivate](/products/kubernetes/how-to/add-control-plane-firewall/)
    *   [Set RoleBindings for Custom Roles](/products/kubernetes/how-to/set-up-custom-rolebindings/)
    *   [Set Up Horizontal Pod Autoscaling](/products/kubernetes/how-to/set-up-autoscaling/)
*   [Reference](/products/kubernetes/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Kubernetes)
    *   [CLI Reference](/reference/doctl/reference/kubernetes/cluster/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/kubernetes/concepts/)
    *   [Choosing a Plan](/products/kubernetes/concepts/choosing-a-plan/)
    *   [Best Practices](/products/kubernetes/concepts/best-practices/)
*   [Details](/products/kubernetes/details/)
    *   [Features](/products/kubernetes/details/features/)
    *   [Pricing](/products/kubernetes/details/pricing/)
    *   [Availability](/products/kubernetes/details/availability/)
    *   [Limits](/products/kubernetes/details/limits/)
    *   [Changelog](/products/kubernetes/details/changelog/)
    *   [Managed Kubernetes](/products/kubernetes/details/managed/)
    *   [GPU Worker Nodes](/products/kubernetes/details/supported-gpus/)
    *   [Security Information](/products/kubernetes/details/security/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/doks)
    *   [Supported Releases](/products/kubernetes/details/supported-releases/)
    *   [Volume Features](/products/kubernetes/details/volume-features/)
*   [Support](/products/kubernetes/support/)

*   [Details](/products/kubernetes/details/) 
*   Security Information

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DigitalOcean Kubernetes Security Information

Validated on 12 Aug 2019 • Last edited on 31 Jul 2023

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

## Is there an option to restrict the access for the Kubernetes API by IP addresses?[](#is-there-an-option-to-restrict-the-access-for-the-kubernetes-api-by-ip-addresses)

Not today.

## How can we get the latest OS version and patch-level information on worker nodes, so we can check OS and kernel versions for 0-day exploits or other CVE vulnerabilities?[](#how-can-we-get-the-latest-os-version-and-patch-level-information-on-worker-nodes-so-we-can-check-os-and-kernel-versions-for-0-day-exploits-or-other-cve-vulnerabilities)

You need to use a privileged pod configured to gain access to the underlying system of the worker node.

## How do you keep the worker nodes secure?[](#how-do-you-keep-the-worker-nodes-secure)

The worker node system is updated when clusters are upgraded. This is one important reason to [enable auto-upgrades on your cluster](/products/kubernetes/how-to/upgrade-cluster/#upgrading-automatically). The [changelog](/products/kubernetes/details/changelog/) has the set of images released over time with the things that changed.

## How can I run additional security tooling on worker nodes?[](#how-can-i-run-additional-security-tooling-on-worker-nodes)

You can run additional security tooling on worker nodes as privileged DaemonSets.

## How can I reasonably make sure there are no known exploits in the images running on the Droplets?[](#how-can-i-reasonably-make-sure-there-are-no-known-exploits-in-the-images-running-on-the-droplets)

Security-scanning services are built into some image registries such as Docker Hub and Quay. You can also use an independent scanner such as Anchore, WhiteSource, or Clair. Be sure not to import open-source code in tarballs and instead use a package from a public repository so the scanner is more likely to recognize it.

## What are my options for authentication?[](#what-are-my-options-for-authentication)

DOKS offers token-based authorization (recommended) and supports certificates for legacy clusters. For more details, see [Connect to a Cluster](/products/kubernetes/how-to/connect-to-cluster/).

## Where can I read some security best practices for Kubernetes in general (rather than DOKS in specific?)[](#where-can-i-read-some-security-best-practices-for-kubernetes-in-general-rather-than-doks-in-specific)

We recommend consulting [the CNCF’s security recommendations](https://www.cncf.io/blog/2019/01/14/9-kubernetes-security-best-practices-everyone-must-follow/), and reading [Securing a Cluster](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/) and [Overview of Cloud Native Security](https://kubernetes.io/docs/concepts/security/overview/) in the Kubernetes documentation.

In this article...

*   [Is there an option to restrict the access for the Kubernetes API by IP addresses?](#is-there-an-option-to-restrict-the-access-for-the-kubernetes-api-by-ip-addresses)
*   [How can we get the latest OS version and patch-level information on worker nodes, so we can check OS and kernel versions for 0-day exploits or other CVE vulnerabilities?](#how-can-we-get-the-latest-os-version-and-patch-level-information-on-worker-nodes-so-we-can-check-os-and-kernel-versions-for-0-day-exploits-or-other-cve-vulnerabilities)
*   [How do you keep the worker nodes secure?](#how-do-you-keep-the-worker-nodes-secure)
*   [How can I run additional security tooling on worker nodes?](#how-can-i-run-additional-security-tooling-on-worker-nodes)
*   [How can I reasonably make sure there are no known exploits in the images running on the Droplets?](#how-can-i-reasonably-make-sure-there-are-no-known-exploits-in-the-images-running-on-the-droplets)
*   [What are my options for authentication?](#what-are-my-options-for-authentication)
*   [Where can I read some security best practices for Kubernetes in general (rather than DOKS in specific?)](#where-can-i-read-some-security-best-practices-for-kubernetes-in-general-rather-than-doks-in-specific)

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

Try using different keywords or simplifying your search
