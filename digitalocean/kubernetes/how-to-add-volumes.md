---
source: https://docs.digitalocean.com/products/kubernetes/how-to/add-volumes/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Add Volumes to Kubernetes Clusters | DigitalOcean Documentation

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
*   Add Volumes

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Add Volumes to Kubernetes Clusters

Validated on 25 Feb 2021 • Last edited on 20 Oct 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

To write and access persistent data in a Kubernetes cluster, you can create and access [DigitalOcean Volumes Block Storage](/products/volumes/) or [DigitalOcean NFS Storage](/products/kubernetes/how-to/use-nfs-storage/).

To use Volumes Block Storage, create a [`PersistentVolumeClaim`](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) (PVC) as part of your [deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/). This guide shows how to add volumes to your cluster using the Kubernetes command line tool, `kubectl`. To learn more about `kubectl`, see [Overview of `kubectl`](https://kubernetes.io/docs/reference/kubectl/overview/).

The claim can allow cluster workers to read and write database records, user-generated website content, log files, and other data that should persist after a process has completed.

When managing persistent volume claims:

*   Deleting a deployment will not automatically delete any PVCs that have been created. You’ll have to remove those manually with [`kubectl delete pvc`](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#deleting-resources).
    
*   If the volume is deleted before the PVC API object is removed, it may be in an inconsistent state and attempts to remove the PVC will stall or fail. See the [troubleshooting instructions](#troubleshooting) for a fix to try in this case.
    
*   If a PVC by the same name already exists, you will get an error message similar to the following:
    
        Error from server (AlreadyExists): error when creating "pvc.yml":
        persistentvolumeclaims "csi-pvc" already exists
    
    Since the volume exists, it cannot be created. The existing volume will be mounted instead.
    
*   Volumes created in the control panel or via the API cannot be used by your Kubernetes clusters. You must create volumes within Kubernetes in order for your PVCs to use them.
    

## Create a Configuration File[](#create-a-configuration-file)

We recommend making pods that reference volumes [owned by a StatefulSet](/support/clusterlint-error-fixes/#dobs-pod-owner). This section shows how to create a StatefulSet to use a PVC as a volume for a pod.

The StatefulSet config file can look like this:

    apiVersion: apps/v1
    kind: StatefulSet
    metadata:
      name: my-csi-app-set
    spec:
      selector:
        matchLabels:
          app: mypod
      serviceName: "my-frontend"
      replicas: 1
      template:
        metadata:
          labels:
            app: mypod
        spec:
          containers:
          - name: my-frontend
            image: busybox
            args:
            - sleep
            - infinity
            volumeMounts:
            - mountPath: "/data"
              name: csi-pvc
      volumeClaimTemplates:
      - metadata:
          name: csi-pvc
        spec:
          accessModes:
          - ReadWriteOnce
          resources:
            requests:
              storage: 5Gi
          storageClassName: do-block-storage

The configuration example has:

1.  A pod `template` that defines how the pod gets created and the image the container uses. This example adds a pod based on the Linux [BusyBox image](https://busybox.net/), uses the volume named `csi-pvc`, and mounts it within the container at `/data` on the filesystem.
    
2.  A `volumeClaimTemplates` that is responsible for locating the volume by name `csi-pvc`. If a volume by that name does _not_ exist, one will be created. If one already exists, then the existing volume will be mounted on the first object. This example creates a 5 GB volume that will be available to the cluster by the name `csi-pvc`.
    

The three highlighted values, `name`, `accessModes`, and `storage` can be customized as follows:

1.  The `name` must be lowercase alphanumeric values and dashes only and unique within the cluster. Within these constraints, you can name it whatever you want.
    
2.  `accessModes` must be set to `ReadWriteOnce`.`ReadWriteMany` is supported for [DigitalOcean NFS shares](/products/kubernetes/how-to/use-nfs-storage/) and `ReadOnlyMany` is not supported by DigitalOcean volumes. See the Kubernetes documentation for more about [`accessModes`](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes).
    
3.  The `storage` value specifies the size of the volume and can be customized to meet your needs. DigitalOcean storage values can range from 1 GB to 10,000 GB.
    

Use `kubectl apply` to create the StatefulSet with the pod and the mounted volume.

You can resize volumes through Kubernetes [if the DOKS version is recent enough](/products/kubernetes/details/volume-features/). To resize a volume, update the `storage` value of the PVC object to a new target size using `kubectl edit pvc <your-pvc-name>`. Alternatively, you can run:

    kubectl patch pvc <your-pvc-name> -p '{ "spec": { "resources": { "requests": { "storage": "<new-size>" }}}}'

It may take a few minutes for the volume to resize or you may need to restart the application for the resize to become effective. To verify that the volume has resized, check its capacity value in the [volumes list](#show-volumes) or [cluster’s Kubernetes dashboard](/products/kubernetes/getting-started/quickstart/#kubernetes-dashboard).

Note

Volumes can only be increased in size, but never decreased.

Billing for the volume begins when the object is successfully created. To end billing, you must [explicitly delete the volume](#delete). Remove the PVC from your cluster before deleting the volume.

## Show Volumes[](#show-volumes)

Once you apply the config file to a deployment, you can see the volumes in the [**Resources** tab](https://cloud.digitalocean.com/kubernetes/clusters) of your cluster in the control panel.

Within the cluster, volumes will be identified by their names as defined in the `name` parameter. In the example above, the name is `csi-pvc`.

Regardless of what you set this name to be, the name of the volume on DigitalOcean will begin with `pvc-` and end with a unique identifying number, something like `pvc-0213ed0abexample`.

Alternatively, you can list the storage volumes associated with a cluster with the `get pv` command:

    kubectl get pv

The output looks something like:

    NAME                   CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS    CLAIM             STORAGECLASS       REASON    AGE
    pvc-0213ed0abexample   5Gi        RWO            Delete           Bound     default/csi-pvc   do-block-storage             11s

## Setting Permissions on Volumes[](#setting-permissions-on-volumes)

By default, the filesystem owner of a volume is `root:root`. If a Pod is running as a non-root user and needs to create files or directories on the volume, this will fail due to insufficient or incorrect permissions. However, the following `mountOptions` settings are not supported by DigitalOcean Kubernetes:

    mountOptions:
    - dir_mode=0777
    - file_mode=0777

The solution is to create a temporary container to change the permissions/ownership of the volume’s filesystem using [`initContainers`](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/).

We’re going to reuse the same PVC config as described in the example above and change the pod definition.

### Define the Pod[](#define-the-pod)

The next example persists data to a Postgres database using the volume you created. The pod’s resource definition might look like:

    ---
    apiVersion: v1
    kind: Pod
    metadata:
      name: my-csi-app
    spec:
      containers:
        - name: my-db
          image: postgres:latest
          volumeMounts:
          - mountPath: "/var/lib/postgresql"
            name: my-do-volume
      initContainers:
      - name: pgsql-data-permission-fix
        image: busybox
        command: ["/bin/chmod","-R","777", "/data"]
        volumeMounts:
        - name: my-do-volume
          mountPath: /data
      volumes:
        - name: my-do-volume
          persistentVolumeClaim:
            claimName: csi-pvc

This adds a pod called `my-csi-app` based on the latest `postgres` image that names the `csi-pvc` volume `my-do-volume` and mounts it within the container at `/data` on the filesystem. This also creates an `initContainer` that temporarily mounts the volume and changes the file permissions for the specified path to 777. The `initContainer` then deletes itself. This all happens before the volume is mounted to the container. If you use `securityContext` in the YAML file for your Pod, you can use `chown $userid` instead of `chmod 777`.

#### Example:[](#example)

    securityContext:
      runAsUser: 1000
      fsGroup: 2000

### Check the Volume Permissions[](#check-the-volume-permissions)

Once the cluster has been created, you can confirm the permissions were correct by checking the log with `kubectl`:

    kubectl logs my-csi-app

The output should look like the following:

    The files belonging to this database system will be owned by user "postgres".
    This user must also own the server process.
    
    The database cluster will be initialized with locale "en_US.utf8".
    The default database encoding has accordingly been set to "UTF8".
    The default text search configuration will be set to "english".
    
    Data page checksums are disabled.
    
    fixing permissions on existing directory /var/lib/postgresql/data ... ok
    creating subdirectories ... ok
    selecting default max_connections ... 100
    selecting default shared_buffers ... 128MB
    selecting dynamic shared memory implementation ... posix
    creating configuration files ... ok
    running bootstrap script ... ok
    performing post-bootstrap initialization ... ok
    syncing data to disk ... ok

## Troubleshooting[](#troubleshooting)

Warning

In addition to the cluster’s **Resources** tab, cluster resources (worker nodes, load balancers, and volumes) are also listed outside the Kubernetes page in the DigitalOcean Control Panel. If you rename or otherwise modify these resources in the control panel, you may render them unusable to the cluster or cause the reconciler to provision replacement resources. To avoid this, manage your cluster resources exclusively with `kubectl` or from the control panel’s Kubernetes page.

As mentioned above, if the volume is removed manually before the PVC API object is removed with `kubectl`, this can cause issues. For instance, it can cause the PVC deletion to hang and never complete. If this happens, you can try the following:

    kubectl get volumeattachments

The output will look something like this:

    NAME           CREATED AT
    $VOLUME_NAME   2019-03-08T21:58:24Z

Use your volume’s name, displayed by the previous command, in the commands below to gather information you’ll need to try to fix the issue.

    kubectl describe volumeattachments $VOLUME_NAME
    kubectl edit volumeattachment $VOLUME_NAME

The `edit` command above will allow us to edit the PVC using a text editor. Remove the following from the volume attachment `metadata` section, and save your changes:

    finalizers:
      external-attacher/dobs-csi-digitalocean-com

Now, you can try removing the PVC:

    kubectl delete pvc csi-pvc

If those steps don’t work, you can [open a ticket](https://cloudsupport.digitalocean.com) with support.

## References[](#references)

For more about managing persistent volumes see:

*   [Other Kubernetes Components](https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes#other-kubernetes-components) in the DigitalOcean Community’s [Introduction to Kubernetes](https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes).
    
*   [Kubernetes Objects](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/) in the official [Kubernetes Concepts guide](https://kubernetes.io/docs/concepts/)
    
*   [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) in the official [Kubernetes Storage guide](https://kubernetes.io/docs/concepts/storage/volumes/)
    

In this article...

*   [Create a Configuration File](#create-a-configuration-file)
*   [Show Volumes](#show-volumes)
*   [Setting Permissions on Volumes](#setting-permissions-on-volumes)
    *   [Define the Pod](#define-the-pod)
        *   [Example:](#example)
    *   [Check the Volume Permissions](#check-the-volume-permissions)
*   [Troubleshooting](#troubleshooting)
*   [References](#references)

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

Try using different keywords or sim
