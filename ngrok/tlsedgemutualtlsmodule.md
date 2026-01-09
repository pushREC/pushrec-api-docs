---
created: 2026-01-09
tags: [type/api-reference, api/tlsedgemutualtlsmodule]
api_name: ngrok OpenAPI
category: TLSEdgeMutualTLSModule
endpoint_count: 3
---

# ngrok OpenAPI - Tlsedgemutualtlsmodule

[[README|Back to Overview]]

---

## PUT /edges/tls/{id}/mutual_tls

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
  "https://api.ngrok.com/edges/tls/{id}/mutual_tls"
```

---

## GET /edges/tls/{id}/mutual_tls

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
  "https://api.ngrok.com/edges/tls/{id}/mutual_tls"
```

---

## DELETE /edges/tls/{id}/mutual_tls

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
  "https://api.ngrok.com/edges/tls/{id}/mutual_tls"
```

---
