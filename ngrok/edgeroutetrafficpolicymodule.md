---
created: 2026-01-09
tags: [type/api-reference, api/edgeroutetrafficpolicymodule]
api_name: ngrok OpenAPI
category: EdgeRouteTrafficPolicyModule
endpoint_count: 3
---

# ngrok OpenAPI - Edgeroutetrafficpolicymodule

[[README|Back to Overview]]

---

## PUT /edges/https/{edge_id}/routes/{id}/traffic_policy

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
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/traffic_policy"
```

---

## GET /edges/https/{edge_id}/routes/{id}/traffic_policy

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
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/traffic_policy"
```

---

## DELETE /edges/https/{edge_id}/routes/{id}/traffic_policy

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
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/traffic_policy"
```

---
