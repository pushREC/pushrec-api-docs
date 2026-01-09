---
created: 2026-01-09
tags: [type/api-reference, api/httpsedgetlsterminationmodule]
api_name: ngrok OpenAPI
category: HTTPSEdgeTLSTerminationModule
endpoint_count: 3
---

# ngrok OpenAPI - Httpsedgetlsterminationmodule

[[README|Back to Overview]]

---

## PUT /edges/https/{id}/tls_termination

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
  "https://api.ngrok.com/edges/https/{id}/tls_termination"
```

---

## GET /edges/https/{id}/tls_termination

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
  "https://api.ngrok.com/edges/https/{id}/tls_termination"
```

---

## DELETE /edges/https/{id}/tls_termination

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
  "https://api.ngrok.com/edges/https/{id}/tls_termination"
```

---
