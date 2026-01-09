---
created: 2026-01-09
tags: [type/api-reference, api/team.profile]
api_name: Slack Web API
category: team.profile
endpoint_count: 1
---

# Slack Web API - Team.Profile

[[README|Back to Overview]]

---

## GET /team.profile.get

Retrieve a team's profile.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `users.profi |
| `visibility` | query | string | No | Filter by visibility. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/team.profile.get"
```

---
