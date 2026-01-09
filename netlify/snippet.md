---
created: 2026-01-09
tags: [type/api-reference, api/snippet]
api_name: Netlify's API documentation
category: snippet
endpoint_count: 5
---

# Netlify's API documentation - Snippet

[[README|Back to Overview]]

---

## GET /sites/{site_id}/snippets

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/snippets"
```

---

## POST /sites/{site_id}/snippets

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/snippets"
```

---

## GET /sites/{site_id}/snippets/{snippet_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/snippets/{snippet_id}"
```

---

## PUT /sites/{site_id}/snippets/{snippet_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/snippets/{snippet_id}"
```

---

## DELETE /sites/{site_id}/snippets/{snippet_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/snippets/{snippet_id}"
```

---
