---
created: 2026-01-08
tags: [type/api-reference, api/changes]
api_name: Google Drive API
resource: changes
method_count: 3
---

# Google Drive API - Changes

[[README|Back to Overview]]

---

## GET changes.getStartPageToken

**Gets the starting pageToken for listing future changes. For more information, see [Retrieve changes](https://developers.google.com/workspace/drive/api/guides/manage-changes).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/changes/startPageToken`

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
| `driveId` | string | query | No | The ID of the shared drive for which the starting pageToken ... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `teamDriveId` | string | query | No | Deprecated: Use `driveId` instead. |

### Response

Schema: `StartPageToken`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/changes/startPageToken"
```

---

## GET changes.list

**Lists the changes for a user or shared drive. For more information, see [Retrieve changes](https://developers.google.com/workspace/drive/api/guides/manage-changes).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/changes`

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
| `driveId` | string | query | No | The shared drive from which changes will be returned. If spe... |
| `includeCorpusRemovals` | boolean | query | No | Whether changes should include the file resource if the file... |
| `includeItemsFromAllDrives` | boolean | query | No | Whether both My Drive and shared drive items should be inclu... |
| `includeLabels` | string | query | No | A comma-separated list of IDs of labels to include in the `l... |
| `includePermissionsForView` | string | query | No | Specifies which additional view's permissions to include in ... |
| `includeRemoved` | boolean | query | No | Whether to include changes indicating that items have been r... |
| `includeTeamDriveItems` | boolean | query | No | Deprecated: Use `includeItemsFromAllDrives` instead. |
| `pageSize` | integer | query | No | The maximum number of changes to return per page. |
| `pageToken` | string | query | Yes | The token for continuing a previous list request on the next... |
| `restrictToMyDrive` | boolean | query | No | Whether to restrict the results to changes inside the My Dri... |
| `spaces` | string | query | No | A comma-separated list of spaces to query within the corpora... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `teamDriveId` | string | query | No | Deprecated: Use `driveId` instead. |

### Response

Schema: `ChangeList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/changes"
```

---

## POST changes.watch

**Subscribes to changes for a user. For more information, see [Notifications for resource changes](https://developers.google.com/workspace/drive/api/guides/push).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/changes/watch`

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
| `driveId` | string | query | No | The shared drive from which changes will be returned. If spe... |
| `includeCorpusRemovals` | boolean | query | No | Whether changes should include the file resource if the file... |
| `includeItemsFromAllDrives` | boolean | query | No | Whether both My Drive and shared drive items should be inclu... |
| `includeLabels` | string | query | No | A comma-separated list of IDs of labels to include in the `l... |
| `includePermissionsForView` | string | query | No | Specifies which additional view's permissions to include in ... |
| `includeRemoved` | boolean | query | No | Whether to include changes indicating that items have been r... |
| `includeTeamDriveItems` | boolean | query | No | Deprecated: Use `includeItemsFromAllDrives` instead. |
| `pageSize` | integer | query | No | The maximum number of changes to return per page. |
| `pageToken` | string | query | Yes | The token for continuing a previous list request on the next... |
| `restrictToMyDrive` | boolean | query | No | Whether to restrict the results to changes inside the My Dri... |
| `spaces` | string | query | No | A comma-separated list of spaces to query within the corpora... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `teamDriveId` | string | query | No | Deprecated: Use `driveId` instead. |

### Request Body

Schema: `Channel`

### Response

Schema: `Channel`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/changes/watch"
```

---
