---
created: 2026-01-08
tags: [type/api-reference, api/files]
api_name: Google Drive API
resource: files
method_count: 13
---

# Google Drive API - Files

[[README|Back to Overview]]

---

## POST files.copy

**Creates a copy of a file and applies any requested updates with patch semantics. For more information, see [Create and manage files](https://developers.google.com/workspace/drive/api/guides/create-file).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/files/{fileId}/copy`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`
- `drive.photos.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `enforceSingleParent` | boolean | query | No | Deprecated: Copying files into multiple folders is no longer... |
| `fileId` | string | path | Yes | The ID of the file. |
| `ignoreDefaultVisibility` | boolean | query | No | Whether to ignore the domain's default visibility settings f... |
| `includeLabels` | string | query | No | A comma-separated list of IDs of labels to include in the `l... |
| `includePermissionsForView` | string | query | No | Specifies which additional view's permissions to include in ... |
| `keepRevisionForever` | boolean | query | No | Whether to set the `keepForever` field in the new head revis... |
| `ocrLanguage` | string | query | No | A language hint for OCR processing during image import (ISO ... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |

### Request Body

Schema: `File`

### Response

Schema: `File`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/copy"
```

---

## POST files.create

** Creates a file. For more information, see [Create and manage files](/workspace/drive/api/guides/create-file). This method supports an */upload* URI and accepts uploaded media with the following characteristics: - *Maximum file size:* 5,120 GB - *Accepted Media MIME types:* `*/*` (Specify a valid MIME type, rather than the literal `*/*` value. The literal `*/*` is only used to indicate that any valid MIME type can be uploaded. For more information, see [Google Workspace and Google Drive supported MIME types](/workspace/drive/api/guides/mime-types).) For more information on uploading files, see [Upload file data](/workspace/drive/api/guides/manage-uploads). Apps creating shortcuts with the `create` method must specify the MIME type `application/vnd.google-apps.shortcut`. Apps should specify a file extension in the `name` property when inserting files with the API. For example, an operation to insert a JPEG file should specify something like `"name": "cat.jpg"` in the metadata. Subsequent `GET` requests include the read-only `fileExtension` property populated with the extension originally specified in the `name` property. When a Google Drive user requests to download a file, or when the file is downloaded through the sync client, Drive builds a full filename (with extension) based on the name. In cases where the extension is missing, Drive attempts to determine the extension based on the file's MIME type.**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/files`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `enforceSingleParent` | boolean | query | No | Deprecated: Creating files in multiple folders is no longer ... |
| `ignoreDefaultVisibility` | boolean | query | No | Whether to ignore the domain's default visibility settings f... |
| `includeLabels` | string | query | No | A comma-separated list of IDs of labels to include in the `l... |
| `includePermissionsForView` | string | query | No | Specifies which additional view's permissions to include in ... |
| `keepRevisionForever` | boolean | query | No | Whether to set the `keepForever` field in the new head revis... |
| `ocrLanguage` | string | query | No | A language hint for OCR processing during image import (ISO ... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `useContentAsIndexableText` | boolean | query | No | Whether to use the uploaded content as indexable text. |

### Request Body

Schema: `File`

### Response

Schema: `File`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files"
```

---

## DELETE files.delete

**Permanently deletes a file owned by the user without moving it to the trash. For more information, see [Trash or delete files and folders](https://developers.google.com/workspace/drive/api/guides/delete). If the file belongs to a shared drive, the user must be an `organizer` on the parent folder. If the target is a folder, all descendants owned by the user are also deleted.**

**Endpoint:** `DELETE https://www.googleapis.com/drive/v3/files/{fileId}`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `enforceSingleParent` | boolean | query | No | Deprecated: If an item isn't in a shared drive and its last ... |
| `fileId` | string | path | Yes | The ID of the file. |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}"
```

---

## POST files.download

**Downloads the content of a file. For more information, see [Download and export files](https://developers.google.com/workspace/drive/api/guides/manage-downloads). Operations are valid for 24 hours from the time of creation.**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/files/{fileId}/download`

### Required Scopes

- `drive`
- `drive.file`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | Required. The ID of the file to download. |
| `mimeType` | string | query | No | Optional. The MIME type the file should be downloaded as. Th... |
| `revisionId` | string | query | No | Optional. The revision ID of the file to download. This fiel... |

### Response

Schema: `Operation`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/download"
```

---

## DELETE files.emptyTrash

**Permanently deletes all of the user's trashed files. For more information, see [Trash or delete files and folders](https://developers.google.com/workspace/drive/api/guides/delete).**

**Endpoint:** `DELETE https://www.googleapis.com/drive/v3/files/trash`

### Required Scopes

- `drive`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `driveId` | string | query | No | If set, empties the trash of the provided shared drive. |
| `enforceSingleParent` | boolean | query | No | Deprecated: If an item isn't in a shared drive and its last ... |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/trash"
```

---

## GET files.export

**Exports a Google Workspace document to the requested MIME type and returns exported byte content. For more information, see [Download and export files](https://developers.google.com/workspace/drive/api/guides/manage-downloads). Note that the exported content is limited to 10 MB.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/export`

### Required Scopes

- `drive`
- `drive.file`
- `drive.meet.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | The ID of the file. |
| `mimeType` | string | query | Yes | Required. The MIME type of the format requested for this exp... |

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/export"
```

---

## GET files.generateIds

**Generates a set of file IDs which can be provided in create or copy requests. For more information, see [Create and manage files](https://developers.google.com/workspace/drive/api/guides/create-file).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/generateIds`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `count` | integer | query | No | The number of IDs to return. |
| `space` | string | query | No | The space in which the IDs can be used to create files. Supp... |
| `type` | string | query | No | The type of items which the IDs can be used for. Supported v... |

### Response

Schema: `GeneratedIds`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/generateIds"
```

---

## GET files.get

** Gets a file's metadata or content by ID. For more information, see [Search for files and folders](/workspace/drive/api/guides/search-files). If you provide the URL parameter `alt=media`, then the response includes the file contents in the response body. Downloading content with `alt=media` only works if the file is stored in Drive. To download Google Docs, Sheets, and Slides use [`files.export`](/workspace/drive/api/reference/rest/v3/files/export) instead. For more information, see [Download and export files](/workspace/drive/api/guides/manage-downloads).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}`

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
| `includeLabels` | string | query | No | A comma-separated list of IDs of labels to include in the `l... |
| `includePermissionsForView` | string | query | No | Specifies which additional view's permissions to include in ... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |

### Response

Schema: `File`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}"
```

---

## GET files.list

** Lists the user's files. For more information, see [Search for files and folders](/workspace/drive/api/guides/search-files). This method accepts the `q` parameter, which is a search query combining one or more search terms. This method returns *all* files by default, including trashed files. If you don't want trashed files to appear in the list, use the `trashed=false` query parameter to remove trashed files from the results.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files`

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
| `corpora` | string | query | No | Bodies of items (files or documents) to which the query appl... |
| `corpus` | string | query | No | Deprecated: The source of files to list. Use `corpora` inste... |
| `driveId` | string | query | No | ID of the shared drive to search. |
| `includeItemsFromAllDrives` | boolean | query | No | Whether both My Drive and shared drive items should be inclu... |
| `includeLabels` | string | query | No | A comma-separated list of IDs of labels to include in the `l... |
| `includePermissionsForView` | string | query | No | Specifies which additional view's permissions to include in ... |
| `includeTeamDriveItems` | boolean | query | No | Deprecated: Use `includeItemsFromAllDrives` instead. |
| `orderBy` | string | query | No | A comma-separated list of sort keys. Valid keys are: * `crea... |
| `pageSize` | integer | query | No | The maximum number of files to return per page. Partial or e... |
| `pageToken` | string | query | No | The token for continuing a previous list request on the next... |
| `q` | string | query | No | A query for filtering the file results. For supported syntax... |
| `spaces` | string | query | No | A comma-separated list of spaces to query within the corpora... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `teamDriveId` | string | query | No | Deprecated: Use `driveId` instead. |

### Response

Schema: `FileList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files"
```

---

## GET files.listLabels

**Lists the labels on a file. For more information, see [List labels on a file](https://developers.google.com/workspace/drive/api/guides/list-labels).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/listLabels`

### Required Scopes

- `drive`
- `drive.file`
- `drive.meet.readonly`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | The ID for the file. |
| `maxResults` | integer | query | No | The maximum number of labels to return per page. When not se... |
| `pageToken` | string | query | No | The token for continuing a previous list request on the next... |

### Response

Schema: `LabelList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/listLabels"
```

---

## POST files.modifyLabels

**Modifies the set of labels applied to a file. For more information, see [Set a label field on a file](https://developers.google.com/workspace/drive/api/guides/set-label). Returns a list of the labels that were added or modified.**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/files/{fileId}/modifyLabels`

### Required Scopes

- `drive`
- `drive.file`
- `drive.metadata`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | The ID of the file to which the labels belong. |

### Request Body

Schema: `ModifyLabelsRequest`

### Response

Schema: `ModifyLabelsResponse`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/modifyLabels"
```

---

## PATCH files.update

** Updates a file's metadata, content, or both. When calling this method, only populate fields in the request that you want to modify. When updating fields, some fields might be changed automatically, such as `modifiedDate`. This method supports patch semantics. This method supports an */upload* URI and accepts uploaded media with the following characteristics: - *Maximum file size:* 5,120 GB - *Accepted Media MIME types:* `*/*` (Specify a valid MIME type, rather than the literal `*/*` value. The literal `*/*` is only used to indicate that any valid MIME type can be uploaded. For more information, see [Google Workspace and Google Drive supported MIME types](/workspace/drive/api/guides/mime-types).) For more information on uploading files, see [Upload file data](/workspace/drive/api/guides/manage-uploads).**

**Endpoint:** `PATCH https://www.googleapis.com/drive/v3/files/{fileId}`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`
- `drive.metadata`
- `drive.scripts`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `addParents` | string | query | No | A comma-separated list of parent IDs to add. |
| `enforceSingleParent` | boolean | query | No | Deprecated: Adding files to multiple folders is no longer su... |
| `fileId` | string | path | Yes | The ID of the file. |
| `includeLabels` | string | query | No | A comma-separated list of IDs of labels to include in the `l... |
| `includePermissionsForView` | string | query | No | Specifies which additional view's permissions to include in ... |
| `keepRevisionForever` | boolean | query | No | Whether to set the `keepForever` field in the new head revis... |
| `ocrLanguage` | string | query | No | A language hint for OCR processing during image import (ISO ... |
| `removeParents` | string | query | No | A comma-separated list of parent IDs to remove. |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `useContentAsIndexableText` | boolean | query | No | Whether to use the uploaded content as indexable text. |

### Request Body

Schema: `File`

### Response

Schema: `File`

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}"
```

---

## POST files.watch

**Subscribes to changes to a file. For more information, see [Notifications for resource changes](https://developers.google.com/workspace/drive/api/guides/push).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/files/{fileId}/watch`

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
| `includeLabels` | string | query | No | A comma-separated list of IDs of labels to include in the `l... |
| `includePermissionsForView` | string | query | No | Specifies which additional view's permissions to include in ... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |

### Request Body

Schema: `Channel`

### Response

Schema: `Channel`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/watch"
```

---
