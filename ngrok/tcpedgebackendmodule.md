---
created: 2026-01-09
tags: [type/api-reference, api/tcpedgebackendmodule]
api_name: ngrok OpenAPI
category: TCPEdgeBackendModule
endpoint_count: 3
---

# ngrok OpenAPI - Tcpedgebackendmodule

[[README|Back to Overview]]

---

## PUT /edges/tcp/{id}/backend

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
  "https://api.ngrok.com/edges/tcp/{id}/backend"
```

---

## GET /edges/tcp/{id}/backend

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
  "https://api.ngrok.com/edges/tcp/{id}/backend"
```

---

## DELETE /edges/tcp/{id}/backend

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
  "https://api.ngrok.com/edges/tcp/{id}/backend"
```

---
