---
created: 2026-01-09
tags: [type/api-reference, api/conversations]
api_name: Slack Web API
category: conversations
endpoint_count: 18
---

# Slack Web API - Conversations

[[README|Back to Overview]]

---

## POST /conversations.archive

Archives a conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | ID of conversation to archive |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.archive"
```

---

## POST /conversations.close

Closes a direct message or multi-person direct message.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | Conversation to close. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.close"
```

---

## POST /conversations.create

Initiates a public or private channel-based conversation

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `name` | formData | string | No | Name of the public or private channel to create |
| `is_private` | formData | string | No | Create a private channel instead of a public one |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.create"
```

---

## GET /conversations.history

Fetches a conversation's history of messages and events.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | query | string | No | Conversation ID to fetch history for. |
| `latest` | query | string | No | End of time range of messages to include in result |
| `oldest` | query | string | No | Start of time range of messages to include in resu |
| `inclusive` | query | string | No | Include messages with latest or oldest timestamp i |
| `limit` | query | string | No | The maximum number of items to return. Fewer than  |
| `cursor` | query | string | No | Paginate through collections of data by setting th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.history"
```

---

## GET /conversations.info

Retrieve information about a conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | query | string | No | Conversation ID to learn more about |
| `include_locale` | query | string | No | Set this to `true` to receive the locale for this  |
| `include_num_members` | query | string | No | Set to `true` to include the member count for the  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.info"
```

---

## POST /conversations.invite

Invites users to a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | The ID of the public or private channel to invite  |
| `users` | formData | string | No | A comma separated list of user IDs. Up to 1000 use |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.invite"
```

---

## POST /conversations.join

Joins an existing conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `channels:wr |
| `channel` | formData | string | No | ID of conversation to join |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.join"
```

---

## POST /conversations.kick

Removes a user from a conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | ID of conversation to remove user from. |
| `user` | formData | string | No | User ID to be removed. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.kick"
```

---

## POST /conversations.leave

Leaves a conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | Conversation to leave |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.leave"
```

---

## GET /conversations.list

Lists all channels in a Slack team.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `conversatio |
| `exclude_archived` | query | string | No | Set to `true` to exclude archived channels from th |
| `types` | query | string | No | Mix and match channel types by providing a comma-s |
| `limit` | query | string | No | The maximum number of items to return. Fewer than  |
| `cursor` | query | string | No | Paginate through collections of data by setting th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.list"
```

---

## POST /conversations.mark

Sets the read cursor in a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | Channel or conversation to set the read cursor for |
| `ts` | formData | string | No | Unique identifier of message you want marked as mo |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.mark"
```

---

## GET /conversations.members

Retrieve members of a conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | query | string | No | ID of the conversation to retrieve members for |
| `limit` | query | string | No | The maximum number of items to return. Fewer than  |
| `cursor` | query | string | No | Paginate through collections of data by setting th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.members"
```

---

## POST /conversations.open

Opens or resumes a direct message or multi-person direct message.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | Resume a conversation by supplying an `im` or `mpi |
| `users` | formData | string | No | Comma separated lists of users. If only one user i |
| `return_im` | formData | string | No | Boolean, indicates you want the full IM channel de |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.open"
```

---

## POST /conversations.rename

Renames a conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | ID of conversation to rename |
| `name` | formData | string | No | New name for conversation. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.rename"
```

---

## GET /conversations.replies

Retrieve a thread of messages posted to a conversation

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | query | string | No | Conversation ID to fetch thread from. |
| `ts` | query | string | No | Unique identifier of a thread's parent message. `t |
| `latest` | query | string | No | End of time range of messages to include in result |
| `oldest` | query | string | No | Start of time range of messages to include in resu |
| `inclusive` | query | string | No | Include messages with latest or oldest timestamp i |
| `limit` | query | string | No | The maximum number of items to return. Fewer than  |
| `cursor` | query | string | No | Paginate through collections of data by setting th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.replies"
```

---

## POST /conversations.setPurpose

Sets the purpose for a conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | Conversation to set the purpose of |
| `purpose` | formData | string | No | A new, specialer purpose |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.setPurpose"
```

---

## POST /conversations.setTopic

Sets the topic for a conversation.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | Conversation to set the topic of |
| `topic` | formData | string | No | The new topic string. Does not support formatting  |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.setTopic"
```

---

## POST /conversations.unarchive

Reverses conversation archival.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `conversatio |
| `channel` | formData | string | No | ID of conversation to unarchive |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/conversations.unarchive"
```

---
