---
title: YouTube Analytics API - Groups Insert Method
source: https://developers.google.com/youtube/analytics/v2/reference/groups/insert
api: youtube-analytics
scraped: 2026-01-07
---

# YouTube Analytics API: Groups Insert Method

## Overview

Creates a new group for aggregating YouTube Analytics data.

## HTTP Request

```
POST https://youtubeanalytics.googleapis.com/v2/groups
```

## Parameters

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Content owner ID for creating a group on behalf of a content owner. |

## Request Body

Provide a group resource in the request body:

```json
{
  "snippet": {
    "title": string
  }
}
```

### Required Properties

| Property | Description |
|----------|-------------|
| `snippet.title` | The name of the group (required). |

## Authorization

Requires OAuth 2.0 authorization with one of the following scopes:

- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtubepartner`

## Response

Returns the created group resource:

```json
{
  "kind": "youtube#group",
  "etag": string,
  "id": string,
  "snippet": {
    "publishedAt": datetime,
    "title": string
  },
  "contentDetails": {
    "itemCount": 0,
    "itemType": string
  }
}
```

## Example Request

```http
POST https://youtubeanalytics.googleapis.com/v2/groups
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "snippet": {
    "title": "My Video Collection"
  }
}
```

## Example Response

```json
{
  "kind": "youtube#group",
  "etag": "xyz123abc",
  "id": "NEW_GROUP_ID",
  "snippet": {
    "publishedAt": "2024-03-15T09:30:00Z",
    "title": "My Video Collection"
  },
  "contentDetails": {
    "itemCount": 0,
    "itemType": ""
  }
}
```

## Notes

- Newly created groups have an `itemCount` of 0
- The `itemType` is determined when you add the first item to the group
- All items added to a group must be of the same type
- Maximum 500 items per group
- After creating a group, use the groupItems.insert method to add items

## Error Responses

| Error Code | Description |
|------------|-------------|
| 400 | Invalid request body or missing required fields |
| 401 | Invalid or expired access token |
| 403 | Insufficient permissions |
| 409 | Group with the same title already exists |

## Next Steps

After creating a group, add items using the groupItems.insert method:

```http
POST https://youtubeanalytics.googleapis.com/v2/groupItems
```
