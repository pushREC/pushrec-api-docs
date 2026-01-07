---
source: https://developers.google.com/youtube/v3/docs/playlistItems/update
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: playlistItems
method_name: update
---

# YouTube Data API v3 - PlaylistItems: update

## Overview

This endpoint modifies a playlist item, enabling updates to properties such as item position within the playlist.

## HTTP Request

```
PUT https://www.googleapis.com/youtube/v3/playlistItems
```

## Quota Impact

A call to this method has a quota cost of **50 units**.

## Authorization

This operation requires at least one of these authentication scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Identifies the properties that the write operation will set as well as the properties that the API response will include. Permitted values: `contentDetails`, `id`, `snippet`, `status` |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Intended exclusively for YouTube content partners - allows authenticated users affiliated with a content owner to access and manage all associated video and channel data without per-channel authentication. |

## Request Body

A `playlistItem` resource must be provided with:

**Required Properties:**
- `id`
- `snippet.playlistId`
- `snippet.resourceId`

**Updatable Properties:**
- `snippet.position`
- `contentDetails.note`
- `contentDetails.startAt`
- `contentDetails.endAt`

**Important:** If you are submitting an update request, and your request does not specify a value for a property that already has a value, the property's existing value will be deleted.

## Response

A successful request returns a `playlistItem` resource in the response body.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|-----------|-------------|
| 403 | `playlistItemsNotAccessible` | Request lacks proper authorization |
| 400 | `invalidPlaylistItemPosition` | Position value is invalid or unsupported |
| 400 | `invalidResourceType` | Resource type not supported for this operation |
| 400 | `invalidSnippet` | Missing or invalid snippet property |
| 400 | `manualSortRequired` | Playlist does not use manual sorting - remove position element or update playlist settings |
| 404 | `playlistItemNotFound` | Specified playlist item cannot be located |
| 404 | `playlistNotFound` | Specified playlist cannot be located |
| 400 | `channelIdRequired` | Missing required channelId property |
| 400 | `playlistIdRequired` | Missing required playlistId property |
| 400 | `playlistItemIdRequired` | Must use id property to identify item being updated |
| 400 | `playlistOperationUnsupported` | API does not support updates for this playlist type |
