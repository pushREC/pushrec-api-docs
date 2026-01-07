---
source: https://docs.digitalocean.com/products/app-platform/how-to/configure-edge-settings/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Configure Edge Settings in App Platform

Validated on 18 May 2021 • Last edited on 11 Nov 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform exposes three CDN edge settings you can configure to manage caching, security, and threat protection for your app:

*   **Cache Control** defines how your app’s cacheable HTTP responses are cached by browsers and CDN edge servers.
*   **Email Obfuscation** prevents bots from scraping email addresses.
*   **Enhanced Threat Control** adds advanced Layer 7 DDoS protection for your app.

Each edge setting requires at least one [custom domain](/products/app-platform/how-to/manage-domains/) and does not work with the starter domain. Edge settings are boolean values and apply to all custom domains associated with the app. Setting them to `false` or removing them from your app spec restores their default behavior. Changes to edge settings may take up to 30 seconds to propagate.

## Cache Control[](#cache-control)

If your app contains cacheable content, such as images and website data, you can improve the performance of your app for end users by implementing the [`Cache-Control` header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control) in your app’s HTTP responses. The `Cache-Control` header instructs web browsers and CDN edge servers to cache the content of a request for a specified period of time. This keeps subsequent requests and responses for the same content closer to the end user by caching it on local CDN edge servers or web browsers, which reduces response times and traffic on your app.

By default, App Platform deploys static sites with the `Cache-Control` header set to cache for 24 hours on CDN edge servers and 10 seconds in web browsers. If you redeploy the app, any cached content is invalidated across the web and CDN servers, and web browsers will cache the latest iteration of the website upon any new traffic to the app.

How to implement the `Cache-Control` header into your app depends on the language and framework your app is based on. Reference the language’s documentation on how to do this.

In this Go example, the `Cache-Control` header in the HTTP handler function is set to cache responses for 86400 seconds (24 hours):

    http.HandleFunc("/cached", func(w http.ResponseWriter, r *http.Request) {
      w.Header().Set("Cache-Control", "public, max-age=86400")
      // rest of the response logic
    })

### Disable CDN Cache[](#disable-cdn-cache)

You might disable CDN cache for the following reasons:

*   **Dynamic content**: Ensures users always see the most up-to-date version of frequently changing pages. Responses from dynamic apps served by service resources are not cached by default.
*   **During development**: Reflects code changes immediately without the need to manually clear the cache.
*   **Server-Sent Events (SSE)**: Prevents cache interference with the continuous data stream required for real-time updates.
*   **Custom CDN usage**: Avoids conflicts if you use a third-party CDN and lets you manage caching from a single provider.
*   **A/B testing and personalization**: Ensures users receive the correct variant or personalized content instead of a shared cached version.
*   **Debugging**: Bypasses caching layers so you can inspect responses directly from your origin server.
*   **Conflicting security headers**: Prevents conflicts if your app already defines its own caching logic through headers like `Cache-Control: no-cache`.

You can disable an app service’s CDN cache, allowing you to use your own CDN. Disabling the cache is required to use SSE or MCP (Model Context Protocol) over GET requests, while POST requests work even with caching enabled. To disable the cache, first [update your app spec](/products/app-platform/reference/app-spec/) by setting `disable_edge_cache` to `true`:

    name: my-app
    disable_edge_cache: true

For SSE, set the following headers in your app, setting `Cache-Control` to `no-cache`:

    'Content-Type': 'text/event-stream'
    'Cache-Control': 'no-cache'

Note

You cannot disable the cache for apps with static sites. As a workaround, you can either create a new app for that static component or serve the static site from a [service component](/products/app-platform/reference/app-spec/).

## Email Obfuscation[](#email-obfuscation)

Email obfuscation is a security measure that prevents bots from harvesting email addresses from your website’s source code. Email addresses are replaced with an obfuscated version in the HTML, which is then converted back into a readable address for legitimate users via JavaScript.

By default, App Platform obfuscates email addresses in your HTML content.

### Disable Email Obfuscation[](#disable-email-obfuscation)

You might disable email obfuscation for the following reasons:

*   **Email collection tools**: If your app uses a JavaScript-based form or third-party service to collect email addresses, obfuscation can interfere with its functionality.
*   **Conflicts with scripts or extensions**: In some single-page apps (SPAs) or when certain browser extensions are active, the obfuscation script might not run correctly, causing display issues.

To disable email obfuscation and display email HTML as-is, [update your app spec](/products/app-platform/reference/app-spec/) with the following:

    name: my-app
    disable_email_obfuscation: true

## Enhanced Threat Control[](#enhanced-threat-control)

Enhanced Threat Control mode provides additional protection against layer 7 DDoS attacks and malicious traffic by challenging suspicious requests before they reach your app.

By default, App Platform provides basic DDoS protection.

You might enable Enhanced Threat Control for the following reasons:

*   **Active DDoS attack**: Use to provide additional protection when under attack.
*   **Frequent attack targets**: Enable proactively for sites that are frequent targets of attacks.

Enabling this setting can affect your app in these ways:

*   **User experience**: Suspicious requests may encounter an interstitial challenge, but legitimate users typically experience little or no delay.
*   **Site analytics**: Analytics may be affected if some bot traffic is challenged or blocked, potentially altering traffic measurements.

To enable Enhanced Threat Control, [update your app spec](/products/app-platform/reference/app-spec/) with the following:

    name: my-app
    enhanced_threat_control_enabled: true