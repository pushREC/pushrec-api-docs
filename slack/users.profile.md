---
created: 2026-01-09
tags: [type/api-reference, api/users.profile]
api_name: Slack Web API
category: users.profile
endpoint_count: 2
---

# Slack Web API - Users.Profile

[[README|Back to Overview]]

---

## GET /users.profile.get

Retrieves a user's profile information.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `users.profi |
| `include_labels` | query | string | No | Include labels for each ID in custom profile field |
| `user` | query | string | No | User to retrieve profile info for |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users.profile.get"
```

---

## POST /users.profile.set

Set the profile information for a user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `users.profi |
| `name` | formData | string | No | Name of a single key to set. Usable only if `profi |
| `profile` | formData | string | No | Collection of key:value pairs presented as a URL-e |
| `user` | formData | string | No | ID of user to change. This argument may only be sp |
| `value` | formData | string | No | Value to set a single key to. Usable only if `prof |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/users.profile.set"
```

---
