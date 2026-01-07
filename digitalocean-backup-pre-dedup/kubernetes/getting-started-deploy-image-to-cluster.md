---
source: https://docs.digitalocean.com/products/kubernetes/getting-started/deploy-image-to-cluster/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
               Build and Deploy Your First Image to Your First Cluster | DigitalOcean Documentation

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

*   [Getting Started](/products/kubernetes/getting-started/) 
*   Deploy Image to Cluster

[Give Feedback](https://ideas.digitalocean.com/documentation)

# Build and Deploy Your First Image to Your First Cluster

Validated on 18 Apr 2022 • Last edited on 17 Apr 2025

DigitalOcean Kubernetes (DOKS) is a Kubernetes service with a fully managed control plane, high availability, and autoscaling. DOKS integrates with standard Kubernetes toolchains and DigitalOcean’s load balancers, volumes, CPU and GPU Droplets, API, and CLI.

In this tutorial, you create an app, build it as a Docker image, and run it on a DigitalOcean Kubernetes cluster. You also learn how to use DigitalOcean Container Registry to store your Docker images for use in your cluster.

## Prerequisites[](#prerequisites)

To follow this tutorial, you must:

*   [Install `doctl`](/reference/doctl/how-to/install/), the DigitalOcean command-line tool.
*   [Install `kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl/), the Kubernetes command-line tool.
*   Sign up for a [DigitalOcean account](https://cloud.digitalocean.com/registrations/new).

## STEP 1: Authenticate Your Environment[](#step-1-authenticate-your-environment)

First, [generate a token](https://cloud.digitalocean.com/account/api/tokens/new) with read and write access, using any name of your choice. The token is only displayed once, so save it somewhere safe.

Use the following command to authenticate `doctl`. Paste in your token when prompted.

    doctl auth init

## STEP 2: Build a Sample Python App[](#step-2-build-a-sample-python-app)

Create a sample app that outputs a “Hello World!” message and its hostname to the screen.

In a new directory, create a `app.py` file with and write the following content:

`app.py`

    from flask import Flask
    import os
    import socket
    
    app = Flask(__name__)
    
    @app.route("/")
    def hello():
        html = """Hello {name}!
        Hostname: {hostname}"""
        return html.format(name=os.getenv("NAME", "world"), hostname=socket.gethostname())
    
    if __name__ == "__main__":
        app.run(host='0.0.0.0', port=80)

This code uses the [Flask](https://flask.palletsprojects.com/) web framework to create a web server that listens on port 80. When you visit the server in a browser, it returns a “Hello World!” message and the hostname of the machine serving the request. The `NAME` environment variable is used to customize the message. If `NAME` is not set, it defaults to “world”. This variable is set in the next step.

Create a `requirements.txt` file with the following content. In the next step, the Docker image configuration uses this file to install Flask as the one Python dependency for your app.

`requirements.txt`

    Flask

## STEP 3: Build a Docker Image[](#step-3-build-a-docker-image)

To build a Docker image, you first need to create a `Dockerfile`. A `Dockerfile` is a text document that defines the environment, build, and run commands that your code needs to run. Executing a `Dockerfile` creates a build artifact called an image.

The ability to compose environments this way with a `Dockerfile` is a significant benefit of using containers. With an image, code is bundled with the environment it needs to run, which solves the problem of getting code to run correctly in different environments, like on different machines.

In the same directory, create a file called `Dockerfile` and write the following content:

Dockerfile

    # Use an official Python runtime as a parent image. 
    FROM python
    
    # Set the working directory to /app
    WORKDIR /app
    
    # Copy the current directory contents into the container at /app
    ADD . /app
    
    # Install any needed packages specified in requirements.txt
    RUN pip install -r requirements.txt
    
    # Make port 80 available to the world outside this container
    EXPOSE 80
    
    # Define environment variable
    ENV NAME World
    
    # Run app.py when the container launches
    CMD ["python", "app.py"]

The commands in this `Dockerfile` define an environment with Python set up and Flask installed via `pip`, move the app’s code to where Flask expects it, define the `NAME` environment variable that the app needs, open HTTP port 80 to the world, and define the command that runs your app.

Run the following command to build an image based on the `Dockerfile` you defined. Tag it with `-t` so it has a human-readable name:

    docker build -t my-python-app .

Note

To run the same image on different types of hardware, use the `--platform` flag in the `docker build` command or set the default platform in the [`DOCKER_DEFAULT_PLATFORM` environment variable](https://docs.docker.com/reference/cli/docker/#environment-variables). For more information, see the [Docker documentation](https://docs.docker.com/build/building/multi-platform/#build-multi-platform-images).

Once built, Docker images are stored in a registry, which is a collection of images. You can use the `docker images` command to see the images you have locally.

    docker images

Use the following command to run the image. The `-ti` arguments ensure you can enter `CTRL/CMD+C` to exit, and the `-p` argument maps port 80 of the container to port 80 of the host machine, so you can reach the web server from your browser:

    docker run -ti -p 80:80 my-python-app

Go to `http://localhost` in your browser to see the output of your app. It displays the “Hello World!” message and the hostname of the machine serving the request. You are now accessing your app from a container, which is a runtime instance of the image. Docker returns the ID of the container for a hostname, simulating how a virtual machine might slot in the machine hostname. Therefore, each time you run the image, you get a new container, and therefore a new hostname.

Enter `CTRL/CMD+C` in your terminal to exit the app. Then, run the app again:

    docker run -ti -p 80:80 my-python-app

The hostname changes, demonstrating that the image is the immutable artifact that contains your app, and the container is an ephemeral runtime instance of that image.

## STEP 4: Upload Your Docker Image[](#step-4-upload-your-docker-image)

The image is still only in your local registry. To make it available to other machines, you need to upload it to a registry server.

Since you have already authenticated your environment with your DigitalOcean account, you can create such a registry with DigitalOcean Container Registry (DOCR). Run the following command using your registry name for the `<your-registry-name>` variable:

    doctl registry create <your-registry-name>

Then, log in to your registry with this commend. This configures Docker to use DOCR as the default registry for pushing and pulling images:

    doctl registry login

Next, tag your image with the fully-qualified name of your registry, which tells Docker where to upload it:

    docker tag my-python-app registry.digitalocean.com/<your-registry-name>/my-python-app

Finally, push your image to the registry:

    docker push registry.digitalocean.com/<your-registry-name>/my-python-app

Once uploaded, you can use the following command to create a running container of your app on any machine that you have authenticated your environment on (with `doctl registry login`):

    docker run -p 80:80 registry.digitalocean.com/<your-registry-name>/my-python-app

## STEP 5: Create a Cluster[](#step-5-create-a-cluster)

Now that you have a containerized version of your app stored in a cloud registry, you can run it on Kubernetes at scale using DigitalOcean Kubernetes, which provides a management layer that offers convenience features like automatic upgrades, monitoring, security patches, metrics, logging, and a user interface for managing your cluster.

From one image you can create many containers, and to run at scale, you need something like Kubernetes to manage them, which is an _orchestrator_. An orchestrator is a management application that coordinates running containers on a cluster of machines. Each machine in a cluster is called a _node_. In DigitalOcean Kubernetes, these nodes are Droplets. If your app needs more capacity, you can add more nodes to your cluster. Kubernetes then packs them efficiently with your containers, managing their state and secrets for you.

DigitalOcean Kubernetes gives users the ability to manage groups of nodes in tandem using _node pools_, which are groups of nodes that you configure to be of a certain size and number. If enabled, node pools auto-scale, increasing or decreasing the number of nodes when their resources are over or underutilized. You can also configure node pools to automatically upgrade their nodes to the latest patch version of Kubernetes.

Create a new DigitalOcean Kubernetes cluster with the following command:

    doctl kubernetes cluster create <your-cluster-name> --tag do-tutorial --auto-upgrade=true --node-pool "name=mypool;count=2;auto-scale=true;min-nodes=1;max-nodes=3;tag=do-tutorial"

This command creates a cluster with one node pool named `mypool` featuring two nodes to start. It also allows the cluster to automatically scale the node pool in size between one and three nodes (depending on the needed capacity). Finally, it tags everything with `do-tutorial`, and enables automatic upgrades to keep the cluster up to date with security patches and upgrades.

Note

During the cluster creation process, `doctl` automatically configures the Kubernetes command-line interface, `kubectl`, so that all `kubectl` commands execute against your new cluster. This is similar to how `doctl registry login` configured the `docker` CLI to use your new registry. Therefore, you can use the `kubectl` commands in this tutorial to manage your cluster without further configuration. If you need to manage a different cluster, you can change `kubectl`’s context using [`doctl kubernetes cluster kubeconfig`](/reference/doctl/reference/kubernetes/cluster/kubeconfig/).

There are a number of machine sizes you can use for a node, each one offering a different combination of memory and CPU cores. When creating a node pool, you can configure machine size using any slug returned from the `doctl kubernetes options sizes` command or on the [Droplet pricing page](/products/droplets/details/pricing/#droplet-sizes). If you change the desired machine size after creating the node pool, DigitalOcean Kubernetes _recycles_ the nodes, which destroys the old nodes at the same rate as they are being replaced with the new ones.

## STEP 6: Run Your App on a Cluster[](#step-6-run-your-app-on-a-cluster)

Your cluster is ready when you get output that looks like this:

    Notice: Cluster is provisioning, waiting for cluster to be running
    ......................................................
    Notice: Cluster created, fetching credentials
    Notice: Adding cluster credentials to kubeconfig file found in "/root/.kube/config"
    Notice: Setting current-context to do-nyc1-*********

The components of a Kubernetes cluster are defined by YAML files called _manifests_. A common Kubernetes workflow is a cycle of defining or modifying a manifest and then applying it to a cluster with `kubectl apply`.

Here, the next step is authorizing your cluster to use your private registry so it can download images. You can use `doctl` to generate the manifest for this, and then pipe the generated manifest directly to `kubectl` to apply it:

    doctl registry kubernetes-manifest | kubectl apply -f -

Kubernetes stores your registry credentials as a _secret_, the built-in mechanism Kubernetes offers for securely storing sensitive data. After running this command, the secret is uploaded and given a name similar to your registry’s name.

Next, configure Kubernetes to use this secret as an authentication token when pulling images from your private registry:

    kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "registry-<your-registry-name>"}]}'

Finally, you can deploy the app. To create a _Deployment_ of your app, which is the object Kubernetes uses to maintain the desired state of your running containers, run the following command. This launches the app live in the cluster:

    kubectl create deployment my-python-app --image=registry.digitalocean.com/<your-registry-name>/my-python-app

Each deployment creates a _replica set_, which is the object Kubernetes uses to maintain a stable number of replicas of your container. Each replica is a separate running instance of your container called a _pod_. Replica sets track the desired number of pods you wish to run for your app. By default, this is set to one, as you see when you run this command:

    kubectl get rs

    NAME                       DESIRED   CURRENT   READY   AGE
    my-python-app-84b997f5b4   1         1         1       5s

To view details at the pod level, run the following command:

    kubectl get pods

    NAME                             READY   STATUS             RESTARTS   AGE
    my-python-app-84b997f5b4-6j5pn   1/1     Running              0          27s

Try scaling up to run 20 replicas:

    kubectl scale deployment/my-python-app --replicas=20

Now, when you call `kubectl get rs` and `kubectl get pods`, you see a lot more activity. If you repeatedly call `kubectl get pods`, you can watch the `Status` column change as Kubernetes gets the 19 new pods up and running.

Next, run the following command to see how these Pods get divided over your nodes:

    kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces | grep my-python-app

This returns an output similar to the following:

    mypool-byrky   my-python-app-84b997f5b4-25shx
    mypool-byrky   my-python-app-84b997f5b4-2tkgz
    mypool-zrkyz   my-python-app-84b997f5b4-5dtbz
    mypool-zrkyz   my-python-app-84b997f5b4-5gl7h
    ...

Since you named your node pool `mypool`, the two individual nodes have names with `mypool`, plus some random characters. Furthermore, the pods are being scheduled so that they are comfortably spread out on your available capacity.

Next, create a load balancer to expose your deployment to the world. The load balancer runs in the cloud and routes the incoming traffic:

    kubectl expose deployment my-python-app --type=LoadBalancer --port=80 --target-port=80

This command exposes the pods to the world behind a load balancer, which receives traffic at port 80 and routes that traffic to port 80 on the pods, mapping the host and container ports similarly to how the `-p` flag was used when testing the app with Docker.

Keep running this command until you see `active` under the `Status` column for the new load balancer:

    doctl compute load-balancer list --format Name,Created,IP,Status

This returns an output similar to the following:

    Name                                Created At              IP                 Status
    a55a6520a74d5437fa389891f2f8708f    2022-04-27T14:46:34Z    143.244.215.xxx    new

Note

When you first run this command, the `Status` is `new` and the `IP` is blank; re-run the command until you have been assigned an IP address.

Navigate to the IP address of the load balancer and refresh your browser. The `hostname` you used earlier changes with every refresh, cycling between the container IDs. This confirms that you have multiple healthy Pods running and serving traffic in a load-balanced way.

## STEP 7: Check the Kubernetes Dashboard[](#step-7-check-the-kubernetes-dashboard)

You can use the [Kubernetes dashboard](/products/kubernetes/getting-started/quickstart/#kubernetes-dashboard) to inspect your cluster and view visualizers and graphs of your cluster’s state. Install the [1-Click App](/products/marketplace/catalog/kubernetes-dashboard/) and then port-forward the dashboard to your local machine to access it.

## Summary[](#summary)

You created a sample app, built a Docker image of it, created a private registry, uploaded your image, created a cluster, deployed your application to it, scaled your app up 20x, and exposed it to the world over a load balancer, making it accessible at a stable IP address.

## What’s Next[](#whats-next)

Now that you know the basics, we recommend reading the [Kubernetes Operational Readiness Guide](/products/kubernetes/getting-started/operational-readiness/) to learn how to set up tools such as nginx and Cert-Manager to make your cluster operationally ready to serve production traffic over HTTPS.

We also recommend that you [set up push-to-deploy](/products/kubernetes/how-to/deploy-using-github-actions/) with the official DigitalOcean GitHub Action to automatically build and deploy your code to your cluster when you push to your GitHub repository.

Finally, we recommend [learning how to configure auto-scaling for your cluster](/products/kubernetes/how-to/set-up-autoscaling/) when resources are over or underutilized.

In this article...

*   [Prerequisites](#prerequisites)
*   [STEP 1: Authenticate Your Environment](#step-1-authenticate-your-environment)
*   [STEP 2: Build a Sample Python App](#step-2-build-a-sample-python-app)
*   [STEP 3: Build a Docker Image](#step-3-build-a-docker-image)
*   [STEP 4: Upload Your Docker Image](#step-4-upload-your-docker-image)
*   [STEP 5: Create a Cluster](#step-5-create-a-cluster)
*   [STEP 6: Run Your App on a Cluster](#step-6-run-your-app-on-a-cluster)
*   [STEP 7: Check the Kubernetes Dashboard](#step-7-check-the-kubernetes-dashboard)
*   [Summary](#summary)
*   [What’s Next](#whats-next)

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

Try using different keywords 
