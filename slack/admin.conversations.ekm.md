---
created: 2026-01-09
tags: [type/api-reference, api/admin.conversations.ekm]
api_name: Slack Web API
category: admin.conversations.ekm
endpoint_count: 1
---

# Slack Web API - Admin.Conversations.Ekm

[[README|Back to Overview]]

---

## GET /admin.conversations.ekm.listOriginalConnectedChannelInfo

List all disconnected channels—i.e., channels that were once connected to other workspaces and then disconnected—and the corresponding original channel IDs for key revocation with EKM.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_ids` | query | string | No | A comma-separated list of channels to filter to. |
| `team_ids` | query | string | No | A comma-separated list of the workspaces to which  |
| `limit` | query | string | No | The maximum number of items to return. Must be bet |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.ekm.listOriginalConnectedChannelInfo"
```

---
