---
created: 2026-01-09
tags: [type/api-reference, api/attachments]
api_name: Asana
category: Attachments
endpoint_count: 4
---

# Asana - Attachments

[[README|Back to Overview]]

---

## GET /attachments/{attachment_gid}

**Get an attachment**

<b>Required scope: </b><code>attachments:read</code>

Get the full record for a single attachment.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/attachments/{attachment_gid}"
```

---

## DELETE /attachments/{attachment_gid}

**Delete an attachment**

<b>Required scope: </b><code>attachments:delete</code>

Deletes a specific, existing attachment.

Returns an empty data record.

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/attachments/{attachment_gid}"
```

---

## GET /attachments

**Get attachments from an object**

<b>Required scope: </b><code>attachments:read</code>

Returns the compact records for all attachments on the object.
There are three possible `parent` values for this request: `project`, `project_brief`, and `task`. For a project, an attachment refers to a file uploaded to the "Key resources" section in the project Overview. For a project brief, an attachment refers to inline files in the project brief itself. For a task, an attachment refers to a file directly associated to that task.

Note that within the Asana app, inline images in the task description do not appear in the index of image thumbnails nor as stories in the task. However, requests made to `GET /attachments` for a task will return all of the images in the task, including inline images.

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `` | query | string | No |  |
| `` | query | string | No |  |
| `parent` | query | string | Yes | Globally unique identifier for object to fetch sta |
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/attachments"
```

---

## POST /attachments

**Upload an attachment**

<b>Required scope: </b><code>attachments:write</code>

Upload an attachment.

This method uploads an attachment on an object and returns the compact
record for the created attachment object. This is possible by either:

- Providing the URL of the external resource being attached, or
- Downloading the file content first and then uploading it as any other attachment. Note that it is not possible to attach
files from third party services such as Dropbox, Box, Vimeo & Google Drive via the API

The 100MB size limit on attachments in Asana is enforced on this endpoint.

This endpoint expects a multipart/form-data encoded request containing the full contents of the file to be uploaded.

Requests made should follow the HTTP/1.1 specification that line
terminators are of the form `CRLF` or `\r\n` outlined
[here](http://www.w3.org/Protocols/HTTP/1.1/draft-ietf-http-v11-spec-01#Basic-Rules) in order for the server to reliably and properly handle the request.

For file names that contain non-ASCII characters, the file name should be URL-encoded. For example, a file named `résumé.pdf` should be encoded as
`r%C3%A9sum%C3%A9.pdf` and the `filename` parameter in the `Content-Disposition` header should be set to the encoded file name.

Below is an example of a cURL request with the `Content-Disposition` header:

```
export ASANA_PAT="<YOUR_ASANA_PERSONAL_ACCESS_TOKEN>"
export PARENT_ID="<PARENT_GID>"
export ENCODED_NAME="r%C3%A9sum%C3%A9.pdf"
curl --location 'https://app.asana.com/api/1.0/attachments' \
  --header 'Content-Type: multipart/form-data' \
  --header 'Accept: application/json' \
  --header "Authorization: Bearer $ASANA_PAT" \
  --form "parent=$PARENT_ID" \
  --form "file=@/Users/exampleUser/Downloads/résumé.pdf;headers=\"Content-Disposition: form-data; name="file"; filename="$ENCODED_NAME.pdf"; filename*=UTF-8''$ENCODED_NAME.pdf\""
```

### Parameters

| Name | In | Type | Required | Description |
|------|-----|------|----------|-------------|
| `opt_fields` | query | array | No | This endpoint returns a resource which excludes so |

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  "https://app.asana.com/api/1.0/attachments"
```

---
