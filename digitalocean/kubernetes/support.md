---
source: https://docs.digitalocean.com/products/kubernetes/support/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                Kubernetes Support | DigitalOcean Documentation

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

*   Support

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Kubernetes Support

Generated on 6 Jan 2026

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

[](/support/why-cant-my-vpc-native-pods-connect-to-my-droplets/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why can't my VPC-native pods connect to my Droplets?

For Droplets created before 2 October 2024, you must manually add VPC peering routes to interconnect with VPC-native DOKS clusters

[](/support/how-to-troubleshoot-load-balancer-health-check-issues/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How to Troubleshoot Load Balancer Health Check Issues

Health checks often fail due to firewalls or misconfigured backend server software.

[](/support/how-can-i-improve-the-performance-of-cluster-dns/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How can I improve the performance of cluster DNS?

Enable DNS caching, use non-shared machine types for the cluster, and scale out or reduce DNS traffic.

[](/support/how-do-i-enable-proxy-protocol-when-my-load-balancer-sends-requests-to-the-nginx-ingress-controller/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I enable PROXY protocol when my load balancer sends requests to the NGINX Ingress Controller?

Edit the ConfigMap which nginx uses to enable PROXY protocol.

[](/support/can-i-disable-unsafe-sysctl-on-digitalocean-kubernetes/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Can I disable unsafe sysctl on DigitalOcean Kubernetes?

Launch an Init Container or run a DaemonSet.

[](/support/why-are-cpu-and-memory-usage-not-displayed-on-managed-kubernetes-dashboard/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why are CPU and memory usage not displayed on Managed Kubernetes Dashboard?

Displaying CPU and memory usage in the Kubernetes Dashboard is not supported at this time.

[](/support/why-do-kubectl-top-and-digitalocean-control-panel-show-different-metrics-values-for-worker-nodes/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why do kubectl top and DigitalOcean Control Panel show different metrics values for worker nodes?

The output of the `kubectl top` command does not measure the entire system load in the same way the control panel does.

[](/support/why-does-my-doks-node-show-a-notready-status/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why does my DOKS node show a NotReady status?

A node can show as NotReady if it is unhealthy and not accepting pods.

[](/support/why-do-my-doks-load-balancer-settings-keep-reverting/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why do my DOKS load balancer settings keep reverting?

You can configure load balancers that are provisioned by DOKS using Kubernetes service annotations.

[](/support/why-do-my-load-balancers-kubernetes-nodes-have-the-no-traffic-status/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why do my load balancer's Kubernetes node(s) have the No Traffic status?

Kubernetes service ’externaltrafficpolicy’ field controls how nodes respond to health checks.

[](/support/can-i-resize-a-doks-node/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Can I resize a DOKS node?

You can resize a DOKS node by creating a new node pool of the desired size.

[](/support/clusterlint-error-fixes/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Clusterlint Error Fixes

Recommended solutions for common errors raised by Clusterlint, a non-invasive best practices checker for DigitalOcean Kubernetes clusters.

In this article...

[Kubernetes Support](https://docs.digitalocean.com/products/kubernetes/support/)

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
