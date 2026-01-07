---
source: https://developers.google.com/youtube/v3/docs/playlistItems/insert
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: playlistItems
method_name: insert
---

# YouTube Data API v3 - PlaylistItems: insert

## Overview
This endpoint adds a resource to a playlist.

## HTTP Request

```
POST https://www.googleapis.com/youtube/v3/playlistItems
```

## Quota Impact

Each call incurs a quota cost of **50 units**.

## Authorization

The following scopes authorize this operation:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Identifies properties the write operation will set and the API response will include. Supported values: `contentDetails`, `id`, `snippet`, `status` |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube content partners only. Indicates authorization credentials identify a YouTube CMS user acting on behalf of the specified content owner, enabling access to multiple channels without per-channel authentication. |

## Request Body

Provide a `playlistItem` resource with these requirements:

**Required Properties:**
- `snippet.playlistId`
- `snippet.resourceId`

**Optional Properties:**
- `snippet.playlistId`
- `snippet.position`
- `snippet.resourceId`
- `contentDetails.note` (max 280 characters)
- `contentDetails.startAt`
- `contentDetails.endAt`

## Response

Success returns a `playlistItem` resource in the response body.

## Error Codes

| Error Type | Error Detail | Description |
|-----------|--------------|-------------|
| `forbidden (403)` | `playlistContainsMaximumNumberOfVideos` | Playlist has reached maximum item capacity |
| `forbidden (403)` | `playlistItemsNotAccessible` | Request lacks proper authorization for this item |
| `invalidValue (400)` | `invalidContentDetails` | Invalid contentDetails property; note field may exceed 280 characters |
| `invalidValue (400)` | `invalidPlaylistItemPosition` | Position value is invalid or unsupported |
| `invalidValue (400)` | `invalidResourceType` | Specified resource type unsupported for this operation |
| `invalidValue (400)` | `manualSortRequired` | Playlist doesn't use manual sorting; remove position element or adjust playlist settings |
| `invalidValue (400)` | `videoAlreadyInAnotherSeriesPlaylist` | Video already exists in another series playlist |
| `notFound (404)` | `playlistNotFound` | Specified playlist ID not found |
| `notFound (404)` | `videoNotFound` | Video ID invalid or not found |
| `required (400)` | `channelIdRequired` | Missing required `channelId` property |
| `required (400)` | `playlistIdRequired` | Missing required `playlistId` property |
| `required (400)` | `resourceIdRequired` | Request must include `resourceId` in snippet object |
| `invalidValue (400)` | `playlistOperationUnsupported` | Operation unsupported for this playlist type |
