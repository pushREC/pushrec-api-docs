---
created: 2026-01-09
tags: [type/api-reference, api/deploykey]
api_name: Netlify's API documentation
category: deployKey
endpoint_count: 4
---

# Netlify's API documentation - Deploykey

[[README|Back to Overview]]

---

## GET /deploy_keys

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploy_keys"
```

---

## POST /deploy_keys

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploy_keys"
```

---

## GET /deploy_keys/{key_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploy_keys/{key_id}"
```

---

## DELETE /deploy_keys/{key_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/deploy_keys/{key_id}"
```

---
