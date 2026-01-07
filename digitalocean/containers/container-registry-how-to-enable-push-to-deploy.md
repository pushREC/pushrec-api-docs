---
source: https://docs.digitalocean.com/products/container-registry/how-to/enable-push-to-deploy/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/container-registry/how-to/enable-push-to-deploy/
domain: docs.digitalocean.com
---
                Enable Push-to-Deploy on DigitalOcean Kubernetes Using GitHub Actions | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/container-registry.9233118a7fd14376bbb94aedab28b1762ed7cb822f6df9ae7f66db21052e45d6.svg)Container Registry](/products/container-registry/)
*   [Getting Started](/products/container-registry/getting-started/)
    *   [Quickstart](/products/container-registry/getting-started/quickstart/)
    *   [Deploy Image to Cluster](/products/kubernetes/getting-started/deploy-image-to-cluster/)
*   [How-Tos](/products/container-registry/how-to/)
    *   [Create Registry](/products/container-registry/how-to/create-registry/)
    *   [Use Docker and Kubernetes](/products/container-registry/how-to/use-registry-docker-kubernetes/)
    *   [Clean Up Container Registry](/products/container-registry/how-to/clean-up-container-registry/)
    *   [Integrate with CI/CD](/products/container-registry/how-to/set-up-ci-cd/)
    *   [Enable Push-to-Deploy](/products/container-registry/how-to/enable-push-to-deploy/)
*   [Reference](/products/container-registry/reference/)
    *   [API Reference (Container Registry)](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Container-Registry)
    *   [API Reference (Container Registries)](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Container-Registries)
    *   [CLI Reference](/reference/doctl/reference/registry/repository/)
*   [Details](/products/container-registry/details/)
    *   [Features](/products/container-registry/details/features/)
    *   [Pricing](/products/container-registry/details/pricing/)
    *   [Availability](/products/container-registry/details/availability/)
    *   [Limits](/products/container-registry/details/limits/)
*   [Support](/products/container-registry/support/)

*   [How-Tos](/products/container-registry/how-to/) 
*   Enable Push-to-Deploy

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Enable Push-to-Deploy on DigitalOcean Kubernetes Using GitHub Actions

Validated on 19 Jul 2021 • Last edited on 23 Jan 2025

The DigitalOcean Container Registry (DOCR) is a private Docker image registry that lets you store and manage private container images. DOCR integrates natively with Docker environments and DigitalOcean Kubernetes clusters.

You can create continuous integration and continuous deployment (CI/CD) workflows with DigitalOcean services using [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/introduction-to-github-actions). In this tutorial, you learn how to deploy a Python application to a DigitalOcean Kubernetes cluster whenever you commit a change to your GitHub repository.

The workflow consists of the following steps:

1.  [Creating workflow file](#create-file)
    
2.  [Defining workflow actions](#define-actions)
    
3.  [Running workflow](#run-workflow)
    

Note

Following the steps below may result in charges for the use of DigitalOcean resources. [Delete the resources](#deleting-the-resources) to avoid being billed for additional resources.

## Prerequisites[](#prerequisites)

Before you can create a CI/CD workflow using DigitalOcean services, do the following:

*   Create a [DigitalOcean Container Registry](/products/container-registry/getting-started/quickstart/#create-a-registry) and add the registry name as [a secret to your GitHub repository](https://docs.github.com/en/actions/reference/encrypted-secrets). Name the secret `REGISTRY_NAME`.
    
*   Create a [DigitalOcean Kubernetes cluster](/products/kubernetes/getting-started/quickstart/#create-clusters) and add the cluster name as a secret to your GitHub repository. Name the secret `CLUSTER_NAME`.
    
*   Create a [DigitalOcean access token](/reference/api/create-personal-access-token/) for your container registry and add it as a secret to your GitHub repository. Name the secret `DIGITALOCEAN_ACCESS_TOKEN`.
    
*   Integrate your DigitalOcean Container Registry with your DigitalOcean Kubernetes cluster [in the control panel](/products/container-registry/how-to/use-registry-docker-kubernetes/#add-secret-control-panel) or using `doctl`:
    

    doctl kubernetes cluster registry add <cluster-name>

## STEP 1: Cloning the Sample GitHub Repository[](#step-1-cloning-the-sample-github-repository)

We provide a [sample repository](https://github.com/digitalocean/sample-push-to-deploy-doks) that has a Python app that generates a “hello world” message and other files used in the tutorial. You can clone the repository using the following command:

    [email protected]:digitalocean/sample-push-to-deploy-doks.git

## STEP 2: Creating the Workflow File[](#create-file)

The file named `workflow.yaml` in the sample GitHub repository defines the triggers, jobs and steps for the workflow.

You can create your own workflow file in your GitHub repository. Click **Actions** and choose one of the provided templates. To create a custom workflow, click **set up a workflow yourself**.

![Create workflow yaml](https://docs.digitalocean.com/screenshots/kubernetes/create-workflow-yaml.d481de49d6cb958620a68e2b76cf4f9a7688be6111f72c75e37cf7deb39f1333.png)

This creates a template YAML file in the `.gitub/workflows` folder. Rename `main.yml` to `workflow.yml`.

## STEP 3: Configuring Actions in the Workflow[](#define-actions)

The `workflow.yml` file configures the following actions for the workflow:

1.  [Events that trigger workflow](#specify-events)
2.  [Workflow run](#create-workflow-run)
3.  [Steps in job](#specify-steps)

For more information on the syntax to write the actions, see [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions).

### Specifying Events that Trigger Workflow[](#specify-events)

The first section of the `workflow.yml` file specifies the conditions under which the workflow gets triggered. In this example, the workflow is triggered on a `push` to the `main` branch of the repository if specific files or folders are changed.

    on:
      push:
        branches:
          - main
        paths:
          - 'config/**'
          - 'server.py'
          - 'Dockerfile'
          - '.github/workflows/**'

The `on` keyword specifies the name of the GitHub event which triggers the workflow, which is `push` in this case. We specify the configuration for the `push` event using the following keywords:

*   `branches` – The workflow triggers only on a `push` to the `main` branch.
*   `paths` – The workflow triggers when there is a change in `server.py`, `Dockerfile`, the deployment YAML file in `config` folder or the workflow YAML file in the `workflow` folder in the repository.

### Creating Workflow Run[](#create-workflow-run)

A workflow run is made up of one or more jobs that can run sequentially or in parallel. It specifies the type of machine where the job runs and several steps to represent a sequence of tasks that are executed as part of the job. We specify these using the `runs-on` and `steps` keywords in a single `build` job.

    jobs:
     build:
       runs-on: ubuntu-latest
       steps:
       ....

### Specifying Steps in Job[](#specify-steps)

A step is an individual task that can run commands in a job. A step has a `uses` or a `run` keyword to run an action or a shell command, and optionally a `name` keyword. The `build` job in this example does the following:

1.  Checks out your repository under `$GITHUB_WORKSPACE` so that the job can access it.

`$GITHUB_WORKSPACE` is one of the [environment variables in the Action’s runtime environment](https://docs.github.com/en/actions/reference/environment-variables#default-environment-variables). This directory contains a copy of the repository that triggered the workflow. Changes made here persist from one step to the next.

    steps:
    - name: Checkout master
      uses: actions/checkout@main

2.  Installs the `doctl` command-line client using [DigitalOcean doctl Action](https://github.com/digitalocean/action-doctl).  
    This action enables you to interact with DigitalOcean services. It uses `DIGITALOCEAN_ACCESS_TOKEN` you added previously as a secret to the GitHub repository.

    - name: Install doctl
      uses: digitalocean/action-doctl@v2
      with:
        token: ${{ secrets.DIGITALOCEAN_ACCESS_TOKEN }}

`doctl` is now available in the virtual environment and can be used directly in the following steps.

3.  Builds the Docker image and pushes it to your container registry.

This example builds the Docker image with the `$GITHUB_SHA` tag, which is another environment variable in the Action’s runtime environment. Its value is the SHA of the commit that triggered the workflow. `REGISTRY_NAME` is the name of your DigitalOcean Container Registry you added to the GitHub repository as a secret previously. `python-example` is the name of the repository in your container registry.

Before we can push the tagged image, we log in to the container registry. We pass the `--expiry-seconds` flag to generate temporary, short-lived credentials that are revoked when the job is complete. We then push the tagged image to the container registry.

    - name: Build container image
      run: docker build -t ${{ secrets.REGISTRY_NAME }}/python-example:$(echo $GITHUB_SHA | head -c7) .
    
    - name: Log in to DigitalOcean Container Registry with short-lived credentials
      run: doctl registry login --expiry-seconds 1200
    
    - name: Push image to DigitalOcean Container Registry
      run: docker push ${{ secrets.REGISTRY_NAME }}/python-example:$(echo $GITHUB_SHA | head -c7)

4.  Deploys to your DigitalOcean Kubernetes cluster.

The `deployment.yml` file in the sample repository only has [a placeholder for the Docker image](https://github.com/digitalocean/sample-push-to-deploy-doks/blob/71e503f0a76a0796bba96dbef3edbc131ecfc7ed/config/deployment.yml#L24), `IMAGE`, to deploy. Before we can deploy the image to the DigitalOcean Kubernetes cluster, we need to update it to point to the image pushed to your container registry. To do this, we use the standard UNIX tools and `sed` to update the contents of the deployment file.

Then, we add the credentials for the cluster to a local `kubeconfig` file, deploy to the cluster and verify the deployment. `CLUSTER_NAME` is the name of the DigitalOcean Kubernetes cluster you added to the GitHub repository as a secret previously. `python-example` is the name of the deployment specified in the `deployment.yml` file.

    - name: Update deployment file
      run: TAG=$(echo $GITHUB_SHA | head -c7) && sed -i 's|<IMAGE>|${{ secrets.REGISTRY_NAME }}/python-example:'${TAG}'|' $GITHUB_WORKSPACE/config/deployment.yml
    
    - name: Save DigitalOcean kubeconfig with short-lived credentials
      run: doctl kubernetes cluster kubeconfig save --expiry-seconds 600 ${{ secrets.CLUSTER_NAME }}
    
    - name: Deploy to DigitalOcean Kubernetes
      run: kubectl apply -f $GITHUB_WORKSPACE/config/deployment.yml
    
    - name: Verify deployment
      run: kubectl rollout status deployment/python-example

## STEP 4: Running Your Workflow[](#run-workflow)

Go to the **Actions** tab in your GitHub repository, click a workflow run and click **Re-run jobs**. Each step runs in the order specified in the workflow. Alternatively, you can edit any file in your repository and commit the changes to the repository. This commit triggers the workflow.

You can monitor the workflow run by clicking **All workflows** and selecting the name of the workflow. Under **Jobs**, click **build**.

Click to expand a step and view the results of that step.

![GitHub Actions progress](https://docs.digitalocean.com/screenshots/kubernetes/github-actions-progress.f6e5828bb333cf192412e2f03ae49d0b7bf11978e113c55913b90264b22eaa4a.png)

Once everything is green, your application is live at `http://<external-endpoint>`, where `external-endpoint` is the **External Endpoint** of the service that you can obtain from the [Kubernetes dashboard of your cluster](/products/kubernetes/getting-started/quickstart/#kubernetes-dashboard).

Any time you make a change to your app and push a commit to the `main` branch of your GitHub repository, the GitHub Actions workflow triggers and the changes get re-deployed.

## STEP 5: Deleting the Resources[](#step-5-deleting-the-resources)

When you no longer need the resources created in this tutorial, you can delete the [DOKS cluster](/products/kubernetes/getting-started/quickstart/#destroy-clusters) and [container registry](/products/container-registry/getting-started/quickstart/#delete-your-registry).

## Summary[](#summary)

In this tutorial, you integrated a DigitalOcean Container Registry with a DigitalOcean Kubernetes cluster and set up a CI/CD workflow using GitHub Actions to deploy a Python application. You can create your own Dockerfile to build the image for your application and use the same workflow to deploy other applications. You completed the following prerequisites for the tutorial:

*   Created a DigitalOcean Container Registry and DOKS cluster
    
*   Created a DigitalOcean access token
    
*   Integrated the container registry with a DOKS cluster
    

## What’s Next?[](#whats-next)

You can expose your deployment to the world by adding a load balancer as described in [Add Load Balancers](/products/kubernetes/how-to/add-load-balancers/).

In this article...

*   [Prerequisites](#prerequisites)
*   [STEP 1: Cloning the Sample GitHub Repository](#step-1-cloning-the-sample-github-repository)
*   [STEP 2: Creating the Workflow File](#create-file)
*   [STEP 3: Configuring Actions in the Workflow](#define-actions)
    *   [Specifying Events that Trigger Workflow](#specify-events)
    *   [Creating Workflow Run](#create-workflow-run)
    *   [Specifying Steps in Job](#specify-steps)
*   [STEP 4: Running Your Workflow](#run-workflow)
*   [STEP 5: Deleting the Resources](#step-5-deleting-the-resources)
*   [Summary](#summary)
*   [What’s Next?](#whats-next)

##### Company

*   [About](https://www.digitalocean.com/about)
*   [Careers](https://www.digitalocean.com/careers)
*   [Blog](https://www.digitalocean.com/blog)

##### Docs

*   [Docs Home](https://docs.digitalocean.com)
*   [API Reference](https://docs.digitalocean.com/reference/api)
*   [CLI Reference](https://docs.digitalocean.com/reference/doctl)
*   [Release Notes](https://docs.digitalocean.com/release-notes)
*   [Trust Platform](https://www.digitalocean.com/trust)

##### Community

*   [Tutorials](https://www.digitalocean.com/community/tutorials)
*   [Q&A](https://www.digitalocean.com/community/questions)
*   [Write for DOnations](https://www.digitalocean.com/community/pages/write-for-digitalocean)
*   [Currents Research](https://www.digitalocean.com/currents)
*   [Legal](https://www.digitalocean.com/legal)
*   [Code of Conduct](https://www.digitalocean.com/community/pages/code-of-conduct)

##### Support

*   [Support Center](/support)
*   [Report Abuse](https://www.digitalocean.com/company/contact/abuse)

* * *

© 2025 DigitalOcean, LLC. All rights reserved

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https://www.linkedin.com/company/digitalocean)[](https://github.com/digitalocean)

### We can't find any results for your search.

Try using different keywords or simplifyin