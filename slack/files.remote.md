---
created: 2026-01-09
tags: [type/api-reference, api/files.remote]
api_name: Slack Web API
category: files.remote
endpoint_count: 6
---

# Slack Web API - Files.Remote

[[README|Back to Overview]]

---

## POST /files.remote.add

Adds a file from a remote service

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | No | Authentication token. Requires scope: `remote_file |
| `external_id` | formData | string | No | Creator defined GUID for the file. |
| `title` | formData | string | No | Title of the file being shared. |
| `filetype` | formData | string | No | type of file |
| `external_url` | formData | string | No | URL of the remote file. |
| `preview_image` | formData | string | No | Preview of the document via `multipart/form-data`. |
| `indexable_file_contents` | formData | string | No | A text file (txt, pdf, doc, etc.) containing textu |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/files.remote.add"
```

---

## GET /files.remote.info

Retrieve information about a remote file added to Slack

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `remote_file |
| `file` | query | string | No | Specify a file by providing its ID. |
| `external_id` | query | string | No | Creator defined GUID for the file. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/files.remote.info"
```

---

## GET /files.remote.list

Retrieve information about a remote file added to Slack

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `remote_file |
| `channel` | query | string | No | Filter files appearing in a specific channel, indi |
| `ts_from` | query | string | No | Filter files created after this timestamp (inclusi |
| `ts_to` | query | string | No | Filter files created before this timestamp (inclus |
| `limit` | query | string | No | The maximum number of items to return. |
| `cursor` | query | string | No | Paginate through collections of data by setting th |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/files.remote.list"
```

---

## POST /files.remote.remove

Remove a remote file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | No | Authentication token. Requires scope: `remote_file |
| `file` | formData | string | No | Specify a file by providing its ID. |
| `external_id` | formData | string | No | Creator defined GUID for the file. |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/files.remote.remove"
```

---

## GET /files.remote.share

Share a remote file into a channel.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | query | string | No | Authentication token. Requires scope: `remote_file |
| `file` | query | string | No | Specify a file registered with Slack by providing  |
| `external_id` | query | string | No | The globally unique identifier (GUID) for the file |
| `channels` | query | string | No | Comma-separated list of channel IDs where the file |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "/files.remote.share"
```

---

## POST /files.remote.update

Updates an existing remote file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `token` | formData | string | No | Authentication token. Requires scope: `remote_file |
| `file` | formData | string | No | Specify a file by providing its ID. |
| `external_id` | formData | string | No | Creator defined GUID for the file. |
| `title` | formData | string | No | Title of the file being shared. |
| `filetype` | formData | string | No | type of file |
| `external_url` | formData | string | No | URL of the remote file. |
| `preview_image` | formData | string | No | Preview of the document via `multipart/form-data`. |
| `indexable_file_contents` | formData | string | No | File containing contents that can be used to impro |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "/files.remote.update"
```

---
