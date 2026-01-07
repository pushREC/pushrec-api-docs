---
source: https://docs.digitalocean.com/products/kubernetes/how-to/import-snapshot/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Import a DigitalOcean Snapshot into a Kubernetes Cluster | DigitalOcean Documentation

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

*   [How-Tos](/products/kubernetes/how-to/) 
*   Import DigitalOcean Snapshots

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Import a DigitalOcean Snapshot into a Kubernetes Cluster

Validated on 24 Apr 2023 • Last edited on 17 Apr 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

You can import an existing [DigitalOcean volume snapshot](/products/snapshots/how-to/snapshot-volumes/) into a Kubernetes cluster by applying three new YAML files that link your existing snapshot, create a local snapshot, and request for space on your Kubernetes cluster.

## Find the Snapshot ID[](#find-the-snapshot-id)

First, find the existing snapshot’s ID by making a request to [our API](/reference/api/digitalocean/#operation/snapshots_list) or running the following command:

    doctl compute snapshot list

## Create a Volume Snapshot Content[](#create-a-volume-snapshot-content)

Create a `VolumeSnapshotContent` spec called `snapshotcontent.yaml`. This file specifies your existing snapshot as the source of data to be imported. Write the following content, replacing `<your-snapshot-ID>` with your snapshot ID:

`snapshotcontent.yaml`

    apiVersion: snapshot.storage.k8s.io/v1
    kind: VolumeSnapshotContent
    metadata:
      name: manually-created-snapshot-content
    spec:
      deletionPolicy: Retain
      driver: dobs.csi.digitalocean.com
      source:
        snapshotHandle: your-snapshot-ID
      volumeSnapshotRef:
        name: test-snapshot
        namespace: default

The `name` field for `VolumeSnapshotContent` is the name of the volume snapshot content and the `name` field for `volumeSnapshotRef` is the reference of the corresponding volume snapshot. You can pick any name you want for them, but the names must match in the `VolumeSnapshot` spec you are going to create later.

The `deletionPolicy` is set to `Retain`. This setting preserves the `VolumeSnapshotContent` and the DigitalOcean snapshot resource when you delete the `VolumeSnapshot`, instead of automatically deleting them. To delete all three files together when deleting `VolumeSnapshot`, change this value to `Delete`.

Save and exit the file, then use `kubectl apply` to create the volume snapshot content:

    kubectl apply -f snapshotcontent.yaml

## Create a Volume Snapshot[](#create-a-volume-snapshot)

Create a `VolumeSnapshot` spec called `snapshot.yml`. This file creates a request local snapshot using the `name` of the `VolumeSnapshotContent` as the source for the snapshot. Write the following content, ensuring that the `name` used matches with the previously-created `VolumeSnapshotContent`:

`snapshot.yaml`

    apiVersion: snapshot.storage.k8s.io/v1
    kind: VolumeSnapshot
    metadata:
      name: test-snapshot
    spec:
      source:
            volumeSnapshotContentName: manually-created-snapshot-content

Save and exit the file, then use `kubectl apply` to create the volume snapshot:

    kubectl apply -f snapshot.yaml

Wait for the snapshot to be imported successfully.

## Import the Volume[](#import-the-volume)

Lastly, once the snapshot is ready, source the snapshot from a `PersistentVolumeClaim` (PVC). The file requests space for the new data on the Kubernetes cluster. Create a file called `pvc.yaml` and write the following content, ensuring that the `name` of the `VolumeSnapshot` matches with the previous file:

`pvc.yaml`

    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: pvc-restore
    spec:
      dataSource:
        name: test-snapshot
        kind: VolumeSnapshot
        apiGroup: snapshot.storage.k8s.io
      accessModes:
        - ReadWriteOnce
      resources:
        requests:
          storage: 5Gi

Save and exit the file, then `kubectl apply` to create the persistent volume claim:

    kubectl apply -f pvc.yaml

This command causes the `PersistentVolumeClaim` to dynamically create a `PersistentVolume`.

You have now imported a DigitalOcean snapshot into a Kubernetes cluster and can use it as a volume in your workload.

In this article...

*   [Find the Snapshot ID](#find-the-snapshot-id)
*   [Create a Volume Snapshot Content](#create-a-volume-snapshot-content)
*   [Create a Volume Snapshot](#create-a-volume-snapshot)
*   [Import the Volume](#import-the-volume)

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
