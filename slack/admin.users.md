---
created: 2026-01-09
tags: [type/api-reference, api/admin.users]
api_name: Slack Web API
category: admin.users
endpoint_count: 8
---

# Slack Web API - Admin.Users

[[README|Back to Overview]]

---

## POST /admin.users.assign

Add an Enterprise user to a workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `team_id` | formData | string | Yes | The ID (`T1234`) of the workspace. |
| `user_id` | formData | string | Yes | The ID of the user to add to the workspace. |
| `is_restricted` | formData | string | No | True if user should be added to the workspace as a |
| `is_ultra_restricted` | formData | string | No | True if user should be added to the workspace as a |
| `channel_ids` | formData | string | No | Comma separated values of channel IDs to add user  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.assign"
```

---

## POST /admin.users.invite

Invite a user to a workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `team_id` | formData | string | Yes | The ID (`T1234`) of the workspace. |
| `email` | formData | string | Yes | The email address of the person to invite. |
| `channel_ids` | formData | string | Yes | A comma-separated list of `channel_id`s for this u |
| `custom_message` | formData | string | No | An optional message to send to the user in the inv |
| `real_name` | formData | string | No | Full name of the user. |
| `resend` | formData | string | No | Allow this invite to be resent in the future if a  |
| `is_restricted` | formData | string | No | Is this user a multi-channel guest user? (default: |
| `is_ultra_restricted` | formData | string | No | Is this user a single channel guest user? (default |
| `guest_expiration_ts` | formData | string | No | Timestamp when guest account should be disabled. O |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.invite"
```

---

## GET /admin.users.list

List users on a workspace

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `team_id` | query | string | Yes | The ID (`T1234`) of the workspace. |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |
| `limit` | query | string | No | Limit for how many users to be retrieved per page |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.list"
```

---

## POST /admin.users.remove

Remove a user from a workspace.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `team_id` | formData | string | Yes | The ID (`T1234`) of the workspace. |
| `user_id` | formData | string | Yes | The ID of the user to remove. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.remove"
```

---

## POST /admin.users.setAdmin

Set an existing guest, regular user, or owner to be an admin user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `team_id` | formData | string | Yes | The ID (`T1234`) of the workspace. |
| `user_id` | formData | string | Yes | The ID of the user to designate as an admin. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.setAdmin"
```

---

## POST /admin.users.setExpiration

Set an expiration for a guest user

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `team_id` | formData | string | Yes | The ID (`T1234`) of the workspace. |
| `user_id` | formData | string | Yes | The ID of the user to set an expiration for. |
| `expiration_ts` | formData | string | Yes | Timestamp when guest account should be disabled. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.setExpiration"
```

---

## POST /admin.users.setOwner

Set an existing guest, regular user, or admin user to be a workspace owner.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `team_id` | formData | string | Yes | The ID (`T1234`) of the workspace. |
| `user_id` | formData | string | Yes | Id of the user to promote to owner. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.setOwner"
```

---

## POST /admin.users.setRegular

Set an existing guest user, admin user, or owner to be a regular user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.users |
| `team_id` | formData | string | Yes | The ID (`T1234`) of the workspace. |
| `user_id` | formData | string | Yes | The ID of the user to designate as a regular user. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.users.setRegular"
```

---
