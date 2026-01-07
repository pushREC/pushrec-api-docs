---
source: https://developers.google.com/youtube/v3/docs/captions/insert
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Captions: insert

Uploads a new caption track to a YouTube video.

## HTTP Request

```
POST https://www.googleapis.com/upload/youtube/v3/captions
```

## Quota Cost

**400 units** per call

## Authorization

Required scope (choose one):
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtubepartner`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Must be set to `snippet`; specifies response content |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube partners acting on behalf of content owners |
| `sync` | boolean | **Deprecated.** Controls auto-synchronization with audio |

## Request Body

The caption resource must include:

### Required Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.videoId` | string | YouTube video ID to associate caption with |
| `snippet.language` | string | BCP-47 language code for the caption track |
| `snippet.name` | string | Display name for the caption track (max 150 characters) |

### Optional Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.isDraft` | boolean | Set to `true` to mark as draft (not publicly visible) |

## Media Upload

### Constraints

| Constraint | Value |
|------------|-------|
| Maximum file size | 100 MB |
| Accepted MIME types | `text/xml`, `application/octet-stream`, `*/*` |

### Supported Caption Formats

- SubRip (.srt)
- SubViewer (.sbv)
- TTML (.ttml)
- WebVTT (.vtt)

## Response

Returns a caption resource object upon successful upload.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | `contentRequired` | Missing caption track contents |
| 400 | `nameTooLong` | Name exceeds 150 characters |
| 400 | `invalidMetadata` | Request contains invalid metadata |
| 403 | `forbidden` | Insufficient permissions |
| 404 | `videoNotFound` | Invalid video ID |
| 409 | `captionExists` | Duplicate language/name combination already exists |

## Example Request

```
POST https://www.googleapis.com/upload/youtube/v3/captions?part=snippet
Content-Type: application/json

{
  "snippet": {
    "videoId": "VIDEO_ID",
    "language": "en",
    "name": "English Subtitles",
    "isDraft": false
  }
}
```

## Notes

- The `sync` parameter was deprecated on March 13, 2024
- Auto-syncing is still available through YouTube Creator Studio
- Caption track names must be unique per language for a given video
