---
source: https://developers.google.com/youtube/v3/docs/videoAbuseReportReasons/list
scraped: 2026-01-07
api: YouTube Data API v3
resource: VideoAbuseReportReasons
method: list
---

# YouTube Data API: VideoAbuseReportReasons list

## Method Overview

This endpoint retrieves a comprehensive collection of reasons that can be used to report videos containing abusive content.

**Quota Cost:** 1 unit per request

## HTTP Request Format

```
GET https://www.googleapis.com/youtube/v3/videoAbuseReportReasons
```

## Authorization Scopes

The following scopes authorize requests:

- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtube.readonly`

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `part` | string | Specifies which resource parts to include in the response. Accepts: `id` and `snippet` |

### Optional Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `hl` | string | `en_US` | Language for text values in the API response |

## Request Body

No request body is needed for this method.

## Response Schema

```json
{
  "kind": "youtube#videoAbuseReportReasonListResponse",
  "etag": "etag",
  "items": [
    // videoAbuseReportReason resources
  ]
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always returns `youtube#videoAbuseReportReasonListResponse` |
| `etag` | etag | Resource identifier tag |
| `items[]` | list | List of videoAbuseReportReason resources identifying reportable offense categories |

## Error Responses

| Error Code | Error Type | Description |
|-----------|-----------|-------------|
| 403 | forbidden | Request lacks proper authorization |

## Usage Context

Results from this endpoint support the `videos.reportAbuse` method, enabling applications to report videos that contain abusive content.
