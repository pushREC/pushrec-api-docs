---
created: 2026-01-09
tags: [type/api-reference, api/stars]
api_name: Slack Web API
category: stars
endpoint_count: 3
---

# Slack Web API - Stars

[[README|Back to Overview]]

---

## POST /stars.add

Adds a star to an item.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `stars:write |
| `channel` | formData | string | No | Channel to add star to, or channel where the messa |
| `file` | formData | string | No | File to add star to. |
| `file_comment` | formData | string | No | File comment to add star to. |
| `timestamp` | formData | string | No | Timestamp of the message to add star to. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/stars.add"
```

---

## GET /stars.list

Lists stars for a user.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `stars:read` |
| `count` | query | string | No |  |
| `page` | query | string | No |  |
| `cursor` | query | string | No | Parameter for pagination. Set `cursor` equal to th |
| `limit` | query | string | No | The maximum number of items to return. Fewer than  |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/stars.list"
```

---

## POST /stars.remove

Removes a star from an item.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | Yes | Authentication token. Requires scope: `stars:write |
| `channel` | formData | string | No | Channel to remove star from, or channel where the  |
| `file` | formData | string | No | File to remove star from. |
| `file_comment` | formData | string | No | File comment to remove star from. |
| `timestamp` | formData | string | No | Timestamp of the message to remove star from. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/stars.remove"
```

---
