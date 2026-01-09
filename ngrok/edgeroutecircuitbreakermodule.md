---
created: 2026-01-09
tags: [type/api-reference, api/edgeroutecircuitbreakermodule]
api_name: ngrok OpenAPI
category: EdgeRouteCircuitBreakerModule
endpoint_count: 3
---

# ngrok OpenAPI - Edgeroutecircuitbreakermodule

[[README|Back to Overview]]

---

## PUT /edges/https/{edge_id}/routes/{id}/circuit_breaker

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
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/circuit_breaker"
```

---

## GET /edges/https/{edge_id}/routes/{id}/circuit_breaker

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
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/circuit_breaker"
```

---

## DELETE /edges/https/{edge_id}/routes/{id}/circuit_breaker

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
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/circuit_breaker"
```

---
