---
source: https://docs.digitalocean.com/products/app-platform/reference/app-spec/
scraped: 2026-01-07
tags: [digitalocean, app-platform, api-docs]
---

# Reference for App Specification

Validated on 6 Oct 2020 • Last edited on 9 Sep 2025

App Platform is a fully managed Platform-as-a-Service (PaaS) that deploys applications from Git repositories or container images. It automatically builds, deploys, and scales components while handling all underlying infrastructure.

As an alternative to configuring your app in the control panel, you can define an [application specification](https://docs.digitalocean.com/glossary/app-spec/) using YAML. YAML-based app specs are useful for deploying fully-configured apps with the [DigitalOcean API or `doctl`, the DigitalOcean command-line tool](/products/app-platform/reference/).

## Example App Spec[](#example-app-spec)

This example app spec defines a single service, `api`, and a single static site, `website`. A CORS exception is defined for `internal.example-app.com`, and an alert is triggered in the event of deployment failure.

When writing your app spec, reference \[Supported Buildpacks\] for your `environment_slug` and [App Platform pricing](/products/app-platform/details/pricing/#current-plans) for your `instance_size_slug`.

A working example app spec

    alerts:
    - rule: DEPLOYMENT_FAILED
    - rule: DOMAIN_FAILED
    features:
    - buildpack-stack=ubuntu-22
    ingress:
      rules:
      - component:
          name: api
        match:
          path:
            prefix: /api
      - component:
          name: website
        cors:
          allow_origins:
          - prefix: https://internal.example-app.com
        match:
          path:
            prefix: /
    name: your-app
    region: nyc
    services:
    - environment_slug: go
      github:
        branch: main
        deploy_on_push: true
        repo: git-user-name/api
      http_port: 8080
      instance_count: 2
      instance_size_slug: apps-s-1vcpu-1gb
      name: api
      run_command: bin/api
      source_dir: /
    static_sites:
    - environment_slug: html
      github:
        branch: master
        deploy_on_push: true
        repo: git-user-name/website
      name: website
      source_dir: /

## YAML File Structure[](#yaml-file-structure)

This reference covers all possible values that can be defined in an app spec. Whitespace defines hierarchy in YAML files, so this reference uses whitespace to nest child values under parent values. Where the string `(array)` appears, you can define more than one of the child values, but you must prefix them with a `-` dash as shown, per YAML syntax.

 name

String. The name of the app. Must be unique across all apps in the same account.

Minimum length: 2. Maximum length: 32.

Must comply with the following regular expression: `^[a-z][a-z0-9-]{0,30}[a-z0-9]$`

* * *

services (array)

Array of Objects. Workloads which expose publicly-accessible HTTP services.

name

String. The name. Must be unique across all components within the same app.

Minimum length: 2. Maximum length: 32.

Must comply with the following regular expression: `^[a-z][a-z0-9-]{0,30}[a-z0-9]$`

* * *

git

Object. A Git repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo\_clone\_url

String. The clone URL of the repo. Example: `https://github.com/digitalocean/sample-golang.git`

Maximum length: 255

* * *

branch

String. The name of the branch to use

* * *

* * *

github

Object. A GitHub repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+/[^/]+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

image

Object. An image to use as the component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

registry\_type

String. The registry type.

*   `DOCR`: The DigitalOcean container registry type.
*   `DOCKER_HUB`: The DockerHub container registry type.
*   `GHCR`: The Github container registry type.

* * *

registry

String. The registry name. Must be left empty for the `DOCR` registry type. Required for the `DOCKER_HUB` registry type, multiple registries, and push to deploy.

Maximum length: 192

* * *

repository

String. The repository name.

Maximum length: 192

* * *

tag

String. The repository tag. Defaults to `latest` if not provided and no digest is provided. Cannot be specified if digest is provided.

Maximum length: 192

* * *

digest

String. The image digest. Cannot be specified if tag is provided.

Maximum length: 192

* * *

registry\_credentials

String. The credentials to be able to pull the image. The value will be encrypted on first submission. On following submissions, the encrypted value should be used.

*   “$username:$access\_token” for registries of type `DOCKER_HUB`.
*   “$username:$access\_token” for registries of type `GHCR`.

* * *

deploy\_on\_push

Object. Deploy on new image tags. Only for DOCR images.

enabled

Boolean. Automatically deploy new images. Only for DOCR images. Can’t be enabled when a specific digest is specified.

* * *

* * *

* * *

gitlab

Object. A GitLab repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo

String. The name of the repo in the format owner/repo or owner/subgroup/repo. Example: `digitalocean/sample-golang` or `digitalocean/subgroup/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

bitbucket

Object. A Bitbucket repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab` or `image` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

dockerfile\_path

String. The path to the Dockerfile relative to the root of the repo. If set, it will be used to build this component. Otherwise, App Platform will attempt to build it using buildpacks.

* * *

build\_command

String. An optional build command to run while building this component from source.

* * *

run\_command

String. An optional run command to override the component’s default.

* * *

source\_dir

String. An optional path to the working directory to use for the build. For Dockerfile builds, this will be used as the build context. Must be relative to the root of the repo.

* * *

environment\_slug

String. A slug identifying the type of app, such as `node-js`. Available values are `node-js`, `php`, `ruby`, `python`, `go`, `hugo`, `html`, `hexo`, `ruby-on-rails`, `jekyll`, and `gatsby`.

* * *

envs (array)

Array of Objects. A list of environment variables made available to the component.

key

String. The name

Must comply with the following regular expression: `^[_A-Za-z][_A-Za-z0-9]*$`

* * *

value

String. The value. If the type is `SECRET`, the value will be encrypted on first submission. On following submissions, the encrypted value should be used.

* * *

scope

String. The visibility scope

*   `RUN_TIME`: Made available only at run-time
*   `BUILD_TIME`: Made available only at build-time
*   `RUN_AND_BUILD_TIME`: Made available at both build and run-time

* * *

type

String. The type

*   `GENERAL`: A plain-text environment variable
*   `SECRET`: A secret encrypted environment variable

* * *

* * *

instance\_size\_slug

String. The instance size to use for this component. Default: `basic-xxs`

* * *

instance\_count

Integer. The amount of instances that this component should be scaled to. Default 1, Minimum 1, Maximum 250. Consider using a larger instance size if your application requires more than 250 instances.

* * *

autoscaling

Object. Configuration for automatically scaling this component based on metrics.

min\_instance\_count

Integer. The minimum amount of instances for this component.

* * *

max\_instance\_count

Integer. The maximum amount of instances for this component. Maximum 250. Consider using a larger instance size if your application requires more than 250 instances.

* * *

metrics

Object. The metrics that the component is scaled on.

cpu

Object. Settings for scaling the component based on CPU utilization.

percent

Integer. The average target CPU utilization for the component.

* * *

* * *

* * *

* * *

http\_port

Integer. The internal port on which this service’s run command will listen. Default: 8080 If there is not an environment variable with the name `PORT`, one will be automatically added with its value set to the value of this field.

* * *

protocol

String. The protocol which the service uses to serve traffic on the http\_port.

*   `HTTP`: The app is serving the HTTP protocol. Default.
*   `HTTP2`: The app is serving the HTTP/2 protocol. Currently, this needs to be implemented in the service by serving HTTP/2 with prior knowledge.

* * *

routes (array)

Array of Objects. (Deprecated) A list of HTTP routes that should be routed to this component.

path

String. (Deprecated) An HTTP path prefix. Paths must start with / and must be unique across all components within an app.

* * *

preserve\_path\_prefix

Boolean. (Deprecated) An optional flag to preserve the path that is forwarded to the backend service. By default, the HTTP request path will be trimmed from the left when forwarded to the component. For example, a component with `path=/api` will have requests to `/api/list` trimmed to `/list`. If this value is `true`, the path will remain `/api/list`. Note: this is not applicable for Functions Components.

* * *

* * *

health\_check

Object. A health check to determine the availability of this component.

initial\_delay\_seconds

Integer. The number of seconds to wait before beginning health checks. Default: 0 seconds, Minimum 0, Maximum 3600. When used in liveness\_health\_check, Default: 5 seconds, Minimum 0, Maximum 3600.

* * *

period\_seconds

Integer. The number of seconds to wait between health checks. Default: 10 seconds, Minimum 1, Maximum 300. When used in liveness\_health\_check, Default: 10 seconds, Minimum 1, Maximum 300.

* * *

timeout\_seconds

Integer. The number of seconds after which the check times out. Default: 1 second, Minimum 1, Maximum 120.

* * *

success\_threshold

Integer. The number of successful health checks before considered healthy. Default: 1 second, Minimum 1, Maximum 50. When used in liveness\_health\_check, Default: 1 second, Minimum 1, Maximum 1.

* * *

failure\_threshold

Integer. The number of failed health checks before considered unhealthy. Default: 9 seconds, Minimum 1, Maximum 50. When used in liveness\_health\_check, Default: 18 seconds, Minimum 1, Maximum 50.

* * *

http\_path

String. The route path used for the HTTP health check ping. If not set, the HTTP health check will be disabled and a TCP health check used instead.

* * *

port

Integer. The port on which the health check will be performed. If not set, the health check will be performed on the component’s http\_port.

* * *

* * *

cors

Object. (Deprecated, see `ingress > rules > cors`) A Cross-Origin Resource Sharing policy (CORS).

allow\_origins (array)

Array of Objects. The set of allowed CORS origins. This configures the Access-Control-Allow-Origin header.

exact

String. Exact string match. Only 1 of `exact`, `prefix`, or `regex` must be set.

Minimum length: 1. Maximum length: 256

* * *

prefix

String. Prefix-based match. Only 1 of `exact`, `prefix`, or `regex` must be set.

Minimum length: 1. Maximum length: 256

* * *

regex

String. RE2 style regex-based match. Only 1 of `exact`, `prefix`, or `regex` must be set. For more information about RE2 syntax, see: [https://github.com/google/re2/wiki/Syntax](https://github.com/google/re2/wiki/Syntax)

Minimum length: 1. Maximum length: 256

* * *

* * *

allow\_methods (array)

Array of Strings. The set of allowed HTTP methods. This configures the Access-Control-Allow-Methods header.

* * *

allow\_headers (array)

Array of Strings. The set of allowed HTTP request headers. This configures the Access-Control-Allow-Headers header.

* * *

expose\_headers (array)

Array of Strings. The set of HTTP response headers that browsers are allowed to access. This configures the Access-Control-Expose-Headers header.

* * *

max\_age

String. An optional duration specifying how long browsers can cache the results of a preflight request. This configures the Access-Control-Max-Age header. Example: `5h30m`.

* * *

allow\_credentials

Boolean. Whether browsers should expose the response to the client-side JavaScript code when the request’s credentials mode is `include`. This configures the Access-Control-Allow-Credentials header.

* * *

* * *

internal\_ports (array)

Array of Int64s. The ports on which this service will listen for internal traffic.

* * *

alerts (array)

Array of Objects. A list of configured alerts which apply to the component.

rule

String. The specific type of alert.

*   `CPU_UTILIZATION`: Represents CPU for a given container instance. Only applicable at the component level.
*   `MEM_UTILIZATION`: Represents RAM for a given container instance. Only applicable at the component level.
*   `RESTART_COUNT`: Represents restart count for a given container instance. Only applicable at the component level.
*   `DEPLOYMENT_FAILED`: Represents whether a deployment has failed. Only applicable at the app level.
*   `DEPLOYMENT_LIVE`: Represents whether a deployment has succeeded. Only applicable at the app level.
*   `DEPLOYMENT_STARTED`: Represents whether a deployment has started. Only applicable at the app level.
*   `DEPLOYMENT_CANCELED`: Represents whether a deployment has been canceled. Only applicable at the app level.
*   `DOMAIN_FAILED`: Represents whether a domain configuration has failed. Only applicable at the app level.
*   `DOMAIN_LIVE`: Represents whether a domain configuration has succeeded. Only applicable at the app level.
*   `AUTOSCALE_FAILED`: Represents whether autoscaling has failed. Only applicable at the app level.
*   `AUTOSCALE_SUCCEEDED`: Represents whether autoscaling has succeeded. Only applicable at the app level.
*   `FUNCTIONS_ACTIVATION_COUNT`: Represents an activation count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_DURATION_MS`: Represents the average duration for function runtimes. Only applicable to functions components.
*   `FUNCTIONS_ERROR_RATE_PER_MINUTE`: Represents an error rate per minute for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_WAIT_TIME_MS`: Represents the average wait time for functions. Only applicable to functions components.
*   `FUNCTIONS_ERROR_COUNT`: Represents an error count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_GB_RATE_PER_SECOND`: Represents the rate of memory consumption (GB x seconds) for functions. Only applicable to functions components.

* * *

disabled

Boolean. Determines whether or not the alert is disabled.

* * *

operator

String. Can be `GREATER_THAN`, or `LESS_THAN`

* * *

value

Number. The meaning is dependent upon the rule. It is used in conjunction with the operator and window to determine when an alert should trigger.

* * *

window

String. Can be `FIVE_MINUTES`, `TEN_MINUTES`, `THIRTY_MINUTES`, or `ONE_HOUR`

* * *

* * *

log\_destinations (array)

Array of Objects. A list of configured log forwarding destinations.

name

String. Name of the log destination.

Minimum length: 2. Maximum length: 42.

Must comply with the following regular expression: `^[A-Za-z0-9()\[\]'"][-A-Za-z0-9_. \/()\[\]]{0,40}[A-Za-z0-9()\[\]'"]$`

* * *

papertrail

Object. Papertrail configuration.

endpoint

String. Papertrail syslog endpoint.

* * *

* * *

datadog

Object. Datadog configuration.

endpoint

String. Datadog HTTP log intake endpoint.

* * *

api\_key

String. Datadog API key.

* * *

* * *

logtail

Object. Logtail configuration.

token

String. Logtail token.

* * *

* * *

open\_search

Object. OpenSearch configuration.

endpoint

String. OpenSearch API Endpoint. Only HTTPS is supported. Format: https://:. Cannot be specified if `cluster_name` is also specified.

* * *

basic\_auth

Object.

user

String. Username to authenticate with. Only required when `endpoint` is set. Defaults to `doadmin` when `cluster_name` is set.

* * *

password

String. Password for user defined in User. Is required when `endpoint` is set. Cannot be set if using a DigitalOcean DBaaS OpenSearch cluster.

* * *

* * *

index\_name

String. The index name to use for the logs. If not set, the default index name is “logs”.

* * *

cluster\_name

String. The name of a DigitalOcean DBaaS OpenSearch cluster to use as a log forwarding destination. Cannot be specified if `endpoint` is also specified.

* * *

* * *

* * *

termination

Object.

drain\_seconds

Integer. The number of seconds to wait between selecting a container instance for termination and issuing the TERM signal. Selecting a container instance for termination begins an asynchronous drain of new requests on upstream load-balancers. Default: 15 seconds, Minimum 1, Maximum 110.

* * *

grace\_period\_seconds

Integer. The number of seconds to wait between sending a TERM signal to a container and issuing a KILL which causes immediate shutdown. Default: 120, Minimum 1, Maximum 600.

* * *

* * *

liveness\_health\_check

Object. A health check that determines the availability of this component. Failing to respond will result in the component being restarted.

initial\_delay\_seconds

Integer. The number of seconds to wait before beginning health checks. Default: 5 seconds, Minimum 0, Maximum 3600.

* * *

period\_seconds

Integer. The number of seconds to wait between health checks. Default: 10 seconds, Minimum 1, Maximum 300.

* * *

timeout\_seconds

Integer. The number of seconds after which the check times out. Default: 1 second, Minimum 1, Maximum 120.

* * *

success\_threshold

Integer. The number of successful health checks before considered healthy. Default: 1 second, Minimum 1, Maximum 1.

* * *

failure\_threshold

Integer. The number of failed health checks before considered unhealthy. Default: 18 seconds, Minimum 1, Maximum 50.

* * *

http\_path

String. The route path used for the HTTP health check ping. If not set, the HTTP health check will be disabled and a TCP health check used instead.

* * *

port

Integer. The port on which the health check will be performed.

* * *

* * *

* * *

static\_sites (array)

Array of Objects. Content which can be rendered to static web assets.

name

String. The name. Must be unique across all components within the same app.

Minimum length: 2. Maximum length: 32.

Must comply with the following regular expression: `^[a-z][a-z0-9-]{0,30}[a-z0-9]$`

* * *

git

Object. A Git repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, or `gitlab` must be set.

repo\_clone\_url

String. The clone URL of the repo. Example: `https://github.com/digitalocean/sample-golang.git`

Maximum length: 255

* * *

branch

String. The name of the branch to use

* * *

* * *

github

Object. A GitHub repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, or `gitlab` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+/[^/]+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

gitlab

Object. A GitLab repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, or `gitlab` must be set.

repo

String. The name of the repo in the format owner/repo or owner/subgroup/repo. Example: `digitalocean/sample-golang` or `digitalocean/subgroup/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

bitbucket

Object. A Bitbucket repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, or `gitlab` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

dockerfile\_path

String. The path to the Dockerfile relative to the root of the repo. If set, it will be used to build this component. Otherwise, App Platform will attempt to build it using buildpacks.

* * *

build\_command

String. An optional build command to run while building this component from source.

* * *

source\_dir

String. An optional path to the working directory to use for the build. For Dockerfile builds, this will be used as the build context. Must be relative to the root of the repo.

* * *

environment\_slug

String. A slug identifying the type of app, such as `node-js`. Available values are `node-js`, `php`, `ruby`, `python`, `go`, `hugo`, `html`, `hexo`, `ruby-on-rails`, `jekyll`, and `gatsby`.

* * *

output\_dir

String. An optional path to where the built assets will be located, relative to the build context. If not set, App Platform will automatically scan for these directory names: `_static`, `dist`, `public`, `build`.

* * *

index\_document

String. The name of the index document to use when serving this static site. Default: index.html

* * *

error\_document

String. The name of the error document to use when serving this static site. Default: 404.html. If no such file exists within the built assets, App Platform will supply one.

* * *

envs (array)

Array of Objects. A list of environment variables made available to the component.

key

String. The name

Must comply with the following regular expression: `^[_A-Za-z][_A-Za-z0-9]*$`

* * *

value

String. The value. If the type is `SECRET`, the value will be encrypted on first submission. On following submissions, the encrypted value should be used.

* * *

scope

String. The visibility scope

*   `RUN_TIME`: Made available only at run-time
*   `BUILD_TIME`: Made available only at build-time
*   `RUN_AND_BUILD_TIME`: Made available at both build and run-time

* * *

type

String. The type

*   `GENERAL`: A plain-text environment variable
*   `SECRET`: A secret encrypted environment variable

* * *

* * *

routes (array)

Array of Objects. (Deprecated) A list of HTTP routes that should be routed to this component.

path

String. (Deprecated) An HTTP path prefix. Paths must start with / and must be unique across all components within an app.

* * *

preserve\_path\_prefix

Boolean. (Deprecated) An optional flag to preserve the path that is forwarded to the backend service. By default, the HTTP request path will be trimmed from the left when forwarded to the component. For example, a component with `path=/api` will have requests to `/api/list` trimmed to `/list`. If this value is `true`, the path will remain `/api/list`. Note: this is not applicable for Functions Components.

* * *

* * *

cors

Object. (Deprecated) A Cross-Origin Resource Sharing policy (CORS).

allow\_origins (array)

Array of Objects. The set of allowed CORS origins. This configures the Access-Control-Allow-Origin header.

exact

String. Exact string match. Only 1 of `exact`, `prefix`, or `regex` must be set.

Minimum length: 1. Maximum length: 256

* * *

prefix

String. Prefix-based match. Only 1 of `exact`, `prefix`, or `regex` must be set.

Minimum length: 1. Maximum length: 256

* * *

regex

String. RE2 style regex-based match. Only 1 of `exact`, `prefix`, or `regex` must be set. For more information about RE2 syntax, see: [https://github.com/google/re2/wiki/Syntax](https://github.com/google/re2/wiki/Syntax)

Minimum length: 1. Maximum length: 256

* * *

* * *

allow\_methods (array)

Array of Strings. The set of allowed HTTP methods. This configures the Access-Control-Allow-Methods header.

* * *

allow\_headers (array)

Array of Strings. The set of allowed HTTP request headers. This configures the Access-Control-Allow-Headers header.

* * *

expose\_headers (array)

Array of Strings. The set of HTTP response headers that browsers are allowed to access. This configures the Access-Control-Expose-Headers header.

* * *

max\_age

String. An optional duration specifying how long browsers can cache the results of a preflight request. This configures the Access-Control-Max-Age header. Example: `5h30m`.

* * *

allow\_credentials

Boolean. Whether browsers should expose the response to the client-side JavaScript code when the request’s credentials mode is `include`. This configures the Access-Control-Allow-Credentials header.

* * *

* * *

catchall\_document

String. The name of the document to use as the fallback for any requests to documents that are not found when serving this static site. Only 1 of `catchall_document` or `error_document` can be set.

* * *

* * *

workers (array)

Array of Objects. Workloads which do not expose publicly-accessible HTTP services.

name

String. The name. Must be unique across all components within the same app.

Minimum length: 2. Maximum length: 32.

Must comply with the following regular expression: `^[a-z][a-z0-9-]{0,30}[a-z0-9]$`

* * *

git

Object. A Git repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo\_clone\_url

String. The clone URL of the repo. Example: `https://github.com/digitalocean/sample-golang.git`

Maximum length: 255

* * *

branch

String. The name of the branch to use

* * *

* * *

github

Object. A GitHub repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+/[^/]+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

image

Object. An image to use as the component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

registry\_type

String. The registry type.

*   `DOCR`: The DigitalOcean container registry type.
*   `DOCKER_HUB`: The DockerHub container registry type.
*   `GHCR`: The Github container registry type.

* * *

registry

String. The registry name. Must be left empty for the `DOCR` registry type. Required for the `DOCKER_HUB` registry type.

Maximum length: 192

* * *

repository

String. The repository name.

Maximum length: 192

* * *

tag

String. The repository tag. Defaults to `latest` if not provided and no digest is provided. Cannot be specified if digest is provided.

Maximum length: 192

* * *

digest

String. The image digest. Cannot be specified if tag is provided.

Maximum length: 192

* * *

registry\_credentials

String. The credentials to be able to pull the image. The value will be encrypted on first submission. On following submissions, the encrypted value should be used.

*   “$username:$access\_token” for registries of type `DOCKER_HUB`.
*   “$username:$access\_token” for registries of type `GHCR`.

* * *

deploy\_on\_push

Object. Deploy on new image tags. Only for DOCR images.

enabled

Boolean. Automatically deploy new images. Only for DOCR images. Can’t be enabled when a specific digest is specified.

* * *

* * *

* * *

gitlab

Object. A GitLab repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo

String. The name of the repo in the format owner/repo or owner/subgroup/repo. Example: `digitalocean/sample-golang` or `digitalocean/subgroup/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

bitbucket

Object. A Bitbucket repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

dockerfile\_path

String. The path to the Dockerfile relative to the root of the repo. If set, it will be used to build this component. Otherwise, App Platform will attempt to build it using buildpacks.

* * *

build\_command

String. An optional build command to run while building this component from source.

* * *

run\_command

String. An optional run command to override the component’s default.

* * *

source\_dir

String. An optional path to the working directory to use for the build. For Dockerfile builds, this will be used as the build context. Must be relative to the root of the repo.

* * *

environment\_slug

String. A slug identifying the type of app, such as `node-js`. Available values are `node-js`, `php`, `ruby`, `python`, `go`, `hugo`, `html`, `hexo`, `ruby-on-rails`, `jekyll`, and `gatsby`.

* * *

envs (array)

Array of Objects. A list of environment variables made available to the component.

key

String. The name

Must comply with the following regular expression: `^[_A-Za-z][_A-Za-z0-9]*$`

* * *

value

String. The value. If the type is `SECRET`, the value will be encrypted on first submission. On following submissions, the encrypted value should be used.

* * *

scope

String. The visibility scope

*   `RUN_TIME`: Made available only at run-time
*   `BUILD_TIME`: Made available only at build-time
*   `RUN_AND_BUILD_TIME`: Made available at both build and run-time

* * *

type

String. The type

*   `GENERAL`: A plain-text environment variable
*   `SECRET`: A secret encrypted environment variable

* * *

* * *

instance\_size\_slug

String. The instance size to use for this component.

* * *

instance\_count

Integer. The amount of instances that this component should be scaled to. Default 1, Minimum 1, Maximum 250. Consider using a larger instance size if your application requires more than 250 instances.

* * *

autoscaling

Object. Configuration for automatically scaling this component based on metrics.

min\_instance\_count

Integer. The minimum amount of instances for this component.

* * *

max\_instance\_count

Integer. The maximum amount of instances for this component. Maximum 250. Consider using a larger instance size if your application requires more than 250 instances.

* * *

metrics

Object. The metrics that the component is scaled on.

cpu

Object. Settings for scaling the component based on CPU utilization.

percent

Integer. The average target CPU utilization for the component.

* * *

* * *

* * *

* * *

alerts (array)

Array of Objects. A list of configured alerts which apply to the component.

rule

String. The specific type of alert.

*   `CPU_UTILIZATION`: Represents CPU for a given container instance. Only applicable at the component level.
*   `MEM_UTILIZATION`: Represents RAM for a given container instance. Only applicable at the component level.
*   `RESTART_COUNT`: Represents restart count for a given container instance. Only applicable at the component level.
*   `DEPLOYMENT_FAILED`: Represents whether a deployment has failed. Only applicable at the app level.
*   `DEPLOYMENT_LIVE`: Represents whether a deployment has succeeded. Only applicable at the app level.
*   `DEPLOYMENT_STARTED`: Represents whether a deployment has started. Only applicable at the app level.
*   `DEPLOYMENT_CANCELED`: Represents whether a deployment has been canceled. Only applicable at the app level.
*   `DOMAIN_FAILED`: Represents whether a domain configuration has failed. Only applicable at the app level.
*   `DOMAIN_LIVE`: Represents whether a domain configuration has succeeded. Only applicable at the app level.
*   `AUTOSCALE_FAILED`: Represents whether autoscaling has failed. Only applicable at the app level.
*   `AUTOSCALE_SUCCEEDED`: Represents whether autoscaling has succeeded. Only applicable at the app level.
*   `FUNCTIONS_ACTIVATION_COUNT`: Represents an activation count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_DURATION_MS`: Represents the average duration for function runtimes. Only applicable to functions components.
*   `FUNCTIONS_ERROR_RATE_PER_MINUTE`: Represents an error rate per minute for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_WAIT_TIME_MS`: Represents the average wait time for functions. Only applicable to functions components.
*   `FUNCTIONS_ERROR_COUNT`: Represents an error count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_GB_RATE_PER_SECOND`: Represents the rate of memory consumption (GB x seconds) for functions. Only applicable to functions components.

* * *

disabled

Boolean. Determines whether or not the alert is disabled.

* * *

operator

String. Can be `GREATER_THAN`, or `LESS_THAN`

* * *

value

Number. The meaning is dependent upon the rule. It is used in conjunction with the operator and window to determine when an alert should trigger.

* * *

window

String. Can be `FIVE_MINUTES`, `TEN_MINUTES`, `THIRTY_MINUTES`, or `ONE_HOUR`

* * *

* * *

log\_destinations (array)

Array of Objects. A list of configured log forwarding destinations.

name

String. Name of the log destination.

Minimum length: 2. Maximum length: 42.

Must comply with the following regular expression: `^[A-Za-z0-9()\[\]'"][-A-Za-z0-9_. \/()\[\]]{0,40}[A-Za-z0-9()\[\]'"]$`

* * *

papertrail

Object. Papertrail configuration.

endpoint

String. Papertrail syslog endpoint.

* * *

* * *

datadog

Object. Datadog configuration.

endpoint

String. Datadog HTTP log intake endpoint.

* * *

api\_key

String. Datadog API key.

* * *

* * *

logtail

Object. Logtail configuration.

token

String. Logtail token.

* * *

* * *

open\_search

Object. OpenSearch configuration.

endpoint

String. OpenSearch API Endpoint. Only HTTPS is supported. Format: https://:. Cannot be specified if `cluster_name` is also specified.

* * *

basic\_auth

Object.

user

String. Username to authenticate with. Only required when `endpoint` is set. Defaults to `doadmin` when `cluster_name` is set.

* * *

password

String. Password for user defined in User. Is required when `endpoint` is set. Cannot be set if using a DigitalOcean DBaaS OpenSearch cluster.

* * *

* * *

index\_name

String. The index name to use for the logs. If not set, the default index name is “logs”.

* * *

cluster\_name

String. The name of a DigitalOcean DBaaS OpenSearch cluster to use as a log forwarding destination. Cannot be specified if `endpoint` is also specified.

* * *

* * *

* * *

termination

Object.

grace\_period\_seconds

Integer. The number of seconds to wait between sending a TERM signal to a container and issuing a KILL which causes immediate shutdown. Default: 120, Minimum 1, Maximum 600.

* * *

* * *

liveness\_health\_check

Object. A health check that determines the availability of this component. Failing to respond will result in the component being restarted.

initial\_delay\_seconds

Integer. The number of seconds to wait before beginning health checks. Default: 5 seconds, Minimum 0, Maximum 3600.

* * *

period\_seconds

Integer. The number of seconds to wait between health checks. Default: 10 seconds, Minimum 1, Maximum 300.

* * *

timeout\_seconds

Integer. The number of seconds after which the check times out. Default: 1 second, Minimum 1, Maximum 120.

* * *

success\_threshold

Integer. The number of successful health checks before considered healthy. Default: 1 second, Minimum 1, Maximum 1.

* * *

failure\_threshold

Integer. The number of failed health checks before considered unhealthy. Default: 18 seconds, Minimum 1, Maximum 50.

* * *

http\_path

String. The route path used for the HTTP health check ping. If not set, the HTTP health check will be disabled and a TCP health check used instead.

* * *

port

Integer. The port on which the health check will be performed.

* * *

* * *

* * *

jobs (array)

Array of Objects. Pre and post deployment workloads which do not expose publicly-accessible HTTP routes.

name

String. The name. Must be unique across all components within the same app.

Minimum length: 2. Maximum length: 32.

Must comply with the following regular expression: `^[a-z][a-z0-9-]{0,30}[a-z0-9]$`

* * *

git

Object. A Git repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo\_clone\_url

String. The clone URL of the repo. Example: `https://github.com/digitalocean/sample-golang.git`

Maximum length: 255

* * *

branch

String. The name of the branch to use

* * *

* * *

github

Object. A GitHub repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+/[^/]+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

image

Object. An image to use as the component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

registry\_type

String. The registry type.

*   `DOCR`: The DigitalOcean container registry type.
*   `DOCKER_HUB`: The DockerHub container registry type.
*   `GHCR`: The Github container registry type.

* * *

registry

String. The registry name. Must be left empty for the `DOCR` registry type. Required for the `DOCKER_HUB` registry type.

Maximum length: 192

* * *

repository

String. The repository name.

Maximum length: 192

* * *

tag

String. The repository tag. Defaults to `latest` if not provided and no digest is provided. Cannot be specified if digest is provided.

Maximum length: 192

* * *

digest

String. The image digest. Cannot be specified if tag is provided.

Maximum length: 192

* * *

registry\_credentials

String. The credentials to be able to pull the image. The value will be encrypted on first submission. On following submissions, the encrypted value should be used.

*   “$username:$access\_token” for registries of type `DOCKER_HUB`.
*   “$username:$access\_token” for registries of type `GHCR`.

* * *

deploy\_on\_push

Object. Deploy on new image tags. Only for DOCR images.

enabled

Boolean. Automatically deploy new images. Only for DOCR images. Can’t be enabled when a specific digest is specified.

* * *

* * *

* * *

gitlab

Object. A GitLab repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo

String. The name of the repo in the format owner/repo or owner/subgroup/repo. Example: `digitalocean/sample-golang` or `digitalocean/subgroup/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

bitbucket

Object. A Bitbucket repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, `gitlab`, or `image` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

dockerfile\_path

String. The path to the Dockerfile relative to the root of the repo. If set, it will be used to build this component. Otherwise, App Platform will attempt to build it using buildpacks.

* * *

build\_command

String. An optional build command to run while building this component from source.

* * *

run\_command

String. An optional run command to override the component’s default.

* * *

source\_dir

String. An optional path to the working directory to use for the build. For Dockerfile builds, this will be used as the build context. Must be relative to the root of the repo.

* * *

environment\_slug

String. A slug identifying the type of app, such as `node-js`. Available values are `node-js`, `php`, `ruby`, `python`, `go`, `hugo`, `html`, `hexo`, `ruby-on-rails`, `jekyll`, and `gatsby`.

* * *

envs (array)

Array of Objects. A list of environment variables made available to the component.

key

String. The name

Must comply with the following regular expression: `^[_A-Za-z][_A-Za-z0-9]*$`

* * *

value

String. The value. If the type is `SECRET`, the value will be encrypted on first submission. On following submissions, the encrypted value should be used.

* * *

scope

String. The visibility scope

*   `RUN_TIME`: Made available only at run-time
*   `BUILD_TIME`: Made available only at build-time
*   `RUN_AND_BUILD_TIME`: Made available at both build and run-time

* * *

type

String. The type

*   `GENERAL`: A plain-text environment variable
*   `SECRET`: A secret encrypted environment variable

* * *

* * *

instance\_size\_slug

String. The instance size to use for this component.

* * *

instance\_count

Integer. The amount of instances that this component should be scaled to. Default 1, Minimum 1, Maximum 250. Consider using a larger instance size if your application requires more than 250 instances.

* * *

kind

String. The type of job and when it will be run during the deployment process.

*   `UNSPECIFIED`: Default job type, will auto-complete to POST\_DEPLOY kind.
*   `PRE_DEPLOY`: Indicates a job that runs before an app deployment.
*   `POST_DEPLOY`: Indicates a job that runs after an app deployment.
*   `FAILED_DEPLOY`: Indicates a job that runs after a component fails to deploy.
*   `SCHEDULED`: Indicates a job that runs periodically based on a cron expression.

* * *

schedule

Object. Used to schedule a job to run periodically.

cron

String. A cron expression that determines how often the job runs.

* * *

time\_zone

String. The schedule’s timezone from the tz database.

* * *

* * *

alerts (array)

Array of Objects. A list of configured alerts which apply to the component.

rule

String. The specific type of alert.

*   `CPU_UTILIZATION`: Represents CPU for a given container instance. Only applicable at the component level.
*   `MEM_UTILIZATION`: Represents RAM for a given container instance. Only applicable at the component level.
*   `RESTART_COUNT`: Represents restart count for a given container instance. Only applicable at the component level.
*   `DEPLOYMENT_FAILED`: Represents whether a deployment has failed. Only applicable at the app level.
*   `DEPLOYMENT_LIVE`: Represents whether a deployment has succeeded. Only applicable at the app level.
*   `DEPLOYMENT_STARTED`: Represents whether a deployment has started. Only applicable at the app level.
*   `DEPLOYMENT_CANCELED`: Represents whether a deployment has been canceled. Only applicable at the app level.
*   `DOMAIN_FAILED`: Represents whether a domain configuration has failed. Only applicable at the app level.
*   `DOMAIN_LIVE`: Represents whether a domain configuration has succeeded. Only applicable at the app level.
*   `AUTOSCALE_FAILED`: Represents whether autoscaling has failed. Only applicable at the app level.
*   `AUTOSCALE_SUCCEEDED`: Represents whether autoscaling has succeeded. Only applicable at the app level.
*   `FUNCTIONS_ACTIVATION_COUNT`: Represents an activation count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_DURATION_MS`: Represents the average duration for function runtimes. Only applicable to functions components.
*   `FUNCTIONS_ERROR_RATE_PER_MINUTE`: Represents an error rate per minute for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_WAIT_TIME_MS`: Represents the average wait time for functions. Only applicable to functions components.
*   `FUNCTIONS_ERROR_COUNT`: Represents an error count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_GB_RATE_PER_SECOND`: Represents the rate of memory consumption (GB x seconds) for functions. Only applicable to functions components.

* * *

disabled

Boolean. Determines whether or not the alert is disabled.

* * *

operator

String. Can be `GREATER_THAN`, or `LESS_THAN`

* * *

value

Number. The meaning is dependent upon the rule. It is used in conjunction with the operator and window to determine when an alert should trigger.

* * *

window

String. Can be `FIVE_MINUTES`, `TEN_MINUTES`, `THIRTY_MINUTES`, or `ONE_HOUR`

* * *

* * *

log\_destinations (array)

Array of Objects. A list of configured log forwarding destinations.

name

String. Name of the log destination.

Minimum length: 2. Maximum length: 42.

Must comply with the following regular expression: `^[A-Za-z0-9()\[\]'"][-A-Za-z0-9_. \/()\[\]]{0,40}[A-Za-z0-9()\[\]'"]$`

* * *

papertrail

Object. Papertrail configuration.

endpoint

String. Papertrail syslog endpoint.

* * *

* * *

datadog

Object. Datadog configuration.

endpoint

String. Datadog HTTP log intake endpoint.

* * *

api\_key

String. Datadog API key.

* * *

* * *

logtail

Object. Logtail configuration.

token

String. Logtail token.

* * *

* * *

open\_search

Object. OpenSearch configuration.

endpoint

String. OpenSearch API Endpoint. Only HTTPS is supported. Format: https://:. Cannot be specified if `cluster_name` is also specified.

* * *

basic\_auth

Object.

user

String. Username to authenticate with. Only required when `endpoint` is set. Defaults to `doadmin` when `cluster_name` is set.

* * *

password

String. Password for user defined in User. Is required when `endpoint` is set. Cannot be set if using a DigitalOcean DBaaS OpenSearch cluster.

* * *

* * *

index\_name

String. The index name to use for the logs. If not set, the default index name is “logs”.

* * *

cluster\_name

String. The name of a DigitalOcean DBaaS OpenSearch cluster to use as a log forwarding destination. Cannot be specified if `endpoint` is also specified.

* * *

* * *

* * *

termination

Object.

grace\_period\_seconds

Integer. The number of seconds to wait between sending a TERM signal to a container and issuing a KILL which causes immediate shutdown. Default: 120, Minimum 1, Maximum 600.

* * *

* * *

* * *

functions (array)

Array of Objects. Workloads which expose publicly-accessible HTTP services via Functions Components.

name

String. The name. Must be unique across all components within the same app.

Minimum length: 2. Maximum length: 32.

Must comply with the following regular expression: `^[a-z][a-z0-9-]{0,30}[a-z0-9]$`

* * *

git

Object. A Git repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, or `gitlab` must be set.

repo\_clone\_url

String. The clone URL of the repo. Example: `https://github.com/digitalocean/sample-golang.git`

Maximum length: 255

* * *

branch

String. The name of the branch to use

* * *

* * *

github

Object. A GitHub repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, or `gitlab` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+/[^/]+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

gitlab

Object. A GitLab repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, or `gitlab` must be set.

repo

String. The name of the repo in the format owner/repo or owner/subgroup/repo. Example: `digitalocean/sample-golang` or `digitalocean/subgroup/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

bitbucket

Object. A Bitbucket repo to use as component’s source. Only one of `bitbucket`, `git`, `github`, or `gitlab` must be set.

repo

String. The name of the repo in the format owner/repo. Example: `digitalocean/sample-golang`

Must comply with the following regular expression: `^[^/]+(/[^/]+)+$`

* * *

branch

String. The name of the branch to use

* * *

deploy\_on\_push

Boolean. Whether to automatically deploy new commits made to the repo

* * *

* * *

source\_dir

String. An optional path to the working directory to use for the build. Must be relative to the root of the repo.

* * *

envs (array)

Array of Objects. A list of environment variables made available to the component.

key

String. The name

Must comply with the following regular expression: `^[_A-Za-z][_A-Za-z0-9]*$`

* * *

value

String. The value. If the type is `SECRET`, the value will be encrypted on first submission. On following submissions, the encrypted value should be used.

* * *

scope

String. The visibility scope

*   `RUN_TIME`: Made available only at run-time
*   `BUILD_TIME`: Made available only at build-time
*   `RUN_AND_BUILD_TIME`: Made available at both build and run-time

* * *

type

String. The type

*   `GENERAL`: A plain-text environment variable
*   `SECRET`: A secret encrypted environment variable

* * *

* * *

routes (array)

Array of Objects. (Deprecated) A list of HTTP routes that should be routed to this component.

path

String. (Deprecated) An HTTP path prefix. Paths must start with / and must be unique across all components within an app.

* * *

preserve\_path\_prefix

Boolean. (Deprecated) An optional flag to preserve the path that is forwarded to the backend service. By default, the HTTP request path will be trimmed from the left when forwarded to the component. For example, a component with `path=/api` will have requests to `/api/list` trimmed to `/list`. If this value is `true`, the path will remain `/api/list`. Note: this is not applicable for Functions Components.

* * *

* * *

alerts (array)

Array of Objects. A list of configured alerts the user has enabled.

rule

String. The specific type of alert.

*   `CPU_UTILIZATION`: Represents CPU for a given container instance. Only applicable at the component level.
*   `MEM_UTILIZATION`: Represents RAM for a given container instance. Only applicable at the component level.
*   `RESTART_COUNT`: Represents restart count for a given container instance. Only applicable at the component level.
*   `DEPLOYMENT_FAILED`: Represents whether a deployment has failed. Only applicable at the app level.
*   `DEPLOYMENT_LIVE`: Represents whether a deployment has succeeded. Only applicable at the app level.
*   `DEPLOYMENT_STARTED`: Represents whether a deployment has started. Only applicable at the app level.
*   `DEPLOYMENT_CANCELED`: Represents whether a deployment has been canceled. Only applicable at the app level.
*   `DOMAIN_FAILED`: Represents whether a domain configuration has failed. Only applicable at the app level.
*   `DOMAIN_LIVE`: Represents whether a domain configuration has succeeded. Only applicable at the app level.
*   `AUTOSCALE_FAILED`: Represents whether autoscaling has failed. Only applicable at the app level.
*   `AUTOSCALE_SUCCEEDED`: Represents whether autoscaling has succeeded. Only applicable at the app level.
*   `FUNCTIONS_ACTIVATION_COUNT`: Represents an activation count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_DURATION_MS`: Represents the average duration for function runtimes. Only applicable to functions components.
*   `FUNCTIONS_ERROR_RATE_PER_MINUTE`: Represents an error rate per minute for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_WAIT_TIME_MS`: Represents the average wait time for functions. Only applicable to functions components.
*   `FUNCTIONS_ERROR_COUNT`: Represents an error count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_GB_RATE_PER_SECOND`: Represents the rate of memory consumption (GB x seconds) for functions. Only applicable to functions components.

* * *

disabled

Boolean. Determines whether or not the alert is disabled.

* * *

operator

String. Can be `GREATER_THAN`, or `LESS_THAN`

* * *

value

Number. The meaning is dependent upon the rule. It is used in conjunction with the operator and window to determine when an alert should trigger.

* * *

window

String. Can be `FIVE_MINUTES`, `TEN_MINUTES`, `THIRTY_MINUTES`, or `ONE_HOUR`

* * *

* * *

log\_destinations (array)

Array of Objects. A list of configured log forwarding destinations.

name

String. Name of the log destination.

Minimum length: 2. Maximum length: 42.

Must comply with the following regular expression: `^[A-Za-z0-9()\[\]'"][-A-Za-z0-9_. \/()\[\]]{0,40}[A-Za-z0-9()\[\]'"]$`

* * *

papertrail

Object. Papertrail configuration.

endpoint

String. Papertrail syslog endpoint.

* * *

* * *

datadog

Object. Datadog configuration.

endpoint

String. Datadog HTTP log intake endpoint.

* * *

api\_key

String. Datadog API key.

* * *

* * *

logtail

Object. Logtail configuration.

token

String. Logtail token.

* * *

* * *

open\_search

Object. OpenSearch configuration.

endpoint

String. OpenSearch API Endpoint. Only HTTPS is supported. Format: https://:. Cannot be specified if `cluster_name` is also specified.

* * *

basic\_auth

Object.

user

String. Username to authenticate with. Only required when `endpoint` is set. Defaults to `doadmin` when `cluster_name` is set.

* * *

password

String. Password for user defined in User. Is required when `endpoint` is set. Cannot be set if using a DigitalOcean DBaaS OpenSearch cluster.

* * *

* * *

index\_name

String. The index name to use for the logs. If not set, the default index name is “logs”.

* * *

cluster\_name

String. The name of a DigitalOcean DBaaS OpenSearch cluster to use as a log forwarding destination. Cannot be specified if `endpoint` is also specified.

* * *

* * *

* * *

cors

Object. (Deprecated, see `ingress > rules > cors`) A Cross-Origin Resource Sharing policy (CORS).

allow\_origins (array)

Array of Objects. The set of allowed CORS origins. This configures the Access-Control-Allow-Origin header.

exact

String. Exact string match. Only 1 of `exact`, `prefix`, or `regex` must be set.

Minimum length: 1. Maximum length: 256

* * *

prefix

String. Prefix-based match. Only 1 of `exact`, `prefix`, or `regex` must be set.

Minimum length: 1. Maximum length: 256

* * *

regex

String. RE2 style regex-based match. Only 1 of `exact`, `prefix`, or `regex` must be set. For more information about RE2 syntax, see: [https://github.com/google/re2/wiki/Syntax](https://github.com/google/re2/wiki/Syntax)

Minimum length: 1. Maximum length: 256

* * *

* * *

allow\_methods (array)

Array of Strings. The set of allowed HTTP methods. This configures the Access-Control-Allow-Methods header.

* * *

allow\_headers (array)

Array of Strings. The set of allowed HTTP request headers. This configures the Access-Control-Allow-Headers header.

* * *

expose\_headers (array)

Array of Strings. The set of HTTP response headers that browsers are allowed to access. This configures the Access-Control-Expose-Headers header.

* * *

max\_age

String. An optional duration specifying how long browsers can cache the results of a preflight request. This configures the Access-Control-Max-Age header. Example: `5h30m`.

* * *

allow\_credentials

Boolean. Whether browsers should expose the response to the client-side JavaScript code when the request’s credentials mode is `include`. This configures the Access-Control-Allow-Credentials header.

* * *

* * *

* * *

databases (array)

Array of Objects. Database instances which can provide persistence to workloads within the application.

name

String. The database’s name. The name must be unique across all components within the same app and cannot use capital letters.

Minimum length: 2. Maximum length: 32.

Must comply with the following regular expression: `^[a-z][a-z0-9-]{0,30}[a-z0-9]$`

* * *

engine

String. The database engine to use

*   `MYSQL`: MySQL
*   `PG`: PostgreSQL
*   `REDIS`: Redis
*   `MONGODB`: MongoDB
*   `KAFKA`: Kafka
*   `OPENSEARCH`: OpenSearch
*   `VALKEY`: Valkey

* * *

version

String. The version of the database engine

* * *

production

Boolean. Whether this is a production or dev database.

* * *

cluster\_name

String. The name of the underlying DigitalOcean DBaaS cluster. This is required for production databases. For dev databases, if cluster\_name is not set, a new cluster will be provisioned.

* * *

db\_name

String. The name of the MySQL or PostgreSQL database to configure.

* * *

db\_user

String. The name of the MySQL or PostgreSQL user to configure.

* * *

* * *

domains (array)

Array of Objects. A set of hostnames where the application will be available.

domain

String. The hostname for the domain

Minimum length: 4. Maximum length: 253.

Must comply with the following regular expression: `^([a-zA-Z0-9]+(-+[a-zA-Z0-9]+)*\.)+(xn--)?[a-zA-Z0-9]{2,}\.?$`

* * *

type

String. The domain type, which can be one of the following:

*   `DEFAULT`: The default `.ondigitalocean.app` domain assigned to this app
*   `PRIMARY`: The primary domain for this app that is displayed as the default in the control panel, used in bindable environment variables, and any other places that reference an app’s live URL. Only one domain may be set as primary.
*   `ALIAS`: A non-primary domain

* * *

wildcard

Boolean. Indicates whether the domain includes all sub-domains, in addition to the given domain

* * *

zone

String. Optional. If the domain uses DigitalOcean DNS and you would like App Platform to automatically manage it for you, set this to the name of the domain on your account.

For example, If the domain you are adding is `app.domain.com`, the zone could be `domain.com`.

* * *

minimum\_tls\_version

String. Optional. The minimum version of TLS a client application can use to access resources for the domain.

Must be one of the following values wrapped within quotations: `"1.2"` or `"1.3"`.

* * *

* * *

region

String. The slug form of the geographical origin of the app. Default: `nearest available`

* * *

envs (array)

Array of Objects. A list of environment variables made available to all components in the app.

key

String. The name

Must comply with the following regular expression: `^[_A-Za-z][_A-Za-z0-9]*$`

* * *

value

String. The value. If the type is `SECRET`, the value will be encrypted on first submission. On following submissions, the encrypted value should be used.

* * *

scope

String. The visibility scope

*   `RUN_TIME`: Made available only at run-time
*   `BUILD_TIME`: Made available only at build-time
*   `RUN_AND_BUILD_TIME`: Made available at both build and run-time

* * *

type

String. The type

*   `GENERAL`: A plain-text environment variable
*   `SECRET`: A secret encrypted environment variable

* * *

* * *

alerts (array)

Array of Objects. A list of alerts which apply to the app.

rule

String. The specific type of alert.

*   `CPU_UTILIZATION`: Represents CPU for a given container instance. Only applicable at the component level.
*   `MEM_UTILIZATION`: Represents RAM for a given container instance. Only applicable at the component level.
*   `RESTART_COUNT`: Represents restart count for a given container instance. Only applicable at the component level.
*   `DEPLOYMENT_FAILED`: Represents whether a deployment has failed. Only applicable at the app level.
*   `DEPLOYMENT_LIVE`: Represents whether a deployment has succeeded. Only applicable at the app level.
*   `DEPLOYMENT_STARTED`: Represents whether a deployment has started. Only applicable at the app level.
*   `DEPLOYMENT_CANCELED`: Represents whether a deployment has been canceled. Only applicable at the app level.
*   `DOMAIN_FAILED`: Represents whether a domain configuration has failed. Only applicable at the app level.
*   `DOMAIN_LIVE`: Represents whether a domain configuration has succeeded. Only applicable at the app level.
*   `AUTOSCALE_FAILED`: Represents whether autoscaling has failed. Only applicable at the app level.
*   `AUTOSCALE_SUCCEEDED`: Represents whether autoscaling has succeeded. Only applicable at the app level.
*   `FUNCTIONS_ACTIVATION_COUNT`: Represents an activation count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_DURATION_MS`: Represents the average duration for function runtimes. Only applicable to functions components.
*   `FUNCTIONS_ERROR_RATE_PER_MINUTE`: Represents an error rate per minute for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_AVERAGE_WAIT_TIME_MS`: Represents the average wait time for functions. Only applicable to functions components.
*   `FUNCTIONS_ERROR_COUNT`: Represents an error count for a given functions instance. Only applicable to functions components.
*   `FUNCTIONS_GB_RATE_PER_SECOND`: Represents the rate of memory consumption (GB x seconds) for functions. Only applicable to functions components.

* * *

disabled

Boolean. Determines whether or not the alert is disabled.

* * *

operator

String. Can be `GREATER_THAN`, or `LESS_THAN`

* * *

value

Number. The meaning is dependent upon the rule. It is used in conjunction with the operator and window to determine when an alert should trigger.

* * *

window

String. Can be `FIVE_MINUTES`, `TEN_MINUTES`, `THIRTY_MINUTES`, or `ONE_HOUR`

* * *

* * *

ingress

Object. Specification for component routing, rewrites, and redirects.

rules (array)

Array of Objects. Rules for configuring HTTP ingress for component routes, CORS, rewrites, and redirects.

match

Object. The match configuration for the rule

path

Object. The path to match on.

prefix

String. Prefix-based match. For example, `/api` will match `/api`, `/api/`, and any nested paths such as `/api/v1/endpoint`.

Maximum length: 256

* * *

exact

String.

Maximum length: 256

* * *

* * *

authority

Object. The authority to match on.

prefix

String. Prefix-based match. For example, `/api` will match `/api`, `/api/`, and any nested paths such as `/api/v1/endpoint`.

Maximum length: 256

* * *

exact

String.

Maximum length: 256

* * *

* * *

* * *

component

Object. The component to route to. Only one of `component` or `redirect` may be set.

name

String. The name of the component to route to.

* * *

preserve\_path\_prefix

Boolean. An optional flag to preserve the path that is forwarded to the backend service. By default, the HTTP request path will be trimmed from the left when forwarded to the component. For example, a component with `path=/api` will have requests to `/api/list` trimmed to `/list`. If this value is `true`, the path will remain `/api/list`. Note: this is not applicable for Functions Components and is mutually exclusive with `rewrite`.

* * *

rewrite

String. An optional field that will rewrite the path of the component to be what is specified here. By default, the HTTP request path will be trimmed from the left when forwarded to the component. For example, a component with `path=/api` will have requests to `/api/list` trimmed to `/list`. If you specified the rewrite to be `/v1/`, requests to `/api/list` would be rewritten to `/v1/list`. Note: this is mutually exclusive with `preserve_path_prefix`.

* * *

* * *

redirect

Object. The redirect configuration for the rule. Only one of `component` or `redirect` may be set.

uri

String. An optional URI path to redirect to. Note: if this is specified the whole URI of the original request will be overwritten to this value, irrespective of the original request URI being matched.

* * *

authority

String. The authority/host to redirect to. This can be a hostname or IP address. Note: use `port` to set the port.

* * *

port

Integer. The port to redirect to.

* * *

scheme

String. The scheme to redirect to. Supported values are `http` or `https`. Default: `https`.

* * *

redirect\_code

Integer. The redirect code to use. Defaults to `302`. Supported values are 300, 301, 302, 303, 304, 307, 308.

* * *

* * *

cors

Object. The CORS configuration for the rule.

allow\_origins (array)

Array of Objects. The set of allowed CORS origins. This configures the Access-Control-Allow-Origin header.

exact

String. Exact string match. Only 1 of `exact`, `prefix`, or `regex` must be set.

Minimum length: 1. Maximum length: 256

* * *

prefix

String. Prefix-based match. Only 1 of `exact`, `prefix`, or `regex` must be set.

Minimum length: 1. Maximum length: 256

* * *

regex

String. RE2 style regex-based match. Only 1 of `exact`, `prefix`, or `regex` must be set. For more information about RE2 syntax, see: [https://github.com/google/re2/wiki/Syntax](https://github.com/google/re2/wiki/Syntax)

Minimum length: 1. Maximum length: 256

* * *

* * *

allow\_methods (array)

Array of Strings. The set of allowed HTTP methods. This configures the Access-Control-Allow-Methods header.

* * *

allow\_headers (array)

Array of Strings. The set of allowed HTTP request headers. This configures the Access-Control-Allow-Headers header.

* * *

expose\_headers (array)

Array of Strings. The set of HTTP response headers that browsers are allowed to access. This configures the Access-Control-Expose-Headers header.

* * *

max\_age

String. An optional duration specifying how long browsers can cache the results of a preflight request. This configures the Access-Control-Max-Age header. Example: `5h30m`.

* * *

allow\_credentials

Boolean. Whether browsers should expose the response to the client-side JavaScript code when the request’s credentials mode is `include`. This configures the Access-Control-Allow-Credentials header.

* * *

* * *

* * *

* * *

maintenance

Object. The maintenance configuration for the app.

enabled

Boolean. Set to `true` to enable maintenance mode. When enabled, all traffic to the app receives a maintenance message. Defaults to `false`.

* * *

offline\_page\_url

String. A custom offline page to display when maintenance mode is enabled or the app is archived.

* * *

* * *

disable\_edge\_cache

Boolean. Set to `true` to disable the CDN cache, allowing you to use your own CDN, use SSE, and build MCP servers. Defaults to `false`.

* * *

disable\_email\_obfuscation

Boolean. Set to `true` to disable email obfuscation, presenting any email addresses in your site’s HTML as they are, instead of automatically anonymizing them. Defaults to `false`.

* * *

enhanced\_threat\_control\_enabled

Boolean. Set to `true` to enable enhanced threat control for Layer 7 DDoS protection. This returns a `403 Forbidden` error response to suspicious API requests. Takes up to 30 seconds to propagate. Defaults to `false`.

* * *

vpc

Now in public preview, App Platform apps in FRA1, NYC1, and TOR1 support VPC.

id

String. Enter a single UUID for the VPC you want the app to connect to.

* * *

* * *

### File Structure Example[](#file-structure-example)

The example below displays all possible fields in an app spec with example values.

This example demonstrates the full structure of an app spec, but is not a working spec. There is [a functional example app spec](#example-app-spec) at the top of this page.

Full app spec structure (not a working spec)

    name: my-app
    region: nyc
    services:
      - name: web-service
        git:
          repo_clone_url: https://github.com/user/repo-name.git
          branch: main
        github:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        image:
          registry_type: DOCR
          registry: ghcr.io
          repository: user/repo-name
          tag: latest
          digest: sha256:1234567890abcdef
          registry_credentials: "$your_username:$access_token"
          deploy_on_push:
            enabled: true
        gitlab:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        dockerfile_path: ./Dockerfile
        build_command: npm install && npm run build
        run_command: npm start
        source_dir: ./web
        envs:
          - key: NODE_ENV
            value: production
            scope: RUN_TIME
            type: general
          - key: SECRET_KEY
            value: EV[1:zqiRIeaaYK/NqctZDYzy6t0pTrtRDeq8:wqGpZRrsKN5nPhWQrS479cfBiXT0WQ==]
            type: secret
        instance_count: 2
        autoscaling:
          min_instances: 1
          max_instances: 5
          metrics:
            cpu:
              percent: 75
        http_port: 8080
        health_check:
          initial_delay_seconds: 5
          period_seconds: 10
          timeout_seconds: 5
          success_threshold: 2
          failure_threshold: 3
          http_path: /api
          port: 8080
        liveness_health_check: 
         initial_delay_seconds: 5 
         period_seconds: 10 
         timeout_seconds: 5 
         success_threshold: 2 
         failure_threshold: 3
         http_path: /api
         port: 8080 
        internal_ports: [8080, 80]
        alerts:
          - rule: CPU_UTILIZATION
            disabled: false
            operator: GREATER_THAN
            value: 75
            window: FIVE_MINUTES
        log_destinations:
          - name: example-logger
            papertrail:
              endpoint: logs.papertrailapp.com:12345
            datadog:
              endpoint: logs.datadoghq.com:12345
              api_key: 82d168fdae72372ec79408dd22912d97
            logtail:
              token: 123e4567-e89b-12d3-a456-426614174000
            open_search:
              endpoint: logs.example.com:12345
              basic_auth:
                user: doadmin
                password: 1234567890abcdef
              index_name: example-index
              cluster_name: example-cluster
        termination:
          drain_seconds: 30
          grace_period_seconds: 90
    static_sites:
      - name: static-site
        git:
          repo_clone_url: https://github.com/user/repo-name.git
          branch: main
        github:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        gitlab:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        dockerfile_path: ./Dockerfile
        build_command: npm install && npm run build
        source_dir: ./web
        output_dir: build
        index_document: index.html
        error_document: 404.html
        envs:
          - key: API_ENDPOINT
            value: https://api.example.com
            scope: RUN_TIME
            type: general
          - key: SECRET_KEY
            value: EV[1:zqiRIeaaYK/NqctZDYzy6t0pTrtRDeq8:wqGpZRrsKN5nPhWQrS479cfBiXT0WQ==]
            type: secret
        catchall_document: index.html
    workers:
      - name: background-worker
        git:
          repo_clone_url: https://github.com/user/repo-name.git
          branch: main
        github:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        image:
          registry_type: DOCR
          registry: ghcr.io
          repository: user/repo-name
          tag: latest
          digest: sha256:1234567890abcdef
          registry_credentials: "$your_username:$access_token"
          deploy_on_push:
            enabled: true
        gitlab:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        dockerfile_path: ./Dockerfile
        build_command: npm install && npm run build
        run_command: npm start
        source_dir: ./web
        envs:
          - key: NODE_ENV
            value: production
            scope: RUN_TIME
            type: general
          - key: SECRET_KEY
            value: EV[1:zqiRIeaaYK/NqctZDYzy6t0pTrtRDeq8:wqGpZRrsKN5nPhWQrS479cfBiXT0WQ==]
            type: secret
        instance_count: 2
        autoscaling:
          min_instances: 1
          max_instances: 5
          metrics:
            cpu:
              percent: 75
        alerts:
          - rule: CPU_UTILIZATION
            disabled: false
            operator: GREATER_THAN
            value: 75
            window: FIVE_MINUTES
        log_destinations:
          - name: example-logger
            papertrail:
              endpoint: logs.papertrailapp.com:12345
            datadog:
              endpoint: logs.datadoghq.com:12345
              api_key: 82d168fdae72372ec79408dd22912d97
            logtail:
              token: 123e4567-e89b-12d3-a456-426614174000
            open_search:
              endpoint: logs.example.com:12345
              basic_auth:
                user: doadmin
                password: 1234567890abcdef
              index_name: example-index
              cluster_name: example-cluster
        termination:
          drain_seconds: 30
          grace_period_seconds: 90
    jobs:
        git:
          repo_clone_url: https://github.com/user/repo-name.git
          branch: main
        github:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        image:
          registry_type: DOCR
          registry: ghcr.io
          repository: user/repo-name
          tag: latest
          digest: sha256:1234567890abcdef
          registry_credentials: "$your_username:$access_token"
          deploy_on_push:
            enabled: true
        gitlab:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        dockerfile_path: ./Dockerfile
        build_command: npm install && npm run build
        run_command: npm start
        source_dir: ./web
        envs:
          - key: NODE_ENV
            value: production
            scope: RUN_TIME
            type: general
          - key: SECRET_KEY
            value: EV[1:zqiRIeaaYK/NqctZDYzy6t0pTrtRDeq8:wqGpZRrsKN5nPhWQrS479cfBiXT0WQ==]
            type: secret
        instance_count: 2
        kind: SCHEDULED
        schedule:
          cron: "*/15 * * * *"
          time_zone: Asia/Kolkata
        alerts:
          - rule: CPU_UTILIZATION
            disabled: false
            operator: GREATER_THAN
            value: 75
            window: FIVE_MINUTES
        log_destinations:
          - name: example-logger
            papertrail:
              endpoint: logs.papertrailapp.com:12345
            datadog:
              endpoint: logs.datadoghq.com:12345
              api_key: 82d168fdae72372ec79408dd22912d97
            logtail:
              token:  123e4567-e89b-12d3-a456-426614174000
            open_search:
              endpoint: logs.example.com:12345
              basic_auth:
                user: doadmin
                password: 1234567890abcdef
              index_name: example-index
              cluster_name: example-cluster
        termination:
          drain_seconds: 30
          grace_period_seconds: 90
    functions:
      - name: example-function
        git:
          repo_clone_url: https://github.com/user/repo-name.git
          branch: main
        github:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        gitlab:
          repo: user/repo-name
          branch: main
          deploy_on_push: true
        source_dir: ./web
        envs:
          - key: NODE_ENV
            value: production
            scope: RUN_TIME
            type: general
          - key: SECRET_KEY
            value: EV[1:zqiRIeaaYK/NqctZDYzy6t0pTrtRDeq8:wqGpZRrsKN5nPhWQrS479cfBiXT0WQ==]
            type: secret
        alerts:
          - rule: CPU_UTILIZATION
            disabled: false
            operator: GREATER_THAN
            value: 75
            window: FIVE_MINUTES
        log_destinations:
          - name: example-logger
            papertrail:
              endpoint: logs.papertrailapp.com:12345
            datadog:
              endpoint: logs.datadoghq.com:12345
              api_key: 82d168fdae72372ec79408dd22912d97
            logtail:
              token: 123e4567-e89b-12d3-a456-426614174000
            open_search:
              endpoint: logs.example.com:12345
              basic_auth:
                user: doadmin
                password: 1234567890abcdef
              index_name: example-index
              cluster_name: example-cluster
        termination:
          drain_seconds: 30
          grace_period_seconds: 90
    databases:
      - name: postgres-db
        engine: PG
        version: "13"
        production: true
        cluster_name: example-cluster
        db_name: example-db
        db_user: example-user
    domains:
      - domain: app.example.com
        type: primary
        wildcard: true
        zone: example.com
        minimum_tls_version: 1.2
    envs:
      - key: NODE_ENV
        value: production
        scope: RUN_TIME
        type: general
      - key: SECRET_KEY
        value: EV[1:zqiRIeaaYK/NqctZDYzy6t0pTrtRDeq8:wqGpZRrsKN5nPhWQrS479cfBiXT0WQ==]
        type: secret
    alerts:
      - rule: CPU_UTILIZATION
        disabled: false
        operator: GREATER_THAN
        value: 75
        window: FIVE_MINUTES
    ingress:
      rules:
        - match: 
            path:
              prefix: /api
          component:
            name: web-service
            preserve_path_prefix: true
            rewrite: /api
          redirect:
            uri: /developers
            authority: example.com
            port: 8080
            scheme: https
            redirect_code: 302
          cors:
            allow_origins: 
              - exact: https://example.com
                regex: ^https://.*\.example\.com$
            allow_methods: ["GET", "POST"]
            allow_headers: ["Authorization"]
            expose_headers: ["Authorization"]
            max_age: 5h30m
            allow_credentials: true
    maintenance:
      enabled: false
    disable_edge_cache: false
    disable_email_obfuscation: false
    enhanced_threat_control_enabled: false
    vpc:
      id: 5218b393-8cef-41a3-a436-72a20de7cba4