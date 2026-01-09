---
created: 2026-01-09
tags: [type/api-reference, api/function]
api_name: Netlify's API documentation
category: function
endpoint_count: 2
---

# Netlify's API documentation - Function

[[README|Back to Overview]]

---

## GET /sites/{site_id}/functions

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |
| `filter` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/functions"
```

---

## PUT /deploys/{deploy_id}/functions/{name}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploy_id` | path | string | Yes |  |
| `name` | path | string | Yes |  |
| `runtime` | query | string | No |  |
| `invocation_mode` | query | string | No |  |
| `timeout` | query | integer | No |  |
| `size` | query | integer | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploys/{deploy_id}/functions/{name}"
```

---
