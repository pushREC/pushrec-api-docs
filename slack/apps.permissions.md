---
created: 2026-01-09
tags: [type/api-reference, api/apps.permissions]
api_name: Slack Web API
category: apps.permissions
endpoint_count: 2
---

# Slack Web API - Apps.Permissions

[[README|Back to Overview]]

---

## GET /apps.permissions.info

Returns list of permissions this app has on a team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `none` |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/apps.permissions.info"
```

---

## GET /apps.permissions.request

Allows an app to request additional scopes

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `none` |
| `scopes` | query | string | Yes | A comma separated list of scopes to request for |
| `trigger_id` | query | string | Yes | Token used to trigger the permissions API |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/apps.permissions.request"
```

---
