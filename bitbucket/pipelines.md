---
created: 2026-01-09
tags: [type/api-reference, api/pipelines]
api_name: Bitbucket API
category: Pipelines
endpoint_count: 58
---

# Bitbucket API - Pipelines

[[README|Back to Overview]]

---

## GET /repositories/{workspace}/{repo_slug}/deployments_config/environments/{environment_uuid}/variables

**List variables for an environment**

Find deployment environment level variables.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `environment_uuid` | path | string | Yes | The environment. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deployments_config/environments/{environment_uuid}/variables"
```

---

## POST /repositories/{workspace}/{repo_slug}/deployments_config/environments/{environment_uuid}/variables

**Create a variable for an environment**

Create a deployment environment level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `environment_uuid` | path | string | Yes | The environment. |
| `_body` | body | string | Yes | The variable to create |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deployments_config/environments/{environment_uuid}/variables"
```

---

## PUT /repositories/{workspace}/{repo_slug}/deployments_config/environments/{environment_uuid}/variables/{variable_uuid}

**Update a variable for an environment**

Update a deployment environment level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `environment_uuid` | path | string | Yes | The environment. |
| `variable_uuid` | path | string | Yes | The UUID of the variable to update. |
| `_body` | body | string | Yes | The updated deployment variable. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deployments_config/environments/{environment_uuid}/variables/{variable_uuid}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/deployments_config/environments/{environment_uuid}/variables/{variable_uuid}

**Delete a variable for an environment**

Delete a deployment environment level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `environment_uuid` | path | string | Yes | The environment. |
| `variable_uuid` | path | string | Yes | The UUID of the variable to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/deployments_config/environments/{environment_uuid}/variables/{variable_uuid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines

**List pipelines**

Find pipelines in a repository.

Note that unlike other endpoints in the Bitbucket API, this endpoint utilizes query parameters to allow filtering
and sorting of returned results. See [query parameters](#api-repositories-workspace-repo-slug-pipelines-get-request-Query%20parameters)
for specific details.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `creator.uuid` | query | string | No | The UUID of the creator of the pipeline to filter  |
| `target.ref_type` | query | string | No | The type of the reference to filter by. |
| `target.ref_name` | query | string | No | The reference name to filter by. |
| `target.branch` | query | string | No | The name of the branch to filter by. |
| `target.commit.hash` | query | string | No | The revision to filter by. |
| `target.selector.pattern` | query | string | No | The pipeline pattern to filter by. |
| `target.selector.type` | query | string | No | The type of pipeline to filter by. |
| `created_on` | query | string | No | The creation date to filter by. |
| `trigger_type` | query | string | No | The trigger type to filter by. |
| `status` | query | string | No | The pipeline status to filter by. |
| `sort` | query | string | No | The attribute name to sort on. |
| `page` | query | string | No | The page number of elements to retrieve. |
| `pagelen` | query | string | No | The maximum number of results to return. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines"
```

---

## POST /repositories/{workspace}/{repo_slug}/pipelines

**Run a pipeline**

Endpoint to create and initiate a pipeline.
There are a couple of different options to initiate a pipeline, where the payload of the request will determine which type of pipeline will be instantiated.
# Trigger a Pipeline for a branch
One way to trigger pipelines is by specifying the branch for which you want to trigger a pipeline.
The specified branch will be used to determine which pipeline definition from the `bitbucket-pipelines.yml` file will be applied to initiate the pipeline. The pipeline will then do a clone of the repository and checkout the latest revision of the specified branch.

### Example

```
$ curl -X POST -is -u username:password \
  -H 'Content-Type: application/json' \
 https://api.bitbucket.org/2.0/repositories/jeroendr/meat-demo2/pipelines/ \
  -d '
  {
    "target": {
      "ref_type": "branch",
      "type": "pipeline_ref_target",
      "ref_name": "master"
    }
  }'
```
# Trigger a Pipeline for a commit on a branch or tag
You can initiate a pipeline for a specific commit and in the context of a specified reference (e.g. a branch, tag or bookmark).
The specified reference will be used to determine which pipeline definition from the bitbucket-pipelines.yml file will be applied to initiate the pipeline. The pipeline will clone the repository and then do a checkout the specified reference.

The following reference types are supported:

* `branch`
* `named_branch`
* `bookmark`
 * `tag`

### Example

```
$ curl -X POST -is -u username:password \
  -H 'Content-Type: application/json' \
  https://api.bitbucket.org/2.0/repositories/jeroendr/meat-demo2/pipelines/ \
  -d '
  {
    "target": {
      "commit": {
        "type": "commit",
        "hash": "ce5b7431602f7cbba007062eeb55225c6e18e956"
      },
      "ref_type": "branch",
      "type": "pipeline_ref_target",
      "ref_name": "master"
    }
  }'
```
# Trigger a specific pipeline definition for a commit
You can trigger a specific pipeline that is defined in your `bitbucket-pipelines.yml` file for a specific commit.
In addition to the commit revision, you specify the type and pattern of the selector that identifies the pipeline definition. The resulting pipeline will then clone the repository and checkout the specified revision.

### Example

```
$ curl -X POST -is -u username:password \
  -H 'Content-Type: application/json' \
 https://api.bitbucket.org/2.0/repositories/jeroendr/meat-demo2/pipelines/ \
 -d '
  {
     "target": {
      "commit": {
         "hash":"a3c4e02c9a3755eccdc3764e6ea13facdf30f923",
         "type":"commit"
       },
        "selector": {
           "type":"custom",
              "pattern":"Deploy to production"
          },
        "type":"pipeline_commit_target"
   }
  }'
```
# Trigger a specific pipeline definition for a commit on a branch or tag
You can trigger a specific pipeline that is defined in your `bitbucket-pipelines.yml` file for a specific commit in the context of a specified reference.
In addition to the commit revision, you specify the type and pattern of the selector that identifies the pipeline definition, as well as the reference information. The resulting pipeline will then clone the repository a checkout the specified reference.

### Example

```
$ curl -X POST -is -u username:password \
  -H 'Content-Type: application/json' \
 https://api.bitbucket.org/2.0/repositories/jeroendr/meat-demo2/pipelines/ \
 -d '
  {
     "target": {
      "commit": {
         "hash":"a3c4e02c9a3755eccdc3764e6ea13facdf30f923",
         "type":"commit"
       },
       "selector": {
          "type": "custom",
          "pattern": "Deploy to production"
       },
       "type": "pipeline_ref_target",
       "ref_name": "master",
       "ref_type": "branch"
     }
  }'
```


# Trigger a custom pipeline with variables
In addition to triggering a custom pipeline that is defined in your `bitbucket-pipelines.yml` file as shown in the examples above, you can specify variables that will be available for your build. In the request, provide a list of variables, specifying the following for each variable: key, value, and whether it should be secured or not (this field is optional and defaults to not secured).

### Example

```
$ curl -X POST -is -u username:password \
  -H 'Content-Type: application/json' \
 https://api.bitbucket.org/2.0/repositories/{workspace}/{repo_slug}/pipelines/ \
 -d '
  {
    "target": {
      "type": "pipeline_ref_target",
      "ref_type": "branch",
      "ref_name": "master",
      "selector": {
        "type": "custom",
        "pattern": "Deploy to production"
      }
    },
    "variables": [
      {
        "key": "var1key",
        "value": "var1value",
        "secured": true
      },
      {
        "key": "var2key",
        "value": "var2value"
      }
    ]
  }'
```

# Trigger a pull request pipeline

You can also initiate a pipeline for a specific pull request.

### Example

```
$ curl -X POST -is -u username:password \
  -H 'Content-Type: application/json' \
 https://api.bitbucket.org/2.0/repositories/{workspace}/{repo_slug}/pipelines/ \
 -d '
  {
    "target": {
      "type": "pipeline_pullrequest_target",
      "source": "pull-request-branch",
      "destination": "master",
      "destination_commit": {
        "hash": "9f848b7"
      },
      "commit": {
        "hash": "1a372fc"
      },
      "pullrequest": {
        "id": "3"
      },
      "selector": {
        "type": "pull-requests",
        "pattern": "**"
      }
    }
  }'
```


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `_body` | body | string | Yes | The pipeline to initiate. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines-config/caches

**List caches**

Retrieve the repository pipelines caches.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The account. |
| `repo_slug` | path | string | Yes | The repository. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines-config/caches"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pipelines-config/caches

**Delete caches**

Delete repository cache versions by name.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The account. |
| `repo_slug` | path | string | Yes | The repository. |
| `name` | query | string | Yes | The cache name. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines-config/caches"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pipelines-config/caches/{cache_uuid}

**Delete a cache**

Delete a repository cache.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The account. |
| `repo_slug` | path | string | Yes | The repository. |
| `cache_uuid` | path | string | Yes | The UUID of the cache to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines-config/caches/{cache_uuid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines-config/caches/{cache_uuid}/content-uri

**Get cache content URI**

Retrieve the URI of the content of the specified cache.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The account. |
| `repo_slug` | path | string | Yes | The repository. |
| `cache_uuid` | path | string | Yes | The UUID of the cache. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines-config/caches/{cache_uuid}/content-uri"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}

**Get a pipeline**

Retrieve a specified pipeline

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `pipeline_uuid` | path | string | Yes | The pipeline UUID. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps

**List steps for a pipeline**

Find steps for the given pipeline.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `pipeline_uuid` | path | string | Yes | The UUID of the pipeline. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}

**Get a step of a pipeline**

Retrieve a given step of a pipeline.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `pipeline_uuid` | path | string | Yes | The UUID of the pipeline. |
| `step_uuid` | path | string | Yes | The UUID of the step. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/log

**Get log file for a step**

Retrieve the log file for a given step of a pipeline.

This endpoint supports (and encourages!) the use of [HTTP Range requests](https://tools.ietf.org/html/rfc7233) to deal with potentially very large log files.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `pipeline_uuid` | path | string | Yes | The UUID of the pipeline. |
| `step_uuid` | path | string | Yes | The UUID of the step. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/log"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/logs/{log_uuid}

**Get the logs for the build container or a service container for a given step of a pipeline.**

Retrieve the log file for a build container or service container.

This endpoint supports (and encourages!) the use of [HTTP Range requests](https://tools.ietf.org/html/rfc7233) to deal with potentially very large log files.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `pipeline_uuid` | path | string | Yes | The UUID of the pipeline. |
| `step_uuid` | path | string | Yes | The UUID of the step. |
| `log_uuid` | path | string | Yes | For the main build container specify the step UUID |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/logs/{log_uuid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/test_reports

**Get a summary of test reports for a given step of a pipeline.**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `pipeline_uuid` | path | string | Yes | The UUID of the pipeline. |
| `step_uuid` | path | string | Yes | The UUID of the step. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/test_reports"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/test_reports/test_cases

**Get test cases for a given step of a pipeline.**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `pipeline_uuid` | path | string | Yes | The UUID of the pipeline. |
| `step_uuid` | path | string | Yes | The UUID of the step. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/test_reports/test_cases"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/test_reports/test_cases/{test_case_uuid}/test_case_reasons

**Get test case reasons (output) for a given test case in a step of a pipeline.**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `pipeline_uuid` | path | string | Yes | The UUID of the pipeline. |
| `step_uuid` | path | string | Yes | The UUID of the step. |
| `test_case_uuid` | path | string | Yes | The UUID of the test case. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/steps/{step_uuid}/test_reports/test_cases/{test_case_uuid}/test_case_reasons"
```

---

## POST /repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/stopPipeline

**Stop a pipeline**

Signal the stop of a pipeline and all of its steps that not have completed yet.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `pipeline_uuid` | path | string | Yes | The UUID of the pipeline. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines/{pipeline_uuid}/stopPipeline"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines_config

**Get configuration**

Retrieve the repository pipelines configuration.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | The account. |
| `repo_slug` | path | string | Yes | The repository. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pipelines_config

**Update configuration**

Update the pipelines configuration for a repository.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `_body` | body | string | Yes | The updated repository pipelines configuration. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pipelines_config/build_number

**Update the next build number**

Update the next build number that should be assigned to a pipeline. The next build number that will be configured has to be strictly higher than the current latest build number for this repository.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `_body` | body | string | Yes | The build number to update. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/build_number"
```

---

## POST /repositories/{workspace}/{repo_slug}/pipelines_config/schedules

**Create a schedule**

Create a schedule for the given repository.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `_body` | body | string | Yes | The schedule to create. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/schedules"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines_config/schedules

**List schedules**

Retrieve the configured schedules for the given repository.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/schedules"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines_config/schedules/{schedule_uuid}

**Get a schedule**

Retrieve a schedule by its UUID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `schedule_uuid` | path | string | Yes | The uuid of the schedule. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/schedules/{schedule_uuid}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pipelines_config/schedules/{schedule_uuid}

**Update a schedule**

Update a schedule.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `schedule_uuid` | path | string | Yes | The uuid of the schedule. |
| `_body` | body | string | Yes | The schedule to update. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/schedules/{schedule_uuid}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pipelines_config/schedules/{schedule_uuid}

**Delete a schedule**

Delete a schedule.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `schedule_uuid` | path | string | Yes | The uuid of the schedule. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/schedules/{schedule_uuid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines_config/schedules/{schedule_uuid}/executions

**List executions of a schedule**

Retrieve the executions of a given schedule.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `schedule_uuid` | path | string | Yes | The uuid of the schedule. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/schedules/{schedule_uuid}/executions"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines_config/ssh/key_pair

**Get SSH key pair**

Retrieve the repository SSH key pair excluding the SSH private key. The private key is a write only field and will never be exposed in the logs or the REST API.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/ssh/key_pair"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pipelines_config/ssh/key_pair

**Update SSH key pair**

Create or update the repository SSH key pair. The private key will be set as a default SSH identity in your build container.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `_body` | body | string | Yes | The created or updated SSH key pair. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/ssh/key_pair"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pipelines_config/ssh/key_pair

**Delete SSH key pair**

Delete the repository SSH key pair.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/ssh/key_pair"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts

**List known hosts**

Find repository level known hosts.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts"
```

---

## POST /repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts

**Create a known host**

Create a repository level known host.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `_body` | body | string | Yes | The known host to create. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts/{known_host_uuid}

**Get a known host**

Retrieve a repository level known host.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `known_host_uuid` | path | string | Yes | The UUID of the known host to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts/{known_host_uuid}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts/{known_host_uuid}

**Update a known host**

Update a repository level known host.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `known_host_uuid` | path | string | Yes | The UUID of the known host to update. |
| `_body` | body | string | Yes | The updated known host. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts/{known_host_uuid}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts/{known_host_uuid}

**Delete a known host**

Delete a repository level known host.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `known_host_uuid` | path | string | Yes | The UUID of the known host to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/ssh/known_hosts/{known_host_uuid}"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines_config/variables

**List variables for a repository**

Find repository level variables.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/variables"
```

---

## POST /repositories/{workspace}/{repo_slug}/pipelines_config/variables

**Create a variable for a repository**

Create a repository level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `_body` | body | string | Yes | The variable to create. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/variables"
```

---

## GET /repositories/{workspace}/{repo_slug}/pipelines_config/variables/{variable_uuid}

**Get a variable for a repository**

Retrieve a repository level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `variable_uuid` | path | string | Yes | The UUID of the variable to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/variables/{variable_uuid}"
```

---

## PUT /repositories/{workspace}/{repo_slug}/pipelines_config/variables/{variable_uuid}

**Update a variable for a repository**

Update a repository level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `variable_uuid` | path | string | Yes | The UUID of the variable to update. |
| `_body` | body | string | Yes | The updated variable |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/variables/{variable_uuid}"
```

---

## DELETE /repositories/{workspace}/{repo_slug}/pipelines_config/variables/{variable_uuid}

**Delete a variable for a repository**

Delete a repository level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `repo_slug` | path | string | Yes | The repository. |
| `variable_uuid` | path | string | Yes | The UUID of the variable to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/repositories/{workspace}/{repo_slug}/pipelines_config/variables/{variable_uuid}"
```

---

## GET /teams/{username}/pipelines_config/variables

**List variables for an account**

Find account level variables.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `username` | path | string | Yes | The account. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/teams/{username}/pipelines_config/variables"
```

---

## POST /teams/{username}/pipelines_config/variables

**Create a variable for a user**

Create an account level variable.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `username` | path | string | Yes | The account. |
| `_body` | body | string | No | The variable to create. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/teams/{username}/pipelines_config/variables"
```

---

## GET /teams/{username}/pipelines_config/variables/{variable_uuid}

**Get a variable for a team**

Retrieve a team level variable.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `username` | path | string | Yes | The account. |
| `variable_uuid` | path | string | Yes | The UUID of the variable to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/teams/{username}/pipelines_config/variables/{variable_uuid}"
```

---

## PUT /teams/{username}/pipelines_config/variables/{variable_uuid}

**Update a variable for a team**

Update a team level variable.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `username` | path | string | Yes | The account. |
| `variable_uuid` | path | string | Yes | The UUID of the variable. |
| `_body` | body | string | Yes | The updated variable. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/teams/{username}/pipelines_config/variables/{variable_uuid}"
```

---

## DELETE /teams/{username}/pipelines_config/variables/{variable_uuid}

**Delete a variable for a team**

Delete a team level variable.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `username` | path | string | Yes | The account. |
| `variable_uuid` | path | string | Yes | The UUID of the variable to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/teams/{username}/pipelines_config/variables/{variable_uuid}"
```

---

## GET /users/{selected_user}/pipelines_config/variables

**List variables for a user**

Find user level variables.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `selected_user` | path | string | Yes | Either the UUID of the account surrounded by curly |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/pipelines_config/variables"
```

---

## POST /users/{selected_user}/pipelines_config/variables

**Create a variable for a user**

Create a user level variable.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `selected_user` | path | string | Yes | Either the UUID of the account surrounded by curly |
| `_body` | body | string | No | The variable to create. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/pipelines_config/variables"
```

---

## GET /users/{selected_user}/pipelines_config/variables/{variable_uuid}

**Get a variable for a user**

Retrieve a user level variable.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `selected_user` | path | string | Yes | Either the UUID of the account surrounded by curly |
| `variable_uuid` | path | string | Yes | The UUID of the variable to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/pipelines_config/variables/{variable_uuid}"
```

---

## PUT /users/{selected_user}/pipelines_config/variables/{variable_uuid}

**Update a variable for a user**

Update a user level variable.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `selected_user` | path | string | Yes | Either the UUID of the account surrounded by curly |
| `variable_uuid` | path | string | Yes | The UUID of the variable. |
| `_body` | body | string | Yes | The updated variable. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/pipelines_config/variables/{variable_uuid}"
```

---

## DELETE /users/{selected_user}/pipelines_config/variables/{variable_uuid}

**Delete a variable for a user**

Delete an account level variable.
This endpoint has been deprecated, and you should use the new workspaces endpoint. For more information, see [the announcement](https://developer.atlassian.com/cloud/bitbucket/bitbucket-api-teams-deprecation/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `selected_user` | path | string | Yes | Either the UUID of the account surrounded by curly |
| `variable_uuid` | path | string | Yes | The UUID of the variable to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/users/{selected_user}/pipelines_config/variables/{variable_uuid}"
```

---

## GET /workspaces/{workspace}/pipelines-config/identity/oidc/.well-known/openid-configuration

**Get OpenID configuration for OIDC in Pipelines**

This is part of OpenID Connect for Pipelines, see https://support.atlassian.com/bitbucket-cloud/docs/integrate-pipelines-with-resource-servers-using-oidc/

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/pipelines-config/identity/oidc/.well-known/openid-configuration"
```

---

## GET /workspaces/{workspace}/pipelines-config/identity/oidc/keys.json

**Get keys for OIDC in Pipelines**

This is part of OpenID Connect for Pipelines, see https://support.atlassian.com/bitbucket-cloud/docs/integrate-pipelines-with-resource-servers-using-oidc/

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/pipelines-config/identity/oidc/keys.json"
```

---

## GET /workspaces/{workspace}/pipelines-config/variables

**List variables for a workspace**

Find workspace level variables.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/pipelines-config/variables"
```

---

## POST /workspaces/{workspace}/pipelines-config/variables

**Create a variable for a workspace**

Create a workspace level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `_body` | body | string | No | The variable to create. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/pipelines-config/variables"
```

---

## GET /workspaces/{workspace}/pipelines-config/variables/{variable_uuid}

**Get variable for a workspace**

Retrieve a workspace level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `variable_uuid` | path | string | Yes | The UUID of the variable to retrieve. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/pipelines-config/variables/{variable_uuid}"
```

---

## PUT /workspaces/{workspace}/pipelines-config/variables/{variable_uuid}

**Update variable for a workspace**

Update a workspace level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `variable_uuid` | path | string | Yes | The UUID of the variable. |
| `_body` | body | string | Yes | The updated variable. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/pipelines-config/variables/{variable_uuid}"
```

---

## DELETE /workspaces/{workspace}/pipelines-config/variables/{variable_uuid}

**Delete a variable for a workspace**

Delete a workspace level variable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `workspace` | path | string | Yes | This can either be the workspace ID (slug) or the  |
| `variable_uuid` | path | string | Yes | The UUID of the variable to delete. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "/workspaces/{workspace}/pipelines-config/variables/{variable_uuid}"
```

---
