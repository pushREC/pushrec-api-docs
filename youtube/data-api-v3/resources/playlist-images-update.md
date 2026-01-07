---
source: https://developers.google.com/youtube/v3/docs/playlistImages/update
scraped: 2026-01-07
api: YouTube Data API v3
resource: PlaylistImages
method: update
---

# YouTube Data API: PlaylistImages update

## Method Overview

The `playlistImages.update` endpoint allows developers to modify a playlist image through the YouTube API. This operation modifies existing playlist image resources associated with YouTube playlists.

**Quota Cost:** 50 units per request

## HTTP Request

```
PUT https://www.googleapis.com/youtube/v3/playlistImages
```

## Authorization Requirements

Three authentication scopes are accepted for this endpoint:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

Users must authenticate with at least one of these scopes to access the method.

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies a comma-separated list of one or more `playlistImage` resource properties that the API response will include |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Designed for YouTube content partners managing multiple channels. Enables authenticated users to access and manage all content owner data without per-channel credentials. The authenticated account must be linked to the specified content owner. |

## Request Body Schema

The request requires a `playlistImages` resource with these specifications:

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

Upon success, the endpoint returns a `playlistImages` resource in the response body matching the requested resource structure.
