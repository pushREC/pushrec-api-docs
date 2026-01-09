---
created: 2026-01-09
tags: [type/api-reference, api/chat.scheduledmessages]
api_name: Slack Web API
category: chat.scheduledMessages
endpoint_count: 1
---

# Slack Web API - Chat.Scheduledmessages

[[README|Back to Overview]]

---

## GET /chat.scheduledMessages.list

Returns a list of scheduled messages.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `none` |
| `channel` | query | string | No | The channel of the scheduled messages |
| `latest` | query | string | No | A UNIX timestamp of the latest value in the time r |
| `oldest` | query | string | No | A UNIX timestamp of the oldest value in the time r |
| `limit` | query | string | No | Maximum number of original entries to return. |
| `cursor` | query | string | No | For pagination purposes, this is the `cursor` valu |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.scheduledMessages.list"
```

---
