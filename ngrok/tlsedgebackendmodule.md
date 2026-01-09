---
created: 2026-01-09
tags: [type/api-reference, api/tlsedgebackendmodule]
api_name: ngrok OpenAPI
category: TLSEdgeBackendModule
endpoint_count: 3
---

# ngrok OpenAPI - Tlsedgebackendmodule

[[README|Back to Overview]]

---

## PUT /edges/tls/{id}/backend

**Replace**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/tls/{id}/backend"
```

---

## GET /edges/tls/{id}/backend

**Get**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/tls/{id}/backend"
```

---

## DELETE /edges/tls/{id}/backend

**Delete**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `id` | path | string | Yes | a resource identifier
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/tls/{id}/backend"
```

---
