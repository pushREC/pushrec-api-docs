---
created: 2026-01-08
tags: [type/api-reference, api/edge-config]
api_name: Vercel API
category: edge-config
endpoint_count: 17
---

# Vercel API - Edge-Config

[[README|Back to Overview]]

---

## GET /v1/edge-config

**Get Edge Configs**

Returns all Edge Configs.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config"
```

---

## POST /v1/edge-config

**Create an Edge Config**

Creates an Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config"
```

---

## GET /v1/edge-config/{edgeConfigId}

**Get an Edge Config**

Returns an Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}"
```

---

## PUT /v1/edge-config/{edgeConfigId}

**Update an Edge Config**

Updates an Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}"
```

---

## DELETE /v1/edge-config/{edgeConfigId}

**Delete an Edge Config**

Delete an Edge Config by id.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}"
```

---

## GET /v1/edge-config/{edgeConfigId}/items

**Get Edge Config items**

Returns all items of an Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/items"
```

---

## PATCH /v1/edge-config/{edgeConfigId}/items

**Update Edge Config items in batch**

Update multiple Edge Config Items in batch.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/items"
```

---

## GET /v1/edge-config/{edgeConfigId}/schema

**Get Edge Config schema**

Returns the schema of an Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/schema"
```

---

## POST /v1/edge-config/{edgeConfigId}/schema

**Update Edge Config schema**

Update an Edge Config's schema.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `dryRun` | query | string | No |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/schema"
```

---

## DELETE /v1/edge-config/{edgeConfigId}/schema

**Delete an Edge Config's schema**

Deletes the schema of existing Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/schema"
```

---

## GET /v1/edge-config/{edgeConfigId}/item/{edgeConfigItemKey}

**Get an Edge Config item**

Returns a specific Edge Config Item.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `edgeConfigItemKey` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/item/{edgeConfigItemKey}"
```

---

## GET /v1/edge-config/{edgeConfigId}/tokens

**Get all tokens of an Edge Config**

Returns all tokens of an Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/tokens"
```

---

## DELETE /v1/edge-config/{edgeConfigId}/tokens

**Delete one or more Edge Config tokens**

Deletes one or more tokens of an existing Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/tokens"
```

---

## GET /v1/edge-config/{edgeConfigId}/token/{token}

**Get Edge Config token meta data**

Return meta data about an Edge Config token.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `token` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/token/{token}"
```

---

## POST /v1/edge-config/{edgeConfigId}/token

**Create an Edge Config token**

Adds a token to an existing Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/token"
```

---

## GET /v1/edge-config/{edgeConfigId}/backups/{edgeConfigBackupVersionId}

**Get Edge Config backup**

Retrieves a specific version of an Edge Config from backup storage.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `edgeConfigBackupVersionId` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/backups/{edgeConfigBackupVersionId}"
```

---

## GET /v1/edge-config/{edgeConfigId}/backups

**Get Edge Config backups**

Returns backups of an Edge Config.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `edgeConfigId` | path | string | Yes |  |
| `next` | query | string | No |  |
| `limit` | query | number | No |  |
| `metadata` | query | string | No |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/edge-config/{edgeConfigId}/backups"
```

---
