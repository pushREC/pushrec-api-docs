---
created: 2026-01-09
tags: [type/api-reference, api/accesstoken]
api_name: Netlify's API documentation
category: accessToken
endpoint_count: 1
---

# Netlify's API documentation - Accesstoken

[[README|Back to Overview]]

---

## POST /oauth/tickets/{ticket_id}/exchange

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `ticket_id` | path | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/oauth/tickets/{ticket_id}/exchange"
```

---
