---
created: 2026-01-09
tags: [type/api-reference, api/asset]
api_name: Netlify's API documentation
category: asset
endpoint_count: 5
---

# Netlify's API documentation - Asset

[[README|Back to Overview]]

---

## GET /sites/{site_id}/assets

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/assets"
```

---

## POST /sites/{site_id}/assets

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `name` | query | string | Yes |  |
| `size` | query | integer | Yes |  |
| `content_type` | query | string | Yes |  |
| `visibility` | query | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/assets"
```

---

## GET /sites/{site_id}/assets/{asset_id}

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/assets/{asset_id}"
```

---

## PUT /sites/{site_id}/assets/{asset_id}

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `state` | query | string | Yes |  |

### Example

```bash
curl -X PUT \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/assets/{asset_id}"
```

---

## DELETE /sites/{site_id}/assets/{asset_id}

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/assets/{asset_id}"
```

---
