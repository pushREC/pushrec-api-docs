---
created: 2026-01-09
tags: [type/api-reference, api/splittest]
api_name: Netlify's API documentation
category: splitTest
endpoint_count: 6
---

# Netlify's API documentation - Splittest

[[README|Back to Overview]]

---

## POST /sites/{site_id}/traffic_splits

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/traffic_splits"
```

---

## GET /sites/{site_id}/traffic_splits

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/traffic_splits"
```

---

## PUT /sites/{site_id}/traffic_splits/{split_test_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/traffic_splits/{split_test_id}"
```

---

## GET /sites/{site_id}/traffic_splits/{split_test_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/traffic_splits/{split_test_id}"
```

---

## POST /sites/{site_id}/traffic_splits/{split_test_id}/publish

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/traffic_splits/{split_test_id}/publish"
```

---

## POST /sites/{site_id}/traffic_splits/{split_test_id}/unpublish

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/traffic_splits/{split_test_id}/unpublish"
```

---
