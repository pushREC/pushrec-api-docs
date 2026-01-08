---
created: 2026-01-08
tags: [type/api-reference, api/drives]
api_name: Google Drive API
resource: drives
method_count: 7
---

# Google Drive API - Drives

[[README|Back to Overview]]

---

## POST drives.create

**Creates a shared drive. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/drives`

### Required Scopes

- `drive`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `requestId` | string | query | Yes | Required. An ID, such as a random UUID, which uniquely ident... |

### Request Body

Schema: `Drive`

### Response

Schema: `Drive`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/drives"
```

---

## DELETE drives.delete

**Permanently deletes a shared drive for which the user is an `organizer`. The shared drive cannot contain any untrashed items. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).**

**Endpoint:** `DELETE https://www.googleapis.com/drive/v3/drives/{driveId}`

### Required Scopes

- `drive`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `allowItemDeletion` | boolean | query | No | Whether any items inside the shared drive should also be del... |
| `driveId` | string | path | Yes | The ID of the shared drive. |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator; if set to true,... |

### Example

```bash
curl -X DELETE \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/drives/{driveId}"
```

---

## GET drives.get

**Gets a shared drive's metadata by ID. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/drives/{driveId}`

### Required Scopes

- `drive`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `driveId` | string | path | Yes | The ID of the shared drive. |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator; if set to true,... |

### Response

Schema: `Drive`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/drives/{driveId}"
```

---

## POST drives.hide

**Hides a shared drive from the default view. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/drives/{driveId}/hide`

### Required Scopes

- `drive`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `driveId` | string | path | Yes | The ID of the shared drive. |

### Response

Schema: `Drive`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/drives/{driveId}/hide"
```

---

## GET drives.list

** Lists the user's shared drives. This method accepts the `q` parameter, which is a search query combining one or more search terms. For more information, see the [Search for shared drives](/workspace/drive/api/guides/search-shareddrives) guide.**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/drives`

### Required Scopes

- `drive`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `pageSize` | integer | query | No | Maximum number of shared drives to return per page. |
| `pageToken` | string | query | No | Page token for shared drives. |
| `q` | string | query | No | Query string for searching shared drives. |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator; if set to true,... |

### Response

Schema: `DriveList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/drives"
```

---

## POST drives.unhide

**Restores a shared drive to the default view. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/drives/{driveId}/unhide`

### Required Scopes

- `drive`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `driveId` | string | path | Yes | The ID of the shared drive. |

### Response

Schema: `Drive`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/drives/{driveId}/unhide"
```

---

## PATCH drives.update

**Updates the metadata for a shared drive. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).**

**Endpoint:** `PATCH https://www.googleapis.com/drive/v3/drives/{driveId}`

### Required Scopes

- `drive`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `driveId` | string | path | Yes | The ID of the shared drive. |
| `useDomainAdminAccess` | boolean | query | No | Issue the request as a domain administrator; if set to true,... |

### Request Body

Schema: `Drive`

### Response

Schema: `Drive`

### Example

```bash
curl -X PATCH \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/drives/{driveId}"
```

---
