---
created: 2026-01-09
tags: [type/api-reference, api/serviceinstance]
api_name: Netlify's API documentation
category: serviceInstance
endpoint_count: 5
---

# Netlify's API documentation - Serviceinstance

[[README|Back to Overview]]

---

## GET /sites/{site_id}/service-instances

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/service-instances"
```

---

## POST /sites/{site_id}/services/{addon}/instances

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/services/{addon}/instances"
```

---

## GET /sites/{site_id}/services/{addon}/instances/{instance_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/services/{addon}/instances/{instance_id}"
```

---

## PUT /sites/{site_id}/services/{addon}/instances/{instance_id}

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/services/{addon}/instances/{instance_id}"
```

---

## DELETE /sites/{site_id}/services/{addon}/instances/{instance_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/services/{addon}/instances/{instance_id}"
```

---
