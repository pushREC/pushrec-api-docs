---
source: https://docs.digitalocean.com/products/app-platform/support/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# App Platform Support

Generated on 6 Jan 2026

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

[](/support/how-do-i-fix-the-error-record-is-managed-by-an-app-on-this-account-and-cannot-be-deleted/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix the error "Record is managed by an App on this account, and cannot be deleted"?

Use the app’s Settings tab to remove domains associated with App Platform apps.

[](/support/why-do-i-get-the-error-javascript-heap-out-of-memory-during-deployment/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why do I get the error “JavaScript heap out of memory” during deployment?

Increase the heap memory by setting the environment variable NODE\_OPTIONS=–max-old-space-size=4096.

[](/support/how-do-i-fix-a-permission-denied-for-schema-public-error-in-my-dev-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix a "permission denied for schema public" error in my dev database?

Delete the existing dev database and create a new one. Then make sure that the app deployment completes successfully.

[](/support/why-do-i-get-the-error-domain-already-exists-when-trying-to-add-a-domain-to-an-app-in-another-account/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why do I get the error "Domain Already Exists" when trying to add a domain to an app in another account?

You cannot add the same domain name to multiple apps or split an app and domain name across more than one account.

[](/support/how-do-i-fix-an-image-or-digest-not-found-error-with-multiple-registries/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I fix an "Image or digest not found" error with multiple registries?

Specify the registry property in the app spec.

[](/support/why-am-i-getting-an-error-when-trying-to-forward-digitalocean-functions-to-managed-opensearch/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why am I getting an error when trying to forward DigitalOcean Functions to Managed OpenSearch?

Functions does not support forwarding to Managed OpenSearch.

[](/support/my-container-based-app-fails-to-deploy-without-logs-or-error-codes./)

![](https://docs.digitalocean.com/images/icons/support.svg)

My container-based app fails to deploy without logs or error codes.

Troubleshoot by making sure the Dockerfile and its commands build on Linux AMD64 and other steps.

[](/support/how-do-i-generate-my-apps-ssl-certificate/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I generate my app's SSL certificate?

App Platform automatically generates and issues the SSL certificate during the configuration.

[](/support/why-am-i-receiving-520-status-codes-from-my-app/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why am I receiving 520 status codes from my app?

Your app may have crashed while trying to receive an upload or return a response larger than it has been configured to manage.

[](/support/why-am-i-receiving-a-forbidden-error-when-making-changes-to-my-app-platform-app/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why am I receiving a forbidden error when making changes to my App Platform app?

Your team balance may be past due. Pay your balance to lift restrictions on actions you can take on the platform.

[](/support/where-can-i-find-the-client-ip-address-of-a-request-connecting-to-my-app/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Where can I find the client IP address of a request connecting to my app?

You can find the client IP address of a request connecting to your app in the `do-connecting-ip` HTTP header.

[](/support/why-is-my-apps-database-connection-timing-out/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why is my app's database connection timing out?

Timeouts can be caused by high CPU utilization, so check your app’s CPU utilization and consider scaling your app.

[](/support/why-cant-i-route-traffic-to-my-apps-dedicated-egress-ip-address/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why can't I route traffic to my app's dedicated egress IP address?

Dedicated egress IPs route egress (outbound) traffic from an app. To route ingress (inbound) traffic to an app, use one of App Platform’s public ingress IPs.

[](/support/why-doesnt-my-apps-wildcard-subdomain-work/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why doesn't my app's wildcard subdomain work?

Add the root domain to the list of domains in the app’s settings along with the wildcard subdomain.

[](/support/why-is-my-app-not-resolving-.gov-domains/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why is my app not resolving .gov domains?

App Platform apps may be slow or unable to resolve `.gov` domains because the domain administrators have blocked DigitalOcean’s IP addresses. To fix this, you can contact the domain administrator or use a custom DNS resolver.

[](/support/why-cant-i-find-my-app-even-after-paying-my-past-due-balance/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why can't I find my app even after paying my past due balance?

If your resources have been destroyed due to a prolonged past due balance, you can contact support to request the app spec for deleted apps to recreate the app with the same configuration.

[](/support/how-do-i-disable-email-obfuscation-on-my-app-platform-site/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I disable email obfuscation on my App Platform site?

Disable the feature in the app spec using the disable\_email\_obfuscation field.

[](/support/my-php-app-is-timing-out-and-throwing-5xx-errors/)

![](https://docs.digitalocean.com/images/icons/support.svg)

My PHP app is timing out and throwing 5xx errors

Increase your app’s maximum execution time in its .user.ini file to give it more time to complete requests.

[](/support/why-is-my-domain-pointing-to-my-old-static-site-app/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why is my domain pointing to my old static site app?

Remove the domain from the old app before deleting the old app, or wait 24 hours for the DNS to update.

[](/support/why-am-i-receiving-a-user-does-not-exist-error-when-building-my-docker-app-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why am I receiving a "user does not exist" error when building my Docker app on App Platform?

In your Dockerfile, the `USER` instruction needs to be after the `FROM` and `WORKDIR` instructions.

[](/support/why-am-i-receiving-an-invalid-dockerfile_path-error-when-building-my-docker-app-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why am I receiving an "invalid dockerfile\_path" error when building my Docker app on App Platform?

Ensure your Dockerfile’s path is correctly defined using the `dockerfile_path` parameter in your app spec file.

[](/support/why-are-there-multiple-408-errors-in-app-platforms-runtime-logs/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why are there multiple 408 errors in App Platform's runtime logs?

Multiple 408 errors are often caused by your app sending health checks with very short timeouts to App Platform. They typically don’t affect the functionality of the app.

[](/support/why-is-my-app-platform-build-or-deployment-failing-with-an-out-of-memory-error/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why is my App Platform build or deployment failing with an out of memory error?

App Platform builds have a fixed amount of memory available, so try optimizing your builds to stay within the 8 GB limit. You can increase the amount of memory in App Platform deployments by upgrading to a different plan.

[](/support/how-do-i-back-up-my-dev-database-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I back up my dev database on App Platform?

Dev Databases have no direct backup feature but you can use a cron job to back up your data to another database.

[](/support/why-am-i-receiving-1001-dns-resolution-error-when-accessing-my-apps-subdomain/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why am I receiving “1001 DNS Resolution Error” when accessing my app's subdomain?

You need to explicitly add the subdomain in your app’s settings.

[](/support/can-i-stop-pause-or-disable-my-app-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Can I stop, pause, or disable my app on App Platform?

You cannot pause, stop, or disable an app. You can delete the app and re-create it when needed.

[](/support/why-are-my-app-platform-environment-variables-not-updating/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why are my App Platform environment variables not updating?

Component-level variables override app-level variables, so you may have defined environment variables at both levels.

[](/support/why-does-my-app-fail-to-build-while-trying-to-connect-to-a-digitalocean-managed-database/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why does my app fail to build while trying to connect to a DigitalOcean Managed Database?

App Platform does not support connecting to DigitalOcean Managed Databases during the build process if the database has trusted sources enabled.

[](/support/how-do-i-back-up-my-app-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I back up my app on App Platform?

App Platform does not support backups, but you can use DigitalOcean Managed Databases to back up your data.

[](/support/what-region-is-my-apps-dev-database-located-in-and-can-i-change-it/)

![](https://docs.digitalocean.com/images/icons/support.svg)

What region is my app's dev database located in and can I change it?

Dev databases are located in the same region as your app and cannot be migrated to another region.

[](/support/why-are-large-files-failing-to-upload-to-my-app-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why are large files failing to upload to my app on App Platform?

Your upload may be exceeding your app’s allotted file storage space or it could be timing out.

[](/support/why-does-my-app-have-a-us-based-ip-address-when-i-created-it-in-a-different-region/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why does my app have a US-based IP address when I created it in a different region?

You see the CDN load balancer’s IP address. Use `dig` to see the dynamic IP address of the app.

[](/support/why-does-my-app-keep-restarting-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why does my app keep restarting on App Platform?

Application crashes, high memory consumption, and high disk usage are usually responsible for apps restarting.

[](/support/how-do-i-add-an-a-record-to-my-app-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I add an A record to my app on App Platform?

Apps do not have static IP addresses so you cannot point an A record at an app.

[](/support/why-cant-i-access-my-environment-variables-at-build-time-when-building-from-a-dockerfile-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why can't I access my environment variables at build time when building from a Dockerfile on App Platform?

Environment variables are only available as build-args for Dockerfile builds in App Platform.

[](/support/how-do-i-change-my-apps-github-repository-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How do I change my app's GitHub repository on App Platform?

You can change an app’s source repository by updating the app’s spec.

[](/support/why-am-i-receiving-a-missing-module-error-when-building-my-node.js-app-on-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why am I receiving a missing module error when building my Node.js app on App Platform ?

Ensure the missing module is listed in the `dependencies` section of the `package.json` file.

[](/support/can-i-inject-certificates-or-other-files-into-my-app-at-build-time/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Can I inject certificates or other files into my app at build time?

App Platform does not currently support injecting values as files on disk. Use environment variables to create files at run time.

[](/support/my-app-failed-to-build-and-i-received-an-exit-code/)

![](https://docs.digitalocean.com/images/icons/support.svg)

My app failed to build and I received an exit code

Review your app’s build logs to diagnose which process failed during building.

[](/support/why-are-my-database-bind-variables-missing-from-my-app/)

![](https://docs.digitalocean.com/images/icons/support.svg)

Why are my database bind variables missing from my app?

Database bind variables are only available during an app’s deployment and run times.

[](/support/my-app-deployment-failed-because-of-a-health-check/)

![](https://docs.digitalocean.com/images/icons/support.svg)

My app deployment failed because of a health check

Your app is likely unavailable on the port App Platform uses to perform health checks. Customize the health check or update the ports in your app.

[](/support/how-to-troubleshoot-apps-in-app-platform/)

![](https://docs.digitalocean.com/images/icons/support.svg)

How to Troubleshoot Apps in App Platform

Review some common troubleshooting techniques for App Platform.