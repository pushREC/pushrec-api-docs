---
created: 2026-01-09
tags: [type/api-reference, api/auditlog]
api_name: Netlify's API documentation
category: auditLog
endpoint_count: 1
---

# Netlify's API documentation - Auditlog

[[README|Back to Overview]]

---

## GET /accounts/{account_id}/audit

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `query` | query | string | No |  |
| `log_type` | query | string | No |  |
| `` | query | string | No |  |
| `` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.netlify.com/api/v1/accounts/{account_id}/audit"
```

---
