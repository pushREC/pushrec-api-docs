---
source: https://developers.google.com/youtube/v3/docs/videos/getRating
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 YouTube Data API v3: Videos.getRating Documentation

## Overview
The `getRating` method retrieves the ratings that the authorized user gave to a list of specified videos.

## HTTP Request

```
GET https://www.googleapis.com/youtube/v3/videos/getRating
```

## Quota Impact

A single call consumes **1 quota unit**.

## Authorization

This endpoint requires one of these authentication scopes:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Request Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | The `id` parameter specifies a comma-separated list of the YouTube video ID(s) for which rating data is being retrieved. The video resource's `id` property contains this identifier. |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Indicates authorization credentials identifying a YouTube CMS user acting for the specified content owner. Reserved for YouTube content partners managing multiple channels, enabling single authentication for all video and channel data access. The linked CMS account must correspond to the specified YouTube content owner. |

## Request Body

No request body is required when calling this method.

## Response Structure

```json
{
  "kind": "youtube#videoGetRatingResponse",
  "etag": "etag_value",
  "items": [
    {
      "videoId": "string",
      "rating": "string"
    }
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Identifies resource type as `youtube#videoGetRatingResponse` |
| `etag` | string | The Etag of this resource |
| `items[]` | list | Array of ratings matching request criteria |
| `items[].videoId` | string | YouTube's unique video identifier |
| `items[].rating` | string | User's rating value: `dislike`, `like`, `none`, or `unspecified` |

## Errors

The API does not define any error messages that are unique to this API method. However, general API errors are available in the error documentation.
