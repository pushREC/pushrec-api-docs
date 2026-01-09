---
created: 2026-01-09
tags: [type/api-reference, api/apps.permissions.scopes]
api_name: Slack Web API
category: apps.permissions.scopes
endpoint_count: 1
---

# Slack Web API - Apps.Permissions.Scopes

[[README|Back to Overview]]

---

## GET /apps.permissions.scopes.list

Returns list of scopes this app has on a team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `none` |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/apps.permissions.scopes.list"
```

---
