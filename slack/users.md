---
created: 2026-01-09
tags: [type/api-reference, api/users]
api_name: Slack Web API
category: users
endpoint_count: 10
---

# Slack Web API - Users

[[README|Back to Overview]]

---

## GET /users.conversations

List conversations the calling user may access.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `conversatio |
| `user` | query | string | No | Browse conversations by a specific user ID's membe |
| `types` | query | string | No | Mix and match channel types by providing a comma-s |
| `exclude_archived` | query | string | No | Set to `true` to exclude archived channels from th |
| `limit` | query | string | No | The maximum number of items to return. Fewer than  |
| `cursor` | query | string | No | Paginate through collections of data by setting th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users.conversations"
```

---

## POST /users.deletePhoto

Delete the user profile photo

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `users.profi |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/users.deletePhoto"
```

---

## GET /users.getPresence

Gets user presence information.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `users:read` |
| `user` | query | string | No | User to get presence info on. Defaults to the auth |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users.getPresence"
```

---

## GET /users.identity

Get a user's identity.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `identity.ba |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users.identity"
```

---

## GET /users.info

Gets information about a user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `users:read` |
| `include_locale` | query | string | No | Set this to `true` to receive the locale for this  |
| `user` | query | string | No | User to get info on |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users.info"
```

---

## GET /users.list

Lists all users in a Slack team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `users:read` |
| `limit` | query | string | No | The maximum number of items to return. Fewer than  |
| `cursor` | query | string | No | Paginate through collections of data by setting th |
| `include_locale` | query | string | No | Set this to `true` to receive the locale for users |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users.list"
```

---

## GET /users.lookupByEmail

Find a user with an email address.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `users:read. |
| `email` | query | string | Yes | An email address belonging to a user in the worksp |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/users.lookupByEmail"
```

---

## POST /users.setActive

Marked a user as active. Deprecated and non-functional.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `users:write |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/users.setActive"
```

---

## POST /users.setPhoto

Set the user profile photo

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | Yes | Authentication token. Requires scope: `users.profi |
| `crop_w` | formData | string | No | Width/height of crop box (always square) |
| `crop_x` | formData | string | No | X coordinate of top-left corner of crop box |
| `crop_y` | formData | string | No | Y coordinate of top-left corner of crop box |
| `image` | formData | string | No | File contents via `multipart/form-data`. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/users.setPhoto"
```

---

## POST /users.setPresence

Manually sets user presence.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `users:write |
| `presence` | formData | string | Yes | Either `auto` or `away` |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/users.setPresence"
```

---
