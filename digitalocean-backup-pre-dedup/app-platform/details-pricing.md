---
source: https://docs.digitalocean.com/products/app-platform/details/pricing/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 App Platform Pricing

Validated on 17 Jan 2025 • Last edited on 29 Aug 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

An app is made up of one or more components like web [services](https://docs.digitalocean.com/glossary/service/) , databases, or [workers](https://docs.digitalocean.com/glossary/worker/) . When you run an app, we deploy an instance (that is, a container) for each of the component. The total cost of running a component is determined by the container size multiplied by the number of containers.

Most plans allow you to [scale your app](/products/app-platform/how-to/scale-app/) (add additional containers) to match your workload. Plans with dedicated CPUs offer [autoscaling](/products/app-platform/how-to/scale-app/#configure-auto-scaling-for-an-app-using-the-control-panel).

Apps are billed by the second, starting at a minimum of one minute. Databases (both development and production) are billed by the hour, starting at a minimum of one hour. If you create an app and destroy it less than an minute later, you are still charged the minimum charge of $0.01.

App components are billed for the first 28 days of the month after creation. The 28-day count restarts when you rename an app component. This can cause excess billing for additional days at the end of the month. For example, if you create a component on 1 July and rename it on 3 July, you are billed for 30 days in July instead of 28.

## Current Plans[](#current-plans)

The table below shows monthly pricing per container and available container sizes.

API/CLI Slug

CPUs

RAM

Bandwidth Allowance

Price

Manual Scaling

Auto Scaling

`apps-s-1vcpu-0.5gb`

1 shared

512 MiB

50 GiB per month

$5.00 per month

No

No

`apps-s-1vcpu-1gb-fixed`

1 shared

1 GiB

100 GiB per month

$10.00 per month

No

No

`apps-s-1vcpu-1gb`

1 shared

1 GiB

150 GiB per month

$12.00 per month

Yes

No

`apps-s-1vcpu-2gb`

1 shared

2 GiB

200 GiB per month

$25.00 per month

Yes

No

`apps-s-2vcpu-4gb`

2 shared

4 GiB

250 GiB per month

$50.00 per month

Yes

No

`apps-d-1vcpu-0.5gb`

1 dedicated

512 MiB

100 GiB per month

$29.00 per month

Yes

Yes

`apps-d-1vcpu-1gb`

1 dedicated

1 GiB

200 GiB per month

$34.00 per month

Yes

Yes

`apps-d-1vcpu-2gb`

1 dedicated

2 GiB

300 GiB per month

$39.00 per month

Yes

Yes

`apps-d-1vcpu-4gb`

1 dedicated

4 GiB

400 GiB per month

$49.00 per month

Yes

Yes

`apps-d-2vcpu-4gb`

2 dedicated

4 GiB

500 GiB per month

$78.00 per month

Yes

Yes

`apps-d-2vcpu-8gb`

2 dedicated

8 GiB

600 GiB per month

$98.00 per month

Yes

Yes

`apps-d-4vcpu-8gb`

4 dedicated

8 GiB

700 GiB per month

$156.00 per month

Yes

Yes

`apps-d-4vcpu-16gb`

4 dedicated

16 GiB

800 GiB per month

$196.00 per month

Yes

Yes

`apps-d-8vcpu-32gb`

8 dedicated

32 GiB

900 GiB per month

$392.00 per month

Yes

Yes

### Free Tier[](#free-tier)

App Platform offers a free tier for [static sites](https://docs.digitalocean.com/glossary/static-site/) . We recommend the free tier for hosting personal websites, portfolios, small projects, and trying out App Platform.

The free tier includes:

*   Deploying up to three apps that use only [static site components](/products/app-platform/how-to/manage-static-sites/). For example, you can deploy an app that hosts four different static websites, and then create two additional apps that host a single static website for free. Each additional app containing static website components costs $3.00 per month per month.
*   1 GiB of outbound data for each app. Additional outbound data transfer costs $0.02 per GiB.

### Legacy Plans[](#legacy-plans)

Legacy plans only apply to apps created before 7 May 2024. We intend to deprecate legacy plans soon, so we strongly encourage you to use the new plans when creating or upgrading apps. The new plans offer the same or better pricing and substantially higher egress data allowance.

Click to view pricing for legacy plans.

API/CLI Slug

CPUs

RAM

Bandwidth Allowance

Price

Manual Scaling

Auto Scaling

`basic-xxs`

1 shared

512 MiB

40 GiB per month

$5.00 per month

No

No

`basic-xs`

1 shared

1 GiB

40 GiB per month

$10.00 per month

No

No

`basic-s`

1 shared

2 GiB

40 GiB per month

$20.00 per month

No

No

`basic-m`

2 shared

4 GiB

40 GiB per month

$40.00 per month

No

No

`professional-xs`

1 shared

1 GiB

100 GiB per month

$12.00 per month

Yes

No

`professional-s`

1 shared

2 GiB

100 GiB per month

$25.00 per month

Yes

No

`professional-m`

2 shared

4 GiB

100 GiB per month

$50.00 per month

Yes

No

`professional-1l`

1 dedicated

4 GiB

100 GiB per month

$75.00 per month

Yes

Yes

`professional-l`

2 dedicated

8 GiB

100 GiB per month

$150.00 per month

Yes

Yes

`professional-xl`

4 dedicated

16 GiB

100 GiB per month

$300.00 per month

Yes

Yes

## App Services & Jobs[](#app-services--jobs)

App services and jobs are billed at a monthly rate based on the above size slug, prorated per-second. Unlike services, jobs are only billed when they are run.

## Bandwidth[](#bandwidth)

Each App Platform plan includes an amount of [free outbound data transfer](/products/app-platform/details/pricing/#current-plans). Additional outbound transfer is billed at $0.02 per GiB. Inbound transfer to App Platform is free.

Transfer allowance and usage is pooled cumulatively across all apps at the team level, not individually per app or component. Accrued transfer does not roll over between months and cannot be transferred between teams.

You can [view ingress bandwidth](/products/app-platform/how-to/view-insights/) for individual apps, but you cannot currently view the accrued transfer allowance or cumulative usage for App Platform.

For more details and examples of bandwidth billing for App Platform, see the [bandwidth billing page](/platform/billing/bandwidth/#app-platform-details).

## Dedicated Egress IP Addresses[](#dedicated-egress-ip-addresses)

Dedicated IPs are billed per second up to $25.00 per month. We enforce a 60 second usage time upon the first use of a dedicated IP.

## Development Databases[](#development-databases)

Development databases are $7.00 per month per 512MB database. Additional outbound data transfer is $0.02 per GiB in a month.

You can view the pricing for DigitalOcean Managed Databases, Spaces (object storage), and DigitalOcean Functions on [the pricing page](https://www.digitalocean.com/pricing).