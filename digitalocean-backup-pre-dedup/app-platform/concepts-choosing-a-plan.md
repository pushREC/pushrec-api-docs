---
source: https://docs.digitalocean.com/products/app-platform/concepts/choosing-a-plan/
scraped: 2026-01-07
api_provider: DigitalOcean
discovery_tier: 3
verified: false
---
 Choosing a Plan for Your App Components

Validated on 16 Jun 2022 • Last edited on 1 May 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

Choosing the [right plan](/products/app-platform/details/pricing/#current-plans) for your App Platform components depends on the component’s expected workload. An oversized component underutilizes the container’s resources and costs more than needed. An undersized component risks being overwhelmed and unable to handle spikes in resource usage.

This guide covers the following topics:

*   [How to choose a CPU type (shared or dedicated)](#choose-a-cpu-type)
*   [How to choose the right number of CPUs and memory](#choosing-the-number-of-cpus-and-memory)

## Choose a CPU Type[](#choose-a-cpu-type)

App Platform offers two types of CPUs: shared CPUs and dedicated CPUs.

Shared CPUs are shared with other DigitalOcean customers. This means that when you deploy an app component on a shared CPU, the component shares its processing power with other apps on App Platform. They provide a cost-effective option for typical web workloads. However, the resources available to your app may vary depending on usage by other customers. We recommend shared CPUs for components with low to medium workloads and traffic, such as blogs, small websites, basic APIs, and microservices.

Dedicated CPUs are solely dedicated to your app component. This means your component has guaranteed access to the full processing power of the CPUs it is deployed on. Dedicated CPUs provide isolation, consistent performance, and can use autoscaling. They cost more than shared CPUs but provide more predictable performance. We recommend dedicated CPUs for components with heavy workloads, strict performance requirements, or components that require autoscaling. Examples include video and streaming services, resource-intensive APIs, and apps with heavy user traffic.

## Choosing the Number of CPUs and Memory[](#choosing-the-number-of-cpus-and-memory)

When choosing the amount of CPUs and memory, it is better to err on the side of more resources rather than less. This ensures your app component has enough headroom to handle traffic spikes without performance issues. Once you establish a baseline of normal usage through metrics, you can scale down over time if needed.

To get a better idea of what you need to start with, you can try deploying your app inside of a Docker container locally and use tools like [Docker Stats](https://docs.docker.com/reference/cli/docker/container/stats) or [htop](https://www.geeksforgeeks.org/htop-command-in-linux-with-examples) to monitor CPU and memory usage over time as you simulate normal and peak traffic loads. This gives you real data to help determine your component’s resource needs.

![A screenshot of the App Platform Insights screen showing CPU and memory usage over time.](https://docs.digitalocean.com/screenshots/app-platform/app-insights.22efee0ede1e7a6b353a88a51c9b3f8eb8c56211e2f504f6643a49d5058d8f31.png)

Once you’ve deployed your app, you can start monitoring its resource usage with App Platform’s [monitoring feature](/products/app-platform/how-to/view-insights/) to help determine whether you need to rescale the component’s resources up or down.

In general, we only recommend fixed plans (plans with no scaling features) for low traffic websites and workers performing tasks that are not time sensitive.