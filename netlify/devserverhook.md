---
created: 2026-01-09
tags: [type/api-reference, api/devserverhook]
api_name: Netlify's API documentation
category: devServerHook
endpoint_count: 5
---

# Netlify's API documentation - Devserverhook

[[README|Back to Overview]]

---

## GET /sites/{site_id}/dev_server_hooks

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_server_hooks"
```

---

## POST /sites/{site_id}/dev_server_hooks

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_server_hooks"
```

---

## GET /sites/{site_id}/dev_server_hooks/{id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_server_hooks/{id}"
```

---

## PUT /sites/{site_id}/dev_server_hooks/{id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_server_hooks/{id}"
```

---

## DELETE /sites/{site_id}/dev_server_hooks/{id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/dev_server_hooks/{id}"
```

---
