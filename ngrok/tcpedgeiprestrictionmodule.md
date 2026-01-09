---
created: 2026-01-09
tags: [type/api-reference, api/tcpedgeiprestrictionmodule]
api_name: ngrok OpenAPI
category: TCPEdgeIPRestrictionModule
endpoint_count: 3
---

# ngrok OpenAPI - Tcpedgeiprestrictionmodule

[[README|Back to Overview]]

---

## PUT /edges/tcp/{id}/ip_restriction

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
  "https://api.ngrok.com/edges/tcp/{id}/ip_restriction"
```

---

## GET /edges/tcp/{id}/ip_restriction

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
  "https://api.ngrok.com/edges/tcp/{id}/ip_restriction"
```

---

## DELETE /edges/tcp/{id}/ip_restriction

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
  "https://api.ngrok.com/edges/tcp/{id}/ip_restriction"
```

---
