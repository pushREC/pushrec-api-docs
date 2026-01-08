---
created: 2026-01-08
tags: [type/api-reference, api/deployments]
api_name: Vercel API
category: deployments
endpoint_count: 10
---

# Vercel API - Deployments

[[README|Back to Overview]]

---

## GET /v3/deployments/{idOrUrl}/events

**Get deployment events**

Get the build logs of a deployment by deployment ID and build ID. It can work as an infinite stream of logs or as a JSON endpoint depending on the input parameters.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrUrl` | path | string | Yes | The unique identifier or hostname of the deploymen |
| `direction` | query | string | No | Order of the returned events based on the timestam |
| `follow` | query | number | No | When enabled, this endpoint will return live event |
| `limit` | query | number | No | Maximum number of events to return. Provide `-1` t |
| `name` | query | string | No | Deployment build ID. |
| `since` | query | number | No | Timestamp for when build logs should be pulled fro |
| `until` | query | number | No | Timestamp for when the build logs should be pulled |
| `statusCode` | query | string | No | HTTP status code range to filter events by. |
| `delimiter` | query | number | No |  |
| `builds` | query | number | No |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v3/deployments/{idOrUrl}/events"
```

---

## PATCH /v1/deployments/{deploymentId}/integrations/{integrationConfigurationId}/resources/{resourceId}/actions/{action}

**Update deployment integration action**

Updates the deployment integration action for the specified integration installation

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploymentId` | path | string | Yes |  |
| `integrationConfigurationId` | path | string | Yes |  |
| `resourceId` | path | string | Yes |  |
| `action` | path | string | Yes |  |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/deployments/{deploymentId}/integrations/{integrationConfigurationId}/resources/{resourceId}/actions/{action}"
```

---

## GET /v13/deployments/{idOrUrl}

**Get a deployment by ID or URL**

Retrieves information for a deployment either by supplying its ID (`id` property) or Hostname (`url` property). Additional details will be included when the authenticated user or team is an owner of the deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrUrl` | path | string | Yes | The unique identifier or hostname of the deploymen |
| `withGitRepoInfo` | query | string | No | Whether to add in gitRepo information. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v13/deployments/{idOrUrl}"
```

---

## POST /v13/deployments

**Create a new deployment**

Create a new deployment with all the required and intended data. If the deployment is not a git deployment, all files must be provided with the request, either referenced or inlined. Additionally, a deployment id can be specified to redeploy a previous deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `forceNew` | query | string | No | Forces a new deployment even if there is a previou |
| `skipAutoDetectionConfirmation` | query | string | No | Allows to skip framework detection so the API woul |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v13/deployments"
```

---

## PATCH /v12/deployments/{id}/cancel

**Cancel a deployment**

This endpoint allows you to cancel a deployment which is currently building, by supplying its `id` in the URL.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The unique identifier of the deployment. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v12/deployments/{id}/cancel"
```

---

## POST /v2/files

**Upload Deployment Files**

Before you create a deployment you need to upload the required files for that deployment. To do it, you need to first upload each file to this endpoint. Once that's completed, you can create a new deployment with the uploaded files. The file content must be placed inside the body of the request. In the case of a successful response you'll receive a status code 200 with an empty body.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `Content-Length` | header | number | No | The file size in bytes |
| `x-vercel-digest` | header | string | No | The file SHA1 used to check the integrity |
| `x-now-digest` | header | string | No | The file SHA1 used to check the integrity |
| `x-now-size` | header | number | No | The file size as an alternative to `Content-Length |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/files"
```

---

## GET /v6/deployments/{id}/files

**List Deployment Files**

Allows to retrieve the file structure of the source code of a deployment by supplying the deployment unique identifier. If the deployment was created with the Vercel CLI or the API directly with the `files` key, it will have a file tree that can be retrievable.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The unique deployment identifier |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v6/deployments/{id}/files"
```

---

## GET /v8/deployments/{id}/files/{fileId}

**Get Deployment File Contents**

Allows to retrieve the content of a file by supplying the file identifier and the deployment unique identifier. The response body will contain a JSON response containing the contents of the file encoded as base64.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The unique deployment identifier |
| `fileId` | path | string | Yes | The unique file identifier |
| `path` | query | string | No | Path to the file to fetch (only for Git deployment |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v8/deployments/{id}/files/{fileId}"
```

---

## GET /v6/deployments

**List deployments**

List deployments under the authenticated user or team. If a deployment hasn't finished uploading (is incomplete), the `url` property will have a value of `null`.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `app` | query | string | No | Name of the deployment. |
| `from` | query | number | No | Gets the deployment created after this Date timest |
| `limit` | query | number | No | Maximum number of deployments to list from a reque |
| `projectId` | query | string | No | Filter deployments from the given ID or name. |
| `projectIds` | query | array | No | Filter deployments from the given project IDs. Can |
| `target` | query | string | No | Filter deployments based on the environment. |
| `to` | query | number | No | Gets the deployment created before this Date times |
| `users` | query | string | No | Filter out deployments based on users who have cre |
| `since` | query | number | No | Get Deployments created after this JavaScript time |
| `until` | query | number | No | Get Deployments created before this JavaScript tim |
| `state` | query | string | No | Filter deployments based on their state (`BUILDING |
| `rollbackCandidate` | query | boolean | No | Filter deployments based on their rollback candida |
| `branch` | query | string | No | Filter deployments based on the branch name |
| `sha` | query | string | No | Filter deployments based on the SHA |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v6/deployments"
```

---

## DELETE /v13/deployments/{id}

**Delete a Deployment**

This API allows you to delete a deployment, either by supplying its `id` in the URL or the `url` of the deployment as a query parameter. You can obtain the ID, for example, by listing all deployments.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the deployment to be deleted |
| `url` | query | string | No | A Deployment or Alias URL. In case it is passed, t |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v13/deployments/{id}"
```

---
