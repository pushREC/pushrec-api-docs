---
created: 2026-01-09
tags: [type/api-reference, api/files]
api_name: Slack Web API
category: files
endpoint_count: 6
---

# Slack Web API - Files

[[README|Back to Overview]]

---

## POST /files.delete

Deletes a file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `files:write |
| `file` | formData | string | No | ID of file to delete. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/files.delete"
```

---

## GET /files.info

Gets information about a file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `files:read` |
| `file` | query | string | No | Specify a file by providing its ID. |
| `count` | query | string | No |  |
| `page` | query | string | No |  |
| `limit` | query | string | No | The maximum number of items to return. Fewer than  |
| `cursor` | query | string | No | Parameter for pagination. File comments are pagina |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/files.info"
```

---

## GET /files.list

List for a team, in a channel, or from a user with applied filters.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `files:read` |
| `user` | query | string | No | Filter files created by a single user. |
| `channel` | query | string | No | Filter files appearing in a specific channel, indi |
| `ts_from` | query | string | No | Filter files created after this timestamp (inclusi |
| `ts_to` | query | string | No | Filter files created before this timestamp (inclus |
| `types` | query | string | No | Filter files by type ([see below](#file_types)). Y |
| `count` | query | string | No |  |
| `page` | query | string | No |  |
| `show_files_hidden_by_limit` | query | string | No | Show truncated file info for files hidden due to b |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/files.list"
```

---

## POST /files.revokePublicURL

Revokes public/external sharing access for a file

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `files:write |
| `file` | formData | string | No | File to revoke |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/files.revokePublicURL"
```

---

## POST /files.sharedPublicURL

Enables a file for public/external sharing.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | header | string | No | Authentication token. Requires scope: `files:write |
| `file` | formData | string | No | File to share |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/files.sharedPublicURL"
```

---

## POST /files.upload

Uploads or creates a file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | No | Authentication token. Requires scope: `files:write |
| `file` | formData | string | No | File contents via `multipart/form-data`. If omitti |
| `content` | formData | string | No | File contents via a POST variable. If omitting thi |
| `filetype` | formData | string | No | A [file type](/types/file#file_types) identifier. |
| `filename` | formData | string | No | Filename of file. |
| `title` | formData | string | No | Title of file. |
| `initial_comment` | formData | string | No | The message text introducing the file in specified |
| `channels` | formData | string | No | Comma-separated list of channel names or IDs where |
| `thread_ts` | formData | string | No | Provide another message's `ts` value to upload thi |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/files.upload"
```

---
