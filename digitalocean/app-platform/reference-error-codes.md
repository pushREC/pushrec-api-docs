---
source: https://docs.digitalocean.com/products/app-platform/reference/error-codes/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# App Platform Error Code Reference

Validated on 30 Sep 2020 • Last edited on 30 Apr 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

During your use of the App Platform, when taking actions that create, update, or redeploy your application or resources, you may encounter one of the following errors. After reviewing the error code below, you can attempt to follow the suggested troubleshooting techniques.

[](/support/how-to-troubleshoot-apps-in-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How to Troubleshoot Apps in App Platform

Review some common troubleshooting techniques for App Platform.

## Generic Internal Error[](#generic-internal-error)

Type: `InternalError`. An internal error occurred. Try reloading or refreshing the page. If you’ve encountered this during a deployment, attempt to manually redeploy your app. Contact support if this persists.

## Build Errors[](#build-errors)

Error

Type

Reason

Job Failed

`BuildJobFailed`

Your build job failed. See the logs for details. Attempt to correct the problem and redeploy your application.

Non-Zero Exit

`BuildJobExitNonZero`

Your build job failed because it returned a non-zero exit code. See the logs for details. Attempt to correct the problem and redeploy your application.

Timeout

`BuildJobTimeout`

Your build job failed because it timed out after 60 minutes.

Out of Memory

`BuildJobOutOfMemory`

Your build job failed because it was out of memory.

Previous Build Reused

`PreviousBuildReused`

Your previous build was reused. For efficiency, this is a normal occurrence when nothing significant has changed between two versions of your application. No user action is required, but to view your latest build logs you may need to go back through your Deployment History.

Rate Limit Reached

`BuildRateLimit`

Your build job is being rate-limited due to concurrent build limits. App Platform will automatically retry your build. If App Platform continues to report this error, wait until your other apps have finished building and try deploying your application again.

## Database Errors[](#database-errors)

Error

Type

Reason

Database Not Available

`DatabaseNotAvailable`

Your database is not available.

Database Not Found

`DatabaseNotFound`

Your database was not found.

Database Limit Exceeded

`DatabaseLimitExceeded`

Your database limit was exceeded.

## Deploy Errors[](#deploy-errors)

Error

Type

Reason

Run Command Not Executable

`ContainerCommandNotExecutable`

Your deploy failed because your container run command either didn’t exist or was not executable. You can try clearing any custom run commands from your application resources’ configurations. Then, after a successful deployment, use the Console functionality in App Platform to test out variations of your run command interactively.

Non-Zero Exit Code

`ContainerExitNonZero`

Your deploy failed because your container exited with a non-zero exit code. See the logs for details. Attempt to correct the problem and redeploy your application.

Health Checks

`ContainerHealthChecksFailed`

Your deploy failed because your container did not respond to health checks. If a health check is failing, that means that external traffic is not reaching your service at the expected HTTP route.

Out of Memory

`ContainerOutOfMemory`

Your deploy failed because your container was out of memory.

Resource Exhausted

`ResourceExhausted`

By default, your overall App Platform resource usage is limited per account or team. There are limits on the total number of apps, total memory usage across apps, total CPU count across apps, total number of static sites, total number of domains, and total active build count. If you need any of these limits increased, [contact support](https://cloudsupport.digitalocean.com).

## Container Errors[](#container-errors)

Error

Type

Reason

Success (Exited Normally)

`0`

The container exited successfully, but it likely should have stayed running. This usually means the app started and then stopped. Check if your app is designed to stay active.

General Error

`1`

The app encountered a general error and exited. [View your logs for more details](/products/app-platform/how-to/view-logs/) and debug the application.

Shell Builtin Misuse

`2`

The container misused a shell builtin command. Check for syntax issues or incorrect usage in your entrypoint or scripts. App Platform supports `sh` and `bash`.

Command Not Executable

`126`

The command exists but is not executable. Check file permissions and ensure it’s an executable file.

Command Not Found

`127`

The command was not found. This usually means a required dependency is missing or not in the PATH.

Invalid Exit Code

`128`

The container tried to exit with an invalid code. This might be a script or signal handling issue.

Abort Signal (SIGABRT)

`134`

The app was aborted, likely from a crash or failed assertion. Check your app’s error handling. If this keeps happening, [contact support](https://cloudsupport.digitalocean.com).

Killed (SIGKILL)

`137`

The container was shut down unexpectedly, usually due to an Out of Memory (OOM) issue or manual stop. Try [increasing memory, enabling autoscaling, or scaling to more containers](/products/app-platform/how-to/scale-app/). If the issue persists, [contact support](https://cloudsupport.digitalocean.com).

Segmentation Fault (SIGSEGV)

`139`

The app crashed due to a segmentation fault. This usually means the app accessed invalid memory. [Debug your app’s memory usage](/products/app-platform/how-to/view-insights/).

Graceful Shutdown (SIGTERM)

`143`

The container received a graceful shutdown signal (SIGTERM). This is normal during scaling or redeployments. Make sure your app handles shutdown gracefully to avoid data loss or dropped requests.

Termination Failed

`145`

The container received a termination signal but didn’t exit properly. Test local signal handling and [contact support](https://cloudsupport.digitalocean.com) if it behaves differently in production.

Python Fatal Error

`217`

Python reported a fatal error, possibly due to memory corruption or internal issues. [Check your Python logs for more information](/products/app-platform/how-to/view-logs/).

Unknown or Out-of-Range Exit

`255`

The app exited with an unknown or out-of-range error. This often points to an unhandled exception. [Review the logs to understand what went wrong](/products/app-platform/how-to/view-logs/).