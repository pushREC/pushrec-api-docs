---
source: https://docs.digitalocean.com/products/kubernetes/how-to/migrate-load-balancers/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Migrate Load Balancers | DigitalOcean Documentation

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
*   Migrate Load Balancers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Migrate Load Balancers

Validated on 9 Mar 2021 • Last edited on 17 Apr 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

When you migrate an application from a Kubernetes cluster to another, you can also migrate the associated load balancer service to the target cluster. Doing so preserves the external IP address of the load balancer that your application’s DNS record points to.

To migrate a load balancer, you first disown the load balancer service from the existing service and then reference the load balancer’s ID in the service of the new cluster. Disowning the load balancer from the existing service turns all mutating actions, such as load balancer creates, updates and deletes, that are driven through the service into no-ops.

Note

The new service’s cluster must reside in the same VPC as the original service for the load balancer ownership to be transferred successfully. For more information, see the [VPC documentation](/products/networking/vpc/).

Use the following workflow to migrate a load balancer from one cluster to another. Suppose you have a load balancer service named `app` that is associated with a `production-v1` cluster and you want to move it to another cluster `production-v2`.

1.  Ensure that there are no load balancer-related error events in your existing service by running the following command:
    
        kubectl describe service <service-name>
    
    Fix any reported errors to bring the service into a stable state.
    
2.  Disown the load balancer by adding the following annotation in the service config file and setting it to `true`:
    
          kind: Service
          apiVersion: v1
          metadata:
          name: app
          annotations:
            kubernetes.digitalocean.com/load-balancer-id: c16b0b29-217b-48eb-907e-93cf2e01fb56
            service.kubernetes.io/do-loadbalancer-disown: "true"
          spec:
            selector:
              name: app
            ports:
              - name: http
              protocol: TCP
              port: 80
            type: LoadBalancer
    

Note

The `load-balancer-id` is set by the [DigitalOcean cloud control manager](https://github.com/digitalocean/digitalocean-cloud-controller-manager) when you first provision the load balancer.

Use `kubectl apply` to apply the update to the config file. Verify that the change applied correctly by running `kubectl describe service <service-name>` again.

Once the change applies, all mutating requests directed at the load balancer and driven through the service are ignored.

3.  Create a new service config file in the `production-v2` cluster to use the `load-balancer-id` from the previous service config file.
    
        kind: Service
        apiVersion: v1
        metadata:
          name: app
          annotations:
            kubernetes.digitalocean.com/load-balancer-id: c16b0b29-217b-48eb-907e-93cf2e01fb56
        spec:
          selector:
            name: app
          ports:
            - name: http
              protocol: TCP
              port: 80
          type: LoadBalancer
    
    If you have other load balancer [configuration annotations](/products/kubernetes/how-to/configure-load-balancers/) that you want to transfer to the new service, add them to the config file.
    
4.  Check the service events again to ensure that the DigitalOcean cloud control manager has finished reconciling the update.
    
    Once complete, the load balancer is owned by the new service and the traffic is routed to the new cluster.
    
5.  Delete the service from the old cluster or change it to another Kubernetes [service type](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types).
    

In this article...

[How to Migrate Load Balancers](https://docs.digitalocean.com/products/kubernetes/how-to/migrate-load-balancers/)

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

Try using different keywords or simplifying your se
