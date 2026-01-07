---
source: https://developers.google.com/youtube/v3/docs/watermarks/unset
scraped: 2026-01-07
api: YouTube Data API v3
resource: Watermarks
method: unset
---

# YouTube Data API: Watermarks unset

## Method Overview

This endpoint removes a watermark image from a specified YouTube channel.

**Quota Cost:** 50 units per request

## HTTP Request

```
POST https://www.googleapis.com/youtube/v3/watermarks/unset
```

## Authorization Scopes

This endpoint requires one of the following OAuth 2.0 scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `channelId` | string | Specifies the YouTube channel ID from which the watermark will be removed |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | For YouTube content partners only. Identifies a CMS user acting on behalf of a content owner. Enables single authentication for managing multiple channels |

## Request Body

No request body should be provided when calling this method.

## Response

**Success Status:** HTTP `204 No Content`

The API returns no response body upon successful watermark removal.

## Error Responses

| Error Type | Code | Description |
|-----------|------|-------------|
| Forbidden | 403 | The watermark can't be unset for the specified channel - typically caused by improper authorization or invalid `channelId` |
