---
created: 2026-01-09
tags: [type/api-reference, api/metadata]
api_name: Netlify's API documentation
category: metadata
endpoint_count: 2
---

# Netlify's API documentation - Metadata

[[README|Back to Overview]]

---

## GET /sites/{site_id}/metadata

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/metadata"
```

---

## PUT /sites/{site_id}/metadata

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/metadata"
```

---
