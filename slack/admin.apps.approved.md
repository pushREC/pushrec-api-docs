---
created: 2026-01-09
tags: [type/api-reference, api/admin.apps.approved]
api_name: Slack Web API
category: admin.apps.approved
endpoint_count: 1
---

# Slack Web API - Admin.Apps.Approved

[[README|Back to Overview]]

---

## GET /admin.apps.approved.list

List approved apps for an org or workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `admin.apps: |
| `limit` | query | string | No | The maximum number of items to return. Must be bet |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |
| `team_id` | query | string | No |  |
| `enterprise_id` | query | string | No |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.apps.approved.list"
```

---
