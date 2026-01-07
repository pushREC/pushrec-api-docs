---
source: https://docs.digitalocean.com/products/app-platform/how-to/build-run-commands/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Manage Build and Run Commands

Validated on 17 Jan 2024 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

App Platform supports running commands during build and run times for web and worker components. You can add these commands during app creation time or after you have deployed the app.

### Build Commands[](#build-commands)

App Platform executes build commands after running the buildpack build but before creating the app’s container image. Build commands are usually used to install additional dependencies or to configure the app before running it, such as setting up TLS certificates.

If you do not specify any build commands, App Platform uses the default build command for your app’s language.

### Run Commands[](#run-commands)

App Platform executes run commands after the app’s container has been deployed. They are usually used to configure and start the app. For example, the `npm run start` command starts the Node.js server. You can also use run commands to run any additional commands in the container, such as running tests and or connecting to a database.

If you do not specify any run commands, App Platform uses the default run command for your app’s language.

## Manage Build and Run Commands from the Control Panel[](#manage-build-and-run-commands-from-the-control-panel)

To add build and run commands at app creation time, see the [Configure Resource Settings section of the app creation workflow](/products/app-platform/how-to/create-apps/#configure-resource-settings).

To add, edit, or delete buildtime and runtime commands on a deployed app, go to [https://cloud.digitalocean.com/apps](https://cloud.digitalocean.com/apps), click your app, and click the **Settings** tab. Scroll down to the **Commands** section, then click the **Edit** link. Two fields are displayed: **Build Command** and **Run Command**.

![](https://docs.digitalocean.com/screenshots/app-platform/app-build-run-commands.3ce997af7417bdf81ebda844d0bf398131bd9e0b41540b8c67601f326e890c2b.png)

Enter your commands into their respective fields, and click **Save**. This triggers a redeployment of your app with the new commands.

## Manage Build and Run Commands from an App’s Spec[](#manage-build-and-run-commands-from-an-apps-spec)

You can also add, edit, or delete build and run commands for your app from the app’s spec. To do this, [download your app’s spec](/products/app-platform/how-to/update-app-spec/) and add the `build_command` or `run_command` fields to the to the applicable service or work object in the spec, and then upload the spec.

For example, the following spec file defines a build and run command for a service in Go app:

`your-app.yaml`

    services:
    - environment_slug: go
      github:
        branch: master
        deploy_on_push: true
        repo: digitalocean/sample-golang
      instance_count: 1
      instance_size_slug: apps-s-1vcpu-1gb
      internal_ports:
      - 8080
      name: internal-service
      build_command: go build
      run_command: bin/sample-golang

## Environment Variables[](#environment-variables)

You can define environment variables to use in your commands. For example, you can define a `DATABASE_URL` environment variable that contains the database connection string and then reference it in your commands as `$DATABASE_URL`.

Being that App Platform doesn’t support injecting values as files on disk at build time, you can also use environment variables and run commands to create necessary configuration files on the disk at run time.

For example, MongoDB requires a Certificate Authority (CA) certificate for clients to connect to a cluster, and most MongoDB clients require the certificate to be a file on disk. You can work around the injection limitation by creating an environment variable, such as `MONGO_CA_CERT=${db.CA_CERT}`, during the app’s creation process or by updating its settings. Then, you can add a command to the app that creates the certificate file upon runtime, such as `echo $MONGO_CA_CERT > ca_cert.cert && <original run command>`. App Platform requires the original run time command to start the app upon runtime.

See [How to Use Environment Variables in App Platform](/products/app-platform/how-to/use-environment-variables/) for more information on how to set up environment variables for your build and run time commands.