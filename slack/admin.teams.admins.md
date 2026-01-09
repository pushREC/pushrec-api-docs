---
created: 2026-01-09
tags: [type/api-reference, api/admin.teams.admins]
api_name: Slack Web API
category: admin.teams.admins
endpoint_count: 1
---

# Slack Web API - Admin.Teams.Admins

[[README|Back to Overview]]

---

## GET /admin.teams.admins.list

List all of the admins on a given workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `admin.teams |
| `limit` | query | string | No | The maximum number of items to return. |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |
| `team_id` | query | string | Yes |  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.admins.list"
```

---
