---
source: https://developers.google.com/youtube/v3/docs/playlists/delete
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: playlists
method_name: delete
---

# YouTube Data API v3: Playlists Delete Method Documentation

## Overview
This endpoint removes a playlist from YouTube. The operation requires proper authorization.

## HTTP Request

```
DELETE https://www.googleapis.com/youtube/v3/playlists
```

## Quota Impact

Each request consumes **50 quota units**.

## Authorization

Three OAuth 2.0 scopes are accepted for this operation:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | Specifies the YouTube playlist ID being deleted. This corresponds to the `id` property within a playlist resource. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For authorized requests only. Indicates the CMS user is acting on behalf of a specified content owner. Designed for YouTube partners managing multiple channels. The authenticated CMS account must be linked to the designated content owner. |

## Request Body

No request body should be provided when calling this method.

## Response

Upon successful deletion, the API returns an HTTP `204 No Content` status code with no additional data.

## Error Responses

| HTTP Status | Error Code | Description |
|-------------|-----------|-------------|
| 403 | `playlistForbidden` | The operation lacks proper authorization or credentials are insufficient. |
| 404 | `playlistNotFound` | The playlist specified by the `id` parameter does not exist or cannot be accessed. |
| 400 | `playlistOperationUnsupported` | Deletion is unavailable for this playlist type (e.g., default uploaded videos playlists cannot be deleted). |
