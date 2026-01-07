---
source: https://developers.google.com/youtube/analytics/v2/reference/groups
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
title: YouTube Analytics API - Groups Resource
---
 YouTube Analytics API: Groups Resource

## Overview

Groups allow you to create custom collections of up to 500 YouTube resources (channels, videos, playlists, or assets) for aggregated analytics reporting. A group enables you to analyze metrics across a defined set of content.

## Resource Representation

A group resource has the following structure:

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

### Properties

| Property | Description |
|----------|-------------|
| `kind` | Resource type: `youtube#group` |
| `etag` | ETag for the resource |
| `id` | Unique identifier for the group |
| `snippet.publishedAt` | Date and time the group was created (ISO 8601 format) |
| `snippet.title` | Group name |
| `contentDetails.itemCount` | Number of items in the group |
| `contentDetails.itemType` | Type of items: `youtube#channel`, `youtube#playlist`, `youtube#video`, or `youtubePartner#asset` |

## Methods

The Groups resource supports the following methods:

### list

Retrieves a list of groups matching the API request parameters.

```
GET https://youtubeanalytics.googleapis.com/v2/groups
```

**Parameters:**
- `id` (optional): Comma-separated list of group IDs
- `mine` (optional): Set to `true` to retrieve all groups owned by the authenticated user
- `onBehalfOfContentOwner` (optional): Content owner ID
- `pageToken` (optional): Token for pagination

### insert

Creates a new group.

```
POST https://youtubeanalytics.googleapis.com/v2/groups
```

**Request body:** Group resource with `snippet.title` required

### update

Modifies a group's metadata.

```
PUT https://youtubeanalytics.googleapis.com/v2/groups
```

**Request body:** Complete group resource with updated values

### delete

Deletes a group.

```
DELETE https://youtubeanalytics.googleapis.com/v2/groups
```

**Parameters:**
- `id` (required): Group ID to delete
- `onBehalfOfContentOwner` (optional): Content owner ID

## Authorization

All methods require OAuth 2.0 authorization with one of these scopes:

- `https://www.googleapis.com/auth/youtube` - Manage YouTube account
- `https://www.googleapis.com/auth/youtube.readonly` - View YouTube account
- `https://www.googleapis.com/auth/youtubepartner` - Manage YouTube assets
- `https://www.googleapis.com/auth/yt-analytics.readonly` - View analytics reports
- `https://www.googleapis.com/auth/yt-analytics-monetary.readonly` - View monetary reports

## Usage Notes

- Maximum 500 items per group
- All items in a group must be the same type (all videos, all channels, etc.)
- Groups are used as filters in Analytics API queries via the `group` filter
- Groups can be created for channels, videos, playlists, or assets

## Using Groups in Reports

To retrieve analytics for a group, use the `group` filter in your reports.query request:

```
filters=group==GROUP_ID
```

This aggregates metrics across all items in the specified group.
