---
created: 2026-01-09
tags: [type/api-reference, api/apps.permissions.resources]
api_name: Slack Web API
category: apps.permissions.resources
endpoint_count: 1
---

# Slack Web API - Apps.Permissions.Resources

[[README|Back to Overview]]

---

## GET /apps.permissions.resources.list

Returns list of resource grants this app has on a team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `none` |
| `cursor` | query | string | No | Paginate through collections of data by setting th |
| `limit` | query | string | No | The maximum number of items to return. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/apps.permissions.resources.list"
```

---
