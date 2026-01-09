---
created: 2026-01-09
tags: [type/api-reference, api/emoji]
api_name: Slack Web API
category: emoji
endpoint_count: 1
---

# Slack Web API - Emoji

[[README|Back to Overview]]

---

## GET /emoji.list

Lists custom emoji for a team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `emoji:read` |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/emoji.list"
```

---
