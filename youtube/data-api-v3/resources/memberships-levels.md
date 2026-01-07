---
source: https://developers.google.com/youtube/v3/docs/membershipsLevels
scraped: 2026-01-07
api: YouTube Data API v3
resource: MembershipsLevels
---

# YouTube Data API - MembershipsLevels Resource Documentation

## Resource Overview

The `membershipsLevel` resource identifies pricing levels created by content creators who have enabled channel memberships. This endpoint is exclusively available to individual creators making requests for their own membership-enabled YouTube channels.

**Access Requirement:** This endpoint can only be used by individual creators to make requests for their own, channel-memberships-enabled YouTube channel. Access requires authorization from a Google or YouTube representative.

## Complete Resource Schema

```json
{
  "kind": "youtube#membershipsLevel",
  "etag": "etag_value",
  "id": "string",
  "snippet": {
    "creatorChannelId": "string",
    "levelDetails": {
      "displayName": "string"
    }
  }
}
```

## Property Definitions

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | API resource type identifier; value is always `youtube#membershipsLevel` |
| `etag` | etag | Entity tag for resource versioning |
| `id` | string | Unique YouTube-assigned membership level identifier; persists even if display name changes |
| `snippet` | object | Container holding membership level details |
| `snippet.creatorChannelId` | string | YouTube channel ID of the creator owning the pricing level |
| `snippet.levelDetails` | object | Data structure containing membership level information |
| `snippet.levelDetails.displayName` | string | The visible name assigned to the membership level |

## Available Methods

| Method | Description |
|--------|-------------|
| list | Retrieves membership levels associated with the requesting channel |
