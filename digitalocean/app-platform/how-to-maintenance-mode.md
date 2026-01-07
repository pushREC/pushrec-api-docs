---
source: https://docs.digitalocean.com/products/app-platform/how-to/maintenance-mode/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Configure Maintenance Mode

Validated on 18 Oct 2024 • Last edited on 17 Apr 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Maintenance mode allows you to take your app offline for maintenance and serve a maintenance page to your users. While your app is in maintenance mode, users see a message on the app’s home page. This allows you to perform critical updates, database migrations, or other maintenance tasks without user traffic.

We continue to bill apps during maintenance.

You cannot configure a custom maintenance message at this time.

## Configure Using the App Spec[](#configure-using-the-app-spec)

Configure maintenance mode by adding the `maintenance` object to the app spec at the app level, like this:

`app.yaml`

    maintenance:
      enabled: true
      offline_page_url: "https://example.com/index.html"

Use the `offline_page_url` field to specify a custom maintenance page to display to users. The page can be any valid URL on the internet. You can only specify a custom maintenance page using the app spec at this time.

You can either edit the app spec [directly in the control panel](/products/app-platform/how-to/update-app-spec/#update-an-apps-spec-from-the-control-panel) or pass the updated spec file [via `doctl` or the API](/products/app-platform/how-to/update-app-spec/#update-an-apps-spec-using-automation).

Once you have updated the app spec, the app is taken offline and a maintenance page is displayed on the app’s home page.

## Configure Using the Control Panel[](#configure-using-the-control-panel)

To turn on Maintenance Mode using the [DigitalOcean Control Panel](https://cloud.digitalocean.com), go to the app’s overview page, and then click the **Settings** tab. Scroll down to the **Maintenance mode** section and click **Turn on**. In the **Maintenance Mode** window, enter the app’s name into the field to confirm that you want to put the app into maintenance mode and then click **Turn on Maintenance Mode**. The app is taken offline and a maintenance page is displayed on the app’s home page.

![The maintenance mode toggle switch on the app Settings page.](https://docs.digitalocean.com/screenshots/app-platform/app-maintenance-mode.b9d5404df92db078198ea05a46f56b31ea59cc18f6552dbbf33a926ee6012092.png)

The maintenance page looks like this:

![The maintenance mode page served at the root of the app](https://docs.digitalocean.com/screenshots/app-platform/app-maintenance-page.51a9247400c728a7a3af6718386aaf64e99e155616db8255dd1cc29986a8bc5b.png)