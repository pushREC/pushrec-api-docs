---
created: 2026-01-09
tags: [type/api-reference, api/devserver]
api_name: Netlify's API documentation
category: devServer
endpoint_count: 5
---

# Netlify's API documentation - Devserver

[[README|Back to Overview]]

---

## GET /sites/{site_id}/dev_servers

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_servers"
```

---

## POST /sites/{site_id}/dev_servers

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `branch` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_servers"
```

---

## DELETE /sites/{site_id}/dev_servers

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `branch` | query | string | No |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_servers"
```

---

## GET /sites/{site_id}/dev_servers/{dev_server_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_servers/{dev_server_id}"
```

---

## POST /sites/{site_id}/dev_servers/{dev_server_id}/state

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_servers/{dev_server_id}/state"
```

---
