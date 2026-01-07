---
source: https://docs.digitalocean.com/products/app-platform/how-to/change-region/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 How to Change an App's Datacenter Region

Validated on 28 Nov 2023 • Last edited on 24 Nov 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform deploys apps to the datacenter region nearest to you by default. You can change which region the app is deployed to by updating the app’s spec. This can be useful if you want to deploy to a region closer to your users or are experiencing performance issues.

We do not support changing an app’s region from the control panel.

Warning

If you migrate an app with a database to a new region, the database remains in the original region and the app is not able to connect to the database. This breaks the connection between the two unless you [disable the database’s trusted sources](/products/databases/postgresql/how-to/secure/).

If you are using a DigitalOcean Managed Database, we recommend you [relocate the database](/products/databases/postgresql/how-to/relocate/) to the app’s new region. If you are not using a Managed Database, we recommend backing up the contents of your database, creating a new database in the target region, and then restoring the data to the new database.

To change an app’s region, go to the [Apps page](https://cloud.digitalocean.com/apps) in the DigitalOcean Control Panel and click your app. Click the **Settings** tab, scroll to the **App Spec** section, and click the **Edit** button. Here, you can download the spec to edit it in your preferred text editor or edit the spec directly in the control panel.

To change the region, set the value of the `region` field to the desired region’s slug, like this:

`example-app.yaml`

    name: example-app
    region: sfo
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

Review our [regional availability page](/platform/regional-availability/) for a list of regions and their slugs.

If you edited the spec in the control panel, click **Save** to update your app. If you downloaded the spec, instead click **Upload File**, select your updated spec, and click **Replace**. This automatically triggers a redeployment into the new region.