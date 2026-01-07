---
source: https://developers.google.com/youtube/v3/docs/watermarks/set
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: set
---
 YouTube Data API: Watermarks set

## Overview

The `watermarks.set` method allows developers to upload a watermark image to YouTube and apply it to a specific channel. This endpoint handles image upload and configuration.

**Quota Cost:** 50 units per request

## HTTP Request

```
POST https://www.googleapis.com/upload/youtube/v3/watermarks/set
```

**Request Type:** Media upload with multipart form data

## Upload Constraints

- **Maximum file size:** 10MB
- **Accepted MIME types:** `image/jpeg`, `image/png`, `application/octet-stream`

## Authorization Scopes

At least one of the following scopes is required:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube.upload`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `channelId` | string | The `channelId` parameter specifies the YouTube channel ID for which the watermark is being provided. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube content partners only. Indicates authorization credentials identify a CMS user acting on behalf of the specified content owner. |

## Request Body

The request body must contain a watermark resource with the image content.

## Response

**Success Status:** HTTP `204 No Content`

No response body is returned on successful execution.

## Error Responses

| Error Code | Error Detail | Description |
|-----------|--------------|-------------|
| 400 | `imageFormatUnsupported` | Image format not supported (use JPEG or PNG) |
| 400 | `imageTooTall` | Image height exceeds maximum dimensions |
| 400 | `imageTooWide` | Image width exceeds maximum dimensions |
| 400 | `mediaBodyRequired` | Request missing image content |
| 403 | `forbidden` | Channel authorization failed or invalid `channelId` |
