---
source: https://docs.digitalocean.com/products/kubernetes/details/volume-features/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                DigitalOcean Volumes Block Storage Features | DigitalOcean Documentation

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
*   Volume Features

[Give Feedback](https://ideas.digitalocean.com/documentation)

# DigitalOcean Volumes Block Storage Features

Validated on 23 Jun 2020 • Last edited on 31 Oct 2023

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

Volumes are integrated into DOKS by leveraging the [CSI specification](https://github.com/container-storage-interface/spec). DigitalOcean’s CSI plugin implements the specification to provide a number of volume-related features.

## Support[](#support)

The availability of a specific CSI feature depends on the employed DOKS version.

The table below outlines the minimum DOKS versions required to use a particular feature. An omitted version supports a feature if it is higher than the latest minimum version listed for that feature. For instance, DOKS version 1.17 supports raw block volumes because it is higher than the latest minimum version 1.16.2-do.3.

Feature

Description

Available From

[Volume Expansion](https://kubernetes.io/blog/2018/07/12/resizing-persistent-volumes-using-kubernetes/)

Resize a volume to increase the available disk space

1.16.2-do.3

[Raw Block Volumes](https://kubernetes.io/blog/2019/03/07/raw-block-volume-support-to-beta/)

Use a volume as a block device

1.14.8-do.3, 1.15.5-do.3, 1.16.2-do.3

Volume Statistics

Retrieve basic volume metrics (consumable by systems such as Prometheus)

1.14.8-do.3, 1.15.5-do.3, 1.16.2-do.3

[Volume Snapshots](/products/kubernetes/how-to/create-snapshots/)

Create and restore from snapshots

1.12.5 to 1.17 (alpha), 1.18.3+ (beta)

## Volume Snapshots Migration from Alpha to Beta[](#volume-snapshots-migration-from-alpha-to-beta)

Prior to DOKS 1.18, volume snapshots were supported in the alpha version only. Starting with 1.18, support for alpha volume snapshots has been removed and replaced with support for beta volume snapshots. Kubernetes does not support simultaneous usage of both API versions and does not provide any official means to migrate volume snapshots from alpha to beta.

To upgrade snapshots in tandem with cluster upgrades, we have built a custom mechanism to automatically convert snapshots from the alpha version to the beta version. [During the upgrade of a DOKS cluster from any 1.17 version to any 1.18 version](/products/kubernetes/how-to/upgrade-cluster/), existing snapshot resources (VolumeSnapshotClass, VolumeSnapshotContent, VolumeSnapshot) will be upgraded automatically. Beta volume snapshots will continue to be available under the same names and namespaces.

For the conversion process to complete successfully, you must ensure that a number of prerequisites are met prior to the start of an upgrade to 1.18:

1.  No new volume snapshots are being added to the cluster. In particular, any running processes that generate volume snapshots automatically should be temporarily disabled.
2.  All existing volume snapshots must be in a stable state and must not be in the process of being created, deleted, or in an error state. The `readyToUse` status field on a volume snapshot resource must be `true`, deleted volume snapshots must not be available in the cluster anymore, and no error events must be observable on any volume snapshot.

After a successful upgrade to 1.18, verify that your converted volume snapshots work as expected. You can do this by [restoring a volume from a snapshot](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#volume-snapshot-and-restore-volume-from-snapshot-support) and validating that the resulting data is available and complete.

For further questions or concerns, [contact the Support team](https://cloudsupport.digitalocean.com).

In this article...

*   [Support](#support)
*   [Volume Snapshots Migration from Alpha to Beta](#volume-snapshots-migration-from-alpha-to-beta)

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
