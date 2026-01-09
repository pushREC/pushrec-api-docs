---
created: 2026-01-09
tags: [type/api-reference, api/file]
api_name: Netlify's API documentation
category: file
endpoint_count: 3
---

# Netlify's API documentation - File

[[README|Back to Overview]]

---

## GET /sites/{site_id}/files

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/files"
```

---

## GET /sites/{site_id}/files/{file_path}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |
| `file_path` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/files/{file_path}"
```

---

## PUT /deploys/{deploy_id}/files/{path}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `deploy_id` | path | string | Yes |  |
| `path` | path | string | Yes |  |
| `size` | query | integer | No |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploys/{deploy_id}/files/{path}"
```

---
