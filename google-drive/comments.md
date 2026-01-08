---
created: 2026-01-08
tags: [type/api-reference, api/comments]
api_name: Google Drive API
resource: comments
method_count: 5
---

# Google Drive API - Comments

[[README|Back to Overview]]

---

## POST comments.create

**Creates a comment on a file. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/files/{fileId}/comments`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | The ID of the file. |

### Request Body

Schema: `Comment`

### Response

Schema: `Comment`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments"
```

---

## DELETE comments.delete

**Deletes a comment. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).**

**Endpoint:** `DELETE https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `commentId` | string | path | Yes | The ID of the comment. |
| `fileId` | string | path | Yes | The ID of the file. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}"
```

---

## GET comments.get

**Gets a comment by ID. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}`

### Required Scopes

- `drive`
- `drive.file`
- `drive.meet.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `commentId` | string | path | Yes | The ID of the comment. |
| `fileId` | string | path | Yes | The ID of the file. |
| `includeDeleted` | boolean | query | No | Whether to return deleted comments. Deleted comments will no... |

### Response

Schema: `Comment`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}"
```

---

## GET comments.list

**Lists a file's comments. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/comments`

### Required Scopes

- `drive`
- `drive.file`
- `drive.meet.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | The ID of the file. |
| `includeDeleted` | boolean | query | No | Whether to include deleted comments. Deleted comments will n... |
| `pageSize` | integer | query | No | The maximum number of comments to return per page. |
| `pageToken` | string | query | No | The token for continuing a previous list request on the next... |
| `startModifiedTime` | string | query | No | The minimum value of 'modifiedTime' for the result comments ... |

### Response

Schema: `CommentList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments"
```

---

## PATCH comments.update

**Updates a comment with patch semantics. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).**

**Endpoint:** `PATCH https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `commentId` | string | path | Yes | The ID of the comment. |
| `fileId` | string | path | Yes | The ID of the file. |

### Request Body

Schema: `Comment`

### Response

Schema: `Comment`

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}"
```

---
