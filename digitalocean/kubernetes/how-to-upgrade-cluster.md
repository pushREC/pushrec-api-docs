---
source: https://docs.digitalocean.com/products/kubernetes/how-to/upgrade-cluster/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Upgrade DOKS Clusters to Newer Versions | DigitalOcean Documentation

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
*   Upgrade Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Upgrade DOKS Clusters to Newer Versions

Validated on 16 Nov 2022 • Last edited on 24 Jan 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

You can upgrade DigitalOcean Kubernetes clusters to newer patch versions (for example, 1.20.1 to 1.20.2) as well as new minor versions (for example, 1.19.1 to 1.20.1) in the DigitalOcean Control Panel or in `doctl`, the command line interface (CLI) tool.

There are two ways to upgrade:

*   [**On demand**](#on-demand). When an upgrade becomes available for DigitalOcean Kubernetes, you can manually trigger the upgrade process. You can upgrade to a new minor version using the manual process, provided you first perform all available patch-level upgrades for your current minor version.
    
*   [**Automatically**](#automatically). You can enable automatic upgrades for a cluster that happen within a maintenance window you specify. Automatic updates trigger on new patch versions of Kubernetes and new point releases of DigitalOcean Kubernetes subsystems with non-breaking updates. However, your cluster is not be automatically upgraded to new minor Kubernetes versions (for example, 1.19.1 to 1.20.1).
    

Note

DigitalOcean Kubernetes officially supports the latest three minor versions of upstream Kubernetes. If your cluster is running an older version of Kubernetes, we force an upgrade, even if automatic upgrades are disabled. The upgrade takes place during our scheduled maintenance windows and you receive notifications in advance via email, the control panel, and our status page. For details, see [Required Upgrades](#required-upgrades).

## Required Upgrades[](#required-upgrades)

When a required upgrade is scheduled for your cluster, a notification appears in the control panel indicating the target version and when the required upgrade is scheduled to occur. You can configure the weekday and time required upgrades occur in the **Upgrade window** in the **Settings** tab of the cluster. You can upgrade the cluster yourself before this date.

When a minor version becomes unsupported, we schedule an upgrade to the latest patch version of the next supported minor version. We notify you via email 30 days prior to the scheduled upgrade. We notify you again 7 days and the day before the upgrade starts.

DigitalOcean may schedule an upgrade to the latest patch version of the cluster’s current minor version if a serious security vulnerability is identified in the version your cluster is running. We notify you at least 7 days before the upgrade, as well as the day before the upgrade starts.

DigitalOcean runs a [cluster linter](https://github.com/digitalocean/clusterlint) check before each required upgrade. A subset of the errors are included in the 30-day notice email and also appear in the control panel. If cluster linter errors are present, you must fix the issues.

## The Upgrade Process[](#the-upgrade-process)

Tip

To avoid downtime and for a faster upgrade, we recommend enabling [surge upgrades](#surge-upgrades) on existing clusters.

During an upgrade, the control plane (Kubernetes main) is replaced with a new control plane running the new version of Kubernetes. This process takes a few minutes, during which API access to the cluster is unavailable but workloads are not impacted.

Once the control plane is replaced, the worker nodes are replaced in a rolling fashion, one worker pool at a time. DOKS uses the following replacement process for the worker nodes:

1.  Identify a number of nodes to drain.
    
2.  Perform the following steps for each node concurrently:
    
    a. Generate the list of pods running on it. This does not include DaemonSets or mirrored pods.
    
    b. Mark the beginning of the drain start time as an annotation on the node. Eviction timeout is 15 minutes and drain (node deletion) timeout is 30 minutes.
    
    c. Evict as many pods concurrently as the PodDisruptionBudget (PDB) policies allow. If the process hits the eviction timeout while draining a node, it switches to deleting the pods. If it hits the drain timeout while draining a node, it switches to deleting the node.
    
    d. Wait a bit to allow for pod disruption budget to recover.
    
    e. Repeat the above steps until all pods are drained.
    

As nodes are upgraded, workloads may experience downtime if there is no additional capacity to host the node’s workload during the replacement. If you enable surge upgrades, then up to 10 new nodes for a given node pool are created up front before the existing nodes of that node pool start getting drained. Since everything happens concurrently, one node stalling the drain process doesn’t stop the other nodes from proceeding. However, since one pool is upgraded at a time, it means that DOKS doesn’t move to the next node pool until the current node pool finishes. When you enable surge upgrades, Kubernetes reschedules each worker node’s workload, then replaces the node with a new node running the new version and reattaches any DigitalOcean Volumes Block Storage to the new nodes. The new worker nodes have new IP addresses.

Warning

Any data stored on the local disks of the worker nodes are lost in the upgrade process. We recommend [using persistent volumes](/products/kubernetes/how-to/add-volumes/) for data storage, and not relying on local disk for anything other than temporary data.

### Surge Upgrades[](#surge-upgrades)

Surge upgrades create duplicate upgraded nodes while, in parallel, draining workloads from old nodes to the new nodes and removing the old nodes. Surge upgrades create up to 10 duplicate nodes. As a result, larger cluster nodes are upgraded with at most 10 nodes at a time.

Surge upgrades are available at no additional cost and are enabled by default when you create a new Kubernetes cluster. We recommend enabling surge upgrades when upgrading an existing cluster for a faster and more stable upgrade.

To enable surge upgrades, in the **Surge upgrades** section of the **Settings** tab of your cluster, click **Edit**. Select the **Enable surge upgrades** option and click **Save**.

![Enable surge upgrade](https://docs.digitalocean.com/screenshots/kubernetes/enable-surge-upgrade.ec9663beb7101915f867165d13abbb55e659a7f487deed723aa283cf7627e54c.png)

To use surge upgrades for the entire upgrade duration, your Droplet limit must be at least `n + min(10, num_nodes)`, where `num_nodes` is the number of nodes in your cluster and `n` is your current Droplet count. For example, if you have a 12-node cluster and 5 Droplets, your Droplet limit must at least be 15. You can [request a Droplet limit increase](/platform/accounts/#droplet-and-volume-limit-increases) at any time.

If an upgrade starts with less than the required number of Droplets or the limit is reached during the upgrade, then a partial upgrade is done using the available Droplets and the remaining upgrade happens without the surge enabled.

To minimize the disruptive impact of upgrades, for critical applications, we recommend setting [Pod Disruption Budgets](#disruption-free-upgrades).

## Upgrading via Control Panel[](#upgrading-via-control-panel)

### Upgrading On Demand[](#on-demand)

To update a cluster manually, visit the **Overview** tab of the cluster in [the control panel](https://cloud.digitalocean.com). You see a **View Available Upgrade** button if there is a new version available for your cluster. Click this button to begin the upgrade process.

Once an upgrade starts, you can see its progress in the **Overview** and **Resources** tabs.

#### Upgrading to a New Minor Version[](#new-minor-version)

The on-demand process is required when upgrading your cluster to a new minor version of Kubernetes. During this process, you can run [our cluster linter](https://github.com/digitalocean/clusterlint) before upgrading. This automatically checks the cluster to ensure it’s conforming to some common best practices, and links to [the fixes recommended in our documentation](/support/clusterlint-error-fixes/), to help mitigate issues that might affect your cluster’s compatibility with the newer version of Kubernetes. Click **Run Linter** on the upgrade window to begin.

![Screenshot of upgrade window showing 'Run Linter' link.](https://docs.digitalocean.com/screenshots/kubernetes/k8s-linter.111a929772f634c0ff2ae0c41887fde50af241718769570c1a94a8a6b660acdc.png)

#### Upgrading to New Control Plane[](#new-control-plane)

DigitalOcean Kubernetes clusters originally created with version 1.20 or older have a version of the control plane architecture which does not allow you to enable [high availability](/products/kubernetes/details/managed/#managed-elements-of-the-control-plane). However, you can now upgrade your control plane to the new version. This upgrade option is available for Kubernetes versions currently 1.22 and later.

In the cluster’s **Overview** page or the **View Available Upgrade** pop-up list, follow the upgrade process to get the new control plane.

![The banner listing the opportunity to upgrade to the new control plane](https://docs.digitalocean.com/screenshots/kubernetes/new-control-plane-banner.a8bb01e21462d24250a36a8d2ad63ab01e3f01daa4e625267ed62aa5803ea892.png)

The upgrade process may disrupt your cluster’s operations for up to approximately 2 minutes. This is because the upgrade involves a significant Cilium configuration change; so, during the migration, many worker nodes are on different configurations and therefore cannot communicate with each other until all the pods have rapidly restarted.

In addition to following the steps to [minimize disruptions during upgrades](#disruption-free-upgrades), we recommend you do not create any new workloads during the upgrade. This includes creating new deployments and increasing replica count for existing processes manually or automatically (such as with replica-adjusting controllers like HPA).

### Upgrading Automatically[](#automatically)

To enable automatic upgrades for a cluster, visit the **Settings** tab of the cluster. In the **Automatically upgrade minor version patches** section, click the **Automatically install minor version patches** checkbox.

Automatic upgrades occur during a cluster’s 4-hour upgrade window. The default upgrade window is chosen by the DigitalOcean Kubernetes backend to guarantee an even workload across all maintenance windows for optimal processing.

You can specify a different maintenance window in the **Settings** tab of a cluster. In the **Upgrade window** section, click **Edit** to specify a different start time. Upgrade windows are made up of two parts: a time of day and, optionally, a day of the week. For example, you can set your upgrade window to 5 AM any day of the week or to 8 PM on Mondays.

You receive a notification email 30 days, 7 days, and 1 day before an automatic upgrade.

Even if you have auto upgrades enabled, you can still upgrade on-demand by clicking the **View Available Upgrade** button in the **Overview** tab.

## Upgrade Using Automation[](#upgrade-using-automation)

If you do not provide a version in the `version` field, the cluster upgrades to the next minor version of Kubernetes (for example, 1.28.1 to 1.29.1). You can retrieve a list of available version using the [`/v2/kubernetes/options` endpoint](/reference/api/digitalocean/#operation/kubernetes_list_options) or the [`doctl kubernetes options` command](/reference/doctl/reference/kubernetes/options/).

How to Upgrade Cluster to Latest Version Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl kubernetes cluster upgrade`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/kubernetes/cluster/upgrade/) for more details:
    
        doctl kubernetes cluster upgrade <id|name> [flags]
    
    The following example upgrades a cluster named `example-cluster` to version 1.28.2:
    
        doctl kubernetes cluster upgrade example-cluster --version 1.28.2-do.0
    

How to Upgrade Cluster to Latest Version Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a POST request to [`https://api.digitalocean.com/v2/kubernetes/clusters/{cluster_id}/upgrade`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/kubernetes_upgrade_cluster).

### cURL[](#upgrade-cluster-to-latest-version-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/kubernetes/clusters/bd5f5959-5e1e-4205-a714-a914373942af/upgrades"

### Go[](#upgrade-cluster-to-latest-version-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "os"
    
        "github.com/digitalocean/godo"
    )
    
    func main() {
        token := os.Getenv("DIGITALOCEAN_TOKEN")
    
        client := godo.NewFromToken(token)
        ctx := context.TODO()
    
        upgradeRequest := &godo.KubernetesClusterUpgradeRequest{
        	VersionSlug: "1.12.3-do.1",
        }
    }

### Python[](#upgrade-cluster-to-latest-version-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    req = {
      "version": "1.16.13-do.0"
    }
    
    resp = client.kubernetes.upgrade_cluster(cluster_id="1fd32a", body=req)

### Upgrading to a Specific Version[](#upgrading-to-a-specific-version)

To upgrade to a specific Kubernetes version, rather than automatically upgrading to the latest version, you must first use your cluster ID to get a list of available upgrades for that cluster:

    doctl kubernetes cluster get-upgrades <cluster-id>

Then, use the `slug` value returned by the `get-upgrades` call to perform the upgrade:

    doctl kubernetes cluster upgrade <cluster-id> --version 1.20.2-do.0

## Minimize Disruptions During Upgrades[](#disruption-free-upgrades)

Upgrading your cluster can cause disruptions in the availability of services running in your workloads. Consider the following measures to improve service availability during upgrades.

### Configure a PodDisruptionBudget[](#configure-a-poddisruptionbudget)

A `PodDisruptionBudget` (PDB) specifies the minimum number of replicas that an application can tolerate during a voluntary disruption, relative to how many it is intended to have. For example, if you set the `replicas` value for a deployment to `5`, and set the PDB to `1`, potentially disruptive actions like cluster upgrades and resizes occur with no fewer than four pods running.

For more information, see [Specifying a Disruption Budget for your Application](https://kubernetes.io/docs/tasks/run-application/configure-pdb/) in the Kubernetes documentation.

### Implement Graceful Shutdowns[](#implement-graceful-shutdowns)

Ensure that the containers in your workload respond to shutdown requests in a way that doesn’t suddenly destroy service. You can use tools like [a `preStop` hook](https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/#hook-details) that responds to a scheduled Pod shutdown, and specify a grace period other than the 30-second default.

This is important because cluster upgrades results in Pod shutdowns, which follow the standard Kubernetes termination lifecycle:

1.  The Pod is set to the “Terminating” state and removed as an endpoint.
2.  The `preStop` hook is executed, if it exists.
3.  A SIGTERM signal is sent to the Pod, notifying the containers that they are going to be shut down soon. Your code should listen for this event and start shutting down at this point.
4.  Kubernetes waits for a grace period to pass; the default grace period is 30 seconds.
5.  A SIGKILL signal is sent to any containers that still haven’t shut down, and the Pod is removed.

For more information, see [Termination of Pods in the Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-termination).

### Set up Readiness Probes[](#set-up-readiness-probes)

Readiness probes are useful if applications are running but not able to serve traffic, due to things like external services that are still starting up, loading of large data sets, etc. You can configure a readiness probe to report such a status. Think of a command that you could execute in the container every few seconds that would indicate readiness if it returns `0`, and specify the command and the schedule in your Pod spec.

For more information, see [Configure Liveness, Readiness and Startup Probes in the Kubernetes Documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-readiness-probes).

In this article...

*   [Required Upgrades](#required-upgrades)
*   [The Upgrade Process](#the-upgrade-process)
    *   [Surge Upgrades](#surge-upgrades)
*   [Upgrading via Control Panel](#upgrading-via-control-panel)
    *   [Upgrading On Demand](#on-demand)
        *   [Upgrading to a New Minor Version](#new-minor-version)
        *   [Upgrading to New Control Plane](#new-control-plane)
    *   [Upgrading Automatically](#automatically)
*   [Upgrade Using Automation](#upgrade-using-automation)
    *   [Upgrading to a Specific Version](#upgrading-to-a-specific-version)
*   [Minimize Disruptions During Upgrades](#disruption-free-upgrades)
    *   [Configure a PodDisruptionBudget](#configure-a-poddisruptionbudget)
    *   [Implement Graceful Shutdowns](#implement-graceful-shutdowns)
    *   [Set up Readiness Probes](#set-up-readiness-probes)

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

Try using different keywords 
