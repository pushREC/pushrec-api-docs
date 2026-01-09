---
created: 2026-01-09
tags: [type/api-reference, api/admin.conversations]
api_name: Slack Web API
category: admin.conversations
endpoint_count: 13
---

# Slack Web API - Admin.Conversations

[[README|Back to Overview]]

---

## POST /admin.conversations.archive

Archive a public or private channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | formData | string | Yes | The channel to archive. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.archive"
```

---

## POST /admin.conversations.convertToPrivate

Convert a public channel to a private channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | formData | string | Yes | The channel to convert to private. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.convertToPrivate"
```

---

## POST /admin.conversations.create

Create a public or private channel-based conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `name` | formData | string | Yes | Name of the public or private channel to create. |
| `description` | formData | string | No | Description of the public or private channel to cr |
| `is_private` | formData | string | Yes | When `true`, creates a private channel instead of  |
| `org_wide` | formData | string | No | When `true`, the channel will be available org-wid |
| `team_id` | formData | string | No | The workspace to create the channel in. Note: this |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.create"
```

---

## POST /admin.conversations.delete

Delete a public or private channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | formData | string | Yes | The channel to delete. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.delete"
```

---

## POST /admin.conversations.disconnectShared

Disconnect a connected channel from one or more workspaces.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | formData | string | Yes | The channel to be disconnected from some workspace |
| `leaving_team_ids` | formData | string | No | The team to be removed from the channel. Currently |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.disconnectShared"
```

---

## GET /admin.conversations.getConversationPrefs

Get conversation preferences for a public or private channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | query | string | Yes | The channel to get preferences for. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.getConversationPrefs"
```

---

## GET /admin.conversations.getTeams

Get all the workspaces a given public or private channel is connected to within this Enterprise org.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | query | string | Yes | The channel to determine connected workspaces with |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |
| `limit` | query | string | No | The maximum number of items to return. Must be bet |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.getTeams"
```

---

## POST /admin.conversations.invite

Invite a user to a public or private channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `user_ids` | formData | string | Yes | The users to invite. |
| `channel_id` | formData | string | Yes | The channel that the users will be invited to. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.invite"
```

---

## POST /admin.conversations.rename

Rename a public or private channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | formData | string | Yes | The channel to rename. |
| `name` | formData | string | Yes |  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.rename"
```

---

## GET /admin.conversations.search

Search for public or private channels in an Enterprise organization.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `team_ids` | query | string | No | Comma separated string of team IDs, signifying the |
| `query` | query | string | No | Name of the the channel to query by. |
| `limit` | query | string | No | Maximum number of items to be returned. Must be be |
| `cursor` | query | string | No | Set `cursor` to `next_cursor` returned by the prev |
| `search_channel_types` | query | string | No | The type of channel to include or exclude in the s |
| `sort` | query | string | No | Possible values are `relevant` (search ranking bas |
| `sort_dir` | query | string | No | Sort direction. Possible values are `asc` for asce |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.search"
```

---

## POST /admin.conversations.setConversationPrefs

Set the posting permissions for a public or private channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | formData | string | Yes | The channel to set the prefs for |
| `prefs` | formData | string | Yes | The prefs for this channel in a stringified JSON f |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.setConversationPrefs"
```

---

## POST /admin.conversations.setTeams

Set the workspaces in an Enterprise grid org that connect to a public or private channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | formData | string | Yes | The encoded `channel_id` to add or remove to works |
| `team_id` | formData | string | No | The workspace to which the channel belongs. Omit t |
| `target_team_ids` | formData | string | No | A comma-separated list of workspaces to which the  |
| `org_channel` | formData | string | No | True if channel has to be converted to an org chan |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.setTeams"
```

---

## POST /admin.conversations.unarchive

Unarchive a public or private channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `admin.conve |
| `channel_id` | formData | string | Yes | The channel to unarchive. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/admin.conversations.unarchive"
```

---
