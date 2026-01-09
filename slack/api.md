---
created: 2026-01-09
tags: [type/api-reference, api/api]
api_name: Slack Web API
category: api
endpoint_count: 1
---

# Slack Web API - Api

[[README|Back to Overview]]

---

## GET /api.test

Checks API calling code.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `error` | query | string | No | Error response to return |
| `foo` | query | string | No | example property to return |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/api.test"
```

---
