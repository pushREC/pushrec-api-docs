---
source: https://docs.digitalocean.com/products/container-registry/how-to/use-registry-docker-kubernetes/
scraped: 2025-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
ool: bright-data-skill
source_url: https://docs.digitalocean.com/products/container-registry/how-to/use-registry-docker-kubernetes/
domain: docs.digitalocean.com
---
                How to Use Your Private DigitalOcean Container Registry with Docker and Kubernetes | DigitalOcean Documentation

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
*   Use Docker and Kubernetes

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Use Your Private DigitalOcean Container Registry with Docker and Kubernetes

Validated on 12 Nov 2019 • Last edited on 10 Dec 2025

The DigitalOcean Container Registry (DOCR) is a private Docker image registry that lets you store and manage private container images. DOCR integrates natively with Docker environments and DigitalOcean Kubernetes clusters.

## Configure Docker to Push to and Pull from the Registry[](#docker-integration)

To interact with your registry using the `docker` command-line interface (CLI), you need to configure `docker` using the DigitalOcean command-line tool, `doctl`. [Install `doctl` and authenticate it with an API token](/reference/doctl/how-to/install/).

Then, call [the `registry login` command](/reference/doctl/reference/registry/login/):

    doctl registry login

This command generates a [personal access token](/reference/api/create-personal-access-token/) that grants `docker` access to your team to authenticate `push` and `pull` commands. You can revoke this token at any time.

If you’re in an environment that doesn’t have `doctl` or if you want to use an existing API token, you can simulate what `doctl registry login` does with `docker login` by using your registered email as the username (`-u`) and API token string as password (`-p`), as in `docker login -u [[email protected]](/cdn-cgi/l/email-protection) -p example-api-token-string registry.digitalocean.com` .

You can then use the `docker tag` command to tag your image with the fully qualified destination path, and `docker push` to upload it:

    docker tag <my-image> registry.digitalocean.com/<my-registry>/<my-image>
    docker push registry.digitalocean.com/<my-registry>/<my-image>

## Integrate The Registry with a DigitalOcean Kubernetes Cluster[](#kubernetes-integration)

You can integrate DigitalOcean Container Registry with DigitalOcean Kubernetes using one of the following options:

*   **[In the control panel](#add-secret-control-panel)**: This is the recommended option. Provides 1-click integration of the registry with DigitalOcean Kubernetes clusters and allows you to use images from the registry in your Kubernetes workloads.
    
*   **[Using `kubectl`](#create-secret-manually)**: Manually create secrets using `kubectl` and then specify them as `imagePullSecrets` for your Kubernetes clusters.
    

### Option 1: Adding the Secret to All Cluster Namespaces (Recommended)[](#add-secret-control-panel)

In the control panel, you can select the Kubernetes clusters to use with your registry. This [generates a secret](#using-generated-secrets), adds it to all the namespaces in the cluster and updates the default service account to include the secret, allowing you to pull images from the registry.

Note

You can only integrate the latest Kubernetes patch versions with the registry. For more information on upgrading your Kubernetes clusters, see [How to Upgrade DOKS Clusters to Newer Versions](/products/kubernetes/how-to/upgrade-cluster/).

Visit [the registry page](https://cloud.digitalocean.com/registry) and click the **Settings** tab. In the **DigitalOcean Kubernetes integration** section, click **Edit** to display the available Kubernetes clusters. Select the clusters you wish to add and click **Save**.

The control panel displays an error message if the control plane of the cluster is unavailable or the version of the cluster is not compatible with the registry integration. [Upgrade your cluster version](/products/kubernetes/how-to/upgrade-cluster/) to continue with the integration.

Once the secret is added to all the namespaces for the selected Kubernetes clusters, the control panel displays the namespaces which have the secret associated with them.

The default service account in each of those namespaces is updated to include the secret in its image pull secret. From then on, you only need to configure the container image name in your workloads. If you want to use the generated secrets as `imagePullSecrets` for a specific workload or other service accounts, see [Using the Generated Secrets](#using-generated-secrets).

To add or remove secrets from the namespaces, click **Edit**.

The secret is created in the `kube-system` namespace of the Kubernetes cluster:

    apiVersion: v1
    kind: Secret
    metadata:
      name: <use_your_registry_name>
      namespace: kube-system
      annotations:
        digitalocean.com/dosecret-identifier: <use_your_registry_name>
    type: kubernetes.io/dockerconfigjson
    data:
      .dockerconfigjson: <use_your_docker_credentials>

Once this secret is created, DOKS internally copies the secret data to all other namespaces as shown below:

    apiVersion: v1
    kind: Secret
    metadata:
      name: <use_your_registry_name>
      namespace: all namespaces other than kube-system
      labels:
        digitalocean.com/copy-identifier: <use_your_registry_name>
    type: kubernetes.io/dockerconfigjson
    data:
      .dockerconfigjson: <use_your_docker_credentials>

You can also use the generated secrets with the other service accounts or for a specific workload. To do so, add `imagePullSecrets` to the service account or workload. For more information, consult [the Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#add-imagepullsecrets-to-a-service-account).

### Option 2: Manually Create and Reference Secrets as `imagePullSecrets`[](#create-secret-manually)

To create a secret using `kubectl` and specify it as an `imagePullSecrets`, first upload the credentials of your registry to your DigitalOcean Kubernetes cluster. There are two ways to do this:

*   Use [the `registry kubernetes-manifest` command](/reference/doctl/reference/registry/kubernetes-manifest/) to download the credentials for your registry and upload them to your cluster as a secret:
    
        doctl registry kubernetes-manifest | kubectl apply -f -
    
    The secret is named `registry-<your-registry-name>`.
    
*   Obtain credentials from the control panel and upload them manually to the cluster. To download credentials from the control panel, [navigate to the registry page](https://cloud.digitalocean.com/registry). Then, click **Download Docker Credentials** to download the credentials as a JSON file.
    
    Once you have the credentials on your machine, upload them to your cluster as a secret. This example names the secret `do-registry`:
    
        kubectl create secret generic do-registry \
          --from-file=.dockerconfigjson=docker-config.json \
          --type=kubernetes.io/dockerconfigjson
    

Finally, reference the secret you uploaded as an `imagePullSecrets`. There are two ways to do this:

*   Set an `imagePullSecret` on a per-Pod or per-Deployment basis.
    
    In the Deployment spec, provide the `name` of the `imagePullSecrets`. In the previous control panel-based example, the secret was named `do-registry`, so that name is also used here. If you used the `doctl`\-based instructions, use `registry-<my-registry>` instead.
    
        apiVersion: apps/v1
        kind: Deployment
        metadata:
          name: hello
          spec:
          replicas: 3
          template:
            metadata:
              labels:
                app: hello
                spec:
                containers:
                - name: hello
                image: registry.digitalocean.com/myregistry/myimage
                imagePullSecrets:
                - name: do-registry
    
    For more information on configuring Pods to connect to private registries, consult [the Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/).
    
*   Set an `imagePullSecret` as the default for all Pods and Deployments.
    
    You can modify the default service account to always use the secret as an `imagePullSecret` when creating Pods or Deployments.
    
    In the previous control panel-based example, the secret was named `do-registry`, so that name is also used here. If you used the `doctl`\-based instructions, use `registry-<my-registry>` instead.
    
        kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "do-registry"}]}'
    
    From then on, any new Pods have this automatically added to their spec:
    
        spec:
            imagePullSecrets:
            - name: do-registry
    
    For more information on patching the default service account to use `imagePullSecrets`, consult [the Kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#add-imagepullsecrets-to-a-service-account).
    

In this article...

*   [Configure Docker to Push to and Pull from the Registry](#docker-integration)
*   [Integrate The Registry with a DigitalOcean Kubernetes Cluster](#kubernetes-integration)
    *   [Option 1: Adding the Secret to All Cluster Namespaces (Recommended)](#add-secret-control-panel)
    *   [Option 2: Manually Create and Reference Secrets as `imagePullSecrets`](#create-secret-manually)

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

Try using different keywords or simplifying your searc