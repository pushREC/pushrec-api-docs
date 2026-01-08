---
created: 2026-01-08
tags: [type/api-reference, api/apps]
api_name: DigitalOcean API
category: Apps
endpoint_count: 33
---

# DigitalOcean API - Apps

[[README|Back to Overview]]

---

## GET /v2/apps

**List All Apps**

List all apps on your account. Information about the current active deployment as well as any in progress ones will also be included for each app.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps"
```

---

## POST /v2/apps

**Create a New App**

Create a new app by submitting an app specification. For documentation on app specifications (`AppSpec` objects), please refer to [the product documentation](https://docs.digitalocean.com/products/app-platform/reference/app-spec/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps"
```

---

## DELETE /v2/apps/{id}

**Delete an App**

Delete an existing app. Once deleted, all active deployments will be permanently shut down and the app deleted. If needed, be sure to back up your app specification so that you may re-create it at a later time.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{id}"
```

---

## GET /v2/apps/{id}

**Retrieve an Existing App**

Retrieve details about an existing app by either its ID or name. To retrieve an app by its name, do not include an ID in the request path. Information about the current active deployment as well as any in progress ones will also be included in the response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{id}"
```

---

## PUT /v2/apps/{id}

**Update an App**

Update an existing app by submitting a new app specification. For documentation on app specifications (`AppSpec` objects), please refer to [the product documentation](https://docs.digitalocean.com/products/app-platform/reference/app-spec/).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{id}"
```

---

## POST /v2/apps/{app_id}/restart

**Restart an App**

Perform a rolling restart of all or specific components in an app.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/restart"
```

---

## GET /v2/apps/{app_id}/components/{component_name}/logs

**Retrieve Active Deployment Logs**

Retrieve the logs of the active deployment if one exists. The response will include links to either real-time logs of an in-progress or active deployment or archived logs of a past deployment. Note log_type=BUILD logs will return logs associated with the current active deployment (being served). To view build logs associated with in-progress build, the query must explicitly reference the deployment id.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/components/{component_name}/logs"
```

---

## GET /v2/apps/{app_id}/components/{component_name}/exec

**Retrieve Exec URL**

Returns a websocket URL that allows sending/receiving console input and output to a component of the active deployment if one exists.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/components/{component_name}/exec"
```

---

## GET /v2/apps/{app_id}/instances

**Retrieve App Instances**

Retrieve the list of running instances for a given application, including instance names and component types. Please note that these instances are ephemeral and may change over time. It is recommended not to make persistent changes or develop scripts that rely on their persistence.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/instances"
```

---

## GET /v2/apps/{app_id}/deployments

**List App Deployments**

List all deployments of an app.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `deployment_types` | query | array | No | Optional. Filter deployments by deployment_type
   |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/deployments"
```

---

## POST /v2/apps/{app_id}/deployments

**Create an App Deployment**

Creating an app deployment will pull the latest changes from your repository and schedule a new deployment for your app.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/deployments"
```

---

## GET /v2/apps/{app_id}/deployments/{deployment_id}

**Retrieve an App Deployment**

Retrieve information about an app deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}"
```

---

## POST /v2/apps/{app_id}/deployments/{deployment_id}/cancel

**Cancel a Deployment**

Immediately cancel an in-progress deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}/cancel"
```

---

## GET /v2/apps/{app_id}/deployments/{deployment_id}/components/{component_name}/logs

**Retrieve Deployment Logs**

Retrieve the logs of a past, in-progress, or active deployment. The response will include links to either real-time logs of an in-progress or active deployment or archived logs of a past deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}/components/{component_name}/logs"
```

---

## GET /v2/apps/{app_id}/deployments/{deployment_id}/logs

**Retrieve Aggregate Deployment Logs**

Retrieve the logs of a past, in-progress, or active deployment. If a component name is specified, the logs will be limited to only that component. The response will include links to either real-time logs of an in-progress or active deployment or archived logs of a past deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}/logs"
```

---

## GET /v2/apps/{app_id}/deployments/{deployment_id}/components/{component_name}/exec

**Retrieve Exec URL for Deployment**

Returns a websocket URL that allows sending/receiving console input and output to a component of the specified deployment if one exists. Optionally, the instance_name parameter can be provided to retrieve the exec URL for a specific instance. Note that instances are ephemeral; therefore, we recommended to avoid making persistent changes or such scripting around them.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/deployments/{deployment_id}/components/{component_name}/exec"
```

---

## GET /v2/apps/{app_id}/logs

**Retrieve Active Deployment Aggregate Logs**

Retrieve the logs of the active deployment if one exists. The response will include links to either real-time logs of an in-progress or active deployment or archived logs of a past deployment. Note log_type=BUILD logs will return logs associated with the current active deployment (being served). To view build logs associated with in-progress build, the query must explicitly reference the deployment id.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/logs"
```

---

## GET /v2/apps/{app_id}/job-invocations

**List Job Invocations**

List all job invocations for an app.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `deployment_id` | query | string | No | The deployment ID |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/job-invocations"
```

---

## GET /v2/apps/{app_id}/job-invocations/{job_invocation_id}

**Get Job Invocations**

Get a specific job invocation for an app.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/job-invocations/{job_invocation_id}"
```

---

## GET /v2/apps/{app_id}/jobs/{job_name}/invocations/{job_invocation_id}/logs

**Retrieve Job Invocation Logs**

Retrieve the logs of a past, in-progress, or active deployment. If a component name is specified, the logs will be limited to only that component. If deployment is omitted the active deployment will be selected (if available). The response will include links to either real-time logs of an in-progress or active deployment or archived logs of a past deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `job_name` | path | string | Yes | The job name to list job invocations for. |
| `` | query | string | No |  |
| `deployment_id` | query | string | No | The deployment ID |
| `` | query | string | No |  |
| `type` | query | string | Yes | The type of logs to retrieve |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/jobs/{job_name}/invocations/{job_invocation_id}/logs"
```

---

## GET /v2/apps/tiers/instance_sizes

**List Instance Sizes**

List all instance sizes for `service`, `worker`, and `job` components.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/tiers/instance_sizes"
```

---

## GET /v2/apps/tiers/instance_sizes/{slug}

**Retrieve an Instance Size**

Retrieve information about a specific instance size for `service`, `worker`, and `job` components.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/tiers/instance_sizes/{slug}"
```

---

## GET /v2/apps/regions

**List App Regions**

List all regions supported by App Platform.

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/regions"
```

---

## POST /v2/apps/propose

**Propose an App Spec**

To propose and validate a spec for a new or existing app, send a POST request to the `/v2/apps/propose` endpoint. The request returns some information about the proposed app, including app cost and upgrade cost. If an existing app ID is specified, the app spec is treated as a proposed update to the existing app.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/propose"
```

---

## GET /v2/apps/{app_id}/alerts

**List all app alerts**

List alerts associated to the app and any components. This includes configuration information about the alerts including emails, slack webhooks, and triggering events or conditions.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/alerts"
```

---

## POST /v2/apps/{app_id}/alerts/{alert_id}/destinations

**Update destinations for alerts**

Updates the emails and slack webhook destinations for app alerts. Emails must be associated to a user with access to the app.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/alerts/{alert_id}/destinations"
```

---

## POST /v2/apps/{app_id}/rollback

**Rollback App**

Rollback an app to a previous deployment. A new deployment will be created to perform the rollback.
The app will be pinned to the rollback deployment preventing any new deployments from being created,
either manually or through Auto Deploy on Push webhooks. To resume deployments, the rollback must be
either committed or reverted.

It is recommended to use the Validate App Rollback endpoint to double check if the rollback is
valid and if there are any warnings.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/rollback"
```

---

## POST /v2/apps/{app_id}/rollback/validate

**Validate App Rollback**

Check whether an app can be rolled back to a specific deployment. This endpoint can also be used
to check if there are any warnings or validation conditions that will cause the rollback to proceed
under unideal circumstances. For example, if a component must be rebuilt as part of the rollback
causing it to take longer than usual.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/rollback/validate"
```

---

## POST /v2/apps/{app_id}/rollback/commit

**Commit App Rollback**

Commit an app rollback. This action permanently applies the rollback and unpins the app to resume new deployments.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/rollback/commit"
```

---

## POST /v2/apps/{app_id}/rollback/revert

**Revert App Rollback**

Revert an app rollback. This action reverts the active rollback by creating a new deployment from the
latest app spec prior to the rollback and unpins the app to resume new deployments.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/rollback/revert"
```

---

## GET /v2/apps/{app_id}/metrics/bandwidth_daily

**Retrieve App Daily Bandwidth Metrics**

Retrieve daily bandwidth usage metrics for a single app.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `date` | query | string | No | Optional day to query. Only the date component of  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/metrics/bandwidth_daily"
```

---

## POST /v2/apps/metrics/bandwidth_daily

**Retrieve Multiple Apps' Daily Bandwidth Metrics**

Retrieve daily bandwidth usage metrics for multiple apps.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/metrics/bandwidth_daily"
```

---

## GET /v2/apps/{app_id}/health

**Retrieve App Health**

Retrieve information like health status, cpu and memory utilization of app components.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.digitalocean.com/v2/apps/{app_id}/health"
```

---
