---
source: https://developers.google.com/youtube/v3/docs/playlistImages/delete
scraped: 2026-01-07
api: YouTube Data API v3
resource: PlaylistImages
method: delete
---

# YouTube Data API: PlaylistImages delete

## Method Overview

The `playlistImages.delete` method removes a playlist image from YouTube. This operation requires proper authorization.

**Quota Cost:** 50 units per request

## HTTP Request

```
DELETE https://www.googleapis.com/youtube/v3/playlistImages
```

## Authorization Requirements

This endpoint requires authorization with at least one of these scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | The `id` parameter specifies the YouTube playlist image ID for the playlist image that is being deleted. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube content partners managing multiple channels, this parameter identifies a content owner and enables authenticated users to manage all associated content without per-channel credentials. The account that the user authenticates with must be linked to the specified content owner in the YouTube Creator Studio settings. |

## Request Body

No request body is required for this method.

## Response

**Success Response:** HTTP `204 (No Content)`

If the deletion succeeds, the API returns a 204 status code with no response body.
