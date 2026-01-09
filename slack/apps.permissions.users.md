---
created: 2026-01-09
tags: [type/api-reference, api/apps.permissions.users]
api_name: Slack Web API
category: apps.permissions.users
endpoint_count: 2
---

# Slack Web API - Apps.Permissions.Users

[[README|Back to Overview]]

---

## GET /apps.permissions.users.list

Returns list of user grants and corresponding scopes this app has on a team.

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
  "/apps.permissions.users.list"
```

---

## GET /apps.permissions.users.request

Enables an app to trigger a permissions modal to grant an app access to a user access scope.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `none` |
| `scopes` | query | string | Yes | A comma separated list of user scopes to request f |
| `trigger_id` | query | string | Yes | Token used to trigger the request |
| `user` | query | string | Yes | The user this scope is being requested for |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/apps.permissions.users.request"
```

---
