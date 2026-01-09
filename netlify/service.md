---
created: 2026-01-09
tags: [type/api-reference, api/service]
api_name: Netlify's API documentation
category: service
endpoint_count: 3
---

# Netlify's API documentation - Service

[[README|Back to Overview]]

---

## GET /services/

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/services/"
```

---

## GET /services/{addonName}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/services/{addonName}"
```

---

## GET /services/{addonName}/manifest

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/services/{addonName}/manifest"
```

---
