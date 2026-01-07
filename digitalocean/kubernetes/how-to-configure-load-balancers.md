---
source: https://docs.digitalocean.com/products/kubernetes/how-to/configure-load-balancers/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Configure Advanced Load Balancer Settings in Kubernetes Clusters | DigitalOcean Documentation

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
*   Configure Load Balancers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Configure Advanced Load Balancer Settings in Kubernetes Clusters

Validated on 27 Feb 2025 • Last edited on 20 Nov 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

The DigitalOcean Cloud Controller Manager lets you [provision DigitalOcean Load Balancers](/products/kubernetes/how-to/add-load-balancers/). To configure advanced settings for the load balancer, add the settings under [`annotations`](https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/) in the `metadata` stanza in your service configuration file. To prevent misconfiguration, an invalid value for an annotation results in an error when you apply the config file.

Additional configuration examples are available in the [DigitalOcean Cloud Controller Manager repository](https://github.com/digitalocean/digitalocean-cloud-controller-manager/tree/master/docs/controllers/services/examples).

[DigitalOcean Load Balancer limits](/products/networking/load-balancers/details/#limits) apply to load balancers you add to DOKS clusters.

Warning

In addition to the cluster’s **Resources** tab, cluster resources (worker nodes, load balancers, and volumes) are also listed outside the Kubernetes page in the DigitalOcean Control Panel. If you rename or otherwise modify these resources in the control panel, you may render them unusable to the cluster or cause the reconciler to provision replacement resources. To avoid this, manage your cluster resources exclusively with `kubectl` or from the control panel’s Kubernetes page.

## Name[](#name)

**Available in:** 1.27.x and later

This setting lets you specify a custom name or to rename an existing DigitalOcean Load Balancer. The name must:

*   Be less than or equal to 255 characters.
*   Start with an alphanumeric character.
*   Consist of alphanumeric characters or the ‘.’ (dot) or ‘-’ (dash) characters, except for the final character which must not be a ‘-’ (dash).

If you do not specify a custom name, the load balancer defaults to a name starting with the character `a` appended by the `Service` UID.

The following example creates a load balancer with the name `my.example.com`:

    . . .
    metadata:
      name: name-snippet
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-name: "my.example.com"
    . . .

## Protocol[](#protocol)

**Available in:** 1.27.x and later

This setting lets you specify the [protocol](/products/networking/load-balancers/#protocol-support) for DigitalOcean Load Balancers. Options are `tcp`, `http`, `https`, and `http2`. Defaults to `tcp`.

If `https`, `http2`, or `http3` are specified, then you must also specify either `service.beta.kubernetes.io/do-loadbalancer-certificate-id`, `service.beta.kubernetes.io/do-loadbalancer-certificate-name`, or `service.beta.kubernetes.io/do-loadbalancer-tls-passthrough`. You must also set up a [health check](#health-checks) with a port that uses either TCP, HTTP, or HTTPS to work properly.

The following example shows how to specify `https` as the load balancer protocol:

    . . .
    metadata:
      name: https-protocol-snippet
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-certificate-id: "1234-5678-9012-3456"
        service.beta.kubernetes.io/do-loadbalancer-protocol: "https"
    . . .

In order to use the UDP protocol with a Load Balancer, use the `ports` section in the load balancer service config file as shown below:

    spec:
      type: LoadBalancer
      selector:
        app: nginx-example
      ports:
        - name: udp
          protocol: UDP
          port: 53
          targetPort: 53

A load balancer port cannot be shared between TCP and UDP due to a [bug in Kubernetes](https://github.com/kubernetes/kubernetes/issues/39188).

## Network Load Balancer[](#network-load-balancer)

**Available in:** 1.29.8-do.0 or later.

This setting creates a regional load balancer that routes TCP and UDP traffic at the network layer. This feature is [currently in public preview](/platform/product-lifecycle/#public-preview) and does not support IPv6.

Note

When you provision a network load balancer, we create inbound firewall rules that allow traffic from all IPv4 addresses to port 10256 on the worker nodes. The DigitalOcean Cloud Controller Manager uses port 10256 for `kube-proxy` health checks. Because DigitalOcean does not support private-only Droplets, these nodes are reachable from the public internet.

The following example creates a network load balancer:

    . . .
    metadata:
     name: example-nlb
     annotations:
       service.beta.kubernetes.io/do-loadbalancer-type: "REGIONAL_NETWORK"
    . . .

The `ports` section of your configuration must specify a `protocol` of `UDP` or `TCP`, and the `port` and `targetPort` must match.

## Internal Load Balancer[](#internal-load-balancer)

**Available in:** 1.28.10-do.0 or later.

This setting creates a load balancer with no public IP address. Resources must be on the same [VPC](/products/networking/vpc/) to access internal load balancers. You cannot switch load balancers between regular and internal after creation.

The following example creates an internal load balancer:

    . . .
    metadata:
     name: example-ilb
     annotations:
       service.beta.kubernetes.io/do-loadbalancer-network: "INTERNAL"
    . . .

## Health Checks[](#health-checks)

**Available in:** 1.27.x and later (basic functionality)

Health checks verify that your nodes are online and meet any customized health criteria. Load balancers only forward requests to nodes that pass health checks. If your load balancer uses UDP in its forwarding rules, the load balancer requires that you set up a health check with a port that uses TCP, HTTP, or HTTPS to work properly.

DigitalOcean Cloud Controller automatically sets a health check configuration suitable for identifying pod and node availability and facilitating graceful rotation of workload and node replacements. The specific values depend on the [external traffic policy](#external-traffic-policies-and-health-checks).

Note

In general, you should not explicitly change the health check annotations for [port](#ports), [path](#path), and [protocol](#protocol).

### Port[](#port)

The load balancer performs health checks against a port on your service. The default is the first node port on the worker nodes as defined in the service. To specify your own value, you must specify an exposed port and not the NodePort, and also set the `service.beta.kubernetes.io/do-loadbalancer-override-health-check` annotation.

### Path[](#path)

The load balancer uses the path used to check if a backend Droplet is healthy. The default is `/`. To specify your own value, you must also set the `service.beta.kubernetes.io/do-loadbalancer-override-health-check` annotation.

### Protocol[](#protocol-1)

The load balancer uses the protocol to check if a backend Droplet is healthy. The default is `tcp`. Other options are `http` and `https`. To specify your own value, you must also set the `service.beta.kubernetes.io/do-loadbalancer-override-health-check` annotation.

While UDP is not a supported health check protocol, if your load balancer has UDP service ports, you must configure a TCP service as a health check for the load balancer to work properly.

### Override Health Check[](#override-health-check)

To override the default values for health check port, path, and protocol with your own values, you must additionally set `service.beta.kubernetes.io/do-loadbalancer-override-health-check` to `true`.

### Interval[](#interval)

The number of seconds between two consecutive health checks. The value must be between 3 and 300. The default value is 3.

### Timeout[](#timeout)

The number of seconds the load balancer instance waits for a response before marking a health check as failed. The value must be between 3 and 300. The default value is 5.

### Threshold[](#threshold)

The number of times a health check must fail for a backend Droplet before it is marked as unhealthy and removed from the pool for the given service. The value must be between 2 and 10. The default value is 3.

The following example shows how to configure health checks for a load balancer:

    metadata:
      name: health-check-snippet
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-certificate-id: "1234-5678-9012-3456"
        service.beta.kubernetes.io/do-loadbalancer-protocol: "https"
        service.beta.kubernetes.io/do-loadbalancer-healthcheck-port: "80"
        service.beta.kubernetes.io/do-loadbalancer-healthcheck-protocol: "http"
        service.beta.kubernetes.io/do-loadbalancer-healthcheck-path: "/health"
        service.beta.kubernetes.io/do-loadbalancer-healthcheck-check-interval-seconds: "3"
        service.beta.kubernetes.io/do-loadbalancer-healthcheck-response-timeout-seconds: "5"
        service.beta.kubernetes.io/do-loadbalancer-healthcheck-unhealthy-threshold: "3"
        service.beta.kubernetes.io/do-loadbalancer-healthcheck-healthy-threshold: "5"

### External Traffic Policies and Health Checks[](#external-traffic-policies-and-health-checks)

Load balancers managed by DOKS assess the health of the endpoints for the `LoadBalancer` service that provisioned them.

A health check’s behavior is dependent on the service’s `externaltrafficpolicy`. A service’s `externaltrafficpolicy` can be set to either `Local` or `Cluster`. A `Local` policy only accepts health checks if the destination pod is running locally, while a `Cluster` policy allows the nodes to distribute requests to pods in other nodes within the cluster.

Services with a `Local` policy assess nodes without any local endpoints for the service as unhealthy. The `kube-proxy /healthz` endpoint on the separate health check node port, created explicitly by Kubernetes, indicates if the node has active pods.

Services with a `Cluster` policy can assess nodes as healthy even if they do not contain pods hosting that service. The `kube-proxy /healthz` endpoint available on each worker node indicates if the node is healthy.

Specifically, an external traffic policy of `Local` guarantees that worker nodes can be drained prior to their removal. You should chose the behavior-related health check parameters (such as frequency and thresholds) such that a node is marked unhealthy before the last target pod on the node stops accepting requests.

To change this setting for a service, run the following command with your desired policy:

    kubectl patch svc myservice -p '{"spec":{"externalTrafficPolicy":"Local"}}'

Note

Because DigitalOcean load balancers [terminate client connection requests with proxy](https://kubernetes.io/docs/tutorials/services/source-ip/#cross-platform-support), setting `externalTrafficPolicy` to `Local` does not preserve the client source IP address. If your service requires retaining the request’s original IP address, see [Preserving Client Source IP Address](#preserving-client-source-ip-address).

## Ports[](#ports)

You can specify which ports of the load balancer should use for HTTP, HTTP2 or TLS protocol.

Note

Ports must not be shared between [HTTP](#http-ports), [TLS](#tls-ports), and [HTTP2](#http2-ports) port annotations.

### HTTP Ports[](#http-ports)

**Available in:** 1.27.x and later

Use this annotation to specify which ports of the load balancer should use the HTTP protocol.

Values are a comma separated list of ports (for example, `80, 8080`).

The following example shows how to specify an HTTP port:

    . . .
    metadata:
      name: http-ports-snippet
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-http-ports: "80"
    . . .

### HTTP/2 Ports[](#http2-ports)

**Available in:** 1.27.x and later

Use this annotation to specify which ports of the load balancer should use the HTTP/2 protocol.

Values are a comma separated list of ports (for example, `443, 6443, 7443`). If specified, you must also specify either `service.beta.kubernetes.io/do-loadbalancer-tls-passthrough`, `service.beta.kubernetes.io/do-loadbalancer-certificate-id`, or `service.beta.kubernetes.io/do-loadbalancer-certificate-name`.

If `service.beta.kubernetes.io/do-loadbalancer-protocol` is not set to `http2`, then this annotation is required for implicit HTTP/2 usage. Unlike `service.beta.kubernetes.io/do-loadbalancer-tls-ports`, no default port is assumed for HTTP/2 to retain compatibility with the semantics of implicit HTTPS usage.

The following example shows how to specify a HTTP/2 port:

    . . .
    metadata:
      name: http2-ports-snippet
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-http2-ports: "443,80"
    . . .

### HTTP/3 Ports[](#http3-ports)

**Available in:** 1.25.4-do.0, 1.24.8-do.0, 1.23.14-do.0

Use this annotation to specify which port of the load balancer should use the HTTP/3 protocol. Unlike other annotations, you cannot specify multiple ports; you can only specify the HTTP/3 protocol for a single port on the cluster. As no default is assumed for HTTP/3, you must provide a port number.

To use the HTTP/3 protocol, you must provide the `service.beta.kubernetes.io/do-loadbalancer-certificate-id` or `service.beta.kubernetes.io/do-loadbalancer-certificate-name` annotation. Because the load balancer can only receive HTTP/3 traffic, you must also specify a protocol for the sending traffic by providing either a `service.beta.kubernetes.io/do-loadbalancer-tls-ports` or `service.beta.kubernetes.io/do-loadbalancer-http2-ports` annotation.

### TLS Ports[](#tls-ports)

**Available in:** 1.27.x and later

Use this annotation to specify which ports of the load balancer should use the HTTPS protocol:

Values are a comma separated list of ports (for example, `443, 6443, 7443`). If specified, you must also specify one of the following:

*   `service.beta.kubernetes.io/do-loadbalancer-tls-passthrough`: Specifies whether the load balancer should pass encrypted data to backend Droplets. Options are `true` or `false`. Defaults to `false`.
*   `service.beta.kubernetes.io/do-loadbalancer-certificate-id`: Specifies the certificate ID used for the HTTPS protocol. To list available certificates and their IDs, install [doctl](/reference/doctl/reference/) and run `doctl compute certificate list`.
*   `service.beta.kubernetes.io/do-loadbalancer-certificate-name` (available in DOKS 1.26 and later): Specifies the certificate name used for the HTTPS protocol. We recommend using this annotation because the name of a Let’s Encrypt certificate does not change when it rotates, but the ID changes each time. The name of the certificate must be unique within an account. To list available certificates and their names, [install doctl](/reference/doctl/how-to/install/) and run `doctl compute certificate list`.

If you don’t specify an HTTPS port but specify either `service.beta.kubernetes.io/do-loadbalancer-tls-passthrough`, `service.beta.kubernetes.io/do-loadbalancer-certificate-id`, or `service.beta.kubernetes.io/do-loadbalancer-certificate-name`, the load balancer uses port 443 for HTTPS unless `service.beta.kubernetes.io/do-loadbalancer-http2-ports` already specifies 443.

The following example shows how to specify a TLS port with passthrough:

    . . .
    metadata:
      name: tls-ports-snippet
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-tls-ports: "443"
        service.beta.kubernetes.io/do-loadbalancer-tls-passthrough: "true"
    . . .

## HTTP Idle Timeout[](#http-idle-timeout)

**Available in:** 1.27.x and later

Specifies the HTTP idle timeout configuration in seconds. The default is 60.

The following example specifies a timeout of 65 seconds:

    . . .
    metadata:
      name: http-idle-timeout
      annotations:
        kubernetes.digitalocean.com/load-balancer-id: "your-load-balancer-id"
        service.beta.kubernetes.io/do-loadbalancer-http-idle-timeout-seconds: 65
    . . .

## Accessing by Hostname[](#accessing-by-hostname)

**Available in:** 1.27.x and later

Because of an existing [limitation in upstream Kubernetes](https://github.com/kubernetes/enhancements/issues/1860), pods cannot talk to other pods via the IP address of an external load balancer set up through a `LoadBalancer`\-typed service.

As a workaround, you can set up a DNS record for a custom hostname (at a provider of your choice) and have it point to the external IP address of the load balancer. Then, instruct the service to return the custom hostname by specifying the hostname in the `service.beta.kubernetes.io/do-loadbalancer-hostname` annotation and retrieving the service’s `status.Hostname` field afterwards.

The workflow for setting up the `service.beta.kubernetes.io/do-loadbalancer-hostname` annotation is generally:

1.  Deploy the manifest with your service (example below).
2.  Wait for the service’s external IP to become available.
3.  Add an A or AAAA DNS record for your hostname pointing to the external IP.
4.  Add the hostname annotation to your manifest (example below). Deploy it.

    kind: Service
    apiVersion: v1
    metadata:
      name: hello
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-certificate-id: "1234-5678-9012-3456"
        service.beta.kubernetes.io/do-loadbalancer-protocol: "https"
        service.beta.kubernetes.io/do-loadbalancer-hostname: "hello.example.com"
    spec:
      type: LoadBalancer
      selector:
        app: my-app-example
      ports:
        - name: https
          protocol: TCP
          port: 443
          targetPort: 80
    . . .

## SSL Certificates[](#ssl-certificates)

**Available in:** 1.27.x and later

You can encrypt traffic to your Kubernetes cluster by using an SSL certificate with the load balancer. You need to [create or upload an SSL certificate](/products/networking/load-balancers/how-to/ssl-termination/#add-an-ssl-certificate) first, and then use one of the following annotations to reference the certificate in the load balancer’s configuration file:

*   `service.beta.kubernetes.io/do-loadbalancer-certificate-id` for the certificate ID.
    
*   `service.beta.kubernetes.io/do-loadbalancer-certificate-name` (available in 1.26x and later) for the certificate name. We recommend using this annotation because the name of a Let’s Encrypt certificate does not change when it rotates, but the ID changes each time. The name of the certificate must be unique within an account.
    

If you provide both, the certificate ID takes precedence.

To obtain the IDs of uploaded SSL certificates, use [`doctl compute certificate list`](/reference/doctl/reference/compute/certificate/list/) or [the `/v2/certificates` API endpoint](/reference/api/digitalocean/#operation/certificates_list).

To use the certificate, you must also specify HTTPS as the load balancer protocol using either the `service.beta.kubernetes.io/do-loadbalancer-protocol` or the `service.beta.kubernetes.io/do-loadbalancer-tls-ports` annotation.

Additionally, you can specify whether to disable automatic DNS record creation for the certificate upon the load balancer’s creation using the `do-loadbalancer-disable-lets-encrypt-dns-records` annotation. If you specify `true`, we do not automatically create a DNS A record at the apex of your domain to support the SSL certificate. This setting is available in versions 1.21.5, 1.20.11, and 1.19.15.

The example below creates a load balancer using an SSL certificate:

    ---
    kind: Service
    apiVersion: v1
    metadata:
      name: https-with-cert
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-protocol: "https"
        service.beta.kubernetes.io/do-loadbalancer-certificate-id: "your-certificate-id"
        service.beta.kubernetes.io/do-loadbalancer-disable-lets-encrypt-dns-records: "false"
    spec:
      type: LoadBalancer
      selector:
        app: nginx-example
      ports:
        - name: https
          protocol: TCP
          port: 443
          targetPort: 80
    . . .

See the [full configuration example](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/examples/https-with-cert-nginx.yml).

Note

When you renew a Let’s Encrypt certificate, DOKS gives it a new UUID and automatically updates all annotations in the certificate’s cluster to use the new UUID. However, you must manually update any external configuration files and tools that reference the UUID.

For further troubleshooting, examine your certificates and their details with [the `compute certificate list` command](/reference/doctl/reference/compute/certificate/list/), or [contact our support team](https://cloudsupport.digitalocean.com).

## Forced SSL Connections[](#forced-ssl-connections)

**Available in:** 1.27.x and later

The SSL option redirects HTTP requests on port 80 to HTTPS on port 443. When you enable this option, HTTP URLs are forwarded to HTTPS with a [307 redirect](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/307).

The example below contains the configuration settings that must be true for the redirect to work.

    . . .
      name: https-with-redirect-snippet
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-protocol: "http"
        service.beta.kubernetes.io/do-loadbalancer-tls-ports: "443"
        service.beta.kubernetes.io/do-loadbalancer-certificate-id: "your-certificate-id"
        service.beta.kubernetes.io/do-loadbalancer-redirect-http-to-https: "true"
      spec:
        type: LoadBalancer
        selector:
          app: nginx-example
        ports:
          - name: http
            protocol: TCP
            port: 80
            targetPort: 80
          - name: https
            protocol: TCP
            port: 443
            targetPort: 80
    . . .

See the [full configuration example for forced SSL connections](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/examples/http-nginx-with-redirect.yml).

## Size Unit[](#size-unit)

**Available in:** 1.27.x and later

This setting lets you specify [how many nodes](/products/networking/load-balancers/details/pricing/) the load balancer is created with. The more nodes a load balancers has, the more simultaneous connections it can manage.

The value can be an integer between `1` and `200` and defaults to `1`. Your actual load balancer node limit is determined by your account’s limits. To request an increase to your limits, [contact support](https://cloudsupport.digitalocean.com).

You can resize the load balancer after creation once per minute.

The following example shows how to specify a the number of nodes a load balancer contains:

    . . .
    metadata:
      name: nginx
      annotations:
        kubernetes.digitalocean.com/load-balancer-id: "your-load-balancer-id"
        service.beta.kubernetes.io/do-loadbalancer-size-unit: "3"
        service.beta.kubernetes.io/do-loadbalancer-disable-lets-encrypt-dns-records: "false"
    . . .

## Sticky Sessions[](#sticky-sessions)

**Available in:** 1.27.x and later

Sticky sessions send subsequent requests from the same client to the same node by setting a cookie with a configurable name and TTL (Time-To-Live) duration. The TTL parameter defines the duration the cookie remains valid in the client's browser. This option is useful for application sessions that rely on connecting to the same node for each request.

*   Sticky sessions route consistently to the same nodes, not pods, so you should avoid having more than one pod per node serving requests.
*   Sticky sessions require your service to configure `externalTrafficPolicy: Local` to preserve the client source IP addresses when incoming traffic is forwarded to other nodes.

Use the `do-loadbalancer-sticky-sessions-type` annotation to explicitly enable (`cookies`) or disable (`none`) sticky sessions, otherwise the load balancer defaults to disabling sticky sessions:

    metadata:
      name: sticky-session-snippet
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-protocol: "http"
        service.beta.kubernetes.io/do-loadbalancer-sticky-sessions-type: "cookies"
        service.beta.kubernetes.io/do-loadbalancer-sticky-sessions-cookie-name: "example"
        service.beta.kubernetes.io/do-loadbalancer-sticky-sessions-cookie-ttl: "60"

See a [full configuration example for sticky sessions](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/examples/http-with-sticky-sessions.yml).

## PROXY Protocol[](#proxy-protocol)

**Available in:** 1.27.x and later

Enabling the PROXY protocol allows the load balancer to forward client connection information (such as client IP addresses) to your nodes. The software running on the nodes must be properly configured to accept the connection information from the load balancer.

Options are `true` or `false`. Defaults to `false`.

    ---
    . . .
    metadata:
      name: proxy-protocol
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-enable-proxy-protocol: "true"
    . . .

## Preserving Client Source IP Address[](#preserving-client-source-ip-address)

DigitalOcean load balancers do not automatically [retain the client source IP address](#external-traffic-policies-and-health-checks) when forwarding requests. To preserve the source IP address, do one of the following:

*   Enable [PROXY protocol](#proxy-protocol) - This requires the receiving application or ingress provider to be able to parse the PROXY protocol header.
    
*   Use the `X-Forwarded-For` HTTP header - DigitalOcean load balancers automatically add this header. This option works only when the entry and target protocols are HTTP or HTTP/2 (except for TLS passthrough).
    

For more information, see [Cross-platform support](https://kubernetes.io/docs/tutorials/services/source-ip/#cross-platform-support) in the Kubernetes documentation.

## Backend Keepalive[](#backend-keepalive)

**Available in:** 1.27.x and later

By default, DigitalOcean Load Balancers ignore the `Connection: keep-alive` header of HTTP responses from Droplets to load balancers and close the connection upon completion. When you enable backend keepalive, the load balancer honors the `Connection: keep-alive` header and keeps the connection open for reuse. This allows the load balancer to use fewer active TCP connections to send and to receive HTTP requests between the load balancer and your target Droplets.

Enabling this option generally improves performance (requests per second and latency) and is more resource efficient. For many use cases, such as serving web sites and APIs, this can improve the performance the client experiences. However, it is not guaranteed to improve performance in all situations, and can increase latency in certain scenarios.

The option applies to all forwarding rules where the target protocol is HTTP or HTTPS. It does not apply to forwarding rules that use TCP, HTTPS, or HTTP/2 passthrough.

There are no hard limits to the number of connections between the load balancer and each server. However, if the target servers are undersized, they may not be able to handle incoming traffic and may lose packets. See [Best Practices for Performance on DigitalOcean Load Balancers](/products/networking/load-balancers/concepts/best-practices/).

Options are `true` or `false`. Defaults to `false`.

    ---
    . . .
    metadata:
      name: backend-keepalive
      annotations:
        service.beta.kubernetes.io/do-loadbalancer-enable-backend-keepalive: "true"
    . . .

## Disown[](#disown)

**Available in:** 1.27.x and later

This setting lets you specify whether to disown a managed load balancer. Disowned load balancers cannot be mutated any further, including creation, updates and deletion. You can use this setting to change ownership of a load balancer from one `Service` to another, including a `Service` in another cluster. For more information, see [Changing ownership of a load balancer](https://github.com/digitalocean/digitalocean-cloud-controller-manager/blob/master/docs/controllers/services/examples/README.md#changing-ownership-of-a-load-balancer-for-migration-purposes).

Options are `true` or `false`. Defaults to `false`. You must supply the value as a string, otherwise you may run into a [Kubernetes bug that throws away all annotations on your Service resource](https://github.com/kubernetes/kubernetes/issues/59113).

Warning

Disowned load balancers may not work correctly while disowned. This is because necessary load balancer updates, such as target nodes or configuration annotations, stop being propagated to the load balancer. Similarly, the `Service` status field may not reflect the load balancer’s current state anymore. Consequently, you should assign disowned load balancers to a new `Service` as soon as possible.

The following example shows how to disown a load balancer:

    . . .
    metadata:
      name: disown-snippet
      annotations:
        kubernetes.digitalocean.com/load-balancer-id: "your-load-balancer-id"
        service.kubernetes.io/do-loadbalancer-disown: "true"
    . . .

## Firewall Rules[](#firewall-rules)

**Available in:** 1.27.x and later

### Deny Rules[](#deny-rules)

Specifies the firewall rules that block traffic from passing. Rules must be in the format `{type}:{source}`.

The following example shows how to add firewall rules to block incoming connections from the `198.51.100.0/16` IP block.

    . . .
    metadata:
      name: firewall-rules
      annotations:
        kubernetes.digitalocean.com/load-balancer-id: "your-load-balancer-id"
        service.beta.kubernetes.io/do-loadbalancer-deny-rules: "cidr:198.51.100.0/16"
    . . .

### Allow Rules[](#allow-rules)

Note

The `service.beta.kubernetes.io/do-loadbalancer-allow-rules` annotation is deprecated. Use [the `LoadBalancerSourceRanges` field in the service configuration file](/products/kubernetes/how-to/add-load-balancers/#create-a-configuration-file) instead. Values specified in the field take precedence over this annotation.

Specifies the firewall rules that allow traffic to pass. Rules must be in the format `{type}:{source}`.

## References[](#references)

For more about managing load balancers, see:

*   [What is Load Balancing?](https://www.digitalocean.com/community/tutorials/what-is-load-balancing) for a conceptual overview of load balancing.
    
*   [DigitalOcean Load Balancer overview](/products/networking/load-balancers/) for the features and limits of DigitalOcean Load Balancers.
    
*   [DigitalOcean Cloud Controller Load Balancer Service Annotations](https://github.com/digitalocean/digitalocean-cloud-controller-manager/tree/master/docs/controllers/services) for more examples.
    
*   [Other Kubernetes Components](https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes#other-kubernetes-components) in the DigitalOcean Community’s [Introduction to Kubernetes](https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes).
    
*   [Kubernetes Services](https://kubernetes.io/docs/concepts/services-networking/service/) in the official [Kubernetes Concepts guide](https://kubernetes.io/docs/concepts/).
    
*   [How to Set Up an Ingress-NGINX with Cert-Manager on DigitalOcean Kubernetes](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-with-cert-manager-on-digitalocean-kubernetes) is a good example use case for DigitalOcean Load Balancers on Kubernetes. The Ingress-NGINX LoadBalancer Service routes all load balancer traffic to nodes running Ingress-NGINX Pods. Other nodes deliberately fail load balancer health checks so that the ingress traffic does not get routed to them.
    

In this article...

*   [Name](#name)
*   [Protocol](#protocol)
*   [Network Load Balancer](#network-load-balancer)
*   [Internal Load Balancer](#internal-load-balancer)
*   [Health Checks](#health-checks)
    *   [Port](#port)
    *   [Path](#path)
    *   [Protocol](#protocol-1)
    *   [Override Health Check](#override-health-check)
    *   [Interval](#interval)
    *   [Timeout](#timeout)
    *   [Threshold](#threshold)
    *   [External Traffic Policies and Health Checks](#external-traffic-policies-and-health-checks)
*   [Ports](#ports)
    *   [HTTP Ports](#http-ports)
    *   [HTTP/2 Ports](#http2-ports)
    *   [HTTP/3 Ports](#http3-ports)
    *   [TLS Ports](#tls-ports)
*   [HTTP Idle Timeout](#http-idle-timeout)
*   [Accessing by Hostname](#accessing-by-hostname)
*   [SSL Certificates](#ssl-certificates)
*   [Forced SSL Connections](#forced-ssl-connections)
*   [Size Unit](#size-unit)
*   [Sticky Sessions](#sticky-sessions)
*   [PROXY Protocol](#proxy-protocol)
*   [Preserving Client Source IP Address](#preserving-client-source-ip-address)
*   [Backend Keepalive](#backend-keepalive)
*   [Disown](#disown)
*   [Firewall Rules](#firewall-rules)
    *   [Deny Rules](#deny-rules)
    *   [Allow Rules](#allow-rules)
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

Try using
