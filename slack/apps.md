---
created: 2026-01-09
tags: [type/api-reference, api/apps]
api_name: Slack Web API
category: apps
endpoint_count: 1
---

# Slack Web API - Apps

[[README|Back to Overview]]

---

## GET /apps.uninstall

Uninstalls your app from a workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `none` |
| `client_id` | query | string | No | Issued when you created your application. |
| `client_secret` | query | string | No | Issued when you created your application. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/apps.uninstall"
```

---
