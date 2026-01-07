---
source: https://docs.digitalocean.com/products/app-platform/details/limits/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 App Platform Limits

Validated on 16 Jun 2022 • Last edited on 5 Jan 2026

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## Storage Limits[](#storage-limits)

*   The host instances running App Platform containers do not provide persistent data storage. Data in the host instance’s local filesystem is permanently lost after deployments and other container replacements. The local filesystem is additionally limited to 4 GiB, and if it is filled to capacity, the container is detected as unhealthy and replaced.

Apps should only use the host instance’s local filesystem for small amounts of temporary storage. For persistent storage, you can use [Spaces Object Storage](/products/spaces/) or [DigitalOcean Managed Databases](/products/databases/).

*   File uploads to apps timeout after 100 seconds.
    
*   App Platform does not support volumes.
    

## Build and Deployment Limits[](#build-and-deployment-limits)

*   App Platform allocates 4 CPU cores, 10 GiB of memory, and 24 GiB of disk space to each build. Processes related to managing the build and its export consume a small portion of these resources, so the build itself may have access to a slightly smaller amount of resources than listed here. If you require more resources for builds, you can use [GitHub Actions](/products/app-platform/how-to/deploy-from-github-actions/) or other CI/CD tools to externally [build containers and push them to App Platform](/products/app-platform/how-to/deploy-from-container-images/).
    
*   Builds time out after 1 hour.
    
*   Job deployments time out after 30 minutes.
    

## Image Limits[](#image-limits)

*   We do not limit the size of images deployed to App Platform, but we recommend using images less than 1 GiB in size. Images larger than 2 GiB are likely to experience build and deployment issues.
    
*   App Platform only supports Linux-based container images built for the AMD64 architecture. If you push an image with a different OS or architecture, the build fails.
    

## Scaling Limits[](#scaling-limits)

*   Autoscaling is only available for app components using [dedicated CPUs](/products/app-platform/details/pricing/#container-pricing).
    
*   Each app supports a maximum of 250 containers (`instance_count` in app spec), whether scaled manually or using autoscaling. To scale beyond this limit, use larger container sizes or [contact support](https://cloudsupport.digitalocean.com).
    

## Repository Service Limits[](#repository-service-limits)

*   App Platform can only integrate with GitHub repositories, GitLab repositories, or public Git repositories over HTTPS. Support for other source providers is planned. When the source is a GitLab respository, to prevent a cloning error, you must first [enable HTTPS and SSH protocols](https://docs.gitlab.com/administration/settings/visibility_and_access_controls/#configure-enabled-git-access-protocols) on it.
    
*   Currently, [Git LFS support](/products/app-platform/how-to/manage-source-repo/#git-lfs) is available only for GitHub repositories.
    
*   App Platform does not support auto-deployment of images from Docker Hub repositories or from GitHub Registry. If you need to auto deploy for your images, consider using [DigitalOcean Container Registry](/products/container-registry/).
    
*   Git submodules that reference SSH path style repos fail to build. Replace SSH submodule links with HTTPS to avoid this limitation.
    
*   You must store private git submodules in the GitHub account you have authorized App Platform to use. Referencing private git submodules that the authorized GitHub account cannot access causes the build to fail.
    
*   You must have an [**Owner** or **Maintainer** permissions-role](https://docs.github.com/en/organizations/managing-peoples-access-to-your-organization-with-roles/roles-in-an-organization) in any GitHub repository that you want to access from App Platform.
    
*   App Platform does not support SHA-256 repositories.
    

## Database Limits[](#database-limits)

*   Dev database cluster permissions do not allow you to create additional databases. You can only use the cluster’s default database. If you need additional databases in your cluster, consider using a [DigitalOcean Managed Database](/products/databases/), instead.
    
*   App Platform’s engine support for dev databases is currently limited to PostgreSQL, but you can create a [PostgreSQL, MySQL, MongoDB, Kafka, OpenSearch, or Valkey managed database](/products/databases/) with DigitalOcean for use in your app.
    
*   Dev databases are located in the same region as your app and cannot be migrated to another region. If you migrate your app to a different region, the app won’t be able to access the associated dev database anymore. If you need to migrate your app and dev database, we recommend either backing up the contents of the database and restoring it after the app’s migration, or using a [DigitalOcean Managed Database](/products/databases/) instead. You can migrate managed databases independently of apps to different regions as needed.
    
*   App Platform does not support connecting to DigitalOcean Managed Databases during the build process if the database has trusted sources enabled. This is because the app’s network configuration information can only be provided to the database’s trusted sources list after the app has been built.
    
*   App Platform does not currently support connections to Kafka databases that have trusted sources enabled. You must [disable trusted sources](/products/app-platform/how-to/manage-databases/#disable-trusted-sources) on the Kafka database before it can be integrated with an App Platform app.
    
*   App Platform does not currently support logging to OpenSearch databases that have trusted sources enabled. OpenSearch clusters with trusted sources enabled are supported as a regular database connection.
    
*   MongoDB database names cannot contain capital letters when adding them [using an app spec](/products/app-platform/how-to/update-app-spec/).
    

## Networking Limits[](#networking-limits)

*   You cannot attach the same [dedicated egress IP addresses](/products/app-platform/how-to/add-ip-address/#add-dedicated-egress-ips) to multiple apps. App Platform assigns dedicated IPs to each app individually. Apps may run in different clusters or regions, so they cannot share IPs. To use the same egress IP, deploy your apps in a single [Kubernetes cluster](/products/kubernetes/how-to/create-clusters/).
    
*   App Platform does not directly support adding `301` and `302` redirects. However, you can work around this by [creating a free app that redirects traffic to another domain](/products/app-platform/how-to/manage-domains/).
    
*   We do not offer [dedicated egress IPv6 addresses](/products/app-platform/how-to/add-ip-address/#add-dedicated-egress-ips).
    
*   App Platform apps do not support connecting to IPv6 services or hosts. If you have explicitly configured your app’s code to use IPv6, you may experience `ETIMEDOUT` timeout errors when using IPv6 connections. To solve this issue, enable IPv4 connections in your app’s code. For example, in a `server.js` file, bind your host to `0.0.0.0` to enable all interfaces, including IPv4. Alternatively, for apps built with Dockerfiles, you can [enable IPv6 on custom Docker images](https://docs.docker.com/engine/daemon/ipv6).
    
*   App Platform does not support adding DNSSEC enabled domains to apps.
    
*   Dedicated egress IPs are an app-level feature. When you assign them to an app, all egress (outgoing) traffic from the app’s components use the addresses assigned to the app, except for [functions](/products/app-platform/how-to/manage-functions/). Egress traffic from functions cannot use dedicated egress IPs and their own addresses can change at any time.
    
*   You cannot [forward logs](/products/app-platform/how-to/forward-logs/) from [dedicated egress IPs](/products/app-platform/how-to/add-ip-address/). Log forwarding uses its own routing to send logs.
    
*   Individual log messages forwarded from apps have a maximum size limit of 2048 bytes.
    
*   Browsers aggressively cache redirects, and as such you may need to clear your cache and hard refresh to see changes in your redirect configuration.
    
*   App Platform only supports high availability (HA) for apps running two or more containers so that there is a failover for App Platform’s load balancer to use.
    
*   You cannot open SSH or SFTP ports on App Platform containers. You must deploy code changes through your code repository or container image.
    
*   You cannot open SMTP ports on App Platform containers.
    
*   App Platform supports HTTP/2, however you need to [configure your app to use the protocol](/products/app-platform/how-to/configure-http2/). App Platform’s edge servers negotiate HTTP/2 connections from supported clients, but if your app is not configured to receive these requests, App Platform downgrades these requests to HTTP/1.1 when relayed to the app’s container. Apps support [gRPC](https://grpc.io/about) once you have enabled HTTP/2.
    
*   App Platform’s edge servers negotiate HTTP/2 and HTTP/3 connections from supported clients. However, App Platform downgrades these requests to HTTP/1.1 when relayed to an app’s container. We do not support [gRPC](https://grpc.io/about/) over HTTP/2.
    
*   While App Platform automatically upgrades all HTTP requests to HTTPS requests, it does not set HTTP Strict-Transport-Security (HSTS) headers for apps. If you want to set HSTS headers for your app, you need to set the headers in your app’s code. All apps hosted on the `.ondigitalocean.app` domain automatically behave as if HSTS has been set as the `.app` TLD is on the [HSTS preload](https://hstspreload.org) list.
    
*   We do not limit the number of concurrent connections to your app, but each connection consumes system resources and may affect your app’s performance when it is under heavy load. If you are experiencing performance issues related to large numbers of concurrent connections, we recommend [scaling your app](/products/app-platform/how-to/scale-app/) to better handle the work load.
    
*   Apps are hosted in the region you select during the initial deployment but the app’s IP address may appear to be in a US region. This is expected behavior as App Platform routes traffic to apps through Cloudflare’s global CDN, a US-based company. Learn more about [why apps have US-based IP addresses](/support/why-does-my-app-have-a-us-based-ip-address-when-i-created-it-in-a-different-region/).
    
*   App Platform does not officially support node clustering, such as [Erlang clustering](https://www.erlang.org/doc/reference_manual/distributed.html). This is because we currently don’t expose a way to discover the cluster nodes.
    
*   You cannot disable the CDN cache for apps with static sites. As a workaround, you can either create a new app for the static site or serve the static site from a [web service](/products/app-platform/how-to/manage-services/).
    
*   Disabling the CDN cache requires a [custom domain](/products/app-platform/how-to/manage-domains/) and does not work with the starter domain.
    
*   VPC is not currently supported for Function components.
    

## Other Limits[](#other-limits)

*   Each App Platform application can have up to 500 domains.
    
*   You cannot move apps between teams. You can only move them between projects within the same team. To transfer an app to a different team, [recreate it in the new team](/products/app-platform/how-to/create-apps/), then [delete it from the original team](/products/app-platform/how-to/destroy-app/).
    
*   App Platform does not currently support injecting values on disk at build time. However, you can use environment variables to inject values at runtime using runtime commands.
    
*   App Platform is not [PCI DSS compliant](https://www.pcisecuritystandards.org/standards/) and may not be suitable for fintech applications. You can use a [Droplet](/products/droplets/) as an alternative to App Platform to give you more control over your infrastructure.
    
*   You cannot increase or decrease resources for static sites. App Platform deploys and serves static sites using [DigitalOcean’s Spaces CDN](/products/spaces/), as they do not require a container or runtime. You can only increase or decrease resources for [service, worker, and job components](/products/app-platform/how-to/manage-components/).
    
*   Configuration changes that redeploy your app also trigger a pull of the latest source code from your repo. This is by design.
    
*   App Platform only supports binaries built for the [AMD64](https://en.wikipedia.org/wiki/X86-64) CPU architecture.
    
*   App Platform uses the [gVisor](https://gvisor.dev/) container runtime sandbox and some [system calls are not supported](https://gvisor.dev/docs/user_guide/compatibility/linux/amd64/).
    
*   App Platform does not support resource usage reporting with [PM2](https://pm2.keymetrics.io/) in Node.js apps. Instead, use the **Insights** tab [to see insights](/products/app-platform/how-to/view-insights/) such as memory and CPU usage.
    
*   You must explicitly start system-level cron jobs using your app’s run commands. cron jobs do not start automatically like on standard Linux systems.
    
*   You cannot view accrued transfer allowance or cumulative usage for App Platform. You can [view ingress bandwidth](/products/app-platform/how-to/view-insights/) for individual apps.
    
*   App Platform does not currently support changing time zones for build and runtime logs, which are displayed in UTC.
    
*   The “Deploy to DO” button only supports public repositories and Dev Databases.
    

## Known Issues[](#known-issues)

*   Next.js apps deployed to App Platform can be vulnerable to [Cache Poisoning Denial of Service (CPDoS) attacks](https://cpdos.org). To avoid this, we recommend [omitting the `cache-control` header](https://nextjs.org/docs/app/building-your-application/caching#opting-out-2) from your app’s responses or setting them to `private` if the response is not cacheable.