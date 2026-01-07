---
source: https://docs.digitalocean.com/products/app-platform/how-to/manage-internal-routing/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Set Up Internal Routing in App Platform

Validated on 22 Jun 2023 • Last edited on 18 Dec 2024

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

[Service components](/products/app-platform/how-to/manage-services/) can send and receive traffic on both the public internet and the app’s internal local area network (LAN). You can also define additional HTTP and internal ports for service components. This can help you set up API gateways, backend job processing, and microservice architecture.

By default, other components in an app can communicate with service components over the app’s LAN using the service’s name as a URL. For example, if your app contains a service named `web`, other components can reach the `web` component at `http://web`.

If the service has other internal ports configured, other components can send traffic to a specific port on that service using the following URL syntax, `http://your-service-name:port-number`. For example, if the `web` service has configured port `3000`, other components can communicate via that service’s port at `http://web:3000`.

Note

[Job](/products/app-platform/how-to/manage-jobs/) and [worker](/products/app-platform/how-to/manage-jobs/) components can only send outbound requests to other service components and the internet but cannot receive requests. You cannot customize ports for these types of components.

## Configure Additional Internal Ports[](#configure-additional-internal-ports)

By default, service components listen on port `80` for public HTTP requests, but you can open internal HTTP ports for a service component to route traffic between your components without exposing the traffic to the public internet. You can do this using the DigitalOcean Control Panel or the app’s spec.

 DigitalOcean Control Panel

To add internal ports to a service component from the [control panel](https://cloud.digitalocean.com/apps), click your app and then click the **Settings** tab. From the **Settings** tab, select the component you want to add internal ports to, scroll down to the **Ports** section, and then click **Edit**.

![A screenshot of the Port section of an app. The internal port field is set to 81 and the Public HTTP Port is set to 8080.](https://docs.digitalocean.com/screenshots/app-platform/app-internal-ports.e99be9a73a4eefc207e5aca796cb7fa2a28770ac3596dfa49856d4b0c68ce096.png)

In the **Ports** section, click the **Add internal ports for private networking** checkbox and then add the port you want to open in the **Internal Port** field. You can add additional internal ports by clicking **Add internal port** and repeating this step.

Once you have specified the ports you want to add, click **Save**. This redeploys the app with the new internal ports.

 App Spec

You can add internal ports to your service component by setting the `internal_ports` field in the [app spec](/products/app-platform/reference/app-spec/). For example, in the following spec, the `internal_ports` field is set to ports `8080` and `3000`.

    services: 
      name: web
      internal_ports: [8080, 3000]

Ports defined in `internal_ports` field can accommodate any TCP-based traffic.

Additionally, as long as one port is specified in the service’s `internal_ports` field of the spec, you can remove the `http_port` field and any applicable routes specified in the `ingress` field to make the service inaccessible from the public internet. You can use this configuration to make a service a backend component in your app’s architecture.

To view, upload, or download app specs using the [DigitalOcean Control Panel](https://cloud.digitalocean.com/apps), click the **Settings** tab for your app to go to the **App Settings** page. In the **App Spec** section, click the **Edit** link.