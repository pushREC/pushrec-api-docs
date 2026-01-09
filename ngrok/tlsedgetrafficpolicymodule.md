---
created: 2026-01-09
tags: [type/api-reference, api/tlsedgetrafficpolicymodule]
api_name: ngrok OpenAPI
category: TLSEdgeTrafficPolicyModule
endpoint_count: 3
---

# ngrok OpenAPI - Tlsedgetrafficpolicymodule

[[README|Back to Overview]]

---

## PUT /edges/tls/{id}/traffic_policy

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
  "https://api.ngrok.com/edges/tls/{id}/traffic_policy"
```

---

## GET /edges/tls/{id}/traffic_policy

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
  "https://api.ngrok.com/edges/tls/{id}/traffic_policy"
```

---

## DELETE /edges/tls/{id}/traffic_policy

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
  "https://api.ngrok.com/edges/tls/{id}/traffic_policy"
```

---
