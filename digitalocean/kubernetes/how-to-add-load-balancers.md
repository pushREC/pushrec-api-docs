---
source: https://docs.digitalocean.com/products/kubernetes/how-to/add-load-balancers/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Add Load Balancers to Kubernetes Clusters | DigitalOcean Documentation

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
*   Add Load Balancers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Add Load Balancers to Kubernetes Clusters

Validated on 14 Aug 2025 • Last edited on 15 Aug 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

The DigitalOcean Cloud Controller supports provisioning DigitalOcean Load Balancers in a cluster’s resource configuration file. Load balancers created in the control panel or via the API cannot be used by your Kubernetes clusters.

Note

*   The DigitalOcean Load Balancer Service routes load balancer traffic to all worker nodes on the cluster. However, only nodes configured to accept the traffic pass health checks. Any other nodes fail and show as unhealthy, but this is expected. See the community article, [How to Set Up an Ingress-NGINX controller with Cert-Manager on DigitalOcean Kubernetes](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-with-cert-manager-on-digitalocean-kubernetes) for a detailed example.

The example configuration below defines a load balancer and creates it if one with the same name does not already exist. Additional configuration examples are available in the [DigitalOcean Cloud Controller Manager repository](https://github.com/digitalocean/digitalocean-cloud-controller-manager/tree/master/docs/controllers/services/examples).

[DigitalOcean Load Balancer limits](/products/networking/load-balancers/details/#limits) apply to load balancers you add to DOKS clusters.

## Create or Update a Configuration File[](#create-or-update-a-configuration-file)

You can add an external load balancer to a cluster by creating a new configuration file. For example, the following configuration file defines a TCP load balancer service named `tcp-lb` that routes traffic to pods with the label `nginx-example`:

    kind: Service
    apiVersion: v1
    metadata:
      name: tcp-lb
    spec:
      type: LoadBalancer
      selector:
        app: nginx-example
      ports:
        - name: http
          protocol: TCP
          port: 80
          targetPort: 80

Both the `type` and `ports` values are required for load balancer services\`.

If you have an existing service config file, add the following lines to your file to add a load balancer:

    spec:
      type: LoadBalancer
      selector:
        app: nginx-example
      ports:
        - name: http
          protocol: TCP
          port: 80
          targetPort: 80

### Configure Settings[](#configure-settings)

During creation, you can also configure the number of nodes for the load balancer and add firewall rules in the config file, which are the minimum definition required to trigger creation of a DigitalOcean Load Balancer on your account.

The [number of nodes a load balancer](/products/networking/load-balancers/details/pricing/) has determines how many connections it can maintain at once. Load balancers with more nodes can maintain more connections, making them more highly available. The number of nodes defaults to `1` and can be any integer between `1` and `200`. Your actual load balancer node limit is determined by your account’s limits. To request a limit increase, [contact support](https://cloudsupport.digitalocean.com). To specify the number of nodes a load balancer contains when created, [set the size unit annotation](/products/kubernetes/how-to/configure-load-balancers/#slug-size-annotation). In the context of a service file, this looks like:

    apiVersion: v1
    kind: Service
    metadata:
      name: nginx
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-size-unit: "3"
    spec:
      type: LoadBalancer
      selector:
        app: nginx-example
      ports:
        - name: http
          protocol: TCP
          port: 80
          targetPort: 80

You can resize the load balancer after creation once per minute.

To control the load balancer service access, add firewall rules. Use the `LoadBalancerSourceRanges` field to allow incoming connections and the `deny-list` annotation to block incoming connections. The following example configures the load balancer’s firewall to block incoming connections from `198.51.100.0/16` IP block and to accept connections from the `203.0.113.24` and `203.0.113.68` addresses.

    apiVersion: v1
    kind: Service
    metadata:
      name: nginx
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-size-unit: "3"
        service.beta.kubernetes.io/do-loadbalancer-deny-rules: "cidr:198.51.100.0/16"
    spec:
      type: LoadBalancer
      selector:
        app: nginx-example
      ports:
        - name: http
          protocol: TCP
          port: 80
          targetPort: 80
      loadBalancerSourceRanges:
        - 203.0.113.24/24, 203.0.113.68/24

Billing begins once the load balancer creation is complete.

You can configure additional load balancer settings, such as add an internal load balancer and specify health checks, [using the annotations in the service config file](/products/kubernetes/how-to/configure-load-balancers/).

## Show Load Balancers[](#show-load-balancers)

Once you apply the config file to a deployment, you can see the load balancer in the [**Resources** tab](https://cloud.digitalocean.com/kubernetes/clusters) of your cluster in the control panel.

Alternatively, use `kubectl get services` to see its status:

    kubectl get services

    NAME                   TYPE           CLUSTER-IP      EXTERNAL-IP      PORT(S)        AGE
    kubernetes             ClusterIP      192.0.2.1       <none>           443/TCP        2h
    sample-load-balancer   LoadBalancer   192.0.2.167     <pending>   80:32490/TCP        6s

When the load balancer creation is complete, the `EXTERNAL-IP` column displays the external IP address instead of `<pending>`. In the `PORT(S)` column, the first port is the incoming port (80), and the second port is the `node port` (32490), not the container port supplied in the `targetPort` parameter.

Warning

In addition to the cluster’s **Resources** tab, cluster resources (worker nodes, load balancers, and volumes) are also listed outside the Kubernetes page in the DigitalOcean Control Panel. If you rename or otherwise modify these resources in the control panel, you may render them unusable to the cluster or cause the reconciler to provision replacement resources. To avoid this, manage your cluster resources exclusively with `kubectl` or from the control panel’s Kubernetes page.

## Show Details for One Load Balancer[](#show-details-for-one-load-balancer)

If the provisioning process for the load balancer is unsuccessful, you can access the service’s event stream to troubleshoot any errors. The event stream includes information on provisioning status and reconciliation errors.

To get detailed information about the load balancer configuration of a single load balancer, including the event stream at the bottom, use `kubectl`’s `describe service` command:

    kubectl describe service <LB-NAME>

    Name:                     sample-load-balancer
    Namespace:                default
    Labels:                   <none>
    Annotations:              kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"name":"sample-load-balancer","namespace":"default"},"spec":{"ports":[{"name":"https",...
    Selector:                 <none>
    Type:                     LoadBalancer
    IP Family Policy:         SingleStack
    IP Families:              IPv4
    IP:                       10.245.178.117
    IPs:                      10.245.178.117
    LoadBalancer Ingress:     203.0.113.86
    Port:                     https  80/TCP
    TargetPort:               443/TCP
    NodePort:                 https  32490/TCP
    Endpoints:                <none>
    Session Affinity:         None
    External Traffic Policy:  Cluster
    Events:
      Type    Reason                Age               From                Message
      ----    ------                ----              ----                -------
      Normal  EnsuringLoadBalancer  3m (x2 over 38m)  service-controller  Ensuring load balancer
      Normal  EnsuredLoadBalancer   1m (x2 over 37m)  service-controller  Ensured load balancer

## References[](#references)

For more about managing load balancers, see:

*   [Other Kubernetes Components](https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes#other-kubernetes-components) in the DigitalOcean Community’s [Introduction to Kubernetes](https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes).
    
*   [Kubernetes Services](https://kubernetes.io/docs/concepts/services-networking/service/) in the official [Kubernetes Concepts guide](https://kubernetes.io/docs/concepts/)
    

In this article...

*   [Create or Update a Configuration File](#create-or-update-a-configuration-file)
    *   [Configure Settings](#configure-settings)
*   [Show Load Balancers](#show-load-balancers)
*   [Show Details for One Load Balancer](#show-details-for-one-load-balancer)
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

Try using different keywords or simplifyi
