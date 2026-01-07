---
source: https://docs.digitalocean.com/products/app-platform/how-to/change-stack/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Upgrade Your App's Stack

Validated on 2 Sep 2024 • Last edited on 10 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform apps run in Docker containers that contain the app’s stack, which includes the OS, buildpack, and other dependencies. You can upgrade the app’s stack by [changing your app’s spec](/products/app-platform/reference/app-spec/) to a specified Ubuntu version, which upgrades the container’s OS, buildpacks, and dependencies.

As of October 2023, all apps on App Platform run on Ubuntu 22. To check which version of Ubuntu your app uses, navigate to your app’s **Overview** page. The app’s stack version is listed in the **Build Phase** section.

From October 2024, Ubuntu-18 will be deprecated for App Platform apps. We recommended that all apps upgrade to Ubuntu-22 as soon as possible.

To change your app’s stack, go to the [Apps page](https://cloud.digitalocean.com/apps) in the DigitalOcean Control Panel and click your app. Click the **Settings** tab, scroll to the **App Spec** section, and click the **Edit** button. Here, you can download the spec to edit it in your preferred text editor or edit the spec directly in the control panel.

To change the stack, add a `feature` field to the spec (if one doesn’t already exist) and set the value to either `buildpack-stack=ubuntu-22` like this:

`example-app.yaml`

    ...
    name: example-app
    region: nyc
    features:
        - buildpack-stack=ubuntu-22
    services:
    - build_command: npm run build
      environment_slug: node-js
      github:
        branch: master
        deploy_on_push: true
        repo: example/app-repo
      http_port: 8080
      instance_count: 2
      instance_size_slug: apps-s-1vcpu-1gb
      name: reactions
      run_command: npm start
      source_dir: /

If you edited the spec in the control panel, click **Save** to update your app. If you downloaded the spec, instead click **Upload File**, select your updated spec, and click **Replace**. Either way, this automatically triggers a deployment with the specified Ubuntu version.