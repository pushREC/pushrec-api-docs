---
created: 2026-01-09
tags: [type/api-reference, api/tunnels]
api_name: ngrok OpenAPI
category: Tunnels
endpoint_count: 2
---

# ngrok OpenAPI - Tunnels

[[README|Back to Overview]]

---

## GET /tunnels

**List**

List all online tunnels currently running on the account.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `before_id` | query | string | No |  |
| `limit` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.ngrok.com/tunnels"
```

---

## GET /tunnels/{id}

**Get**

Get the status of a tunnel by ID


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
  "https://api.ngrok.com/tunnels/{id}"
```

---
