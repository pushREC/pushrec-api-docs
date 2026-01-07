---
source: https://developers.google.com/youtube/v3/docs/videos/reportAbuse
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 YouTube Data API v3 - Videos: reportAbuse Method

## Overview

The `reportAbuse` method enables reporting of YouTube videos containing abusive content through the YouTube Data API v3.

## HTTP Request Format

```
POST https://www.googleapis.com/youtube/v3/videos/reportAbuse
```

## Quota Impact

A call to this method has a quota cost of **50 units**.

## Authorization

This endpoint requires authorization with one of these scopes:

- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtubepartner`

## Query Parameters

### Optional Parameters

**`onBehalfOfContentOwner`** (string)

Available only for properly authorized requests and intended exclusively for YouTube content partners. This parameter allows a YouTube CMS user to act on behalf of a specified content owner, enabling authentication once to access all associated video and channel data without providing separate credentials per channel. The CMS account must be linked to the specified YouTube content owner.

## Request Body

### Structure

```json
{
  "videoId": "string",
  "reasonId": "string",
  "secondaryReasonId": "string",
  "comments": "string",
  "language": "string"
}
```

### Required Properties

- **`videoId`** (string): Identifies the video being reported. Set to the video's YouTube video ID.
- **`reasonId`** (object): Specifies the abuse reason. Set to the unique ID from the `videoAbuseReportReason` resource.

### Optional Properties

- **`secondaryReasonId`** (object): Provides more specific description of objectionable content than the primary reason. Set to the secondary reason's unique ID.
- **`comments`** (string): Additional information the reporter wants to include.
- **`language`** (object): Identifies a language spoken by the reporter.

## Response

Upon success, the method returns an HTTP `204` response code, indicating "No Content."

## Error Handling

| Error Type | Error Detail | Description |
|---|---|---|
| `badRequest (400)` | `invalidAbuseReason` | Unexpected value for `reasonId` or invalid `reasonId`/`secondaryReasonId` combination |
| `badRequest (400)` | `rateLimitExceeded` | User exceeded request rate limits |
| `forbidden (403)` | `forbidden` | Access denied |
| `notFound (404)` | `videoNotFound` | Target video cannot be found |
