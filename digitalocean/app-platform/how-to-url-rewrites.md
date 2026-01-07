---
source: https://docs.digitalocean.com/products/app-platform/how-to/url-rewrites/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Rewrite or Redirect URL Paths

Validated on 30 Mar 2023 • Last edited on 23 Jan 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

When you deploy an app to App Platform, app components are assigned URL paths at creation by you or App Platform. You can remap these paths to different ones or redirect traffic from a path to a different URL using the control panel.

## Rewrites vs Redirects[](#rewrites-vs-redirects)

Rewrites and redirects have similar functionality but behave differently.

*   **Rewrites:** Allow you to map a new path to an existing app component path without displaying URL changes to the user. For example, if you have the existing path `/your-app/api/functions/js/post` in your app, you can create a rewrite that masks that path with a simpler path, such as `/your-app/api/post`. This means that traffic connecting to the simplified path will be routed to the original path without the user seeing any URL changes in their browser. However, rewrites cannot route traffic to other domains.
    
*   **Redirects:** Allow you to redirect traffic from an existing path in an app to any existing URL on the internet. For example, you can set up a redirect in your app that automatically redirects users from `your-app.com/api` to `new-app.com/api`. Redirects function as an HTTP `302` redirect by default, meaning that users connecting to a redirected path can see the URL changing in their browser and can see that they’re being directed to a new page. The redirect feature also supports `300`, `301`, `303`, `304`, `307`, and `308` redirect codes.
    

Rewrites and redirects are mutually exclusive, meaning you cannot apply a rewrite rule to a path that already has a redirect rule applied to it, and vice versa. Rewrites are configured at the component level, while redirects are configured at the app level.

## Configure Rewrites and Redirects[](#configure-rewrites-and-redirects)

You can configure rewrites and redirects for your app using the [DigitalOcean Control Panel](https://cloud.digitalocean.com/apps). To do this, click the app you want to manage.

### Configure a Rewrite[](#configure-a-rewrite)

From the app’s **Overview** page, click the **Settings** tab and then select the component that you want to set up a rewrite for.

In the **HTTP Request Routes** section, click **Edit**. App Platform displays the current HTTP routes configured for the component. Enter a new path into the **Rewrite Path (Optional)** field beside the HTTP route you want to rewrite.

![Droplet image selection](https://docs.digitalocean.com/screenshots/app-platform/app-platform-path-rewrite.1e86ceebcae7aed1e0502c5cfca9550aee80fa072d5713fc43401f684e946101.png)

Note

You cannot use the **Preserve Path Prefix** option if you are adding a rewrite to a path.

Once you have entered the rewrite path, click **Save**. App Platform redeploys the app with the new path.

Note

If you specify a rewrite path, anything after the original path appends to the rewrite path. For example, if you rewrite `/api/` to `/v1/my/api/path/`, a request to `/api/user/1` reaches the component as `/v1/my/api/path/user/1`.

### Configure a Redirect[](#configure-a-redirect)

From the app’s Overview page, click the **Settings** tab and then click the **Edit** button in the **HTTP Routes Redirect**. In the HTTP Routes Redirect menu, click **Add new redirect route**. This opens a drop-down menu open with several configuration fields.

![Droplet image selection](https://docs.digitalocean.com/screenshots/app-platform/app-platform-path-redirect.30b38390170cc5c562eb94d722d500d3b090ac9b18dc369895e77fc28839e807.png)

The fields breakdown as follows:

*   **Route Path:** The existing path to redirect traffic from.
*   **Redirect URI:** The path of the destination domain to redirect traffic to.
*   **Redirect Authority:** The destination domain to redirect traffic to.
*   **Redirect Status Code:** The HTTP status code to return when redirecting the user. Valid values are: `300`, `301`, `302`, `303`, `304`, `307`, and `308`. Defaults to `302` if not specified.
*   **Redirect Port:** The port of the destination URI to send traffic to. If not specified, the value is omitted from the request or uses the port of the original request.
*   **Redirect Scheme:** The URI scheme the redirect uses. Must either be `http` or `https`. Defaults to `https` if not specified.

In the example above, the redirect redirects traffic from the URI `https://your-app.ondigitalocean.app/home` to `https://digitalocean.com/about`.

If your redirect requires a CORS configuration, click **Configure CORS**, fill out the applicable fields, and then click **Apply CORS**.

Once you have configured the applicable fields, click **Save**. This redeploys the app with the new redirect.

Note

Redirects that specify a URI will overwrite a request’s original URI. For example, if you specify a redirect from `/api/v1/redirect` to `myapp.com/api/v1/`, a request to `/api/v1/redirect/to/my/resource` still redirects to `myapp.com/api/v1/`.