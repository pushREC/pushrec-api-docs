---
created: 2026-01-08
tags: [type/api-reference, api/webhooks]
api_name: Vercel API
category: webhooks
endpoint_count: 4
---

# Vercel API - Webhooks

[[README|Back to Overview]]

---

## POST /v1/webhooks

**Creates a webhook**

Creates a webhook

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/webhooks"
```

---

## GET /v1/webhooks

**Get a list of webhooks**

Get a list of webhooks

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `projectId` | query | string | No |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/webhooks"
```

---

## GET /v1/webhooks/{id}

**Get a webhook**

Get a webhook

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/webhooks/{id}"
```

---

## DELETE /v1/webhooks/{id}

**Deletes a webhook**

Deletes a webhook

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `id` | path | string | Yes |  |
| `teamId` | query | string | No | The Team identifier to perform the request on beha |
| `slug` | query | string | No | The Team slug to perform the request on behalf of. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.vercel.com/v1/webhooks/{id}"
```

---
