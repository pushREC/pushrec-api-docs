---
created: 2026-01-09
tags: [type/api-reference, api/rtm]
api_name: Slack Web API
category: rtm
endpoint_count: 1
---

# Slack Web API - Rtm

[[README|Back to Overview]]

---

## GET /rtm.connect

Starts a Real Time Messaging session.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `rtm:stream` |
| `batch_presence_aware` | query | string | No | Batch presence deliveries via subscription. Enabli |
| `presence_sub` | query | string | No | Only deliver presence events when requested by sub |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/rtm.connect"
```

---
