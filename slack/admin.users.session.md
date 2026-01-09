---
created: 2026-01-09
tags: [type/api-reference, api/admin.users.session]
api_name: Slack Web API
category: admin.users.session
endpoint_count: 2
---

# Slack Web API - Admin.Users.Session

[[README|Back to Overview]]

---

## POST /admin.users.session.invalidate

Invalidate a single session for a user by session_id

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `team_id` | formData | string | Yes | ID of the team that the session belongs to |
| `session_id` | formData | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.session.invalidate"
```

---

## POST /admin.users.session.reset

Wipes all valid sessions on all devices for a given user

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `user_id` | formData | string | Yes | The ID of the user to wipe sessions for |
| `mobile_only` | formData | string | No | Only expire mobile sessions (default: false) |
| `web_only` | formData | string | No | Only expire web sessions (default: false) |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.session.reset"
```

---
