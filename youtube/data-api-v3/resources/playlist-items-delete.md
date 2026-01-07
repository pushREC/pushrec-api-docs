---
source: https://developers.google.com/youtube/v3/docs/playlistItems/delete
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 YouTube Data API v3 - PlaylistItems: delete

## Overview

This endpoint removes a specified playlist item from a YouTube playlist.

## HTTP Request

```
DELETE https://www.googleapis.com/youtube/v3/playlistItems
```

## Quota Impact

A call to this method has a quota cost of **50 units**.

## Authorization

The following OAuth 2.0 scopes are required:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Name | Type | Description |
|------|------|-------------|
| `id` | string | Specifies the YouTube playlist item ID being deleted. This value comes from the `id` property of a `playlistItem` resource. |

### Optional Parameters

| Name | Type | Description |
|------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube partners managing multiple channels, this parameter enables authentication once for all content owner operations. The authenticated user must have authorization from the specified content owner through YouTube Creator Studio. |

## Request Body

No request body is required for this method.

## Response

**Success Status:** HTTP `204 No Content`

Successful deletion returns no response content, only the status code indicating completion.

## Error Responses

| HTTP Status | Error Type | Description |
|------------|-----------|-------------|
| 403 | `playlistItemsNotAccessible` | Authorization insufficient to delete the requested item. |
| 404 | `playlistItemNotFound` | The specified playlist item ID does not exist. |
| 400 | `playlistOperationUnsupported` | The API cannot delete from this playlist type (e.g., uploaded videos playlist). |
