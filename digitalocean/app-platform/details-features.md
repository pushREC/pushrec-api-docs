---
source: https://docs.digitalocean.com/products/app-platform/details/features/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# Load Balancers Limits

Validated on 27 Feb 2025 • Last edited on 22 Sep 2025

DigitalOcean fully manages Regional Load Balancers and Global Load Balancers, ensuring they are highly available load balancing services. Load balancers distribute traffic to groups of backend resources in specific regions or across different regions, which prevents the health of a service from depending on the health of a single server, cluster, or region.

*   The number of Load Balancers you can have on your account, and the size of each Load Balancer, depends on the limits set for your account. We use dynamic resource limits to protect our platform against bad actors. Currently, you can’t check your resource limit for Load Balancers, but you can [contact support](https://cloudsupport.digitalocean.com) if you reach the limit and need to increase it. We are working on features that allow you to review this limit in the control panel.
    
*   Load balancers have a maximum number of new SSL connections they can establish per second depending on their size. If they exceed this number, the underlying connection is closed. See [Plans and Pricing](/products/networking/load-balancers/details/pricing/) for the connection limits of each load balancer size.
    
*   You can add up to 10 backend Droplets by name. If you need to add more than 10 Droplets to a load balancer, you can use a [tag](/products/droplets/how-to/tag/). You can apply the tag to as many Droplets as needed and [then add the tag to the load balancer](/products/networking/load-balancers/how-to/manage/#droplets). There is no limit to the number of Droplets to which you can apply a tag. Using a tag automatically updates your load balancer when you add or remove the tag from Droplets.
    

### Regional Load Balancers[](#regional-load-balancers)

*   DigitalOcean Load Balancers only support TLS 1.2 and TLS 1.3 for incoming connections, and do not support downgrading incoming connections to TLS 1.0 or 1.1. The same limits apply to connections from load balancers to Droplets.
    
*   Each load balancer node can support up to 10,000 requests per second.
    
*   Because regional load balancers are network load balancers, not application load balancers, they do not support directing traffic to specific backends based on URLs, cookies, HTTP headers, etc.
    
*   When using SSL passthrough (for example, port 443 to 443), load balancers do not support headers that preserve client information, such as `X-Forwarded-Proto`, `X-Forwarded-Port`, or `X-Forwarded-For`. Load balancers only inject those HTTP headers when the entry and target protocols are HTTP, or HTTPS with a certificate (not passthrough).
    
*   Sticky sessions are only visible at the load balancer layer; the cookies used for sticky sessions are both set and stripped at the load balancer. Because those cookies are not present in the request sent to the backend Droplets, backend applications cannot use them.
    
*   By default, load balancers do not honor `Connection: keep-alive` headers returned by target Droplets. You can configure the load balancer to use fewer active TCP connections by enabling the [backend keepalive setting](/products/networking/load-balancers/how-to/manage/#backend-keepalive).
    
*   You cannot add or remove firewall rules to load balancers using the control panel, but you can add them using the [API](/reference/api/digitalocean/#operation/loadBalancers_update) or [CLI](/reference/doctl/reference/compute/load-balancer/update/) by adding IP addresses and CIDRs to the `allow` list and `deny` list fields.
    
*   A load balancer’s firewall can contain up to 500 `allow` rules and 500 `deny` rules.
    
*   Regional load balancers have a maximum number of simultaneous connections they can maintain. If this number is exceeded, the underlying TCP connection is closed. See [Plans and Pricing](/products/networking/load-balancers/details/pricing/) for the connection limits of each load balancer size. Because DigitalOcean Regional Load Balancers operate on the transport layer of the OSI model, they do not return an HTTP code when a connection is refused due to maximum capacity.
    
*   You can resize regional load balancers up to once per minute. The cost is prorated based on how long the load balancer operates at each size, with a minimum charge of $0.01.
    
*   HTTP health checks are sent using HTTP/1.1. If your web server uses a version other than HTTP/1.1, the headers in the health check may not be compatible, so you need to use a TCP check.
    
*   You cannot assign a reserved IP address to a regional load balancer.
    
*   Sticky sessions do not work with SSL passthrough (port 443 to 443). They do work with SSL termination (port 443 to 80) and HTTP requests (port 80 to 80).
    
*   Ports 50053, 50054 and 50055 are reserved on regional load balancers, so you cannot use those ports in forwarding rules.
    
*   You cannot resize regional load balancers that are sending traffic to Droplets that don’t reside in a VPC network. To resize such load balancers, [recreate the Droplets within a VPC network](/products/networking/vpc/getting-started/quickstart/#migrate-an-existing-droplet-to-a-vpc-network) or remove them from the load balancer’s pool.
    
*   Each load balancer may have a maximum of 40 forwarding rules.
    
*   When using UDP in forwarding rules, the maximum payload size of a UDP packet sent to the load balancer is 1424 bytes.
    
*   HTTP/3 rules do not support TLS passthrough.
    
*   Setting a custom time out length has no effect on HTTPS and HTTP/2 forwarding rules using TLS passthrough.
    
*   Network load balancers on DOKS do not support IPv6.
    

### Global Load Balancers[](#global-load-balancers)

*   Global load balancers do not support Server Name Indication (SNI).

### Let’s Encrypt[](#lets-encrypt)

*   You must [manage your DNS records on DigitalOcean](/products/networking/dns/) in order for us to manage Let’s Encrypt on load balancers on your behalf.
    
*   Let’s Encrypt on DigitalOcean only supports [SSL termination](/products/networking/load-balancers/how-to/ssl-termination/). [SSL passthrough](/products/networking/load-balancers/how-to/ssl-passthrough/) requires certificates on the Droplets themselves, and DigitalOcean does not install or maintain certificates on unmanaged services like Droplets.
    
*   [Let’s Encrypt imposes rate limits](https://letsencrypt.org/docs/rate-limits/) of:
    
    *   20 certificates per registered domain per week
    *   100 names per certificate
    *   5 duplicate domain certificates per week
    
    If your certificate isn’t issued on the first try, we automatically retry at 20 minute intervals up to 3 times. After that, we send email to your account’s address letting you know that the certificate creation failed.
    
*   Let’s Encrypt TLS certificates are ECDSA P-256. These certificates follow the shorter chain rooted at ISRG Root X1, and are not cross-signed by the expired DST Root CA X3. This means that very old devices, like those running Android versions prior to 7.1.1, cannot connect to any Load Balancers or Spaces CDNs using these certificates.
    
    If you need to maintain compatibility with older devices, you can [contact support](https://cloudsupport.digitalocean.com) and request that we downgrade your Let’s Encrypt certificate to RSA-2048. Per [Let’s Encrypt](https://letsencrypt.org/2020/12/21/extending-android-compatibility.html), starting in September 2024, older Android devices show certificate errors even with downgraded certificates.