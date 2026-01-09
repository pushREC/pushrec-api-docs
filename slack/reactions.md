---
created: 2026-01-09
tags: [type/api-reference, api/reactions]
api_name: Slack Web API
category: reactions
endpoint_count: 4
---

# Slack Web API - Reactions

[[README|Back to Overview]]

---

## POST /reactions.add

Adds a reaction to an item.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `channel` | formData | string | Yes | Channel where the message to add reaction to was p |
| `name` | formData | string | Yes | Reaction (emoji) name. |
| `timestamp` | formData | string | Yes | Timestamp of the message to add reaction to. |
| `token` | header | string | Yes | Authentication token. Requires scope: `reactions:w |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/reactions.add"
```

---

## GET /reactions.get

Gets reactions for an item.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `reactions:r |
| `channel` | query | string | No | Channel where the message to get reactions for was |
| `file` | query | string | No | File to get reactions for. |
| `file_comment` | query | string | No | File comment to get reactions for. |
| `full` | query | string | No | If true always return the complete reaction list. |
| `timestamp` | query | string | No | Timestamp of the message to get reactions for. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/reactions.get"
```

---

## GET /reactions.list

Lists reactions made by a user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | Yes | Authentication token. Requires scope: `reactions:r |
| `user` | query | string | No | Show reactions made by this user. Defaults to the  |
| `full` | query | string | No | If true always return the complete reaction list. |
| `count` | query | string | No |  |
| `page` | query | string | No |  |
| `cursor` | query | string | No | Parameter for pagination. Set `cursor` equal to th |
| `limit` | query | string | No | The maximum number of items to return. Fewer than  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/reactions.list"
```

---

## POST /reactions.remove

Removes a reaction from an item.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `reactions:w |
| `name` | formData | string | Yes | Reaction (emoji) name. |
| `file` | formData | string | No | File to remove reaction from. |
| `file_comment` | formData | string | No | File comment to remove reaction from. |
| `channel` | formData | string | No | Channel where the message to remove reaction from  |
| `timestamp` | formData | string | No | Timestamp of the message to remove reaction from. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/reactions.remove"
```

---
