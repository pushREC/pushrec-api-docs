---
source: https://docs.digitalocean.com/products/kubernetes/how-to/customize-coredns/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Customize CoreDNS for Kubernetes Clusters | DigitalOcean Documentation

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
*   Customize Cluster DNS Settings

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Customize CoreDNS for Kubernetes Clusters

Validated on 20 Jul 2021 • Last edited on 17 Apr 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

Warning

Besides the methods in this guide, do not modify any managed components pre-installed in your DigitalOcean Kubernetes cluster, such as workloads, policies, Cilium, and CoreDNS. Modifying these services can cause your cluster’s operations to temporarily or permanently fail, and we may revert these changes at any time to maintain the functionality of your cluster.

DOKS uses [CoreDNS](https://coredns.io/) for cluster DNS management. To serve DNS requests for pods, every DOKS clusters has two CoreDNS replicas by default. To see the default configuration of the CoreDNS deployment, you can use the following command:

    kubectl describe deployment coredns -n=kube-system

You can view the CoreDNS settings used by DOKS in the [CoreDNS’s configuration file](https://coredns.io/2017/07/23/corefile-explained/) using the following command:

    kubectl get configmap -n kube-system coredns -o yaml

The output looks similar to the following:

    apiVersion: v1
    data:
      Corefile: |
        .:53 {
            errors
            health
            ready
            kubernetes cluster.local in-addr.arpa ip6.arpa {
              pods insecure
              fallthrough in-addr.arpa ip6.arpa
            }
            prometheus :9153
            forward . /etc/resolv.conf
            cache 30
            loop
            reload
            loadbalance
            import custom/*.override
        }
        import custom/*.server
    kind: ConfigMap
    [...]

The default CoreDNS configuration is in the `Corefile` key of the ConfigMap and includes plugins such as [`errors`](https://coredns.io/plugins/errors), [`health`](https://coredns.io/plugins/health), [`ready`](https://coredns.io/plugins/ready), [`reload`](https://coredns.io/plugins/reload), and [`loadbalance`](https://coredns.io/plugins/loadbalance).

The [`import`](https://coredns.io/plugins/import/) plugin lets you include customizations, such as specifying a forwarding server for your network traffic, enabling logging for debugging DNS queries, or configuring your environment’s custom domains, stub domains, or upstream name servers.

The DigitalOcean Kubernetes backend overwrites any changes you make to the default CoreDNS ConfigMap. Instead of modifying the CoreDNS ConfigMap, we recommend using a Kubernetes ConfigMap to customize the CoreDNS settings of a cluster:

1.  Create a custom ConfigMap that has keys named with `.override` and `.server` extensions and save it as `coredns-custom.yaml`.
    
    *   `.override` lets you append to the default [Server Block](https://coredns.io/manual/configuration/#server-blocks) of CoreDNS. This does not let you override options that have already been specified.
    *   `.server` lets you specify additional server blocks for CoreDNS.
    
    You can specify a name of your choice for the `.server` or `.override` extensions.
    
    For example, the following custom ConfigMap:
    
    *   Adds the [`log`](https://coredns.io/plugins/log) plugin. Specifying `log` in the `.override` option to start logging at the system level. Using the plugin in the `.server` option starts logging for a specific domain.
    *   Overrides the [`forward`](https://coredns.io/plugins/forward) plugin to forward requests to the specified name server. You can redirect requests to a specific DNS server that can resolve the rewritten domain name.

    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: coredns-custom
      namespace: kube-system
    data:
      log.override: |
        log
      custom.server: |
        example.io:8053 {
          forward . 8.8.8.8
        }

2.  Apply the custom configuration to the `kube-system` namespace:

    kubectl apply -f coredns-custom.yaml

3.  Check the logs to make sure that the customization have been applied:

    kubectl logs -n kube-system -l k8s-app=kube-dns

For the ConfigMap shown previously, the output looks similar to the following after the changes reconcile:

    [INFO] Reloading
    [INFO] plugin/reload: Running configuration MD5 = 2abff3bcc90cc5e9925581a55c02a47c
    [INFO] Reloading complete
    [INFO] 127.0.0.1:56186 - 38484 "HINFO IN 300556296135298597.3851195213192789444. udp 56 false 512" NXDOMAIN qr,rd,ra,ad 131 0.003940763s
    [INFO] 10.244.1.134:40618 - 34833 "A IN mirror.vacares.com.svc.cluster.local. udp 54 false
    [INFO] 10.244.1.134:52328 - 3722 "AAAA IN mirror.atlanticmetro.net.cluster.local. udp 56 false 512" NXDOMAIN qr,aa,rd 149 0.000093086s
    [INFO] 10.244.1.134:40521 - 28128 "A IN example.io. udp 51 false 4096" NOERROR qr,rd,ra 115 0.000944973s

Because the example ConfigMap uses the `log` plugin, the log output here shows DNS queries, including a query to `example.io` that occurred on the cluster’s pod.

In this article...

[How to Customize CoreDNS for Kubernetes Clusters](https://docs.digitalocean.com/products/kubernetes/how-to/customize-coredns/)

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
