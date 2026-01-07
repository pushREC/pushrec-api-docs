---
source: https://docs.digitalocean.com/products/kubernetes/how-to/use-nfs-storage/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Use NFS Storage with Kubernetes Clusters | DigitalOcean Documentation

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
*   Use NFS Storage

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Use NFS Storage with Kubernetes Clusters

Validated on 3 Oct 2025 • Last edited on 3 Dec 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

You can connect your DOKS clusters to a [DigitalOcean NFS Share](/products/nfs/) and use the share for tasks such as AI/ML Kubernetes workloads. For other persistent storage options, see [Add Volumes to Kubernetes Clusters](/products/kubernetes/how-to/add-volumes/).

To use an NFS share with your DOKS cluster, you statically provision a PersistentVolume (PV), bind the PV to a PersistentVolumeClaim (PVC), and then mount the PVC to your workload.

Note

You can create and use NFS shares with DOKS clusters only in regions where [DigitalOcean NFS shares are available](/products/nfs/details/availability/) and only when the cluster and NFS share are on the same VPC network.

## Prerequisites[](#prerequisites)

To connect an existing DOKS cluster to a DigitalOcean NFS share, you need to:

*   Create an NFS share. You can provision one using either the [DigitalOcean Control Panel](/products/nfs/how-to/create/) or the [API](/reference/api/digitalocean/#tag/nfs).
    
*   Get the connection details once the share is active.
    
    In the left menu of the control panel, click **Network File Storage** to open the **Network File Storage** page which lists all the NFS shares. Note the server IP address and mount path values in the **Mount Path** column. The server IP address is the value before the `:` and the mount path is the value after the `:`. For example, if the value is `10.128.0.69:/123456/6160d138-60cb-4e61-9ff3-076eebed5c0f`, then the server IP address is `10.128.0.69` and the mount path is `/123456/6160d138-60cb-4e61-9ff3-076eebed5c0f`.
    
    To get the values using the API, send a `GET` request to the `/v2/nfs` endpoint. From the API response, note the host IP address and the mount path. For example:
    
        ...
        "host": "10.128.0.69",
        "mount_path": "/123456/38bc6f86-9927-491a-a7b5-c5627219a0d3",
        ...
    
    The `host` value is the server IP address. The `mount_path` value provides the path to use when configuring your Kubernetes cluster.
    

## Create PersistentVolume[](#create-persistentvolume)

A [PersistentVolume](https://kubernetes.io/docs/concepts/storage/persistent-volumes) (PV) is a cluster-level resource that registers your DigitalOcean NFS Share with Kubernetes, making it available for use across the entire cluster.

To provision a PV for your NFS share, create the following config file named `nfs-pv.yaml`, replacing the values for `server` and `path` with the `host` and `mount_path` values of your NFS share. The size of the PV should ideally match your share’s size and the `accessModes` must be `ReadWriteMany` to allow multiple pods to read and write to the volume simultaneously.

`nfs-pv.yaml`

    apiVersion: v1
    kind: PersistentVolume
    metadata:
     name: do-nfs-pv
     labels:
       type: nfs-model-storage
    spec:
     capacity:
     storage: 10Gi
     accessModes:
       - ReadWriteMany
     persistentVolumeReclaimPolicy: Retain
     nfs:
       server: "10.128.0.69"
       path: "/123456/38bc6f86-9927-491a-a7b5-c5627219a0d3"

Use `kubectl apply` to create the PV:

    kubectl apply -f nfs-pv.yaml

## Create PersistentVolumeClaim[](#create-persistentvolumeclaim)

A [PersistentVolumeClaim](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims) (PVC) is how your applications request access to the storage made available by the PV.

To provision a PVC for your NFS share, create the following config file named `nfs-pvc.yaml`. The label for the PVC must match the label for your PV to ensure that the PVC binds to the specific NFS PV. The `accessModes` must be `ReadWriteMany` to allow multiple pods to read and write to the PVC simultaneously.

`nfs-pvc.yaml`

    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
     name: do-nfs-pvc
     namespace: sammy-doks
    spec:
     storageClassName: ""
     accessModes:
       - ReadWriteMany
     resources:
       requests:
         storage: 10Gi
     selector:
       matchLabels:
         type: nfs-model-storage

In the config file, the `storageClassName` field is set to `""`. This instructs DOKS to find a pre-existing, statically provisioned PV matching the specified PV label and links your PVC directly to your manually configured NFS share. DOKS has built-in [StorageClass](https://kubernetes.io/docs/concepts/storage/storage-classes/) options such as `do-block-storage` that dynamically provision new storage volumes when a PVC requests them. However, in this case, you have already provisioned the storage when creating the PV and therefore do not need DOKS to dynamically provision one.

Use `kubectl apply` to create the PV:

    kubectl apply -f nfs-pvc.yaml

## Mount PVC in Your Workload[](#mount-pvc-in-your-workload)

After your PVC is bound to the PV, you can mount it to a workload such as Deployment, Pod, Job, or DaemonSet.

The following config file demonstrates how to mount the storage to a pod and write the current date to a log file on the NFS share every 5 seconds.

To mount the volume to the pod and reference your PVC, add the `volumes` section to the specification. The `claimName` field must match the [name you specified for your PVC](#create-persistentvolumeclaim). Next, add the `volumeMounts` section where the `name` field must match the volume name you specified earlier and the `mountPath` field specifies the path where the volume will be mounted in the container’s filesystem. The `securityContext` section configures the Pod to [run as a non-root user](#run-workloads-as-non-root-users). This is required because DigitalOcean NFS shares enforce root squashing, which prevents root users from writing to the share.

`pod-with-nfs.yaml`

    apiVersion: v1
    kind: Pod
    metadata:
     name: nfs-test-pod
     namespace: sammy-doks
    spec:
       volumes:
         - name: my-nfs-share
           persistentVolumeClaim:
             claimName: do-nfs-pvc
      containers:
        - name: my-app-container
          image: busybox
          command: ["/bin/sh", "-c", "while true; do date >> /data/test.log; sleep 5; done"]
          volumeMounts:
            - name: my-nfs-share
              mountPath: "/data"
      securityContext:
        runAsUser: 1000
        runAsGroup: 1000

After you apply this manifest using `kubectl apply -f pod-with-nfs.yaml`, the pod reads from and writes to its `/data` directory, with all files persisting directly on your DigitalOcean NFS Share.

## Run Workloads as a Non-Root User[](#run-workloads-as-a-non-root-user)

DigitalOcean NFS shares enforce root squashing, a security feature that maps root user operations from NFS clients to an unprivileged user. As a result, workloads running as the root user (User ID 0) can read from the NFS share but receive permission denied errors when attempting to write to it.

To enable write access, the workload must run as a non-root user. Containers run as root unless their Dockerfile specifies otherwise. If the container in your workload specification runs as root by default, you can configure the workload to use a non-root user in the `securityContext` section of the config file. The `runAsUser` field specifies which User ID (UID) the workload runs as, and `runAsGroup` specifies the Group ID (GID). Set these fields to non-zero values that have write access to the files on the NFS share.

The following example shows the config file for a Job that processes data on an NFS share. The `securityContext` section specifies that the Job runs with UID 1000 and GID 1000:

`job-with-nfs.yaml`

    apiVersion: batch/v1
    kind: Job
    metadata:
      name: nfs-data-job
      namespace: sammy-doks
    spec:
      template:
        spec:
          securityContext:
            runAsUser: 1000
            runAsGroup: 1000
          volumes:
            - name: my-nfs-share
              persistentVolumeClaim:
                claimName: do-nfs-pvc
          containers:
            - name: data-processor
              image: your-image:tag
              volumeMounts:
                - name: my-nfs-share
                  mountPath: "/data"
          restartPolicy: OnFailure

In this article...

*   [Prerequisites](#prerequisites)
*   [Create PersistentVolume](#create-persistentvolume)
*   [Create PersistentVolumeClaim](#create-persistentvolumeclaim)
*   [Mount PVC in Your Workload](#mount-pvc-in-your-workload)
*   [Run Workloads as a Non-Root User](#run-workloads-as-a-non-root-user)

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
