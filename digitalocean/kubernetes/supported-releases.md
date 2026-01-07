---
source: https://docs.digitalocean.com/products/kubernetes/details/supported-releases/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               DigitalOcean Kubernetes Supported Releases | DigitalOcean Documentation

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
*   Supported Releases

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DigitalOcean Kubernetes Supported Releases

Validated on 25 Mar 2021 • Last edited on 19 Nov 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

This section outlines DigitalOcean Kubernetes (DOKS) release process and when we end support for unsupported upstream Kubernetes releases. You can find version availability and deprecation announcements in the Kubernetes [changelog](/products/kubernetes/details/changelog/) and [release notes](/release-notes/kubernetes/).

We release new minor versions of DOKS as soon as possible (usually a month) after an upstream Kubernetes release. We release new patch versions of DOKS, which integrate new upstream patches as well as improvements to DOKS-specific components, about once a month. When an upstream Kubernetes release becomes unsupported, we stop updating the DOKS patch releases for that release.

Currently, you can create new clusters on the three most recent minor releases. In addition, you can keep existing clusters on older minor releases and apply patch upgrades to them.

## Supported Releases Policy[](#supported-releases-policy)

Our supported releases policy helps you take advantage of the latest upstream Kubernetes features and bug fixes as well as helps us provide better support and security.

*   We enforce upgrades for clusters that are on unsupported releases.
    
    Clusters are upgraded using [the upgrade process](/products/kubernetes/how-to/upgrade-cluster/) and follow the [end-of-support timeline](#end-of-support-timeline). During their scheduled maintenance windows, they are automatically upgraded to the next minor release 30 days after the release they are running becomes unsupported. You can manually trigger an update at any time before or during this window. You receive notification emails 30 days, 7 days, and a day before an automatic upgrade.
    
    We automatically upgrade clusters running on unsupported versions to the next minor release 30 days after the release they are running becomes unsupported regardless of whether you have enabled auto upgrades for those clusters.
    
*   We provide [support](https://www.digitalocean.com/company/contact/support) for clusters running unsupported releases during the 30-day window on a best-effort basis.
    
*   If a serious security vulnerability is identified in the version your cluster is running, we may end support for that patch version and schedule an upgrade to the latest patch version of the cluster’s current minor version. We notify you at least 7 days before the upgrade, as well as the day before the upgrade starts.
    
*   You can continue to create new clusters on any currently-supported Kubernetes minor release. When a release goes beyond its support window, we immediately disable creation of new clusters on that release.
    

## End-of-Support Timeline[](#end-of-support-timeline)

The following table shows the end-of-support timeline for all DOKS releases that are currently in use. The table follows the [upstream end of maintenance support](https://endoflife.date/kubernetes).

DOKS Release

Initial DOKS Release

End of Support

Upgrades Begin

1.11-1.14

21 May 2019 (DOKS GA)

1 September 2021

1 October 2021

1.15

12 August 2019

1 September 2021

1 October 2021

1.16

5 November 2019

1 September 2021

1 October 2021

1.17

7 May 2020

1 September 2021

1 October 2021

1.18

20 July 2020

1 September 2021

1 October 2021

1.19

27 October 2020

1 September 2021

30 October 2021

1.20

2 February 2021

28 March 2022

27 April 2022

1.21

29 June 2021

28 June 2022

27 July 2022

1.22

3 March 2022

28 October 2022

27 November 2022

1.23

26 July 2022

28 February 2023

27 March 2023

1.24

30 August 2022

28 July 2023

27 August 2023

1.25

6 December 2022

27 October 2023

26 November 2023

1.26

22 March 2023

28 February 2024

27 March 2024

1.27

30 May 2023

28 June 2024

27 July 2024

1.28

18 September 2023

28 October 2024

27 November 2024

1.29

17 January 2024

28 February 2025

27 March 2025

1.30

21 May 2024

28 June 2025

27 July 2025

1.31

13 September 2024

28 October 2025

27 November 2025

1.32

6 February 2025

28 February 2026

27 March 2026

1.33

16 June 2025

28 June 2026

27 July 2026

1.34

19 November 2025

27 October 2026

26 November 2026

In this article...

*   [Supported Releases Policy](#supported-releases-policy)
*   [End-of-Support Timeline](#end-of-support-timeline)

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
