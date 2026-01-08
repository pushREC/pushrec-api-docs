---
created: 2026-01-08
tags: [type/api-reference, api/bulk-redirects]
api_name: Vercel API
category: bulk-redirects
endpoint_count: 7
---

# Vercel API - Bulk-Redirects

[[README|Back to Overview]]

---

## PUT /v1/bulk-redirects

**Stages new redirects for a project.**

Stages new redirects for a project and returns the new version.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/bulk-redirects"
```

---

## GET /v1/bulk-redirects

**Gets project-level redirects.**

Get the version history for a project's bulk redirects

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `versionId` | query | string | No |  |
| `q` | query | string | No |  |
| `diff` | query | string | No |  |
| `page` | query | integer | No |  |
| `per_page` | query | integer | No |  |
| `sort_by` | query | string | No |  |
| `sort_order` | query | string | No |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/bulk-redirects"
```

---

## DELETE /v1/bulk-redirects

**Delete project-level redirects.**

Deletes the provided redirects from the latest version of the projects' bulk redirects. Stages a new change with the new redirects and returns the alias for the new version in the response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/bulk-redirects"
```

---

## PATCH /v1/bulk-redirects

**Edit a project-level redirect.**

Edits a single redirect identified by its source path. Stages a new change with the modified redirect and returns the alias for the new version in the response.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/bulk-redirects"
```

---

## POST /v1/bulk-redirects/restore

**Restore staged project-level redirects to their production version.**

Restores the provided redirects in the staging version to the value in the production version. If no production version exists, removes the redirects from staging.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/bulk-redirects/restore"
```

---

## GET /v1/bulk-redirects/versions

**Get the version history for a project's redirects.**

Get the version history for a project's bulk redirects

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/bulk-redirects/versions"
```

---

## POST /v1/bulk-redirects/versions

**Promote a staging version to production or restore a previous production version.**

Update a version by promoting staging to production or restoring a previous production version

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/bulk-redirects/versions"
```

---
