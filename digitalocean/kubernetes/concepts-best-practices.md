---
source: https://docs.digitalocean.com/products/kubernetes/concepts/best-practices/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                Kubernetes Best Practices | DigitalOcean Documentation

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

*   [Concepts](/products/kubernetes/concepts/) 
*   Best Practices

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Kubernetes Best Practices

Validated on 10 Sep 2019 • Last edited on 17 Apr 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

Kubernetes clusters require a balance of resources in both pods and nodes to maintain high availability and scalability. This article outlines some best practices to help you avoid common disruption problems.

## Use Replicas Instead of Bare Pods[](#use-replicas-instead-of-bare-pods)

We recommend deploying all of your applications in a highly available manner. This means [deploying multiple stable replicas](https://kubernetes.io/docs/concepts/workloads/) of your applications and not using [bare pods](https://kubernetes.io/docs/concepts/workloads/controllers/job/#bare-pods). Using replicas ensures that a stable set of pods are running your application at any given time.

### How do I do this?[](#how-do-i-do-this)

Use the `replicas` field in your application spec to define at least three replicas:

An example app spec

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: frontend
      labels:
        app: guestbook
        tier: frontend
    spec:
      # modify replicas according to your case
      replicas: 3
      selector:
        matchLabels:
          tier: frontend
      template:
        metadata:
          labels:
            tier: frontend
        spec:
          containers:
          - name: php-redis
            image: gcr.io/google_samples/gb-frontend:v3

## Size Nodes Appropriately[](#size-nodes-appropriately)

The size of nodes determines the maximum amount of memory you can allocate to pods. Because of this, we recommend using nodes with less than 2GB of allocatable memory only for development purposes and not production. For production clusters, we recommend sizing nodes large enough (2.5 GB or more) to absorb the workload of a down node.

### How do I do this?[](#how-do-i-do-this-1)

During [cluster creation](/products/kubernetes/how-to/create-clusters/), choose a plan from the **NODE PLAN** drop-down menu that fits your project’s purpose. Plans are divided into two categories: **Development plans** and **Production plans**.

![Cluster capacity section with node plan selected](https://docs.digitalocean.com/screenshots/kubernetes/k8s-node-plan.c209c38ca68d476637df6aa1400e40a27dc63714fc116508301f78957efa2aa1.png)

## Size Nodes Pools For High Availability[](#size-nodes-pools-for-high-availability)

To further ensure high availability, node pools with production workloads should have at least three nodes. This gives the cluster more flexibility to distribute and schedule work on other nodes if a node becomes unavailable.

### How do I do this?[](#how-do-i-do-this-2)

You can specify three or more nodes during a [cluster’s creation](/products/kubernetes/how-to/create-clusters/#choose-cluster-capacity) or you can [configure the autoscale function](/products/kubernetes/how-to/autoscale/) to ensure minimum cluster size of three nodes.

## Set Requests and Limits[](#set-requests-and-limits)

To keep your cluster running efficiently, we recommend defining the `requests` and `limits` objects in your application spec for all deployments.

*   `requests` - Specifies how much of a resource (such as CPU and memory resources) a pod is allowed to request on a node before being scheduled. If the node doesn’t have the available resources, the pod is not scheduled. This prevents pods from being scheduled on nodes that are already under heavy workload.
    
*   `limits` - Specifies the amount of resources (such as CPU and memory resources) a pod is allowed to utilize on a node. This prevents pods from potentially slowing down the work of other pods.
    

### How do I do this?[](#how-do-i-do-this-3)

To set `requests` and `limits`, define their values in your application spec. See the [Kubernetes’ documentation for more resource types](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#resource-types).

Example app spec

    apiVersion: v1
    kind: Deployment
    metadata:
      name: frontend
    spec:
      containers:
      - name: app
        image: images.my-company.example/app:v4
        resources:
          requests:
            cpu: 250m
            memory: 64Mi
          limits:
            memory: 128Mi
            cpu: 500m
      - name: log-aggregator
        image: images.my-company.example/log-aggregator:v6
        resources:
          requests:
            memory: 64Mi
            cpu: 250m
          limits:
            memory: 128Mi
            cpu: 500m

## Set Pod Disruption Budgets[](#set-pod-disruption-budgets)

To avoid disruptions to your production, such as during cluster upgrades, you can set up a [pod disruption budget (PDB)](https://kubernetes.io/docs/concepts/workloads/pods/disruptions/) that limits the number of replicated pods that can be down simultaneously. For example, you can have a replica count of 10 and a PDB that allows downtime of three simultaneous replicas by setting the `minAvailable` to 7.

### How do I do this?[](#how-do-i-do-this-4)

To set up a pod disruption budget, you need to create a `PodDisruptionBudget` policy spec.

`policy/example-app-pdb.yaml`

    apiVersion: policy/v1
    kind: PodDisruptionBudget
    metadata:
      name: zk-pdb
    spec:
      minAvailable: 7
      selector:
        matchLabels:
          app: example-app

You can set the minimum available pods for an application using the `minAvailable` field and apply it to your applications using the `matchLabels` object.

## Enable Automatic Upgrades[](#enable-automatic-upgrades)

Enabling automatic upgrades ensures that your cluster is running the latest features, security patches, and stability improvements.

We also recommend enabling [surge upgrades](/products/kubernetes/how-to/upgrade-cluster/#surge-upgrades) when upgrading a cluster.

### How do I do this?[](#how-do-i-do-this-5)

To enable automatic upgrades, follow our [Kubernetes upgrade guide](/products/kubernetes/how-to/upgrade-cluster/).

## Enable Surge Upgrades[](#enable-surge-upgrades)

Surge upgrades reduce the overall cluster upgrade time and impact on applications. We recommend enabling surge upgrades when upgrading an existing cluster. Surge upgrades are enabled by default when you create a new cluster.

### How do I do this?[](#how-do-i-do-this-6)

To enable surge upgrades, follow our [surge upgrade guide](/products/kubernetes/how-to/upgrade-cluster/#surge-upgrades).

## Check Cluster Linter Messages[](#check-cluster-linter-messages)

[Clusterlint](/support/clusterlint-error-fixes/) is a standalone tool that connects to the cluster’s API server and flags issues with workloads deployed in a cluster. These issues might cause downtime during maintenance or upgrades and could complicate the maintenance or upgrade itself. Using `clusterlint` regularly can inform you of ongoing issues that otherwise might not be immediately apparent.

### How to do this?[](#how-to-do-this)

You can access `clusterlint` using three different methods:

*   **Control panel** - To view `clusterlint` messages from the control panel, click **Kubernetes** in the main menu menu, then select your cluster from the list of clusters. From the cluster’s **Overview** page, under **Production Readiness Check**, click **Run Check**. After the card updates, it displays any `clusterlint` results.
*   **DigitalOcean API call** - [Send a diagnostic request](https://developers.digitalocean.com/documentation/v2/#run-clusterlint-checks-on-a-kubernetes-cluster) to the DigitalOcean API and then [retrieve the results](https://developers.digitalocean.com/documentation/v2/#fetch-clusterlint-diagnostics-for-a-kubernetes-cluster).
*   **Command line tool** - [Install `clusterlint` from the command line](https://github.com/digitalocean/clusterlint) and begin using it to access your clusters.

![Linter messages in upgrade window](https://docs.digitalocean.com/screenshots/kubernetes/k8s-linter.111a929772f634c0ff2ae0c41887fde50af241718769570c1a94a8a6b660acdc.png)

For a list of common `clusterlint` errors and their respective fixes, see [Clusterlint Error Fixes](/support/clusterlint-error-fixes/).

## Check Reconciler Messages[](#check-reconciler-messages)

The DOKS reconciler checks the [managed elements of the cluster](/products/kubernetes/details/managed/) during cluster reconciliation and returns information about any issues. These include issues related to account and resource limits and do not contain information about events inside the cluster.

### How to do this?[](#how-to-do-this-1)

You can access the reconciler messages by navigating to the **Overview** tab of your cluster in the DigitalOcean Control Panel.

![Reconciler messages](https://docs.digitalocean.com/screenshots/kubernetes/reconciler-messages.a508a7ee9e6d9976b8bdc9f2933e26c1aa66bd6b8ae8bb26cc9f9ee15660e1c1.png)

The messages only appear if the reconciler finds any issues. Review each message and follow the instructions in the message to fix the issue. These are not real-time messages, which means that if you resolve the issue, it may take some time for its status to update.

In this article...

*   [Use Replicas Instead of Bare Pods](#use-replicas-instead-of-bare-pods)
    *   [How do I do this?](#how-do-i-do-this)
*   [Size Nodes Appropriately](#size-nodes-appropriately)
    *   [How do I do this?](#how-do-i-do-this-1)
*   [Size Nodes Pools For High Availability](#size-nodes-pools-for-high-availability)
    *   [How do I do this?](#how-do-i-do-this-2)
*   [Set Requests and Limits](#set-requests-and-limits)
    *   [How do I do this?](#how-do-i-do-this-3)
*   [Set Pod Disruption Budgets](#set-pod-disruption-budgets)
    *   [How do I do this?](#how-do-i-do-this-4)
*   [Enable Automatic Upgrades](#enable-automatic-upgrades)
    *   [How do I do this?](#how-do-i-do-this-5)
*   [Enable Surge Upgrades](#enable-surge-upgrades)
    *   [How do I do this?](#how-do-i-do-this-6)
*   [Check Cluster Linter Messages](#check-cluster-linter-messages)
    *   [How to do this?](#how-to-do-this)
*   [Check Reconciler Messages](#check-reconciler-messages)
    *   [How to do this?](#how-to-do-this-1)

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

Try using different keywords or simplifying y
