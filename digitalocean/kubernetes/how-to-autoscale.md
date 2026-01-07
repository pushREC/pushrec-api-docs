---
source: https://docs.digitalocean.com/products/kubernetes/how-to/autoscale/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Enable Cluster Autoscaler for a DigitalOcean Kubernetes Cluster | DigitalOcean Documentation

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
*   Enable Autoscaling

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Enable Cluster Autoscaler for a DigitalOcean Kubernetes Cluster

Validated on 7 Jun 2022 • Last edited on 9 Sep 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

DigitalOcean Kubernetes provides a [Cluster Autoscaler (CA)](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#basics) that automatically adjusts the size of a Kubernetes cluster by adding or removing nodes based on the cluster’s capacity to schedule pods.

You can enable autoscaling with minimum and maximum cluster sizes either when you [create a cluster](/products/kubernetes/how-to/create-clusters/) or enable it later. You can use the [DigitalOcean Control Panel](https://cloud.digitalocean.com) or [`doctl`](/reference/doctl/), the DigitalOcean command-line tool for autoscaling.

## Enable Autoscaling[](#enable-autoscaling)

### Using the DigitalOcean Control Panel[](#using-the-digitalocean-control-panel)

To enable autoscaling on an existing node pool, navigate to your cluster in [the Kubernetes section of the control panel](https://cloud.digitalocean.com/kubernetes/clusters), then click the **Resources** tab. Click the three dots to reveal the option to resize the node pool manually or enable autoscaling.

![DOKS node pool screen](https://docs.digitalocean.com/screenshots/kubernetes/autoscaling-node-pool-screen.8db1bfe103359dce87f77c40cf6a7d49f1d0fdcc8417397b7a2b02ff6bad6865.png)

Select **Resize or Autoscale**, and a window opens prompting for configuration details. After selecting **Autoscale**, you can set the following options for the node pool:

*   **Minimum Nodes**: Determines the smallest size the cluster is allowed to “scale down” to; must be greater than or equal to `0` and no greater than **Maximum Nodes**. See [Scaling to Zero](/products/kubernetes/how-to/autoscale/#scaling-to-zero) for recommendations to follow for scaling down to zero.
*   **Maximum Nodes**: Determines the largest size the cluster is allowed to “scale up” to. The upper limit is constrained by the Droplet limit on your account, which is `25` by default, and the number of Droplets already running, which subtracts from that limit. [You can request to have your Droplet limit increased](https://cloud.digitalocean.com/account/profile/droplet_limit_increase).

![DOKS node pool resizing window](https://docs.digitalocean.com/screenshots/kubernetes/autoscaling-configuration-window.b64d9ef5413d9bee52012f3701eab6084edac7d9740f1e87f5960ece1c2f7225.png)

### Using doctl[](#using-doctl)

You can use [`doctl`](/reference/doctl/) to enable cluster autoscaling on any node pool. You need to provide three specific configuration values:

*   `auto-scale`: Specifies that autoscaling should be enabled
*   `min-nodes`: Determines the smallest size the cluster is allowed to “scale down” to; must be greater than or equal to `0` and no greater than `max-nodes`. See [Scaling to Zero](/products/kubernetes/how-to/autoscale/#scaling-to-zero) for recommendations to follow for scaling down to zero.
*   `max-nodes`: Determines the largest size the cluster is allowed to “scale up” to. The upper limit is constrained by the Droplet limit on your account, which is `25` by default, and the number of Droplets already running, which subtracts from that limit. [You can request to have your Droplet limit increased](https://cloud.digitalocean.com/account/profile/droplet_limit_increase).

You can apply autoscaling to a node pool at cluster creation time if you use a semicolon-delimited string.

    doctl kubernetes cluster create mycluster --node-pool "name=mypool;auto-scale=true;min-nodes=1;max-nodes=10"

You can also configure new node pools to have autoscaling enabled at creation time.

    doctl kubernetes cluster node-pool create mycluster mypool --auto-scale --min-nodes 1 --max-nodes 10

If your cluster is already running, you can enable autoscaling on an any existing node pool.

    doctl kubernetes cluster node-pool update mycluster mypool --auto-scale --min-nodes 1 --max-nodes 10

### Scaling to Zero[](#scaling-to-zero)

The Cluster Autoscaler supports scaling a given node pool down to zero. This allows the autoscaler to run simulations and optimize an under-utilised node pool to completely scale it down if possible. You can enable autoscaling using the [control panel or the CLI](#enable-autoscaling). When planning to scale a node pool down to zero, DigitalOcean recommends following these guidelines:

*   Maintain at least one fixed node pool of the smallest size with one node. This allows the DOKS [managed components](/products/kubernetes/details/managed/) to always be available and also provides headroom for the cluster autoscaler to scale down larger node sizes as needed. For node pools of larger size, enable autoscaling and set the minimum number of nodes to zero.
    
*   If the unavailability of the managed components is not a consideration, then you can completely scale down all node pools of your cluster to zero nodes. To do this, set both the minimum and maximum nodes for each pool to zero.
    
    This leaves all workloads in a pending state because there are no nodes present in the cluster. The workloads don’t run until you scale a node pool up again on demand.
    

### Flexible Node Pool Selection[](#flexible-node-pool-selection)

In clusters with multiple nodes pools, you can specify how the autoscaler chooses which pool to scale up when an additional node is required. The autoscaler defaults to choosing node pools randomly, which is not always optimal. CA [expanders](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#what-are-expanders) are strategies for selecting the best node pool to scale up.

You can customize the expanders in your clusters using one of the following options:

*   Random: Selects a node pool to scale at random. This is the default expander.
*   Priority: Selects the node pool with the highest priority according to the [customer-provided configuration](/products/kubernetes/how-to/autoscale/#configuring-priority-expander). This expander is useful in case of capacity constraints limiting the ability to scale a specific node pool.
*   Least-waste: Selects the node pool which minimizes the amount of idle resources.

#### Configuring Custom Expanders[](#configuring-custom-expanders)

You can specify expanders using [`doctl`](/reference/doctl/) version `v1.128.0` or higher with the `--expanders` flag. The flag expects a comma-separated list with the following values: `random`, `priority`, or `least-waste`.

The following example specifies to use the priority and random expanders. The autoscaler uses each of the expanders from the list to narrow down the selection of node pools to scale up, until a single best node pool remains. If applying custom expanders still results in multiple node pools to choose from, it selects from the remaining node pools randomly.

    doctl kubernetes cluster create cluster-with-custom-expanders --region nyc1 --version latest --node-pool "name=pool1;size=s-2vcpu-2gb;count=3" --expanders priority,random

You can also update an existing cluster to use flexible node pool selection for autoscaling:

    doctl kubernetes cluster update cluster-with-custom-expanders --expanders priority,random 

To remove any expander customizations and reset to the default random selection, pass an empty list of expanders:

    doctl kubernetes cluster update cluster-with-custom-expanders --expanders ""

#### Configuring Priority Expander[](#configuring-priority-expander)

Once you [enable the priority expander](/products/kubernetes/how-to/autoscale/#configuring-custom-expanders), DOKS creates a starter ConfigMap named `cluster-autoscaler-priority-expander` in the `kube-system` namespace with the following content:

    apiVersion: v1
    kind: ConfigMap
    metadata:
      labels:
        c3.doks.digitalocean.com/component: cluster-autoscaler
        c3.doks.digitalocean.com/plane: data
        doks.digitalocean.com/managed: "true"
      name: cluster-autoscaler-priority-expander
      namespace: kube-system
    data:
      priorities: |2 
    
        1:
          - .*

Warning

Do not rename this ConfigMap or remove the `doks` labels.

You need to provide a priority list of node pools in this ConfigMap. To do this, update the `.data.priorities` field to reflect the priorities of the node pools in your cluster. The priorities configuration is a YAML object with keys and values:

*   Keys are the integer priority numbers.
    
*   Values are the lists of node pools assigned this priority. You can provide the node pools using their IDs and can also specify regular expressions.
    

For example, the configuration below selects pool ID `11aa5b5c-817e-4213-a303-b65b4d47ad84` as the best option, pool ID `72da2c27-14a3-434e-9db1-2d405cbc24d5` as the next best option, and all remaining pools using regex `.*` to match any string as the lowest-priority, fallback option:

    100:
      - 11aa5b5c-817e-4213-a303-b65b4d47ad84
    90:
      - 72da2c27-14a3-434e-9db1-2d405cbc24d5
    1:
      - .*

To find the IDs of your node pools, use `doctl`:

    doctl kubernetes clusters node-pool list cluster-with-custom-expanders

The command returns the following output:

    ID                                      Name                  Size               Count    Tags                                                       Labels    Taints    Nodes
    11aa5b5c-817e-4213-a303-b65b4d47ad84    s-2vcpu-2gb-amd       s-2vcpu-2gb-amd    1        k8s,k8s:08011cad-c5c1-430e-8082-5392b02149a4,k8s:worker    map[]     []        [s-2vcpu-2gb-amd-f9un]
    72da2c27-14a3-434e-9db1-2d405cbc24d5    s-2vcpu-2gb           s-2vcpu-2gb        0        k8s,k8s:08011cad-c5c1-430e-8082-5392b02149a4,k8s:worker    map[]     []        []

#### Priority Expander Example[](#priority-expander-example)

One of the biggest use-cases for priority expansion is to prepare a cluster for possible capacity constraints, which is especially relevant for very large clusters (100 nodes and more) with large nodes. Suppose your preferred node type is `c-8`, CPU-optimized Droplet with 8 vCPUs. You can find similar Droplet sizes from the output of `doctl compute size list`, and create additional, fallback node pools. Suitable alternatives for `c-8` might be, for example, `s-8vcpu-16gb-amd`, `s-8vcpu-16gb-intel`.

Note

Choose node pools with Droplets that are not on the same fleet as fallback for capacity constraints. For example, `c-16` is not a good fallback for `c-8` as both `c-8` and `c-16` Droplets belong to the same fleet, which means they reside on the same hypervisors and the available amounts of `c-8` and `c-16` Droplets change in tandem.

You can create a cluster with 3 node pools having one preferred size and two fallback sizes. You can scale the fallback pools [to zero nodes](/products/kubernetes/how-to/autoscale/#scaling-to-zero) until needed.

    doctl kubernetes clusters create cluster-with-priority-expander --version latest --node-pool "name=primary;size=c-8;auto-scale=true;count=3;min-nodes=1;max-nodes=10;" --node-pool "name=fallback1;size=s-8vcpu-16gb-amd;auto-scale=true;count=0;min-nodes=0;max-nodes=10;" --node-pool "name=fallback2;size=s-8vcpu-16gb-intel;auto-scale=true;count=0;min-nodes=0;max-nodes=10" --region nyc1 --expanders priority

Next, to see the list of node pools, use the following command:

    doctl kubernetes clusters node-pool list cluster-with-priority-expander

The output looks similar to the following:

    ID                                      Name         Size                  Count    Tags                                                       Labels    Taints    Nodes
    5421e5fb-7fb1-4893-b65f-1887ab6c3ea6    primary      c-8                   3        k8s,k8s:2faf374d-5040-4c05-a285-f18d92a4e90c,k8s:worker    map[]     []        [primary-t0p2t primary-t0p2l primary-t0p22]
    0255d0cc-a010-4eef-a3bc-38dc784b5888    fallback1    s-8vcpu-16gb-amd      0        k8s,k8s:2faf374d-5040-4c05-a285-f18d92a4e90c,k8s:worker    map[]     []        []
    635eb7c0-c3db-4d22-b883-b771f07c239b    fallback2    s-8vcpu-16gb-intel    0        k8s,k8s:2faf374d-5040-4c05-a285-f18d92a4e90c,k8s:worker    map[]     []        []

Next, in the `cluster-autoscaler-priority-expander` ConfigMap, specify the priority list for this cluster to look similar to the following:

    100:
      - 5421e5fb-7fb1-4893-b65f-1887ab6c3ea6
    50:
      - 0255d0cc-a010-4eef-a3bc-38dc784b5888
      - 635eb7c0-c3db-4d22-b883-b771f07c239b

Upon a scale-up event, CA first attempts to create a node in the `primary` pool. If it encounters an error, such as an insufficient capacity error, it moves on to the next priority node pools, `fallback1` and `fallback2`, choosing randomly between the two.

Note

When the `primary` pool node sizes become available again, CA does not redistribute workloads to the higher-priority pool. If you want, you can achieve such redistribution by deleting the fallback nodes using`doctl kubernetes cluster node-pool delete-node` one by one. Deleting nodes drains workloads from them, and the evicted pods that can’t be scheduled, trigger new scale-up events. Since the `primary` node size is now available, scale-up results in creating nodes of this preferred size instead of the fallback size.

## Disabling Autoscaling[](#disabling-autoscaling)

### Using the DigitalOcean Control Panel[](#using-the-digitalocean-control-panel-1)

To disable autoscaling on an existing node pool, navigate to your cluster in [the Kubernetes section of the control panel](https://cloud.digitalocean.com/kubernetes/clusters), then click the **Resources** tab. Click the three dots to reveal the option to resize the node pool manually or enable autoscaling.

![DOKS node pool screen](https://docs.digitalocean.com/screenshots/kubernetes/autoscaling-node-pool-screen.8db1bfe103359dce87f77c40cf6a7d49f1d0fdcc8417397b7a2b02ff6bad6865.png)

Select **Resize or Autoscale**, and a window opens prompting for configuration details. Select **Fixed size** and configure the number of nodes you want to assign to the pool.

![DOKS node pool configuration window](https://docs.digitalocean.com/screenshots/kubernetes/autoscaling-configuration-window-fixed-size.bae91a1a35f81e0fc8cf1e7fbd92a0cdab3e6455d798213b677b03c310126914.png)

### Using doctl[](#using-doctl-1)

To disable autoscaling, run an `update` command that specifies the node pool and cluster:

    doctl kubernetes cluster node-pool update mycluster mypool --auto-scale=false

## Viewing Cluster Autoscaler Status[](#viewing-cluster-autoscaler-status)

You can check the status of the Cluster Autoscaler to view recent events or for debugging purposes.

Check `kube-system/cluster-autoscaler-status` config map by running the following command:

    kubectl get configmap cluster-autoscaler-status -o yaml -n kube-system

The command returns results such as this:

    apiVersion: v1
    data:
      status: |+
        Cluster-autoscaler status at 2021-01-27 21:57:30.462764772 +0000 UTC:
        Cluster-wide:
          Health:      Healthy (ready=5 unready=0 notStarted=0 longNotStarted=0 registered=5 longUnregistered=0)
                       LastProbeTime:      2021-01-27 21:57:30.27867919 +0000 UTC m=+499650.735961122
                       LastTransitionTime: 2021-01-22 03:11:00.371995979 +0000 UTC m=+60.829277965
          ScaleUp:     NoActivity (ready=5 registered=5)
                       LastProbeTime:      2021-01-27 21:57:30.27867919 +0000 UTC m=+499650.735961122
                       LastTransitionTime: 2021-01-22 19:09:20.360421664 +0000 UTC m=+57560.817703589
          ScaleDown:   NoCandidates (candidates=0)
                       LastProbeTime:      2021-01-27 21:57:30.27867919 +0000 UTC m=+499650.735961122
                       LastTransitionTime: 2021-01-22 19:09:20.360421664 +0000 UTC m=+57560.817703589
    ...

To learn more about what is published in the config map, see [What events are emitted by CA?](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#what-events-are-emitted-by-ca).

In the case of an error, you can troubleshoot by using `kubectl get events -A` or `kubectl describe <resource-name>` to check for any events on the Kubernetes resources.

## Autoscaling in Response to Heavy Resource Use[](#autoscaling-in-response-to-heavy-resource-use)

Pod creation and destruction can be automated by a Horizontal Pod Autoscaler (HPA), which monitors the resource use of nodes and generates pods when certain events occur, such as sustained CPU spikes, or memory use surpassing a certain threshold. This, combined with a CA, gives you powerful tools to configure your cluster’s responsiveness to resource demands — an HPA that ensures synchronicity between resource use and the number of pods, and a CA that ensures synchronicity between the number of pods and the cluster’s size.

For a walk-through that builds an autoscaling cluster and demonstrates the interplay between an HPA and a CA, see [Example of Kubernetes Cluster Autoscaling Working With Horizontal Pod Autoscaling](/products/kubernetes/how-to/set-up-autoscaling/).

## PodDisruptionBudget Support[](#poddisruptionbudget-support)

A `PodDisruptionBudget` (PDB) specifies the minimum number of replicas that an application can tolerate having during a voluntary disruption, relative to how many it is intended to have. For example, if you set the `replicas` value for a pod to `5`, and set the PDB to `1`, potentially disruptive actions like cluster upgrades and resizes occur with no fewer than four pods running.

When scaling down a cluster, the DOKS autoscaler respects this setting, and follows [the documented Kubernetes procedure for draining and deleting nodes when a PDB has been specified](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#does-ca-work-with-poddisruptionbudget-in-scale-down).

We recommend you set a PDB for your workloads to ensure graceful scale down. For more information, see [Specifying a Disruption Budget for your Application](https://kubernetes.io/docs/tasks/run-application/configure-pdb/) in the Kubernetes documentation.

In this article...

*   [Enable Autoscaling](#enable-autoscaling)
    *   [Using the DigitalOcean Control Panel](#using-the-digitalocean-control-panel)
    *   [Using doctl](#using-doctl)
    *   [Scaling to Zero](#scaling-to-zero)
    *   [Flexible Node Pool Selection](#flexible-node-pool-selection)
        *   [Configuring Custom Expanders](#configuring-custom-expanders)
        *   [Configuring Priority Expander](#configuring-priority-expander)
        *   [Priority Expander Example](#priority-expander-example)
*   [Disabling Autoscaling](#disabling-autoscaling)
    *   [Using the DigitalOcean Control Panel](#using-the-digitalocean-control-panel-1)
    *   [Using doctl](#using-doctl-1)
*   [Viewing Cluster Autoscaler Status](#viewing-cluster-autoscaler-status)
*   [Autoscaling in Response to Heavy Resource Use](#autoscaling-in-response-to-heavy-resource-use)
*   [PodDisruptionBudget Support](#poddisruptionbudget-support)

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
