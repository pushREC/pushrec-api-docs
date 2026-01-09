---
created: 2026-01-09
tags: [type/api-reference, api/dialog]
api_name: Slack Web API
category: dialog
endpoint_count: 1
---

# Slack Web API - Dialog

[[README|Back to Overview]]

---

## GET /dialog.open

Open a dialog with a user

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `none` |
| `dialog` | query | string | Yes | The dialog definition. This must be a JSON-encoded |
| `trigger_id` | query | string | Yes | Exchange a trigger to post to the user. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/dialog.open"
```

---
