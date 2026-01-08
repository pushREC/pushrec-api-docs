---
created: 2026-01-08
tags: [type/api-reference, api/files]
api_name: OpenAI API
category: Files
endpoint_count: 5
---

# OpenAI API - Files

[[README|Back to Overview]]

---

## GET /files

**List files**

Returns a list of files.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `purpose` | query | string | No | Only return files with the given purpose. |
| `limit` | query | integer | No | A limit on the number of objects to be returned. L |
| `order` | query | string | No | Sort order by the `created_at` timestamp of the ob |
| `after` | query | string | No | A cursor for use in pagination. `after` is an obje |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/files"
```

---

## POST /files

**Upload file**

Upload a file that can be used across various endpoints. Individual files
can be up to 512 MB, and the size of all files uploaded by one organization
can be up to 1 TB.

- The Assistants API supports files up to 2 million tokens and of specific
  file types. See the [Assistants Tools guide](https://platform.openai.com/docs/assistants/tools) for
  details.
- The Fine-tuning API only supports `.jsonl` files. The input also has
  certain required formats for fine-tuning
  [chat](https://platform.openai.com/docs/api-reference/fine-tuning/chat-input) or
  [completions](https://platform.openai.com/docs/api-reference/fine-tuning/completions-input) models.
- The Batch API only supports `.jsonl` files up to 200 MB in size. The input
  also has a specific required
  [format](https://platform.openai.com/docs/api-reference/batch/request-input).

Please [contact us](https://help.openai.com/) if you need to increase these
storage limits.


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/files"
```

---

## DELETE /files/{file_id}

**Delete file**

Delete a file and remove it from all vector stores.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `file_id` | path | string | Yes | The ID of the file to use for this request. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/files/{file_id}"
```

---

## GET /files/{file_id}

**Retrieve file**

Returns information about a specific file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `file_id` | path | string | Yes | The ID of the file to use for this request. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/files/{file_id}"
```

---

## GET /files/{file_id}/content

**Retrieve file content**

Returns the contents of the specified file.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `file_id` | path | string | Yes | The ID of the file to use for this request. |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/files/{file_id}/content"
```

---
