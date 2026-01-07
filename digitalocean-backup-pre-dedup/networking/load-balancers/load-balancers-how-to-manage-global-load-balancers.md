---
source: '[unknown - load-balancers-how-to-manage-global-load-balancers.md]'
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               How to Manage Global Load Balancers | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/load-balancers.1b5f8a9d40bf92d2798a187032a28a29572afdd5e74855e5b1c1d30dfffc07ed.svg)Load Balancers](/products/networking/load-balancers/)
*   [Getting Started](/products/networking/load-balancers/getting-started/)
    *   [Quickstart](/products/networking/load-balancers/getting-started/quickstart/)
    *   [Manage Load Balancers with doctl](/products/networking/load-balancers/getting-started/with-doctl/)
*   [How-Tos](/products/networking/load-balancers/how-to/)
    *   [Create Regional Load Balancers](/products/networking/load-balancers/how-to/create/)
    *   [Create Global Load Balancers](/products/networking/load-balancers/how-to/create-global-load-balancer/)
    *   [Manage Regional Load Balancers](/products/networking/load-balancers/how-to/manage/)
    *   [Manage Global Load Balancers](/products/networking/load-balancers/how-to/manage-global-load-balancers/)
    *   [Scale Regional Load Balancers](/products/networking/load-balancers/how-to/scale/)
    *   [Configure SSL Passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/)
    *   [Balance TCP Traffic](/products/networking/load-balancers/how-to/tcp/)
    *   [Configure Backend Droplets](/products/networking/load-balancers/how-to/configure-droplets-for-nlb/)
    *   [Destroy Load Balancers](/products/networking/load-balancers/how-to/destroy/)
    *   [Configure SSL Termination](/products/networking/load-balancers/how-to/ssl-termination/)
*   [Reference](/products/networking/load-balancers/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Load-Balancers)
    *   [CLI Reference](/reference/doctl/reference/compute/load-balancer/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/networking/load-balancers/concepts/)
    *   [Best Practices](/products/networking/load-balancers/concepts/best-practices/)
    *   [Load Balancer Status](/products/networking/load-balancers/concepts/load-balancer-status/)
*   [Details](/products/networking/load-balancers/details/)
    *   [Features](/products/networking/load-balancers/details/features/)
    *   [Pricing](/products/networking/load-balancers/details/pricing/)
    *   [Availability](/products/networking/load-balancers/details/availability/)
    *   [Limits](/products/networking/load-balancers/details/limits/)
*   [Support](/products/networking/load-balancers/support/)

*   [How-Tos](/products/networking/load-balancers/how-to/) 
*   Manage Global Load Balancers

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Manage Global Load Balancers

Validated on 20 Dec 2024 • Last edited on 17 Jun 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

After creating a global load balancer, you can add additional backend resources and domains, and modify its settings to fit your needs.

## Add or Remove Resources[](#add-or-remove-resources)

The backend resources for a global load balancer can be either Droplets or regional load balancers, but not both. When you add backend resources to a global load balancer, you can specify regional load balancers by name and specify Droplets either by name or by [tag](/products/droplets/how-to/tag/).

To add backend resources to a global load balancer from the control panel, click **Networking** in the left menu. From [the **Load Balancers** tab](https://cloud.digitalocean.com/networking/load_balancers), click the global load balancer that you want to add resources to.

On the load balancer’s page, global load balancers with no resources attached have a **Connect Resources** button. Global load balancers with resources have an **Add Droplets**, **Edit Tags**, or **Connect Load Balancers** button to add more of the same type of resource. Click the relevant button for your load balancer.

In the **Add Resources** window that opens, enter the name of the Droplet, regional load balancer, or the tag you want to add to the load balancer. The field populates with a list of resources that match your search criteria. Click the item that you want to add and then click the **Add** button. The selected resources are added to the load balancer’s backend node pool.

![The Add Droplet model](https://docs.digitalocean.com/screenshots/load-balancers/glb-add-droplets.0923921e3ce6b6385c27e016b3c4c9c5049f77221b42e9f2956c0dddc022b291.png)

To remove backend resources, click the **More** button beside the resource you want to remove and then click **Remove**.

## Additional Settings[](#additional-settings)

To edit your global load balancer’s settings, click **Networking** in the main menu, and then click **Load Balancers** to go to the load balancer’s overview page. From the overview page, click the **Settings** tab.

You can edit the following settings in the **Settings** tab:

### Domains[](#domains)

In the **Domains** section, you can add or remove domains that route traffic to the load balancer, and subsequently, its backend Droplets. Follow the instructions in the [Connect a Domain section](/products/networking/load-balancers/how-to/create-global-load-balancer/#connect-a-domain) of the setup guide to add a domain to your load balancer.

### CDN Caching[](#cdn-caching)

Enabling CDN caching allows DigitalOcean’s CDN to cache your server’s responses. This places your most requested content closer to your users, and reduces the load on your origin server.

If you enable CDN caching, your server responses must include the `Cache-Control` HTTP header. This tells the CDN how long to cache the response for before requesting a new response from the origin server. For example, the following header, `Cache-Control: public, max-age=3600`, tells the CDN to cache the response for one hour.

The following example shows how to set up your server responses for caching using an Express JS server. The server response is set to cache for one hour.

`app.js`

    const express = require('express');
    const app = express();
    
    // Middleware to set caching headers
    app.use((req, res, next) => {
        res.set('Cache-Control', 'public, max-age=3600'); // Cache for 1 hour
        next();
    });
    
    app.get('/', (req, res) => {
        res.send('Hello World');
    });
    
    app.listen(3000, () => {
        console.log('Server running at http://127.0.0.1:3000/');
    });

### Forwarding Rules[](#forwarding-rules)

Unlike regional load balancers, global load balancers can only have one forwarding rule, and the rule can only use HTTP protocols (`HTTP`, `HTTPS`, and `HTTP2` ) to forward traffic to the backend Droplets. The rule can only forward traffic to either ports `80` and `443`.

You can update the forwarding rule’s protocol and port in the **Forwarding Rules** section as needed.

### Health Checks[](#health-checks)

Health checks verify that your Droplets are online and meet any customized health criteria. Load balancers only forward requests to Droplets that pass health checks. If your load balancer uses UDP in its forwarding rules, the load balancer requires that you set up a health check with a port that uses TCP, HTTP, or HTTPS to work properly.

In the **Target** section, you choose the **Protocol** (HTTP, HTTPS, or TCP), **Port** (80 by default), and **Path** (`/` by default) that nodes should respond on.

In the **Additional Settings** section, you choose:

*   The **Check Interval**, which is how many seconds the load balancer waits between health checks.
*   The **Response Timeout**, which is how many seconds the load balancer waits between responses.
*   The **Unhealthy Threshold**, which is how many consecutive times a node must fail a health check before the load balancer stops forwarding traffic to it.
*   The **Healthy Threshold**, which is how many consecutive times a node must pass a health check before the load balancer forwards traffic to it.

The success criteria for HTTP and HTTPS health checks is a status code response in the range 200 - 399. The success criteria for TCP health checks is completing a TCP handshake to connect.

Note

HTTP and HTTPS health checks may fail with Droplets running Apache on Rocky Linux because the default Apache page returns a 403 Forbidden HTTP response code. To fix this, either change the health check from HTTP/HTTPS to TCP or configure Apache to return a 200 OK response code by creating an HTML page in Apache’s root directory.

### Traffic Distribution Priority[](#traffic-distribution-priority)

By default, global load balancers route traffic to your backend resources in the nearest available region. However, if a region becomes unhealthy, traffic is routed to the nearest healthy region. You can change this to prioritize routing traffic to specific regions in the event of failover.

### Sticky Sessions[](#sticky-sessions)

Sticky sessions send subsequent requests from the same client to the same Droplet by setting a cookie with a configurable name and TTL (Time-To-Live) duration. The TTL parameter defines the duration the cookie remains valid in the client's browser. This option is useful for application sessions that rely on connecting to the same Droplet for each request.

### SSL[](#ssl)

The SSL option redirects HTTP requests on port 80 to HTTPS on port 443. When you enable this option, HTTP URLs are forwarded to HTTPS with a [307 redirect](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/307).

### HTTP Idle Timeout[](#http-idle-timeout)

By default, load balancer connections time out after being idle for 60 seconds. You can increase or decrease this amount of time to fit your application’s needs. You can set it for a minimum of 30 seconds and a maximum 600 seconds (10 minutes).

In this article...

*   [Add or Remove Resources](#add-or-remove-resources)
*   [Additional Settings](#additional-settings)
    *   [Domains](#domains)
    *   [CDN Caching](#cdn-caching)
    *   [Forwarding Rules](#forwarding-rules)
    *   [Health Checks](#health-checks)
    *   [Traffic Distribution Priority](#traffic-distribution-priority)
    *   [Sticky Sessions](#sticky-sessions)
    *   [SSL](#ssl)
    *   [HTTP Idle Timeout](#http-idle-timeout)

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