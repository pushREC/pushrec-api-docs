---
source: https://developers.google.com/youtube/v3/docs/playlistImages/insert
scraped: 2026-01-07
api: YouTube Data API v3
resource: PlaylistImages
method: insert
---

# YouTube Data API: PlaylistImages insert

## Method Overview

This API endpoint enables developers to add images to YouTube playlists.

**Quota Cost:** 50 units per request

## File Upload Requirements

- **Maximum file size:** 2MB
- **Aspect ratio:** 1:1 (square images only)
- **Accepted MIME types:** `image/jpeg`, `image/png`

## HTTP Request

```
POST https://www.googleapis.com/youtube/v3/playlistImages
```

## Authorization Scopes

Choose at least one of these scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Query Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Comma-separated list of `playlistImage` resource properties to include in the response |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube content partners; indicates the CMS user is acting on behalf of a specified content owner |
| `onBehalfOfContentOwnerChannel` | string | Required when using `onBehalfOfContentOwner`; specifies the YouTube channel ID for the operation |

## Request Body Schema

The request body must contain a `playlistImages` resource with:

### Required Properties

| Property | Description |
|----------|-------------|
| `snippet.playlistId` | The playlist identifier |
| `snippet.type` | The image type classification |

### Optional Properties

| Property | Description |
|----------|-------------|
| `snippet.width` | Image width dimension |
| `snippet.height` | Image height dimension |

## Response

On success, the API returns a `playlistImages` resource in the response body containing the newly created playlist image metadata.

## Additional Notes

Content partners can utilize the `onBehalfOfContentOwner` parameter to authenticate once and get access to all their video and channel data across multiple managed channels without repeating credentials per channel.
