---
created: 2026-01-09
tags: [type/api-reference, api/edgerouteiprestrictionmodule]
api_name: ngrok OpenAPI
category: EdgeRouteIPRestrictionModule
endpoint_count: 3
---

# ngrok OpenAPI - Edgerouteiprestrictionmodule

[[README|Back to Overview]]

---

## PUT /edges/https/{edge_id}/routes/{id}/ip_restriction

**Replace**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `edge_id` | path | string | Yes |  |
| `id` | path | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/ip_restriction"
```

---

## GET /edges/https/{edge_id}/routes/{id}/ip_restriction

**Get**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `edge_id` | path | string | Yes | unique identifier of this edge
 |
| `id` | path | string | Yes | unique identifier of this edge route
 |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/ip_restriction"
```

---

## DELETE /edges/https/{edge_id}/routes/{id}/ip_restriction

**Delete**

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `edge_id` | path | string | Yes | unique identifier of this edge
 |
| `id` | path | string | Yes | unique identifier of this edge route
 |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/ip_restriction"
```

---
