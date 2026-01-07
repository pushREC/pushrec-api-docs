---
source: https://developers.google.com/youtube/v3/guides/implementation/videos
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
category: guides
method: webfetch
---
 YouTube Data API v3: Videos Implementation Guide

## Overview

This guide covers video-related operations using the YouTube Data API v3, including retrieval, uploading, updating, deletion, and abuse reporting.

## Key Operations

### Retrieve Channel's Uploaded Videos

Two-step process to access a channel's video library:

**Step 1: Get the Uploads Playlist ID**

Call `channels.list` with `part=contentDetails` to locate the uploads playlist. Three methods identify the target channel:

- Set `mine=true` for the authenticated user's channel (requires OAuth 2.0)
- Use `forUsername` parameter with a YouTube username
- Specify `id` parameter with the channel ID directly

**Step 2: Fetch Uploaded Videos**

Call `playlistItems.list` with the playlist ID from Step 1. Set `part` to include `snippet`, `contentDetails`, and `status`.

### Retrieve Most Popular Videos

Use `videos.list` with `chart=mostPopular` to fetch trending content. Optional parameters:

- `regionCode`: ISO 3166-1 alpha-2 country code for geographic filtering
- `videoCategoryId`: Specific category identifier (retrieve via `videoCategories.list`)

Example: Most popular sports videos in Spain uses `regionCode=es` and `videoCategoryId=17`.

### Upload a Video

Call `videos.insert` method. Key resources:

- **API Documentation**: `videos.insert` method contains code samples for multiple languages
- **Resumable Uploads Guide**: Details HTTP request sequences for large files
- **CORS Example**: JavaScript sample demonstrates web-based uploads with resumable support

### Check Upload Processing Status

**Step 1**: Upload via `videos.insert`

**Step 2**: Monitor progress by calling `videos.list` with the video ID and `part=processingDetails`

Check `processingDetails.processingStatus` value—changes from "processing" to "succeeded" or "failed" upon completion. Applications can poll periodically or trigger actions upon status change.

### Update Video Metadata

**Step 1**: Retrieve video ID from user's uploads

**Step 2**: Call `videos.update` with `part=recordingDetails` (or relevant metadata field)

Include request body with video ID and updated fields. Example:

```json
{
  "id": "VIDEO_ID",
  "recordingDetails": {
    "location": {
      "latitude": "42.3464",
      "longitude": "-71.0975"
    },
    "recordingDate": "2013-10-30T23:15:00.000Z"
  }
}
```

### Set Custom Thumbnail

Use `thumbnails.set` method with `videoId` parameter. Requires "media file upload capability" not available in APIs Explorer.

### Delete a Video

Call `videos.delete` with `id` parameter identifying the target. Requires OAuth 2.0 authorization. Only video owners may delete.

### Report Abusive Content

**Step 1**: Retrieve abuse reason IDs via `videoAbuseReportReasons.list`

Response includes primary reasons and associated secondary reasons. Example structure shows "Spam or misleading" (ID: S) with sub-categories like "Misleading thumbnail" (ID: 28).

**Step 2**: Submit report using `videos.reportAbuse`

Request body example:
```json
{
  "videoId": "VIDEO_ID",
  "reasonId": "S",
  "secondaryReasonId": "28",
  "comments": "Testing the video flagging feature.",
  "language": "en"
}
```

Requires OAuth 2.0 authorization.

## Authorization

Most operations requiring user data manipulation (uploads, deletions, updates) mandate OAuth 2.0 authentication.

## Related Resources

- **Code Samples**: PHP and Python examples for thumbnails and uploads
- **APIs Explorer**: Interactive testing tool (limited file upload support)
- **Documentation**: Full method reference at `/youtube/v3/docs/`
