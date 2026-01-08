---
created: 2026-01-08
tags: [type/api-reference, api/revisions]
api_name: Google Drive API
resource: revisions
method_count: 4
---

# Google Drive API - Revisions

[[README|Back to Overview]]

---

## DELETE revisions.delete

**Permanently deletes a file version. You can only delete revisions for files with binary content in Google Drive, like images or videos. Revisions for other files, like Google Docs or Sheets, and the last remaining file version can't be deleted. For more information, see [Manage file revisions](https://developers.google.com/drive/api/guides/manage-revisions).**

**Endpoint:** `DELETE https://www.googleapis.com/drive/v3/files/{fileId}/revisions/{revisionId}`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | The ID of the file. |
| `revisionId` | string | path | Yes | The ID of the revision. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/revisions/{revisionId}"
```

---

## GET revisions.get

**Gets a revision's metadata or content by ID. For more information, see [Manage file revisions](https://developers.google.com/workspace/drive/api/guides/manage-revisions).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/revisions/{revisionId}`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`
- `drive.meet.readonly`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.photos.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `acknowledgeAbuse` | boolean | query | No | Whether the user is acknowledging the risk of downloading kn... |
| `fileId` | string | path | Yes | The ID of the file. |
| `revisionId` | string | path | Yes | The ID of the revision. |

### Response

Schema: `Revision`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/revisions/{revisionId}"
```

---

## GET revisions.list

**Lists a file's revisions. For more information, see [Manage file revisions](https://developers.google.com/workspace/drive/api/guides/manage-revisions). **Important:** The list of revisions returned by this method might be incomplete for files with a large revision history, including frequently edited Google Docs, Sheets, and Slides. Older revisions might be omitted from the response, meaning the first revision returned may not be the oldest existing revision. The revision history visible in the Workspace editor user interface might be more complete than the list returned by the API.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/revisions`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`
- `drive.meet.readonly`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.photos.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | The ID of the file. |
| `pageSize` | integer | query | No | The maximum number of revisions to return per page. |
| `pageToken` | string | query | No | The token for continuing a previous list request on the next... |

### Response

Schema: `RevisionList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/revisions"
```

---

## PATCH revisions.update

**Updates a revision with patch semantics. For more information, see [Manage file revisions](https://developers.google.com/workspace/drive/api/guides/manage-revisions).**

**Endpoint:** `PATCH https://www.googleapis.com/drive/v3/files/{fileId}/revisions/{revisionId}`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | The ID of the file. |
| `revisionId` | string | path | Yes | The ID of the revision. |

### Request Body

Schema: `Revision`

### Response

Schema: `Revision`

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/revisions/{revisionId}"
```

---
