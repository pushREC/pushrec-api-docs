---
source: https://docs.digitalocean.com/products/kubernetes/how-to/manage-1click-apps/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Manage Kubernetes 1-Click Applications | DigitalOcean Documentation

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
*   Manage 1-Click Apps

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Manage Kubernetes 1-Click Applications

Validated on 26 Apr 2022 • Last edited on 23 Jan 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

[DigitalOcean Marketplace](https://marketplace.digitalocean.com/category/kubernetes) provides a variety of apps and stacks that you can install to run pre-configured container images on Kubernetes clusters. You can install these apps directly to a new or existing Kubernetes cluster.

Most Kubernetes 1-Click Apps are [Helm charts](https://helm.sh/docs/topics/charts/#helm) and require [Helm 3](https://helm.sh/) package manager to run. Other apps, such as Linkerd and Knative, use command-line tools or [operators](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/#operators-in-kubernetes). For Helm charts, you must install Helm before you can run these apps and also use various `helm` commands to customize the app.

You can find the corresponding stack for every 1-Click App in the [DigitalOcean Marketplace GitHub repo](https://github.com/digitalocean/marketplace-kubernetes/tree/master/stacks/).

## Installing 1-Click Apps[](#installing-1-click-apps)

You can install Kubernetes 1-Click Apps using either the [DigitalOcean Control Panel](#installing-via-control-panel) or the [command line](#installing-via-command-line).

### Installing via Control Panel[](#installing-via-control-panel)

To install an app using the DigitalOcean Control Panel, navigate to your cluster in [the Kubernetes section of the control panel](https://cloud.digitalocean.com/kubernetes/clusters), then click the **Marketplace** tab. Click **Install** to install one of the recommended apps or search for an app in the search field.

![Empty Add-ons tab](https://docs.digitalocean.com/screenshots/kubernetes/empty-addons-tab.2f841eed9fcb72553341cc5acfa91b62981d3a255c20197eb027da510b62432d.png)

Installing an app automatically executes the deployment script `deploy.sh`, which you can find in the corresponding app folder in the [GitHub repository](https://github.com/digitalocean/marketplace-kubernetes/tree/master/stacks). For example, the nginx deployment script executes `helm` commands and looks similar to the following:

    ...
    # Add the repo.
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo update > /dev/null
    
    # Create the chart.
    STACK="ingress-nginx"
    CHART="ingress-nginx/ingress-nginx"
    CHART_VERSION="4.0.13"
    NAMESPACE="ingress-nginx"
    if [ -z "${MP_KUBERNETES}" ]; then
      # Use local version of values.yml.
      ROOT_DIR=$(git rev-parse --show-toplevel)
      values="$ROOT_DIR/stacks/ingress-nginx/values.yml"
    else
      # Use GitHub-hosted master version of values.yml.
      values="https://raw.githubusercontent.com/digitalocean/marketplace-kubernetes/master/stacks/ingress-nginx/values.yml"
    fi
    
    # Install the chart. A timeout of 10m is needed so that DigitalOcean load balancers can spin up.
    helm upgrade "$STACK" "$CHART" \
      --atomic \
      --create-namespace \
      --install \
      --namespace "$NAMESPACE" \
      --values "$values" \
      --version "$CHART_VERSION" \
      --timeout 10m0s

Some apps use the vendor-recommended tooling for installation. For example, the Linkerd deployment script uses `linkerd` commands to install the app and looks similar to the following:

    ...
    LINKERD2_VERSION="stable-2.11.0"
    TMP_DIR=$(mktemp -d)
    
    # Determine operating system.
    if [ "$(uname -s)" = "Darwin" ]; then
      OS=darwin
    else
      OS=linux-amd64
    fi
    
    FILENAME="linkerd2-cli-$LINKERD2_VERSION-$OS"
    URL="https://github.com/linkerd/linkerd2/releases/download/$LINKERD2_VERSION/$FILENAME"
    BINARY="$TMP_DIR/$FILENAME"
    
    # Download Linkerd.
    wget -q $URL -O "$BINARY" && chmod +x "$BINARY"
    
    # Set kubectl namespace.
    kubectl config set-context --current --namespace=linkerd
    
    # Deploy linkerd.
    $BINARY install --ignore-cluster | kubectl apply -f -
    
    # Ensure services are running.
    kubectl get deployments -o custom-columns=NAME:.metadata.name | tail -n +2 | while read -r line
    do
      kubectl rollout status -w deployment/"$line"
    done
    
    # Install the viz extension
    $BINARY viz install | kubectl apply -f -
    ...

Note

You cannot access the installation logs. If an installation fails, changes are reverted.

The installed app appears in the **History of Installed 1-Click Apps** section of the tab.

![History of 1-Click Apps](https://docs.digitalocean.com/screenshots/kubernetes/history-installed-1clicks.b039b3eb40dab603ec81c20e633bef41b1da7249343c943c6536a6d6206610e3.png)

### Installing via Command Line Using Helm[](#installing-via-command-line-using-helm)

To install a Helm chart using the command line, run the `helm repo add`, `helm repo update`, and `helm install commands`. For example, run the following commands to install Ingress-NGINX:

    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo update ingress-nginx
    helm search repo ingress-nginx
    NGINX_CHART_VERSION="<chart-version>"
    helm install ingress-nginx ingress-nginx/ingress-nginx --version "$NGINX_CHART_VERSION" \
      --namespace ingress-nginx \
      --create-namespace \
      -f "<path-to-values-file>.yml"

For more installation instructions, refer to the app’s page on DigitalOcean Marketplace.

## Install via doctl[](#install-via-doctl)

How to Install 1-Click Apps Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl kubernetes 1-click install`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/kubernetes/1-click/install/) for more details:
    
        doctl kubernetes 1-click install <cluster-id> [flags]
    
    The following example installs Loki and Netdata on a Kubernetes cluster with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`:
    
        doctl kubernetes 1-click install f81d4fae-7dec-11d0-a765-00a0c91e6bf6 --1-clicks loki,netdata
    

## Verifying the Installation[](#verifying-the-installation)

You can verify that the pods are up and running by using the `kubectl get pods --all-namespaces app.kubernetes.io/name=<app-name>` command. For example:

    kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx

All pods should be in a `READY` state with a `STATUS` of `Running` as shown in the following example:

    NAMESPACE       NAME                                        READY   STATUS    RESTARTS   AGE
    ingress-nginx   ingress-nginx-controller-664d8d6d67-6x4dd   1/1     Running   0          3m
    ingress-nginx   ingress-nginx-controller-664d8d6d67-khm5x   1/1     Running   0          3m

Once the installation is complete, see the app’s page on DigitalOcean Marketplace for directions on how to use it.

## Customizing and Upgrading 1-Click Apps[](#customizing-and-upgrading-1-click-apps)

The steps to customize and upgrade an app can vary depending on the app. For Helm charts, you can customize the [default values](https://helm.sh/docs/chart_template_guide/values_files) in the `values.yml` file for the corresponding app in the [GitHub repository](https://github.com/digitalocean/marketplace-kubernetes/tree/master/stacks). To see the values you can customize, run the [`helm show values`](https://helm.sh/docs/helm/helm_show_values/) command. For example:

    helm show values ingress-nginx/ingress-nginx --version 4.0.13

You can then specify new values in the `values.yml` file and run the [`helm upgrade`](https://helm.sh/docs/helm/helm_upgrade/) command to upgrade the chart to use the new values. For example:

    helm upgrade ingress-nginx ingress-nginx/ingress-nginx --version 4.0.13 \
      --namespace ingress-nginx \
      --values values.yml

You can also run the `helm upgrade` command to upgrade the entire stack to the latest release. For example:

    helm upgrade ingress-nginx ingress-nginx/ingress-nginx \
      --version <INGRESS_NGINX_STACK_NEW_VERSION> \
      --namespace ingress-nginx \

In this example for upgrading the Linkerd control plane, you use the `linkerd upgrade` command:

    linkerd upgrade | kubectl apply --prune -l linkerd.io/control-plane-ns=linkerd -f -
    linkerd upgrade | kubectl apply --prune -l linkerd.io/control-plane-ns=linkerd \
      --prune-whitelist=rbac.authorization.k8s.io/v1/clusterrole \
      --prune-whitelist=rbac.authorization.k8s.io/v1/clusterrolebinding \
      --prune-whitelist=apiregistration.k8s.io/v1/apiservice -f -

For more customization instructions, refer to the app’s page on DigitalOcean Marketplace.

## Uninstalling 1-Click Apps[](#uninstalling-1-click-apps)

The steps to uninstall an app can vary depending on the app. For example, to uninstall a Helm chart, run the following commands:

    helm uninstall <app-name> -n <namespace>
    kubectl delete ns <namespace>

The [`helm uninstall`](https://helm.sh/docs/helm/helm_uninstall) command deletes your app installation and the `kubectl delete ns` command deletes the associated namespace.

Here is another example that shows how to uninstall Linkerd. You need to first remove any data plane proxies and extensions followed by the control plane:

    linkerd viz uninstall | kubectl delete -f -
    linkerd uninstall | kubectl delete -f -

See the app’s page on DigitalOcean Marketplace for more uninstallation steps.

In this article...

*   [Installing 1-Click Apps](#installing-1-click-apps)
    *   [Installing via Control Panel](#installing-via-control-panel)
    *   [Installing via Command Line Using Helm](#installing-via-command-line-using-helm)
*   [Install via doctl](#install-via-doctl)
*   [Verifying the Installation](#verifying-the-installation)
*   [Customizing and Upgrading 1-Click Apps](#customizing-and-upgrading-1-click-apps)
*   [Uninstalling 1-Click Apps](#uninstalling-1-click-apps)

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

Try using different keywords or simplifying your 
