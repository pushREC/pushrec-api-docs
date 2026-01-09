---
created: 2026-01-09
tags: [type/api-reference, api/tlsedgeiprestrictionmodule]
api_name: ngrok OpenAPI
category: TLSEdgeIPRestrictionModule
endpoint_count: 3
---

# ngrok OpenAPI - Tlsedgeiprestrictionmodule

[[README|Back to Overview]]

---

## PUT /edges/tls/{id}/ip_restriction

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
  "https://api.ngrok.com/edges/tls/{id}/ip_restriction"
```

---

## GET /edges/tls/{id}/ip_restriction

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
  "https://api.ngrok.com/edges/tls/{id}/ip_restriction"
```

---

## DELETE /edges/tls/{id}/ip_restriction

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
  "https://api.ngrok.com/edges/tls/{id}/ip_restriction"
```

---
