---
source: https://developers.google.com/youtube/v3/docs/videoAbuseReportReasons
scraped: 2026-01-07
api: YouTube Data API v3
resource: VideoAbuseReportReasons
---

# YouTube Data API - VideoAbuseReportReasons Resource Documentation

## Resource Overview

The `videoAbuseReportReason` resource furnishes details about reasons for flagging videos containing abusive material. When applications invoke the `videos.reportAbuse` method, they reference this resource to specify the reporting rationale.

**Key Points:**
- Contains abuse report categorizations
- Integrates with the video reporting workflow
- Supports primary and secondary reason hierarchies
- Enables localized label presentation

## Complete Resource Schema

```json
{
  "kind": "youtube#videoAbuseReportReason",
  "etag": "etag",
  "id": "string",
  "snippet": {
    "label": "string",
    "secondaryReasons": [
      {
        "id": "string",
        "label": "string"
      }
    ]
  }
}
```

## Property Definitions

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Identifies resource type as `youtube#videoAbuseReportReason` |
| `etag` | etag | Resource's Etag identifier |
| `id` | string | YouTube's unique reason identifier; used with `videos.reportAbuse` method |
| `snippet` | object | Contains fundamental reason details |
| `snippet.label` | string | Localized abuse report reason text |
| `snippet.secondaryReasons[]` | list | Associated secondary reasons (zero or more) |
| `snippet.secondaryReasons[].id` | string | YouTube identifier for secondary reason; used in `secondaryReasonId` parameter |
| `snippet.secondaryReasons[].label` | string | Localized secondary reason text |

## Available Methods

| Method | Description |
|--------|-------------|
| list | Retrieve a list of reasons that can be used to report abusive videos |

## Notes

- The `videos.reportAbuse` method uses the reason IDs returned by this resource
- The hierarchical reason structure (primary and secondary reasons) enables comprehensive reporting options
