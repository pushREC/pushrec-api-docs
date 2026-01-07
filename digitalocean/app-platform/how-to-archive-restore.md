---
source: https://docs.digitalocean.com/products/app-platform/how-to/archive-restore/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Archive and Restore an App

Validated on 17 Mar 2025 • Last edited on 22 Sep 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

You can archive an app to store its data and configuration. Archiving an app takes it offline and stops incurring charges for the app’s components, with the exception of associated databases, such as development databases, and dedicated egress IPs. This can be useful for seasonal applications, temporary projects, and creating staging environments. You can also restore an archived app to resume using it. Archiving apps can cause downtime, so we recommend you do not archive production applications.

When you archive an app, App Platform displays an offline page at the app’s URL. You can choose to display a custom offline page or DigitalOcean’s default offline page.

Archived apps are available at no cost. We may charge in the future based on factors like having a larger quantity of archived apps (for example, more than 20) or keeping the archives for a longer duration of time (for example, longer than 3 months).

## Using the Control Panel[](#using-the-control-panel)

To archive an app from the [DigitalOcean Control Panel](https://cloud.digitalocean.com), click **Apps** from the left menu and then click the app you want to archive.

From the app’s overview page, click the **Settings** tab. Scroll down to the **Maintenance and archive page** section, click the **Edit** button, and select the page you want to display when the app is offline. The default offline page looks like this:

![](https://docs.digitalocean.com/screenshots/app-platform/app-offline-page.9bac9f2bbe9ecd9a57b2ddb2b44d7b27465d610727b81c92fedbe31c3b14cee5.png)

If you want to display a custom offline page, select the **External URL** option and then enter the URL of the page you want to display. The URL must be a valid URL starting with `https://`.

Once you have configured the offline page, click **Save**.

Next, scroll down to the **Archive mode** section and click the **Archive** button. In the **Archive App** window, enter the app’s name into the field to confirm that you want to archive the app and then click **Archive**. This triggers a new deployment and the app is archived. You can see the app’s offline page at the app’s URL.

To restore an archived app, click the **Restore** button. This triggers a new deployment and the app is restored.

## Using the App Spec[](#using-the-app-spec)

To archive an app, [update the app spec’s](/products/app-platform/how-to/update-app-spec/) `maintenance` object with an `archive` field and set it to `true`, like this:

`app.yaml`

    name: sample-golang
    maintenance:
     archive: true
     offline_page_url: https://example.com/images/offline.png
    services:
    - name: web
       github:
         repo: digitalocean/sample-golang
         branch: master

Use the `offline_page_url` field to specify the URL of a custom offline page you want to display. Otherwise, the default offline page is displayed.

Once you have saved the changes, this triggers a new deployment that stops all the running components and serves an offline page at the app’s URL.

To restore the archived app, set the `archive` field to `false`.