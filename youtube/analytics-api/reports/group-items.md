---
title: YouTube Analytics API - Group Items Resource
source: https://developers.google.com/youtube/analytics/v2/reference/groupItems
api: youtube-analytics
scraped: 2026-01-07
---

# YouTube Analytics API: Group Items Resource

## Overview

Group items represent the YouTube resources (videos, channels, playlists, or assets) that belong to a group. Each group can contain up to 500 items, and all items must be of the same type.

## Resource Representation

A groupItem resource has the following structure:

```json
{
  "kind": "youtube#groupItem",
  "etag": string,
  "id": string,
  "groupId": string,
  "resource": {
    "kind": string,
    "id": string
  }
}
```

### Properties

| Property | Description |
|----------|-------------|
| `kind` | Resource type: `youtube#groupItem` |
| `etag` | ETag for the resource |
| `id` | Unique identifier for the group item |
| `groupId` | ID of the group this item belongs to |
| `resource.kind` | Type of resource: `youtube#video`, `youtube#channel`, `youtube#playlist`, or `youtubePartner#asset` |
| `resource.id` | ID of the YouTube resource (video ID, channel ID, playlist ID, or asset ID) |

## Methods

### list

Retrieves a list of group items for a specific group.

```
GET https://youtubeanalytics.googleapis.com/v2/groupItems
```

**Required Parameters:**
- `groupId`: The ID of the group

**Optional Parameters:**
- `onBehalfOfContentOwner`: Content owner ID

### insert

Adds an item to a group.

```
POST https://youtubeanalytics.googleapis.com/v2/groupItems
```

**Request body:**
```json
{
  "groupId": string,
  "resource": {
    "kind": string,
    "id": string
  }
}
```

### delete

Removes an item from a group.

```
DELETE https://youtubeanalytics.googleapis.com/v2/groupItems
```

**Required Parameters:**
- `id`: The ID of the group item to delete

**Optional Parameters:**
- `onBehalfOfContentOwner`: Content owner ID

## Authorization

All methods require OAuth 2.0 authorization with one of these scopes:

- `https://www.googleapis.com/auth/youtube` - Manage YouTube account
- `https://www.googleapis.com/auth/youtube.readonly` - View account (list only)
- `https://www.googleapis.com/auth/youtubepartner` - Manage YouTube assets
- `https://www.googleapis.com/auth/yt-analytics.readonly` - View analytics (list only)
- `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` - View monetary reports (list only)

## List Response

```json
{
  "kind": "youtube#groupItemListResponse",
  "etag": string,
  "items": [
    {
      "kind": "youtube#groupItem",
      "etag": string,
      "id": string,
      "groupId": string,
      "resource": {
        "kind": string,
        "id": string
      }
    }
  ]
}
```

## Example: Add a Video to a Group

```http
POST https://youtubeanalytics.googleapis.com/v2/groupItems
Authorization: Bearer ACCESS_TOKEN
Content-Type: application/json

{
  "groupId": "GROUP_ID",
  "resource": {
    "kind": "youtube#video",
    "id": "VIDEO_ID"
  }
}
```

## Example: List Group Items

```http
GET https://youtubeanalytics.googleapis.com/v2/groupItems?groupId=GROUP_ID
Authorization: Bearer ACCESS_TOKEN
```

## Example: Delete a Group Item

```http
DELETE https://youtubeanalytics.googleapis.com/v2/groupItems?id=GROUP_ITEM_ID
Authorization: Bearer ACCESS_TOKEN
```

## Resource Types

| Resource Kind | Description | ID Format |
|---------------|-------------|-----------|
| `youtube#video` | YouTube video | 11-character video ID |
| `youtube#channel` | YouTube channel | Channel ID starting with "UC" |
| `youtube#playlist` | YouTube playlist | Playlist ID starting with "PL" |
| `youtubePartner#asset` | Content owner asset | Asset ID |

## Constraints

- Maximum 500 items per group
- All items in a group must be of the same type
- Once a group has items, you cannot add items of a different type
- The first item added determines the group's item type

## Error Responses

| Error Code | Description |
|------------|-------------|
| 400 | Invalid request or resource type mismatch |
| 401 | Invalid or expired access token |
| 403 | Insufficient permissions |
| 404 | Group or resource not found |
| 409 | Item already exists in the group |
