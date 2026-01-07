---
source: https://developers.google.com/youtube/analytics/v2/reference/groups/update
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Groups Update Method
---
 YouTube Analytics API: Groups Update Method

## Overview

Modifies a group's metadata, such as its title.

## HTTP Request

```
PUT https://youtubeanalytics.googleapis.com/v2/groups
```

## Parameters

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onBehalfOfContentOwner` | string | Content owner ID for updating a group on behalf of a content owner. |

## Request Body

Provide a complete group resource in the request body with the updated values:

```json
{
  "id": string,
  "snippet": {
    "title": string
  }
}
```

### Required Properties

| Property | Description |
|----------|-------------|
| `id` | The group ID to update (required). |
| `snippet.title` | The new name for the group (required). |

## Authorization

Requires OAuth 2.0 authorization with one of the following scopes:

- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtubepartner`

## Response

Returns the updated group resource:

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
    "itemCount": unsigned long,
    "itemType": string
  }
}
```

## Example Request

```http
PUT https://youtubeanalytics.googleapis.com/v2/groups
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "id": "GROUP_ID",
  "snippet": {
    "title": "Updated Group Name"
  }
}
```

## Example Response

```json
{
  "kind": "youtube#group",
  "etag": "new_etag_value",
  "id": "GROUP_ID",
  "snippet": {
    "publishedAt": "2024-01-15T10:30:00Z",
    "title": "Updated Group Name"
  },
  "contentDetails": {
    "itemCount": 25,
    "itemType": "youtube#video"
  }
}
```

## Notes

- Only the group title can be modified
- The `publishedAt` timestamp reflects the original creation date, not the update date
- The `itemCount` and `itemType` are read-only properties
- To modify group contents, use the groupItems.insert and groupItems.delete methods

## Error Responses

| Error Code | Description |
|------------|-------------|
| 400 | Invalid request body or missing required fields |
| 401 | Invalid or expired access token |
| 403 | Insufficient permissions or not the group owner |
| 404 | Group with specified ID not found |
