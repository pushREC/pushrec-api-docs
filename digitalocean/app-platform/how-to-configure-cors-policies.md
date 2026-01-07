---
source: https://docs.digitalocean.com/products/app-platform/how-to/configure-cors-policies/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Configure CORS Policies in App Platform

Validated on 3 May 2021 • Last edited on 18 Dec 2024

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Cross-Origin Resource Sharing (CORS) lets web applications load resources on other origins (usually domains) via HTTP headers. A common use case for CORS is to define how applications in one domain can access applications in another domain. For example, you can set up a CORS policy for `api.example.com` that only accepts HTTP GET requests from a web application at `example.com`.

The parameters you set in the CORS policy define how a client HTTP request must be configured for the policy to accept the request. For example, if you set the `Access-Control-Allow-Origin` header to `https://example.com`, the client requests must originate from `https://example.com` with the `Origin` header set to `https://example.com`.

To update your app’s CORS settings from the [control panel](https://cloud.digitalocean.com/apps), click your app and then click the **Settings** tab. From the Settings tab, click the component whose CORS policies you would like to edit. Under the **HTTP Routes Redirect** header, click **Edit** and then click **Configure CORS**.

![The CORS menu in the App Platform control panel.](https://docs.digitalocean.com/screenshots/app-platform/app-cors-options.c364a8c26710e1ba729a8ebd2ca6d12844939f64aea8b528f3401e0bae9a5a76.png)

## Editing CORS Policies[](#editing-cors-policies)

In the **Configure CORS** window, you can specify which parameters an HTTP request must match in order for the CORS policy to be applied. You can specify only the parameters that are relevant for your use case. You do not need to specify all parameters to create a CORS policy.

### Access-Control-Allow-Origins[](#access-control-allow-origins)

The `Access-Control-Allow-Origins` section specifies the domains (origins) allowed to access your app. For example, if you set this to `https://example.com`, your app only allows HTTP requests that originate from `https://example.com` to access its resources. The value can be specific domains or a [regular expression](https://www.digitalocean.com/community/tutorials/an-introduction-to-regular-expressions).

*   **Exact**: The app only permits access if the client’s origin exactly matches the value you provide. For example, if you set this to `https://example.com`, your app only allows access if an HTTP request originated from `https://example.com`.
*   **Regex**: The app permits access if the client’s origin matches the regex, which must be in [RE2 style syntax](https://github.com/google/re2/wiki/Syntax).

### Access-Control-Allow-Methods[](#access-control-allow-methods)

The `Access-Control-Allow-Methods` section specifies the HTTP CRUD methods that the client is allowed to execute. For example, you can set this to `GET` so that your app only accepts GET requests from matching clients.

### Access-Control-Allow-Headers[](#access-control-allow-headers)

The `Access-Control-Allow-Headers` section specifies the HTTP headers that the client is allowed to send. For example, you can set this to `Content-Type` so that your app only receives requests with the `Content-Type` header from matching clients.

### Access-Control-Expose-Headers[](#access-control-expose-headers)

The `Access-Control-Expose-Headers` section specifies the response headers that must be available to any scripts running in the client. For example, you can set this to `Content-Length` so that the `Content-Length` header is made available to any scripts running in the client.

See Mozilla’s documentation for a list of [response headers that are safe to expose](https://developer.mozilla.org/en-US/docs/Glossary/CORS-safelisted_response_header).

### Access-Control-Max-Age[](#access-control-max-age)

The `Access-Control-Max-Age` section specifies the number of seconds a client browser should cache the CORS policy. You can specify a maximum of `24h`, `1440m` or `86400s`.

### Access-Control-Allow-Credentials[](#access-control-allow-credentials)

The `Access-Control-Allow-Credentials` section specifies whether or not your app allows requests that contain cookies, TLS client certificates, or authentication headers containing a username and password.