---
created: 2026-01-09
tags: [type/api-reference, api/hook]
api_name: Netlify's API documentation
category: hook
endpoint_count: 6
---

# Netlify's API documentation - Hook

[[README|Back to Overview]]

---

## GET /hooks

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/hooks"
```

---

## POST /hooks

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `site_id` | query | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/hooks"
```

---

## GET /hooks/{hook_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/hooks/{hook_id}"
```

---

## PUT /hooks/{hook_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/hooks/{hook_id}"
```

---

## DELETE /hooks/{hook_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/hooks/{hook_id}"
```

---

## POST /hooks/{hook_id}/enable

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/hooks/{hook_id}/enable"
```

---
