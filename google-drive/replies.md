---
created: 2026-01-08
tags: [type/api-reference, api/replies]
api_name: Google Drive API
resource: replies
method_count: 5
---

# Google Drive API - Replies

[[README|Back to Overview]]

---

## POST replies.create

**Creates a reply to a comment. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `commentId` | string | path | Yes | The ID of the comment. |
| `fileId` | string | path | Yes | The ID of the file. |

### Request Body

Schema: `Reply`

### Response

Schema: `Reply`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies"
```

---

## DELETE replies.delete

**Deletes a reply. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).**

**Endpoint:** `DELETE https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies/{replyId}`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `commentId` | string | path | Yes | The ID of the comment. |
| `fileId` | string | path | Yes | The ID of the file. |
| `replyId` | string | path | Yes | The ID of the reply. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies/{replyId}"
```

---

## GET replies.get

**Gets a reply by ID. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies/{replyId}`

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
| `includeDeleted` | boolean | query | No | Whether to return deleted replies. Deleted replies don't inc... |
| `replyId` | string | path | Yes | The ID of the reply. |

### Response

Schema: `Reply`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies/{replyId}"
```

---

## GET replies.list

**Lists a comment's replies. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies`

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
| `includeDeleted` | boolean | query | No | Whether to include deleted replies. Deleted replies don't in... |
| `pageSize` | integer | query | No | The maximum number of replies to return per page. |
| `pageToken` | string | query | No | The token for continuing a previous list request on the next... |

### Response

Schema: `ReplyList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies"
```

---

## PATCH replies.update

**Updates a reply with patch semantics. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).**

**Endpoint:** `PATCH https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies/{replyId}`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `commentId` | string | path | Yes | The ID of the comment. |
| `fileId` | string | path | Yes | The ID of the file. |
| `replyId` | string | path | Yes | The ID of the reply. |

### Request Body

Schema: `Reply`

### Response

Schema: `Reply`

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/comments/{commentId}/replies/{replyId}"
```

---
