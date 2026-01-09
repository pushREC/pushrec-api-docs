---
created: 2026-01-09
tags: [type/api-reference, api/admin.teams]
api_name: Slack Web API
category: admin.teams
endpoint_count: 2
---

# Slack Web API - Admin.Teams

[[README|Back to Overview]]

---

## POST /admin.teams.create

Create an Enterprise team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.teams |
| `team_domain` | formData | string | Yes | Team domain (for example, slacksoftballteam). |
| `team_name` | formData | string | Yes | Team name (for example, Slack Softball Team). |
| `team_description` | formData | string | No | Description for the team. |
| `team_discoverability` | formData | string | No | Who can join the team. A team's discoverability ca |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.create"
```

---

## GET /admin.teams.list

List all teams on an Enterprise organization

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.teams |
| `limit` | query | string | No | The maximum number of items to return. Must be bet |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.teams.list"
```

---
