---
source: https://docs.digitalocean.com/products/app-platform/how-to/add-ip-address/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Add Static IP Addresses to App Platform Components

Validated on 22 Apr 2024 • Last edited on 11 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform offers two types of static IP addresses:

*   **Dedicated egress IPs**: These are static IP addresses that you can use to route egress traffic from your app so that it originates from a dedicated IP address. They are provisioned solely for your app, meaning they are not shared with other users on App Platform and can be used to restrict external resources to receive only outgoing traffic from your app. You cannot map DNS records to these addresses to route incoming traffic to your app.
*   **Static ingress IPs**: These are public, static IP addresses that you can use to route ingress traffic to your app, but they are shared with other users on App Platform.

## Add Dedicated Egress IPs[](#add-dedicated-egress-ips)

Dedicated egress IPs allow you to route egress traffic from your app so that it originates from a dedicated IP address. For example, you can add a dedicated egress IP address to your app and then create a firewall around an external server that allows only traffic from your app’s dedicated egress IP address.

Dedicated egress IPs are a [paid feature](/products/app-platform/details/pricing/#dedicated-egress-ip-addresses). These addresses persist through redeployments but are removed from the app if you disable the feature or the app is destroyed.

Warning

Omitting `egress.type: DEDICATED_IP` from your app spec immediately disables the feature and permanently releases your IP addresses. Once released, these specific IPs cannot be recovered.

Ensure all automated app spec deployments (via `doctl` or GitHub Actions) consistently include the dedicated egress setting to preserve your IPs.

Dedicated egress IPs have the following limitations:

*   Dedicated egress IPs are an app-level feature. When you assign them to an app, all egress (outgoing) traffic from the app’s components use the addresses assigned to the app, except for [functions](/products/app-platform/how-to/manage-functions/). Egress traffic from functions cannot use dedicated egress IPs and their own addresses can change at any time.
    
*   You cannot [forward logs](/products/app-platform/how-to/forward-logs/) from [dedicated egress IPs](/products/app-platform/how-to/add-ip-address/). Log forwarding uses its own routing to send logs.
    
*   We do not offer dedicated egress IPv6 addresses.
    

You can add dedicated egress IPs to your app after you deploy it by [updating the app spec](/products/app-platform/how-to/update-app-spec/) or using the control panel. To do so in the control panel, go to the [Apps page](https://cloud.digitalocean.com/apps) and click your app. Click the **Settings** tab, scroll to the **Dedicated Egress IP Addresses** section, and then click the **Edit** button beside the section.

In the **Edit** menu, click the **Add Dedicated Egress IP** button. This assigns two IP addresses to your app and triggers a redeployment.

To remove the dedicated egress IPs, click **Release Dedicated Egress IPs** in the same **Edit** menu. This removes the IP addresses from the app and triggers a redeployment. Once the addresses have been released, the same addresses cannot be re-added to the app.

## Use Public Static Ingress IPs[](#use-public-static-ingress-ips)

App Platform offers two public ingress IPs that you can point DNS records at to direct traffic to your app, free of charge.

*   `162.159.140.98` (DNS A Record Type)
*   `172.66.0.96` (DNS A Record Type)
*   `2606:4700:7::60` (DNS AAAA Record Type)
*   `2a06:98c1:58::60` (DNS AAAA Record Type)

To use these address, [add a domain to your app](/products/app-platform/how-to/manage-domains/). Once you’ve added a domain, add DNS A records to your domain’s DNS provider that directs traffic to these addresses. If DigitalOcean manages your domain, see our [documentation on managing DNS records](/products/networking/dns/how-to/manage-records/).

Once you’ve added a domain to your app and updated your domain’s DNS records, App Platform can then direct traffic received at these addresses to your app. The app doesn’t require any additional network configuration to start receiving traffic at these addresses.