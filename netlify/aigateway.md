---
created: 2026-01-09
tags: [type/api-reference, api/aigateway]
api_name: Netlify's API documentation
category: aiGateway
endpoint_count: 2
---

# Netlify's API documentation - Aigateway

[[README|Back to Overview]]

---

## GET /ai-gateway/providers

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/ai-gateway/providers"
```

---

## GET /sites/{site_id}/ai-gateway/token

Returns an AI Gateway token for a specific site

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/sites/{site_id}/ai-gateway/token"
```

---
