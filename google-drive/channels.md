---
created: 2026-01-08
tags: [type/api-reference, api/channels]
api_name: Google Drive API
resource: channels
method_count: 1
---

# Google Drive API - Channels

[[README|Back to Overview]]

---

## POST channels.stop

**Stops watching resources through this channel. For more information, see [Notifications for resource changes](https://developers.google.com/workspace/drive/api/guides/push).**

**Endpoint:** `POST https://www.googleapis.com/drive/v3/channels/stop`

### Required Scopes

- `drive`
- `drive.appdata`
- `drive.file`
- `drive.meet.readonly`
- `drive.metadata`
- `drive.metadata.readonly`
- `drive.photos.readonly`
- `drive.readonly`

### Request Body

Schema: `Channel`

### Example

```bash
curl -X POST \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  "https://www.googleapis.com/drive/v3/channels/stop"
```

---
