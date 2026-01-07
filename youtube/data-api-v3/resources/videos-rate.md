---
source: https://developers.google.com/youtube/v3/docs/videos/rate
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: videos
method_name: rate
---

# YouTube Data API v3: Videos.rate Method Documentation

## Overview
Add a like or dislike rating to a video or remove a rating from a video. This endpoint allows authenticated users to rate YouTube videos programmatically.

**Important Note:** This does not affect the official like/dislike count of the video.

## HTTP Request Format

```
POST https://www.googleapis.com/youtube/v3/videos/rate
```

## Quota Impact

A call to this method has a quota cost of **50 units**.

## Authentication & Authorization

The following OAuth 2.0 scopes are required:

- `https://www.googleapis.com/auth/youtubepartner`
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`

## Parameters

### Required Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `id` | string | The `id` parameter specifies the YouTube video ID of the video that is being rated or having its rating removed. |
| `rating` | string | Specifies the rating to record. Acceptable values: `like`, `dislike`, `none` |

## Request Body

No request body is required when calling this method.

## Response

Upon success, the API returns an **HTTP 204** status code with no content.

## Error Codes

| HTTP Status | Error Code | Description |
|-------------|-----------|-------------|
| 400 | `emailNotVerified` | User must verify email before rating |
| 400 | `invalidRating` | Unexpected rating parameter value |
| 400 | `videoPurchaseRequired` | Rental videos require purchase |
| 403 | `forbidden` | Video cannot be rated or authorization issue |
| 403 | `videoRatingDisabled` | Owner disabled ratings for this video |
| 404 | `videoNotFound` | Video ID is invalid or video doesn't exist |
