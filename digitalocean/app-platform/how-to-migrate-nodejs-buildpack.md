---
source: https://docs.digitalocean.com/products/app-platform/how-to/migrate-nodejs-buildpack/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Upgrade Your NodeJS Buildpack in App Platform

Validated on 15 Oct 2024 • Last edited on 10 Dec 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform automatically deploys new Node.js-based apps using the latest Node.js buildpack. However, if you created your app before 17 September 2024, your app likely uses the [legacy Node.js buildpack](/products/app-platform/reference/buildpacks/legacy-nodejs/), and we recommend upgrading it to use the [new Heroku Node.js Buildpack](/products/app-platform/reference/buildpacks/nodejs/). The new buildpack includes security updates and new features, such as custom caching.

Sample apps for PHP, Python, Ruby, Ruby on Rails, Laravel, and Django only support the legacy Node.js buildpack. You cannot upgrade them.

You can verify which buildpack your app uses by going to the [Apps page](https://cloud.digitalocean.com/apps) in the DigitalOcean Control Panel, clicking your app, and scrolling down to the **Build Phase** section. If the Node.js buildpack listed is `Node.js v0.4.1`, your app uses the legacy buildpack.

To change your app’s Node.js buildpack, go to your [Apps page](https://cloud.digitalocean.com/apps) in the control panel and click your app. Click the **Settings** tab, scroll to the **App Spec** section, and click the **Edit** button. Here, you can download the spec to edit it in your preferred text editor or edit the spec directly in the control panel.

Next, add a `feature` field to the spec and set the value to `new-nodejs-buildpack=true`, like this:

`example-app.yaml`

    ...
    name: example-app
    region: nyc
    features:
        - new-nodejs-buildpack=true
    services:
    - environment_slug: node-js
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

If you edited the spec in the control panel, click **Save** to update your app. If you downloaded the spec, instead click **Upload File**, select your updated spec, and then click **Replace**. Either way, this automatically triggers a redeployment with the new buildpack.

The new Node.js buildpack runs `npm run build` (`yarn build` or `pnpm build`) by default and `build_command` runs after this build step.

If you’re using custom build command, you need to remove this `build_command` from the app spec and add this custom build command to your app’s `build` script.