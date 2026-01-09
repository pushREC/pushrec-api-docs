---
created: 2026-01-09
tags: [type/api-reference, api/admin.teams.owners]
api_name: Slack Web API
category: admin.teams.owners
endpoint_count: 1
---

# Slack Web API - Admin.Teams.Owners

[[README|Back to Overview]]

---

## GET /admin.teams.owners.list

List all of the owners on a given workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `admin.teams |
| `team_id` | query | string | Yes |  |
| `limit` | query | string | No | The maximum number of items to return. Must be bet |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.owners.list"
```

---
