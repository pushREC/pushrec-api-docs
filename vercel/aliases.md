---
created: 2026-01-08
tags: [type/api-reference, api/aliases]
api_name: Vercel API
category: aliases
endpoint_count: 6
---

# Vercel API - Aliases

[[README|Back to Overview]]

---

## GET /v2/deployments/{id}/aliases

**List Deployment Aliases**

Retrieves all Aliases for the Deployment with the given ID. The authenticated user or team must own the deployment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the deployment the aliases should be lis |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/deployments/{id}/aliases"
```

---

## POST /v2/deployments/{id}/aliases

**Assign an Alias**

Creates a new alias for the deployment with the given deployment ID. The authenticated user or team must own this deployment. If the desired alias is already assigned to another deployment, then it will be removed from the old deployment and assigned to the new one.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The ID of the deployment the aliases should be lis |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/deployments/{id}/aliases"
```

---

## GET /v4/aliases

**List aliases**

Retrieves a list of aliases for the authenticated User or Team. When `domain` is provided, only aliases for that domain will be returned. When `projectId` is provided, it will only return the given project aliases.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `domain` | query | string | No | Get only aliases of the given domain name |
| `from` | query | number | No | Get only aliases created after the provided timest |
| `limit` | query | number | No | Maximum number of aliases to list from a request |
| `projectId` | query | string | No | Filter aliases from the given `projectId` |
| `since` | query | number | No | Get aliases created after this JavaScript timestam |
| `until` | query | number | No | Get aliases created before this JavaScript timesta |
| `rollbackDeploymentId` | query | string | No | Get aliases that would be rolled back for the give |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v4/aliases"
```

---

## GET /v4/aliases/{idOrAlias}

**Get an Alias**

Retrieves an Alias for the given host name or alias ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `from` | query | number | No | Get the alias only if it was created after the pro |
| `idOrAlias` | path | string | Yes | The alias or alias ID to be retrieved |
| `projectId` | query | string | No | Get the alias only if it is assigned to the provid |
| `since` | query | number | No | Get the alias only if it was created after this Ja |
| `until` | query | number | No | Get the alias only if it was created before this J |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v4/aliases/{idOrAlias}"
```

---

## DELETE /v2/aliases/{aliasId}

**Delete an Alias**

Delete an Alias with the specified ID.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `aliasId` | path | string | Yes | The ID or alias that will be removed |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v2/aliases/{aliasId}"
```

---

## PATCH /aliases/{id}/protection-bypass

**Update the protection bypass for a URL**

Update the protection bypass for the alias or deployment URL (used for user access & comment access for deployments). Used as shareable links and user scoped access for Vercel Authentication and also to allow external (logged in) people to comment on previews for Preview Comments (next-live-mode).

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes | The alias or deployment ID |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/aliases/{id}/protection-bypass"
```

---
