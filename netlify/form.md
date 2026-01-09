---
created: 2026-01-09
tags: [type/api-reference, api/form]
api_name: Netlify's API documentation
category: form
endpoint_count: 2
---

# Netlify's API documentation - Form

[[README|Back to Overview]]

---

## GET /sites/{site_id}/forms

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/forms"
```

---

## DELETE /sites/{site_id}/forms/{form_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | path | string | Yes |  |
| `form_id` | path | string | Yes |  |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/forms/{form_id}"
```

---
