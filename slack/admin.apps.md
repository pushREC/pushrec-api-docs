---
created: 2026-01-09
tags: [type/api-reference, api/admin.apps]
api_name: Slack Web API
category: admin.apps
endpoint_count: 2
---

# Slack Web API - Admin.Apps

[[README|Back to Overview]]

---

## POST /admin.apps.approve

Approve an app for installation on a workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.apps: |
| `app_id` | formData | string | No | The id of the app to approve. |
| `request_id` | formData | string | No | The id of the request to approve. |
| `team_id` | formData | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.apps.approve"
```

---

## POST /admin.apps.restrict

Restrict an app for installation on a workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.apps: |
| `app_id` | formData | string | No | The id of the app to restrict. |
| `request_id` | formData | string | No | The id of the request to restrict. |
| `team_id` | formData | string | No |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.apps.restrict"
```

---
