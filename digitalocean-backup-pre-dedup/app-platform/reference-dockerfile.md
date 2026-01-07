---
source: https://docs.digitalocean.com/products/app-platform/reference/dockerfile/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 App Platform Dockerfile Build Reference

Validated on 24 Sep 2021 • Last edited on 17 Jun 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

## How App Platform Builds Images[](#how-app-platform-builds-images)

App Platform supports two ways to build an image for your app: [Cloud Native Buildpacks](https://buildpacks.io/) and [Dockerfiles](https://docs.docker.com/engine/reference/builder/).

When you give App Platform access to your code, it defaults to using a Dockerfile if one is present in the root of the directory or specified in the app spec. Otherwise, App Platform checks your code to determine what language or framework it uses. If it supports the language or framework, it chooses an appropriate resource type and uses the proper buildpack to build the app and deploy a container.

### Defining the Dockerfile[](#defining-the-dockerfile)

To make the build system use a Dockerfile during the build process for your app, specify the `dockerfile_path` in the [app spec](/products/app-platform/reference/app-spec/):

    name: sample-dockerfile
    services:
    - name: web
      git:
        repo_clone_url: https://github.com/digitalocean/sample-dockerfile.git
        branch: main
      dockerfile_path: Dockerfile

When specifying your `dockerfile_path` value in the app spec, ensure the path is the exact location where your Dockerfile is located in your repository.

## Environment Variables[](#environment-variables)

To pass environment variables to a Dockerfile-based resource, define them as build-time or run-time environment variables in App Platform. This passes variables down to the `docker build` process (with a `--build-arg` parameter) and `docker run` process (with an `-e` parameter) when App Platform builds and deploys your container. You can then access the values of the environment variables using the `ARG` keyword in your Dockerfile as you normally would.

## Go Applications using Dockerfiles[](#go-applications-using-dockerfiles)

Using a Dockerfile to build a Go app is a flexible way to optimize the build image used to deploy the app.

App Platform detects Dockerfile-based Go apps by looking for a `Dockerfile` in the root of the directory or by using a path to a `Dockerfile` specified in the [app spec](/products/app-platform/reference/app-spec/).

One advantage of a Dockerfile-based build is the ability to reduce the size of the image with multi-stage builds. For example, [our sample Dockerfile app](https://github.com/digitalocean/sample-dockerfile) uses a multi-stage build so the final container image only contains updated CA certificates and the compiled Go binary:

    # This is a standard Dockerfile for building a Go app.
    # It is a multi-stage build: the first stage compiles the Go source into a binary, and
    #   the second stage copies only the binary into an alpine base.
    
    # -- Stage 1 -- #
    # Compile the app.
    FROM golang:1.12-alpine as builder
    WORKDIR /app
    # The build context is set to the directory where the repo is cloned.
    # This will copy all files in the repo to /app inside the container.
    # If your app requires the build context to be set to a subdirectory inside the repo, you
    #   can use the source_dir app spec option, see: <https://www.digitalocean.com/docs/app-platform/reference/app-specification-reference/>
    COPY . .
    RUN go build -mod=vendor -o bin/hello
    
    # -- Stage 2 -- #
    # Create the final environment with the compiled binary.
    FROM alpine
    # Install any required dependencies.
    RUN apk --no-cache add ca-certificates
    WORKDIR /root/
    # Copy the binary from the builder stage and set it as the default command.
    COPY --from=builder /app/bin/hello /usr/local/bin/
    CMD ["hello"]

## Limitations[](#limitations)

*   App Platform treats `/var/run` as a special path and avoids extracting it from base Docker images. This may cause errors with some builds. To resolve, restore `/var/run` in the form that is expected by the base image. For example, with Alpine Linux base images: `RUN test -e /var/run || ln -s /run /var/run`.

*   Due to an issue with Gunicorn running in Docker, App Platform fails to run when the temporary directory is not specified in the run command. To resolve, run Gunicorn to use a different location for its temp files. If using Django, modify the run command by passing the option `gunicorn --worker-tmp-dir /dev/shm project.wsgi`, replacing `project` with the name of your project. If using Flask, modify the run command by passing the option `gunicorn --worker-tmp-dir /dev/shm wsgi:project`, replacing `project` with the name of your project.

## Need Help?[](#need-help)

[](/products/app-platform/support/)

![](https://docs.digitalocean.com/images/icons/app-platform.svg)

App Platform Support

Get help with App Platform using our knowledgebase and troubleshooting guides.