---
created: 2026-01-08
tags: [type/api-reference, api/uploads]
api_name: OpenAI API
category: Uploads
endpoint_count: 4
---

# OpenAI API - Uploads

[[README|Back to Overview]]

---

## POST /uploads

**Create upload**

Creates an intermediate [Upload](https://platform.openai.com/docs/api-reference/uploads/object) object
that you can add [Parts](https://platform.openai.com/docs/api-reference/uploads/part-object) to.
Currently, an Upload can accept at most 8 GB in total and expires after an
hour after you create it.

Once you complete the Upload, we will create a
[File](https://platform.openai.com/docs/api-reference/files/object) object that contains all the parts
you uploaded. This File is usable in the rest of our platform as a regular
File object.

For certain `purpose` values, the correct `mime_type` must be specified. 
Please refer to documentation for the 
[supported MIME types for your use case](https://platform.openai.com/docs/assistants/tools/file-search#supported-files).

For guidance on the proper filename extensions for each purpose, please
follow the documentation on [creating a
File](https://platform.openai.com/docs/api-reference/files/create).


### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/uploads"
```

---

## POST /uploads/{upload_id}/cancel

**Cancel upload**

Cancels the Upload. No Parts may be added after an Upload is cancelled.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `upload_id` | path | string | Yes | The ID of the Upload.
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/uploads/{upload_id}/cancel"
```

---

## POST /uploads/{upload_id}/complete

**Complete upload**

Completes the [Upload](https://platform.openai.com/docs/api-reference/uploads/object). 

Within the returned Upload object, there is a nested [File](https://platform.openai.com/docs/api-reference/files/object) object that is ready to use in the rest of the platform.

You can specify the order of the Parts by passing in an ordered list of the Part IDs.

The number of bytes uploaded upon completion must match the number of bytes initially specified when creating the Upload object. No Parts may be added after an Upload is completed.


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `upload_id` | path | string | Yes | The ID of the Upload.
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/uploads/{upload_id}/complete"
```

---

## POST /uploads/{upload_id}/parts

**Add upload part**

Adds a [Part](https://platform.openai.com/docs/api-reference/uploads/part-object) to an [Upload](https://platform.openai.com/docs/api-reference/uploads/object) object. A Part represents a chunk of bytes from the file you are trying to upload. 

Each Part can be at most 64 MB, and you can add Parts until you hit the Upload maximum of 8 GB.

It is possible to add multiple Parts in parallel. You can decide the intended order of the Parts when you [complete the Upload](https://platform.openai.com/docs/api-reference/uploads/complete).


### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `upload_id` | path | string | Yes | The ID of the Upload.
 |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.openai.com/v1/uploads/{upload_id}/parts"
```

---
