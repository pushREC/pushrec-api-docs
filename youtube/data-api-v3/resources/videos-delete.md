---
source: https://developers.google.com/youtube/v3/docs/videos/delete
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: videos
method_name: delete
---

# YouTube Data API v3: Videos Delete Method Documentation

## Overview
Removes a YouTube video from the platform.

## HTTP Request Format

```
DELETE https://www.googleapis.com/youtube/v3/videos
```

## Quota Impact

Each call consumes **50 quota units**.

## Authorization Requirements

The following authentication scopes are accepted:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | The `id` parameter specifies the YouTube video ID for the resource that is being deleted. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Enables YouTube CMS users to act on behalf of specified content owners. This parameter is intended exclusively for YouTube content partners. Allows authentication once for access to all video and channel data across multiple channels. The authenticated account must be linked to the specified YouTube content owner. |

## Request Body

No request body should be provided when calling this method.

## Response

**Success Response:**
- HTTP Status Code: `204 No Content`

## Error Codes

| Error Type | Error Detail | Description |
|------------|--------------|-------------|
| `403` | `forbidden` | The video that you are trying to delete cannot be deleted. The request might not be properly authorized. |
| `404` | `videoNotFound` | The video that you are trying to delete cannot be found. Check the value of the request's `id` parameter. |
