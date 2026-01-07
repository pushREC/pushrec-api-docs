---
source: https://docs.digitalocean.com/products/kubernetes/how-to/deploy-using-github-actions/
scraped: 2025-01-07
tags: [digitalocean, kubernetes, doks, api-docs]
---

                How to Enable Push-to-Deploy on DigitalOcean Kubernetes Using GitHub Actions | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/kubernetes.5c9f5538fc3c9db4ddd19b3b4c2166c4e06a899c3582345cc892b570bd214072.svg)Kubernetes](/products/kubernetes/)
*   [Getting Started](/products/kubernetes/getting-started/)
    *   [Quickstart](/products/kubernetes/getting-started/quickstart/)
    *   [Deploy Image to Cluster](/products/kubernetes/getting-started/deploy-image-to-cluster/)
    *   [Set Up Operational Readiness](/products/kubernetes/getting-started/operational-readiness/)
*   [How-Tos](/products/kubernetes/how-to/)
    *   [Create Clusters](/products/kubernetes/how-to/create-clusters/)
    *   [Connect to a Cluster](/products/kubernetes/how-to/connect-to-cluster/)
    *   [Add Node Pools](/products/kubernetes/how-to/add-node-pools/)
    *   [Enable Autoscaling](/products/kubernetes/how-to/autoscale/)
    *   [Configure Multi-Node GPU Nodes](/products/kubernetes/how-to/configure-multinode-gpus/)
    *   [Manage 1-Click Apps](/products/kubernetes/how-to/manage-1click-apps/)
    *   [Back Up Managed Kubernetes Resources](/products/snapshooter/how-to/back-up-doks/)
    *   [Destroy Clusters](/products/kubernetes/how-to/destroy-clusters/)
    *   [Enable High Availability](/products/kubernetes/how-to/enable-high-availability/)
    *   [Integrate with Container Registry](/products/kubernetes/how-to/integrate-with-docr/)
    *   [Add Volumes](/products/kubernetes/how-to/add-volumes/)
    *   [Delete Volumes](/products/kubernetes/how-to/delete-volumes/)
    *   [Restore Volumes](/products/kubernetes/how-to/restore-volumes/)
    *   [Use NFS Storage](/products/kubernetes/how-to/use-nfs-storage/)
    *   [Import DigitalOcean Snapshots](/products/kubernetes/how-to/import-snapshot/)
    *   [Create Snapshots](/products/kubernetes/how-to/create-snapshots/)
    *   [Add Load Balancers](/products/kubernetes/how-to/add-load-balancers/)
    *   [Configure Load Balancers](/products/kubernetes/how-to/configure-load-balancers/)
    *   [Migrate Load Balancers](/products/kubernetes/how-to/migrate-load-balancers/)
    *   [Delete Load Balancers](/products/kubernetes/how-to/delete-load-balancers/)
    *   [Use Routing Agent](/products/kubernetes/how-to/use-routing-agent/)
    *   [Use Spaces](/products/kubernetes/how-to/use-spaces/)
    *   [Customize Cluster DNS Settings](/products/kubernetes/how-to/customize-coredns/)
    *   [Enable Push-to-Deploy](/products/kubernetes/how-to/deploy-using-github-actions/)
    *   [View Basic Metrics](/products/kubernetes/how-to/monitor-basic/)
    *   [Use Cilium Hubble](/products/kubernetes/how-to/use-cilium-hubble/)
    *   [Set Up Advanced Monitoring](/products/kubernetes/how-to/monitor-advanced/)
    *   [Forward Logs](/products/kubernetes/how-to/forward-logs/)
    *   [Upgrade Clusters](/products/kubernetes/how-to/upgrade-cluster/)
    *   [Add Control Plane Firewallsprivate](/products/kubernetes/how-to/add-control-plane-firewall/)
    *   [Set RoleBindings for Custom Roles](/products/kubernetes/how-to/set-up-custom-rolebindings/)
    *   [Set Up Horizontal Pod Autoscaling](/products/kubernetes/how-to/set-up-autoscaling/)
*   [Reference](/products/kubernetes/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Kubernetes)
    *   [CLI Reference](/reference/doctl/reference/kubernetes/cluster/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/kubernetes/concepts/)
    *   [Choosing a Plan](/products/kubernetes/concepts/choosing-a-plan/)
    *   [Best Practices](/products/kubernetes/concepts/best-practices/)
*   [Details](/products/kubernetes/details/)
    *   [Features](/products/kubernetes/details/features/)
    *   [Pricing](/products/kubernetes/details/pricing/)
    *   [Availability](/products/kubernetes/details/availability/)
    *   [Limits](/products/kubernetes/details/limits/)
    *   [Changelog](/products/kubernetes/details/changelog/)
    *   [Managed Kubernetes](/products/kubernetes/details/managed/)
    *   [GPU Worker Nodes](/products/kubernetes/details/supported-gpus/)
    *   [Security Information](/products/kubernetes/details/security/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/doks)
    *   [Supported Releases](/products/kubernetes/details/supported-releases/)
    *   [Volume Features](/products/kubernetes/details/volume-features/)
*   [Support](/products/kubernetes/support/)

*   [How-Tos](/products/kubernetes/how-to/) 
*   Enable Push-to-Deploy

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Enable Push-to-Deploy on DigitalOcean Kubernetes Using GitHub Actions

Validated on 4 Dec 2020 • Last edited on 23 Jan 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

You can create continuous integration and continuous deployment (CI/CD) workflows with DigitalOcean services using [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/introduction-to-github-actions). In this topic, you learn how to deploy a basic Python application to a DigitalOcean Kubernetes cluster whenever you commit a change to your GitHub repository.

The workflow consists of the following steps:

1.  [Create your workflow file](#create-file)
    
2.  [Define your workflow actions](#define-actions)
    
3.  [Run your workflow](#run-workflow)
    

## Prerequisites[](#prerequisites)

Before you can create a CI/CD workflow using DigitalOcean services:

*   Create the following resources if you do not have them already:
    
    *   A GitHub repository that is ready to use for testing push-to-deploy functionality. If you don’t have a repository ready to use, fork [our sample repository](https://github.com/digitalocean/sample-push-to-deploy-doks) which has a Python app that generates a “hello world” message.
        
    *   [DigitalOcean Container Registry](/products/container-registry/getting-started/quickstart/#create-a-registry)
        
    *   [DigitalOcean Kubernetes Cluster](/products/kubernetes/getting-started/quickstart/#create-clusters)
        
*   Create a [DigitalOcean access token](/reference/api/create-personal-access-token/) for your container registry and [add it as a secret to your GitHub repository](https://docs.github.com/en/actions/reference/encrypted-secrets). Name the secret `DIGITALOCEAN_ACCESS_TOKEN`.
    
*   Integrate your DigitalOcean Container Registry with your DigitalOcean Kubernetes cluster [in the control panel](/products/container-registry/how-to/use-registry-docker-kubernetes/#add-secret-control-panel).
    
    Alternatively, if you prefer to use the `doctl` command-line tool, run:
    
        doctl kubernetes cluster registry add <cluster-name>
    
*   Create a Dockerfile to build the image for your application.
    
*   Create a Kubernetes YAML file that specifies the deployment.
    
    You can access the files used in this topic in [this GitHub repository](https://github.com/digitalocean/sample-push-to-deploy-doks).
    

## Create Your Workflow File[](#create-file)

In your GitHub repository, click **Actions**. You can choose one of the provided templates to create a workflow. For this example, we will set up the workflow by clicking **set up a workflow yourself**.

![Create workflow yaml](https://docs.digitalocean.com/screenshots/kubernetes/create-workflow-yaml.d481de49d6cb958620a68e2b76cf4f9a7688be6111f72c75e37cf7deb39f1333.png)

This creates a template YAML file in the `.gitub/workflows` folder. Rename the `main.yml` file to `workflow.yml`.

## Configure Actions in Your Workflow[](#define-actions)

In the `workflow.yml` file, configure the following actions for your workflow:

1.  [Specify events that trigger workflow](#specify-events)
2.  [Create workflow run](#create-workflow-run)
3.  [Specify steps in job](#specify-steps)

For more information on the syntax to write the actions, see [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions).

### Specify Events that Trigger Workflow[](#specify-events)

In the first section of the `workflow.yml` file, specify the conditions under which the workflow gets triggered. In this example, the workflow is triggered on a `push` to the `main` branch of the repository if specific files or folders are changed.

    on:
      push:
        branches:
          - main
        paths:
          - 'config/**'
          - 'server.py'
          - 'Dockerfile'
          - '.github/workflows/**'

The `on` keyword specifies the name of the GitHub event which triggers the workflow, which is `push` in this case. You specify the configuration for the `push` event using the following keywords:

*   `branches` – The workflow triggers only on a `push` to the `main` branch.
*   `paths` – The workflow triggers when there is a change in `server.py`, `Dockerfile`, the deployment YAML file in `config` folder or the workflow YAML file in the `workflow` folder in the repository.

### Create Workflow Run[](#create-workflow-run)

A workflow run is made up of one or more jobs that can run sequentially or in parallel. It specifies the type of machine where the job runs and several steps to represent a sequence of tasks that will be executed as part of the job. These are specified using the `runs-on` and `steps` keywords. For this example, we write a single `build` job.

    jobs:
     build:
       runs-on: ubuntu-latest
       steps:
       ....

### Specify Steps in Job[](#specify-steps)

A step is an individual task that can run commands in a job. A step has a `uses` or a `run` keyword to run an action or a shell command, and optionally a `name` keyword. The `build` job in this example performs the following steps:

1.  Checks out your repository under `$GITHUB_WORKSPACE` so that the job can access it.

    steps:
    - name: Checkout master
      uses: actions/checkout@main

`$GITHUB_WORKSPACE` is one of the [environment variables in the Action’s runtime environment](https://docs.github.com/en/actions/reference/environment-variables#default-environment-variables). This directory contains a copy of the repository that triggered the workflow. Changes made here persist from one step to the next.

2.  Installs the `doctl` command-line client using [DigitalOcean doctl Action](https://github.com/digitalocean/action-doctl).  
    This action enables you to interact with DigitalOcean services. It uses `DIGITALOCEAN_ACCESS_TOKEN` you added as a GitHub secret as a prerequisite.

    - name: Install doctl
      uses: digitalocean/action-doctl@v2
      with:
        token: ${{ secrets.DIGITALOCEAN_ACCESS_TOKEN }}

`doctl` is now available in the virtual environment and can be used directly in the following steps.

3.  Builds the Docker image and pushes it to your container registry.

    - name: Build container image
      run: docker build -t registry.digitalocean.com/<registry-name>/<repository_name>:$(echo $GITHUB_SHA | head -c7) .
    
    - name: Log in to DigitalOcean Container Registry with short-lived credentials
      run: doctl registry login --expiry-seconds 1200
    
    - name: Push image to DigitalOcean Container Registry
      run: docker push registry.digitalocean.com/<registry-name>/<repository_name>:$(echo $GITHUB_SHA | head -c7)

We build the Docker image with the `$GITHUB_SHA` tag, which is another environment variable in the Action’s runtime environment. Its value is the SHA of the commit that triggered the workflow. To build and push your image, specify the name of your registry and repository in the commands.

Before we can push the tagged image, we log in to the container registry. We pass the `--expiry-seconds` flag to generate temporary, short-lived credentials that will be revoked when the job is complete. We then push the tagged image to the container registry.

4.  Deploys to your DigitalOcean Kubernetes cluster.

    - name: Update deployment file
      run: TAG=$(echo $GITHUB_SHA | head -c7) && sed -i 's|<IMAGE>|registry.digitalocean.com/<registry-name>/<repository_name>:'${TAG}'|' $GITHUB_WORKSPACE/config/deployment.yml
    
    - name: Save DigitalOcean kubeconfig with short-lived credentials
      run: doctl kubernetes cluster kubeconfig save --expiry-seconds 600 <cluster-name>
    
    - name: Deploy to DigitalOcean Kubernetes
      run: kubectl apply -f $GITHUB_WORKSPACE/config/deployment.yml
    
    - name: Verify deployment
      run: kubectl rollout status deployment/<deployment_name>

We provide a `deployment.yml` file that only has [a placeholder for the Docker image](https://github.com/digitalocean/sample-push-to-deploy-doks/blob/71e503f0a76a0796bba96dbef3edbc131ecfc7ed/config/deployment.yml#L24), `IMAGE`, we want to deploy. Before we can deploy the image to the DigitalOcean Kubernetes cluster, we need to update it to point to the image we tagged and pushed to the container registry. To do this, we use the standard UNIX tools and `sed` to update the contents of our deployment file.

Then, we add the credentials for the cluster we integrated with the registry, `<cluster-name>`, as a prerequisite to a local `kubeconfig` file, deploy to the cluster and verify the deployment. `<deployment_name>` is the name of the deployment specified in the `deployment.yml` file.

To deploy to your cluster, specify the name of your registry, repository and cluster integrated with your registry in the commands.

## Run Your Workflow[](#run-workflow)

Once you complete configuring the steps for your workflow run in the `workflow.yml` file, add a commit message and commit the changes to your GitHub repository. This commit triggers the workflow. Each step runs in the order specified in the workflow.

You can monitor the progress of the workflow run by clicking **All workflows** and selecting the name of the workflow in the **Actions** tab. Under **Jobs**, click **build**.

Click to expand a step and view the results of that step.

![GitHub Actions progress](https://docs.digitalocean.com/screenshots/kubernetes/github-actions-progress.f6e5828bb333cf192412e2f03ae49d0b7bf11978e113c55913b90264b22eaa4a.png)

Once everything is green, your application is live at `http://<external-endpoint>`, where `external-endpoint` is the **External Endpoint** of the service that you can obtain from the [Kubernetes dashboard of your cluster](/products/kubernetes/getting-started/quickstart/#kubernetes-dashboard).

## Next Steps[](#next-steps)

You can expose your deployment to the world by adding a load balancer as described in [Add Load Balancers](/products/kubernetes/how-to/add-load-balancers/).

Any time you make a change to your app and push a commit to the `main` branch of your GitHub repository, the GitHub Actions workflow triggers and your changes get re-deployed.

In this article...

*   [Prerequisites](#prerequisites)
*   [Create Your Workflow File](#create-file)
*   [Configure Actions in Your Workflow](#define-actions)
    *   [Specify Events that Trigger Workflow](#specify-events)
    *   [Create Workflow Run](#create-workflow-run)
    *   [Specify Steps in Job](#specify-steps)
*   [Run Your Workflow](#run-workflow)
*   [Next Steps](#next-steps)

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

Try using different keywords or simplifying
