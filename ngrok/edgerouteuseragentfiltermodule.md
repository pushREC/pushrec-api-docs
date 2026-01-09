---
created: 2026-01-09
tags: [type/api-reference, api/edgerouteuseragentfiltermodule]
api_name: ngrok OpenAPI
category: EdgeRouteUserAgentFilterModule
endpoint_count: 3
---

# ngrok OpenAPI - Edgerouteuseragentfiltermodule

[[README|Back to Overview]]

---

## PUT /edges/https/{edge_id}/routes/{id}/user_agent_filter

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
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/user_agent_filter"
```

---

## GET /edges/https/{edge_id}/routes/{id}/user_agent_filter

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
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/user_agent_filter"
```

---

## DELETE /edges/https/{edge_id}/routes/{id}/user_agent_filter

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
  "https://api.ngrok.com/edges/https/{edge_id}/routes/{id}/user_agent_filter"
```

---
