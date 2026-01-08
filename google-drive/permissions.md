---
created: 2026-01-08
tags: [type/api-reference, api/permissions]
api_name: Google Drive API
resource: permissions
method_count: 5
---

# Google Drive API - Permissions

[[README|Back to Overview]]

---

## POST permissions.create

**Creates a permission for a file or shared drive. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing). **Warning:** Concurrent permissions operations on the same file aren't supported; only the last update is applied.**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/files/{fileId}/permissions`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `emailMessage` | string | query | No | A plain text custom message to include in the notification e... |
| `enforceExpansiveAccess` | boolean | query | No | Whether the request should enforce expansive access rules. |
| `enforceSingleParent` | boolean | query | No | Deprecated: See `moveToNewOwnersRoot` for details. |
| `fileId` | string | path | Yes | The ID of the file or shared drive. |
| `moveToNewOwnersRoot` | boolean | query | No | This parameter only takes effect if the item isn't in a shar... |
| `sendNotificationEmail` | boolean | query | No | Whether to send a notification email when sharing to users o... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `transferOwnership` | boolean | query | No | Whether to transfer ownership to the specified user and down... |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator. If set to `true... |

### Request Body

Schema: `Permission`

### Response

Schema: `Permission`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/permissions"
```

---

## DELETE permissions.delete

**Deletes a permission. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing). **Warning:** Concurrent permissions operations on the same file aren't supported; only the last update is applied.**

**Endpoint:** `DELETE https://www.googleapis.com/drive/v3/files/{fileId}/permissions/{permissionId}`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `enforceExpansiveAccess` | boolean | query | No | Whether the request should enforce expansive access rules. |
| `fileId` | string | path | Yes | The ID of the file or shared drive. |
| `permissionId` | string | path | Yes | The ID of the permission. |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator. If set to `true... |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/permissions/{permissionId}"
```

---

## GET permissions.get

**Gets a permission by ID. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/permissions/{permissionId}`

### Required Scopes

- `drive`
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
| `permissionId` | string | path | Yes | The ID of the permission. |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator. If set to `true... |

### Response

Schema: `Permission`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/permissions/{permissionId}"
```

---

## GET permissions.list

**Lists a file's or shared drive's permissions. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/files/{fileId}/permissions`

### Required Scopes

- `drive`
- `drive.file`
- `drive.meet.readonly`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.photos.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `fileId` | string | path | Yes | The ID of the file or shared drive. |
| `includePermissionsForView` | string | query | No | Specifies which additional view's permissions to include in ... |
| `pageSize` | integer | query | No | The maximum number of permissions to return per page. When n... |
| `pageToken` | string | query | No | The token for continuing a previous list request on the next... |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator. If set to `true... |

### Response

Schema: `PermissionList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/permissions"
```

---

## PATCH permissions.update

**Updates a permission with patch semantics. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing). **Warning:** Concurrent permissions operations on the same file aren't supported; only the last update is applied.**

**Endpoint:** `PATCH https://www.googleapis.com/drive/v3/files/{fileId}/permissions/{permissionId}`

### Required Scopes

- `drive`
- `drive.file`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `enforceExpansiveAccess` | boolean | query | No | Whether the request should enforce expansive access rules. |
| `fileId` | string | path | Yes | The ID of the file or shared drive. |
| `permissionId` | string | path | Yes | The ID of the permission. |
| `removeExpiration` | boolean | query | No | Whether to remove the expiration date. |
| `supportsAllDrives` | boolean | query | No | Whether the requesting application supports both My Drives a... |
| `supportsTeamDrives` | boolean | query | No | Deprecated: Use `supportsAllDrives` instead. |
| `transferOwnership` | boolean | query | No | Whether to transfer ownership to the specified user and down... |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator. If set to `true... |

### Request Body

Schema: `Permission`

### Response

Schema: `Permission`

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/files/{fileId}/permissions/{permissionId}"
```

---
