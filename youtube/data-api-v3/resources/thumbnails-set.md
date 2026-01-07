---
source: https://developers.google.com/youtube/v3/docs/thumbnails/set
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: set
---
 YouTube Data API: Thumbnails set

## Overview

This endpoint enables uploading a custom video thumbnail to YouTube and assigning it to a video. The method supports media uploads with specific constraints.

**Quota Cost:** approximately 50 units per request

## File Upload Requirements

- **Maximum file size:** 2MB
- **Accepted MIME types:** `image/jpeg`, `image/png`, `application/octet-stream`

## HTTP Request

```
POST https://www.googleapis.com/upload/youtube/v3/thumbnails/set
```

## Authorization

This operation requires one of these OAuth 2.0 scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube.upload`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `videoId` | string | The videoId parameter specifies a YouTube video ID for which the custom video thumbnail is being provided |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube content partners; indicates CMS user authentication on behalf of specified content owner. This parameter is intended for YouTube content partners that own and manage many different YouTube channels |

## Request Body

The request body contains the raw thumbnail image being uploaded. No structured resource object is included.

## Response Body

```json
{
  "kind": "youtube#thumbnailSetResponse",
  "etag": "etag_value",
  "items": [
    { "thumbnail resource" }
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Identifies the API resource's type. The value will be `youtube#thumbnailSetResponse` |
| `etag` | etag | The Etag of this resource |
| `items[]` | list | A list of thumbnails |

## Error Responses

| HTTP Status | Error Code | Description |
|-------------|-----------|-------------|
| 400 | `invalidImage` | The provided image content is invalid |
| 400 | `mediaBodyRequired` | The request does not include the image content |
| 403 | `forbidden` | Thumbnail cannot be set; authorization issue or insufficient permissions |
| 404 | `videoNotFound` | The video that you are trying to insert a thumbnail image for cannot be found |
| 429 | `uploadRateLimitExceeded` | The channel has uploaded too many thumbnails recently. Please try the request again later |
