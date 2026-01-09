---
created: 2026-01-09
tags: [type/api-reference, api/bots]
api_name: Slack Web API
category: bots
endpoint_count: 1
---

# Slack Web API - Bots

[[README|Back to Overview]]

---

## GET /bots.info

Gets information about a bot user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `users:read` |
| `bot` | query | string | No | Bot user to get info on |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/bots.info"
```

---
