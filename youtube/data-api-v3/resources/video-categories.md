---
source: https://developers.google.com/youtube/v3/docs/videoCategories
scraped: 2026-01-07
api: YouTube Data API v3
resource: VideoCategories
---

# YouTube Data API - VideoCategories Resource Documentation

## Resource Overview

A `videoCategory` resource identifies a category that has been or could be associated with uploaded videos. The API provides a mechanism to retrieve and manage video categorization within YouTube's ecosystem.

**Key Characteristics:**
- Each resource has a unique ID assigned by YouTube
- Categories can be assignable or non-assignable to user-uploaded content
- Resources include metadata about the creating channel and assignability status

## JSON Resource Representation

```json
{
  "kind": "youtube#videoCategory",
  "etag": "etag",
  "id": "string",
  "snippet": {
    "channelId": "UCBR8-60-B28hp2BmDPdntcQ",
    "title": "string",
    "assignable": "boolean"
  }
}
```

## Property Definitions

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | API resource type identifier - always `youtube#videoCategory` |
| `etag` | etag | Resource entity tag for caching purposes |
| `id` | string | YouTube's unique identifier for the video category |
| `snippet` | object | Container for basic category metadata |
| `snippet.channelId` | string | YouTube channel that originated the category |
| `snippet.title` | string | Category display name |
| `snippet.assignable` | boolean | Whether videos can be tagged with this category |

## Available Methods

| Method | Description |
|--------|-------------|
| list | Returns a list of categories applicable to YouTube videos, enabling discovery of assignable categories for video uploads |
