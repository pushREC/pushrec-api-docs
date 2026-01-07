---
source: https://docs.digitalocean.com/products/app-platform/how-to/deploy-from-github-actions/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# How to Deploy using GitHub Actions

Validated on 20 Aug 2024 • Last edited on 17 Apr 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Using [GitHub Actions](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions) and an [app spec](/products/app-platform/how-to/update-app-spec/), you can configure and deploy your apps and app images directly from your GitHub repository without directly interacting with DigitalOcean’s control panel or API. GitHub Actions is a GitHub feature that allows you to automate many aspects of your software development using workflows.

The article documents three different GitHub Action example workflows:

*   Deploy an app from a GitHub repository to App Platform.
*   Build an image of your app using Docker and GitHub Container Registry, and then deploy the image to App Platform.
*   Deploy a unique app for each pull request in your repository so that you can test your changes before merging them into your `main` branch.

## Prerequisites[](#prerequisites)

To use the App Platform deploy workflow, you must:

*   Have a GitHub repository that contains your app’s source code.
*   Have a [DigitalOcean API token](/reference/api/create-personal-access-token/) in your [repository’s secrets collection](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions) with permissions to read and write to App Platform. The API token authenticates your workflow’s deployment to App Platform.
*   Authenticate your GitHub account with App Platform by [deploying an app via the control panel or API](/products/app-platform/how-to/create-apps/). Deploying an app grants App Platform permissions to access your GitHub account. You only need to do this once and the app can be a [sample app](/products/app-platform/getting-started/sample-apps/).

## Add a Workflow to Your Repository[](#add-a-workflow-to-your-repository)

To set up a GitHub Actions workflow that deploys your app to App Platform, open your app’s GitHub repository and then click the **Actions** tab. Below the **Get started with GitHub Actions** header, click the **set up a workflow yourself** link. This opens the GitHub Actions editor.

In the editor, paste one of the following workflows into the editor, change the token values as needed, and then commit the changes to your repository.

### Deploy an App[](#deploy-app)

This workflow runs after every push to the `main` branch of the repository. The workflow checks out the repository’s code, and then deploys the app using the `digitalocean/app_action/deploy@v2` action and your API token.

`deploy-app.yaml`

    name: Update App
    
    on:
     push:
       branches: [main]
    
    permissions:
      contents: read
    
    jobs:
     deploy-app:
       runs-on: ubuntu-latest
       steps:
         - name: Checkout repository
           uses: actions/checkout@v4
         - name: Deploy the app
           uses: digitalocean/app_action/deploy@v2
           with:
             token: ${{ secrets.YOUR_DIGITALOCEAN_ACCESS_TOKEN_VARIABLE_NAME }}

### Build and Deploy an Image[](#deploy-image)

This workflow runs after every push to the `main` branch of the repository. This workflow checkouts out the repository, builds an image of your app using a `Dockerfile`, pushes the image to GitHub Container Registry, and then deploys the image to App Platform.

In addition to a DigitalOcean API token, the workflow also requires a [Dockerfile](https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile) in your repository. The Dockerfile defines the image’s contents and configuration.

`deploy-image.yaml`

    name: Build, Push and Deploy a Docker Image
    
    on:
     push:
       branches: [main]
    
    permissions:
      contents: read
      packages: write
    
    jobs:
     build-push-deploy-image:
       runs-on: ubuntu-latest
       steps:
         - name: Checkout repository
           uses: actions/checkout@v4
         - name: Log in to the Container registry
           uses: docker/[email protected]
           with:
             registry: ghcr.io
             username: ${{ github.actor }}
             password: ${{ secrets.GITHUB_TOKEN }}
         - name: Build and push Docker image
           id: push
           uses: docker/[email protected]
           with:
             context: .
             push: true
             tags: ghcr.io/${{ github.repository }}:latest
         - name: Deploy the app
           uses: digitalocean/app_action/deploy@v2
           env:
             SAMPLE_DIGEST: ${{ steps.push.outputs.digest }}
           with:
             token: ${{ secrets.YOUR_DIGITALOCEAN_ACCESS_TOKEN_VARIABLE_NAME }}

### Preview Pull Requests Before Deploying[](#deploy-preview)

This workflow runs when you open a pull request in your repository. The workflow checks out the repository’s code, deploys the app to App Platform, and then creates a comment in the pull request with a link to the deployed app. The workflow includes a link to the build logs and the deploy logs in the comment if the deployment fails.

`deploy-preview.yaml`

    name: App Platform Preview
    
    on:
      pull_request:
        branches: [main]
    
    permissions:
      contents: read
      pull-requests: write
    
    jobs:
      test:
        name: preview
        runs-on: ubuntu-latest
        steps:
          - name: Checkout repository
            uses: actions/checkout@v4
          - name: Deploy the app
            id: deploy
            uses: digitalocean/app_action/deploy@v2
            with:
              deploy_pr_preview: "true"
              token: ${{ secrets.YOUR_DIGITALOCEAN_ACCESS_TOKEN }}
          - uses: actions/github-script@v7
            env:
              BUILD_LOGS: ${{ steps.deploy.outputs.build_logs }}
              DEPLOY_LOGS: ${{ steps.deploy.outputs.deploy_logs }}
            with:
              script: |
                const { BUILD_LOGS, DEPLOY_LOGS } = process.env
                github.rest.issues.createComment({
                  issue_number: context.issue.number,
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  body: `🚀🚀🚀 The app was successfully deployed at ${{ fromJson(steps.deploy.outputs.app).live_url }}. [1]`
                })
          - uses: actions/github-script@v7
            if: failure()
            with:
              script: |
                github.rest.issues.createComment({
                  issue_number: context.issue.number,
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  body: `The app failed to be deployed. Logs can be found [here](https://github.com/${{ github.repository }}/actions/runs/${{ github.run_id }}).
                  ## Logs
                  <details>
                  <summary>Build logs</summary> [2]
                  \`\\
                  ${BUILD_LOGS}
                  \`\\
                  </details>
                  <details>
                  <summary>Deploy logs</summary> [3]
                  \`\\
                  ${DEPLOY_LOGS}
                  \`\\
                  </details>`
                })

This second action deletes the preview app upon merging or closing the pull request.

`delete-preview.yaml`

    name: Delete Preview
    
    on:
      pull_request:
        types: [ closed ]
    
    jobs:
      closed:
        runs-on: ubuntu-latest
        steps:
          - name: delete preview app
            uses: digitalocean/app_action/delete@v2
            with:
              from_pr_preview: "true"
              ignore_not_found: "true"
              token: ${{ secrets.YOUR_DIGITALOCEAN_ACCESS_TOKEN }}