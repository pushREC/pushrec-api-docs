---
created: 2026-01-08
tags: [type/api-reference, api/checks]
api_name: Vercel API
category: checks
endpoint_count: 5
---

# Vercel API - Checks

[[README|Back to Overview]]

---

## POST /v1/deployments/{deploymentId}/checks

**Creates a new Check**

Creates a new check. This endpoint must be called with an OAuth2 or it will produce a 400 error.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploymentId` | path | string | Yes | The deployment to create the check for. |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/deployments/{deploymentId}/checks"
```

---

## GET /v1/deployments/{deploymentId}/checks

**Retrieve a list of all checks**

List all of the checks created for a deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploymentId` | path | string | Yes | The deployment to get all checks for |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/deployments/{deploymentId}/checks"
```

---

## GET /v1/deployments/{deploymentId}/checks/{checkId}

**Get a single check**

Return a detailed response for a single check.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploymentId` | path | string | Yes | The deployment to get the check for. |
| `checkId` | path | string | Yes | The check to fetch |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/deployments/{deploymentId}/checks/{checkId}"
```

---

## PATCH /v1/deployments/{deploymentId}/checks/{checkId}

**Update a check**

Update an existing check. This endpoint must be called with an OAuth2 or it will produce a 400 error.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploymentId` | path | string | Yes | The deployment to update the check for. |
| `checkId` | path | string | Yes | The check being updated |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/deployments/{deploymentId}/checks/{checkId}"
```

---

## POST /v1/deployments/{deploymentId}/checks/{checkId}/rerequest

**Rerequest a check**

Rerequest a selected check that has failed.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploymentId` | path | string | Yes | The deployment to rerun the check for. |
| `checkId` | path | string | Yes | The check to rerun |
| `autoUpdate` | query | boolean | No | Mark the check as running |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/deployments/{deploymentId}/checks/{checkId}/rerequest"
```

---
