---
created: 2026-01-09
tags: [type/api-reference, api/chat]
api_name: Slack Web API
category: chat
endpoint_count: 9
---

# Slack Web API - Chat

[[README|Back to Overview]]

---

## POST /chat.delete

Deletes a message.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `chat:write` |
| `ts` | formData | string | No | Timestamp of the message to be deleted. |
| `channel` | formData | string | No | Channel containing the message to be deleted. |
| `as_user` | formData | string | No | Pass true to delete the message as the authed user |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.delete"
```

---

## POST /chat.deleteScheduledMessage

Deletes a pending scheduled message from the queue.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `chat:write` |
| `as_user` | formData | string | No | Pass true to delete the message as the authed user |
| `channel` | formData | string | Yes | The channel the scheduled_message is posting to |
| `scheduled_message_id` | formData | string | Yes | `scheduled_message_id` returned from call to chat. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.deleteScheduledMessage"
```

---

## GET /chat.getPermalink

Retrieve a permalink URL for a specific extant message

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `none` |
| `channel` | query | string | Yes | The ID of the conversation or channel containing t |
| `message_ts` | query | string | Yes | A message's `ts` value, uniquely identifying it wi |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.getPermalink"
```

---

## POST /chat.meMessage

Share a me message into a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `chat:write` |
| `channel` | formData | string | No | Channel to send message to. Can be a public channe |
| `text` | formData | string | No | Text of the message to send. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.meMessage"
```

---

## POST /chat.postEphemeral

Sends an ephemeral message to a user in a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `chat:write` |
| `as_user` | formData | string | No | Pass true to post the message as the authed user.  |
| `attachments` | formData | string | No | A JSON-based array of structured attachments, pres |
| `blocks` | formData | string | No | A JSON-based array of structured blocks, presented |
| `channel` | formData | string | Yes | Channel, private group, or IM channel to send mess |
| `icon_emoji` | formData | string | No | Emoji to use as the icon for this message. Overrid |
| `icon_url` | formData | string | No | URL to an image to use as the icon for this messag |
| `link_names` | formData | string | No | Find and link channel names and usernames. |
| `parse` | formData | string | No | Change how messages are treated. Defaults to `none |
| `text` | formData | string | No | How this field works and whether it is required de |
| `thread_ts` | formData | string | No | Provide another message's `ts` value to post this  |
| `user` | formData | string | Yes | `id` of the user who will receive the ephemeral me |
| `username` | formData | string | No | Set your bot's user name. Must be used in conjunct |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.postEphemeral"
```

---

## POST /chat.postMessage

Sends a message to a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `chat:write` |
| `as_user` | formData | string | No | Pass true to post the message as the authed user,  |
| `attachments` | formData | string | No | A JSON-based array of structured attachments, pres |
| `blocks` | formData | string | No | A JSON-based array of structured blocks, presented |
| `channel` | formData | string | Yes | Channel, private group, or IM channel to send mess |
| `icon_emoji` | formData | string | No | Emoji to use as the icon for this message. Overrid |
| `icon_url` | formData | string | No | URL to an image to use as the icon for this messag |
| `link_names` | formData | string | No | Find and link channel names and usernames. |
| `mrkdwn` | formData | string | No | Disable Slack markup parsing by setting to `false` |
| `parse` | formData | string | No | Change how messages are treated. Defaults to `none |
| `reply_broadcast` | formData | string | No | Used in conjunction with `thread_ts` and indicates |
| `text` | formData | string | No | How this field works and whether it is required de |
| `thread_ts` | formData | string | No | Provide another message's `ts` value to make this  |
| `unfurl_links` | formData | string | No | Pass true to enable unfurling of primarily text-ba |
| `unfurl_media` | formData | string | No | Pass false to disable unfurling of media content. |
| `username` | formData | string | No | Set your bot's user name. Must be used in conjunct |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.postMessage"
```

---

## POST /chat.scheduleMessage

Schedules a message to be sent to a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `chat:write` |
| `channel` | formData | string | No | Channel, private group, or DM channel to send mess |
| `text` | formData | string | No | How this field works and whether it is required de |
| `post_at` | formData | string | No | Unix EPOCH timestamp of time in future to send the |
| `parse` | formData | string | No | Change how messages are treated. Defaults to `none |
| `as_user` | formData | string | No | Pass true to post the message as the authed user,  |
| `link_names` | formData | string | No | Find and link channel names and usernames. |
| `attachments` | formData | string | No | A JSON-based array of structured attachments, pres |
| `blocks` | formData | string | No | A JSON-based array of structured blocks, presented |
| `unfurl_links` | formData | string | No | Pass true to enable unfurling of primarily text-ba |
| `unfurl_media` | formData | string | No | Pass false to disable unfurling of media content. |
| `thread_ts` | formData | string | No | Provide another message's `ts` value to make this  |
| `reply_broadcast` | formData | string | No | Used in conjunction with `thread_ts` and indicates |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.scheduleMessage"
```

---

## POST /chat.unfurl

Provide custom unfurl behavior for user-posted URLs

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `links:write |
| `channel` | formData | string | Yes | Channel ID of the message |
| `ts` | formData | string | Yes | Timestamp of the message to add unfurl behavior to |
| `unfurls` | formData | string | No | URL-encoded JSON map with keys set to URLs feature |
| `user_auth_message` | formData | string | No | Provide a simply-formatted string to send as an ep |
| `user_auth_required` | formData | string | No | Set to `true` or `1` to indicate the user must ins |
| `user_auth_url` | formData | string | No | Send users to this custom URL where they will comp |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.unfurl"
```

---

## POST /chat.update

Updates a message.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `chat:write` |
| `as_user` | formData | string | No | Pass true to update the message as the authed user |
| `attachments` | formData | string | No | A JSON-based array of structured attachments, pres |
| `blocks` | formData | string | No | A JSON-based array of [structured blocks](/block-k |
| `channel` | formData | string | Yes | Channel containing the message to be updated. |
| `link_names` | formData | string | No | Find and link channel names and usernames. Default |
| `parse` | formData | string | No | Change how messages are treated. Defaults to `clie |
| `text` | formData | string | No | New text for the message, using the [default forma |
| `ts` | formData | string | Yes | Timestamp of the message to be updated. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/chat.update"
```

---
