---
source: https://docs.digitalocean.com/products/kubernetes/how-to/use-cilium-hubble/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Use Cilium Hubble for Network Visibility and Security of Kubernetes Clusters | DigitalOcean Documentation

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
*   Use Cilium Hubble

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Use Cilium Hubble for Network Visibility and Security of Kubernetes Clusters

Validated on 16 Jan 2024 • Last edited on 15 Feb 2024

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

DigitalOcean Kubernetes provides [Cilium Hubble](https://github.com/cilium/hubble) which you can use to get network observability for your DOKS clusters. Using Hubble, you can determine service dependencies, set up operational monitoring and alerts, monitor applications, and observe cluster security such as services accessing the cluster from outside and blocked connections.

By default, Hubble is enabled on all DOKS clusters. Because Hubble metrics can be resource intensive, we currently do not enable it by default.

## Resources Used by Hubble[](#resources-used-by-hubble)

We run two deployments, `hubble-relay` and `hubble-ui`, in a configuration that minimizes the resources the cluster uses. To see the deployments, run `kubectl get deploy -n kube-system`. The output looks similar to the following:

    NAME              READY   UP-TO-DATE   AVAILABLE   AGE
    cilium-operator   1/1     1            1           50m
    coredns           2/2     2            2           47m
    hubble-relay      1/1     1            1           48m
    hubble-ui         1/1     1            1           48m

For the configuration details of the deployments, run `kubectl get cm -n kube-system | egrep 'hubble|cilium'`. The output looks similar to the following:

    cilium-config                                          106    48m
    hubble-relay-config                                    1      48m
    hubble-ui-nginx                                        1      48m

To see a specific configuration file, for example `hubble-ui-nginx`, run:

    kubectl get configmap -n kube-system hubble-ui-nginx -o yaml

## Prerequisites[](#prerequisites)

To use the Hubble command-line tool and UI:

1.  Install the [Cilium CLI](https://docs.cilium.io/en/stable/gettingstarted/k8s-install-default/#install-the-cilium-cli). For example, to install on MacOS, use the following commands:
    
        CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
        CLI_ARCH=amd64
        if [ "$(uname -m)" = "arm64" ]; then CLI_ARCH=arm64; fi
        curl -L --fail --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-darwin-${CLI_ARCH}.tar.gz{,.sha256sum}
        shasum -a 256 -c cilium-darwin-${CLI_ARCH}.tar.gz.sha256sum
        sudo tar xzvfC cilium-darwin-${CLI_ARCH}.tar.gz /usr/local/bin
        rm cilium-darwin-${CLI_ARCH}.tar.gz{,.sha256sum}
    
    The commands check the SHA256 value, download the Cilium binary from GitHub for the `amd64` architecture, and install the Cilium binary in the `/usr/local/bin` folder.
    
2.  Install the [Hubble CLI](https://docs.cilium.io/en/stable/gettingstarted/hubble_setup/#install-the-hubble-client). For example, to install on MacOS, use the following commands:
    
        HUBBLE_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/hubble/master/stable.txt)
        HUBBLE_ARCH=amd64
        if [ "$(uname -m)" = "arm64" ]; then HUBBLE_ARCH=arm64; fi
        curl -L --fail --remote-name-all https://github.com/cilium/hubble/releases/download/$HUBBLE_VERSION/hubble-darwin-${HUBBLE_ARCH}.tar.gz{,.sha256sum}
        shasum -a 256 -c hubble-darwin-${HUBBLE_ARCH}.tar.gz.sha256sum
        sudo tar xzvfC hubble-darwin-${HUBBLE_ARCH}.tar.gz /usr/local/bin
        rm hubble-darwin-${HUBBLE_ARCH}.tar.gz{,.sha256sum}
    
    The commands check the SHA256 value, download the Hubble client from GitHub for the `amd64` architecture, and install Hubble in the `/usr/local/bin` folder.
    
3.  [Authenticate and connect to your DOKS cluster](/products/kubernetes/how-to/connect-to-cluster/) using `kubeconfig`.
    

## Use the Hubble CLI[](#use-the-hubble-cli)

To use Hubble at the command line:

1.  Open a shell and run `cilium hubble port-forward`.
    
    Since the command only port-forwards Hubble to your local terminal, you will not see any output for this command.
    
2.  Open a second shell and run `hubble observe`.
    

For more information on these commands and their options, see the [Hubble documentation](https://docs.cilium.io/en/stable/gettingstarted/hubble_cli/#inspecting-network-flows-with-the-cli).

## Use the Hubble UI[](#use-the-hubble-ui)

To use the Hubble UI, open a shell and run the following command:

    cilium hubble ui

This command automatically port-forwards to the Hubble UI on your cluster and opens your default browser with the Hubble UI. For more information, see the [Hubble UI documentation](https://docs.cilium.io/en/stable/gettingstarted/hubble/#service-map-hubble-ui).

## Disable Hubble Relay and UI[](#disable-hubble-relay-and-ui)

If you don’t want to [run the deployments](#resources-used-by-hubble) for Hubble Relay and Hubble UI, you can scale them down to zero replicas. For example, run `kubectl scale deploy hubble-ui --replicas=0` to disable the Hubble UI.

In this article...

*   [Resources Used by Hubble](#resources-used-by-hubble)
*   [Prerequisites](#prerequisites)
*   [Use the Hubble CLI](#use-the-hubble-cli)
*   [Use the Hubble UI](#use-the-hubble-ui)
*   [Disable Hubble Relay and UI](#disable-hubble-relay-and-ui)

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
