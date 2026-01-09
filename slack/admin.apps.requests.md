---
created: 2026-01-09
tags: [type/api-reference, api/admin.apps.requests]
api_name: Slack Web API
category: admin.apps.requests
endpoint_count: 1
---

# Slack Web API - Admin.Apps.Requests

[[README|Back to Overview]]

---

## GET /admin.apps.requests.list

List app requests for a team/workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `admin.apps: |
| `limit` | query | string | No | The maximum number of items to return. Must be bet |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |
| `team_id` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.apps.requests.list"
```

---
