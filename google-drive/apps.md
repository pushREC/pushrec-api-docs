---
created: 2026-01-08
tags: [type/api-reference, api/apps]
api_name: Google Drive API
resource: apps
method_count: 2
---

# Google Drive API - Apps

[[README|Back to Overview]]

---

## GET apps.get

**Gets a specific app. For more information, see [Return user info](https://developers.google.com/workspace/drive/api/guides/user-info).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/apps/{appId}`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.apps.readonly`
- `drive.file`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `appId` | string | path | Yes | The ID of the app. |

### Response

Schema: `App`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/apps/{appId}"
```

---

## GET apps.list

**Lists a user's installed apps. For more information, see [Return user info](https://developers.google.com/workspace/drive/api/guides/user-info).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/apps`

### Required Scopes

- `drive.apps.readonly`

### Parameters

| Name | Type | Location | Required | Description |
|------|------|----------|----------|-------------|
| `appFilterExtensions` | string | query | No | A comma-separated list of file extensions to limit returned ... |
| `appFilterMimeTypes` | string | query | No | A comma-separated list of file extensions to limit returned ... |
| `languageCode` | string | query | No | A language or locale code, as defined by BCP 47, with some e... |

### Response

Schema: `AppList`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/apps"
```

---
