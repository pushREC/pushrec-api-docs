---
created: 2026-01-08
tags: [type/api-reference, api/about]
api_name: Google Drive API
resource: about
method_count: 1
---

# Google Drive API - About

[[README|Back to Overview]]

---

## GET about.get

**Gets information about the user, the user's Drive, and system capabilities. For more information, see [Return user info](https://developers.google.com/workspace/drive/api/guides/user-info). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).**

**Endpoint:** `GET https://www.googleapis.com/drive/v3/about`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.photos.readonly`
- `drive.readonly`

### Response

Schema: `About`

### Example

```bash
curl -X GET \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/about"
```

---
