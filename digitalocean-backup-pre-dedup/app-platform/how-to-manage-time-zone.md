---
source: https://docs.digitalocean.com/products/app-platform/how-to/manage-time-zone/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Manage App Server's Time Zone

Validated on 6 Oct 2023 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App servers are set to use the UTC time zone by default. You can change your app server’s time zone by declaring a `TZ` [environment variable](/products/app-platform/how-to/use-environment-variables/) and setting the value to a `TZ` identifier from the [tz database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

For example, to set a server’s time zone to West Africa, declare a variable with the key `TZ` and set its value to `Africa/Lagos`.

To verify that the time zone has changed, click your app’s **Console** tab and then run the `date` command in the console. The command returns the current time in the server’s current time zone.

If you use your own container image, make sure it includes the `tzdata` package. Without it, changing the `TZ` environment variable has no effect.

App Platform does not currently support changing time zones for build and runtime logs, which are displayed in UTC.