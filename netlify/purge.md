---
created: 2026-01-09
tags: [type/api-reference, api/purge]
api_name: Netlify's API documentation
category: purge
endpoint_count: 1
---

# Netlify's API documentation - Purge

[[README|Back to Overview]]

---

## POST /purge

Purges cached content from Netlify's CDN. Supports purging by Cache-Tag.

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/purge"
```

---
