---
source: https://docs.digitalocean.com/products/app-platform/how-to/upgrade-buildpacks/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Upgrade Buildpacks in App Platform

Validated on 4 Aug 2022 • Last edited on 10 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

On DigitalOcean, we automatically upgrade all buildpacks to their latest minor version. However, in case the upgrade causes errors, you need to manually upgrade an app’s and its components’ buildpacks to their latest major versions.

To do this, you can use either of the following methods:

1.  You can upgrade [each of an app’s buildpacks individually](#upgrade-individually).
2.  You can upgrade [all of an app’s buildpacks simultaneously](#upgrade-all).

Warning

Upgrading a buildpack may cause errors in your app, depending on the buildpack’s version changes. If an upgrade results in a deployment error, you can [roll your app back to a previous version](/products/app-platform/how-to/manage-deployments/#roll-back-to-a-previous-deployment). See our [buildpack documentation](/products/app-platform/reference/buildpacks/) for additional information.

### Upgrade Individually[](#upgrade-individually)

To upgrade each buildpack individually, go to the [control panel](https://cloud.digitalocean.com/apps) and click the app with buildpacks you want to upgrade. Under the **Build Phase** section of the settings, click **Edit**.

This section displays the buildpacks for the app and all of the app’s components. Underneath each buildpack, you can see a link to its corresponding documentation and its status: _Latest_ or _Upgrade Available_. If a buildpack has an upgrade available, you can upgrade it by clicking the text reading **Upgrade to Version X** underneath it. This process redeploys your app.

![The app's build phase section in the Settings tab](https://docs.digitalocean.com/screenshots/app-platform/app-buildpacks-latest.f1ae2973480c65b4af3da45ec5292c4b50437cc640f7ba3803c92da025431b6c.png)

### Upgrade All[](#upgrade-all)

To upgrade all of the app’s and its components’ buildpacks simultaneously, go to the [control panel](https://cloud.digitalocean.com/apps) and click the app with buildpacks you want to upgrade. Then, click the app’s **Overview** tab. If any buildpacks have available upgrades, this page has a card titled **Buildpack Upgrades Available**. To upgrade, click the **Deploy Upgrades** button in this card. This process redeploys your app.

![The app's settings tab in the control panel](https://docs.digitalocean.com/screenshots/app-platform/app-buildpack-upgrades-available.5927b71d525922517076fcc2e8da62463bfac715b44b09b072a9060d499816a8.png)