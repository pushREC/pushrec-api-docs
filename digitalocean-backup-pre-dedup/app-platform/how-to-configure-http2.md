---
source: https://docs.digitalocean.com/products/app-platform/how-to/configure-http2/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Configure HTTP/2

Validated on 30 Sep 2024 • Last edited on 21 Aug 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

You can configure your app to receive [HTTP/2](https://en.wikipedia.org/wiki/HTTP/2) traffic. HTTP/2 is an updated HTTP protocol that was designed to improve the performance of web applications by allowing multiple requests to be sent over a single connection. This allows your app to use [gRPC](https://grpc.io/about) and other HTTP/2 features.

If you’re using SSE, enable HTTP/2 traffic to prevent any issues that may limit the maximum number of open SSE connections. For more details, see the [Mozilla documentation](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events).

If you have not configured your app to receive HTTP/2 traffic, App Platform downgrades requests to HTTP/1.1 when relayed to the app’s container.

To configure your app to receive HTTP/2 traffic, [update or add the `protocol` field](/products/app-platform/how-to/update-app-spec/) to the component you want to receive HTTP/2 traffic in your app’s spec file, like this:

`app.yaml`

    name: your-app
    services:
    - name: grpc-service
      protocol: HTTP2

Once you have updated your app’s spec, the app redeploys with the new configuration and the container receives HTTP/2 traffic as HTTP/2 cleartext (h2c). Your app may require additional configuration to receive HTTP/2 traffic.