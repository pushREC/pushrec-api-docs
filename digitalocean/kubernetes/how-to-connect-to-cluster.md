---
source: https://docs.digitalocean.com/products/kubernetes/how-to/connect-to-cluster/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Connect to a DigitalOcean Kubernetes Cluster | DigitalOcean Documentation

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
*   Connect to a Cluster

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Connect to a DigitalOcean Kubernetes Cluster

Validated on 13 Nov 2019 • Last edited on 17 Apr 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

DigitalOcean Kubernetes clusters are typically managed from a local machine or sometimes from a remote management server. In either case, the management machine needs two things:

1.  [`kubectl`](https://kubernetes.io/docs/reference/kubectl/overview/), the official Kubernetes command-line tool, to connect to and interact with the cluster.
    
    The Kubernetes project provides [installation instructions for `kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl/) on a variety of platforms. Use `kubectl version` to verify that your installation is working and [within one minor version of your cluster](https://kubernetes.io/docs/tasks/tools/install-kubectl/#before-you-begin).
    
2.  `doctl`, the official DigitalOcean command-line tool, to manage config files and set context.
    
    The [`doctl` GitHub repo](https://github.com/digitalocean/doctl) has instructions for installing `doctl`.
    

## Get an Authentication Token or Certificate[](#authenticate)

After creating a cluster, you need to add an authentication token or certificate to your `kubectl` configuration file to connect.

### Version requirements for obtaining tokens[](#version-requirements-for-obtaining-tokens)

When connecting to these Kubernetes versions, generating credentials creates a revocable OAuth token. (If using `doctl`, as recommended, you must also have version `1.32.2` or higher installed to obtain an OAuth token.)

*   Any release of Kubernetes after version `1.16`.
*   Kubernetes version `1.15.3-do.3` or higher
*   Kubernetes version `1.14.6-do.3` or higher
*   Kubernetes version `1.13.10-do.3` or higher

If you are not running these versions of Kubernetes, or are using a legacy version of `doctl`, you will be granted a certificate instead.

### Generate Using doctl (Recommended)[](#doctl)

To configure authentication from the command line, use the following command, substituting the name of your cluster.

    doctl kubernetes cluster kubeconfig save use_your_cluster_name

This downloads the `kubeconfig` for the cluster, merges it with any existing configuration from `~/.kube/config`, and automatically handles the authentication token or certificate.

Under the hood, this automatically generates a revocable OAuth token when using recent versions of Kubernetes and `doctl`, and automatically renews a certificate with legacy versions:

*   **Revocable OAuth token**. If you meet [the version requirements listed above](#version-requirements-for-obtaining-tokens), you’ll obtain an OAuth token. You can view and revoke this token in the [**Applications & API** section](https://cloud.digitalocean.com/account/api/tokens) of the control panel.
    
*   **Automatic certificate renewal**. With legacy versions of `doctl` or Kubernetes, this creates a certificate that is valid for seven days, renews automatically, and cannot be revoked.
    
    You can [upgrade Kubernetes clusters](/products/kubernetes/how-to/upgrade-cluster/) to newer patch versions and minor versions to use tokens instead.
    

### Download from the Control Panel[](#download)

There is also a cluster configuration file you can download manually from the [control panel](https://cloud.digitalocean.com).

Click the name of the cluster to go to its **Overview** tab. In the **Configuration** section, click **Download Config File** to download its `kubeconfig` file. The file is named `<clustername>-kubeconfig.yaml`. Put this file in your `~/.kube` directory, and pass it to `kubectl` with the `--kubeconfig` flag. For example:

    kubectl --kubeconfig=~/.kube/<clustername>-kubeconfig.yaml get nodes

This generates a revocable OAuth token when using recent versions of Kubernetes and generates a certificate for legacy versions:

*   **Revocable OAuth token**. If you meet [the version requirements listed above](#version-requirements-for-obtaining-tokens), you’ll obtain an OAuth token. You can view and revoke this token in the [**Applications & API** section](https://cloud.digitalocean.com/account/api/tokens) of the control panel.
    
*   **Expiring certificate**. With legacy versions of Kubernetes, this creates a certificate that is valid for 7 days that cannot be revoked. Download the file again every 7 days to retain access to the cluster.
    
    You can [upgrade Kubernetes clusters](/products/kubernetes/how-to/upgrade-cluster/) to newer patch versions and minor versions to use tokens instead.
    

## Connect to the Cluster[](#connect-to-the-cluster)

Once the cluster configuration file is in place, you can create, manage, and deploy clusters using `kubectl`. See [the official `kubectl` documentation](https://kubernetes.io/docs/reference/kubectl/overview/) to learn more about its commands and options.

From here, you can also [add DigitalOcean Load Balancers](/products/kubernetes/how-to/add-load-balancers/) and [add volumes](/products/kubernetes/how-to/add-volumes/) to your cluster.

### Contexts[](#contexts)

In Kubernetes, a [context](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/#context) is used to group access parameters under a convenient name. The configuration for every cluster will contain a stanza for contexts with cluster-specific values which look like this:

Example context configuration stanza

    contexts:
    - context:
        cluster: do-sfo2-example-cluster-01
        user: do-sfo2-example-cluster-01-admin
      name: do-sfo2-example-cluster-01
    current-context: do-sfo2-example-cluster-01

When you use `kubectl`, the commands you run affect the default context unless you specify a different one with the `--context` flag (for example, `kubectl get nodes --context=do-nyc1-stage`).

To check the current default context, use:

    kubectl config current-context

If you get a `current-context is not set` error, you need to set a default context.

To list all available contexts, use:

    kubectl config get-contexts

The terminal returns output that looks like this:

    CURRENT   NAME                         CLUSTER                      AUTHINFO                         NAMESPACE
    *         do-sfo2-example-cluster-01   do-sfo2-example-cluster-01   do-sfo2-example-cluster-01-admin

The default context is specified with an asterisk under “CURRENT”. To set the default context to a different one, use:

    kubectl config use-context do-sfo2-example-cluster-01

### Namespaces[](#namespaces)

In Kubernetes, [namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) are a way to divide cluster resources between multiple users. They’re useful when you have many users working on the same cluster. You can create multiple namespaces in a cluster, and resources in one namespace are hidden from other namespaces.

Learn more in [the Kubernetes namespaces walk-through](https://kubernetes.io/docs/tasks/administer-cluster/namespaces-walkthrough/).

In this article...

*   [Get an Authentication Token or Certificate](#authenticate)
    *   [Version requirements for obtaining tokens](#version-requirements-for-obtaining-tokens)
    *   [Generate Using doctl (Recommended)](#doctl)
    *   [Download from the Control Panel](#download)
*   [Connect to the Cluster](#connect-to-the-cluster)
    *   [Contexts](#contexts)
    *   [Namespaces](#namespaces)

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

Try using different keywords or simplifying you
