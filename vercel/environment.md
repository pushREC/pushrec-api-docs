---
created: 2026-01-08
tags: [type/api-reference, api/environment]
api_name: Vercel API
category: environment
endpoint_count: 11
---

# Vercel API - Environment

[[README|Back to Overview]]

---

## POST /v1/env

**Create one or more shared environment variables**

Creates shared environment variable(s) for a team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/env"
```

---

## GET /v1/env

**Lists all Shared Environment Variables for a team**

Lists all Shared Environment Variables for a team, taking into account optional filters.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `search` | query | string | No |  |
| `projectId` | query | string | No | Filter SharedEnvVariables that belong to a project |
| `ids` | query | string | No | Filter SharedEnvVariables based on comma separated |
| `exclude_ids` | query | string | No | Filter SharedEnvVariables based on comma separated |
| `exclude-ids` | query | string | No | Filter SharedEnvVariables based on comma separated |
| `exclude_projectId` | query | string | No | Filter SharedEnvVariables that belong to a project |
| `exclude-projectId` | query | string | No | Filter SharedEnvVariables that belong to a project |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/env"
```

---

## PATCH /v1/env

**Updates one or more shared environment variables**

Updates a given Shared Environment Variable for a Team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/env"
```

---

## DELETE /v1/env

**Delete one or more Env Var**

Deletes one or many Shared Environment Variables for a given team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/env"
```

---

## GET /v1/env/{id}

**Retrieve the decrypted value of a Shared Environment Variable by id.**

Retrieve the decrypted value of a Shared Environment Variable by id.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The unique ID for the Shared Environment Variable  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/env/{id}"
```

---

## PATCH /v1/env/{id}/unlink/{projectId}

**Disconnects a shared environment variable for a given project**

Disconnects a shared environment variable for a given project

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The unique ID for the Shared Environment Variable  |
| `projectId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/env/{id}/unlink/{projectId}"
```

---

## POST /v9/projects/{idOrName}/custom-environments

**Create a custom environment for the current project.**

Creates a custom environment for the current project. Cannot be named 'Production' or 'Preview'.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/custom-environments"
```

---

## GET /v9/projects/{idOrName}/custom-environments

**Retrieve custom environments**

Retrieve custom environments for the project. Must not be named 'Production' or 'Preview'.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `gitBranch` | query | string | No | Fetch custom environments for a specific git branc |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/custom-environments"
```

---

## GET /v9/projects/{idOrName}/custom-environments/{environmentSlugOrId}

**Retrieve a custom environment**

Retrieve a custom environment for the project. Must not be named 'Production' or 'Preview'.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `environmentSlugOrId` | path | string | Yes | The unique custom environment identifier within th |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/custom-environments/{environmentSlugOrId}"
```

---

## PATCH /v9/projects/{idOrName}/custom-environments/{environmentSlugOrId}

**Update a custom environment**

Update a custom environment for the project. Must not be named 'Production' or 'Preview'.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `environmentSlugOrId` | path | string | Yes | The unique custom environment identifier within th |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/custom-environments/{environmentSlugOrId}"
```

---

## DELETE /v9/projects/{idOrName}/custom-environments/{environmentSlugOrId}

**Remove a custom environment**

Remove a custom environment for the project. Must not be named 'Production' or 'Preview'.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `idOrName` | path | string | Yes | The unique project identifier or the project name |
| `environmentSlugOrId` | path | string | Yes | The unique custom environment identifier within th |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v9/projects/{idOrName}/custom-environments/{environmentSlugOrId}"
```

---
