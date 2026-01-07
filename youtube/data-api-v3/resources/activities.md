---
source: https://developers.google.com/youtube/v3/docs/activities
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Activities Resource

## Overview

An **activity** resource represents actions taken by YouTube users or channels, including uploads, likes, favorites, comments, and subscriptions. Each activity identifies the action type, associated channel, and related resources.

**Important Notice:** YouTube's channel bulletin feature has been removed, making the `activities.list` method unable to retrieve bulletins and rendering the `activities.insert` method obsolete.

## Available Methods

| Method | Description |
|--------|-------------|
| `activities.list` | Retrieves channel activity events matching specified criteria (e.g., events for a particular channel or user's own channel) |

## Resource Representation

```json
{
  "kind": "youtube#activity",
  "etag": "string",
  "id": "string",
  "snippet": {
    "publishedAt": "datetime",
    "channelId": "string",
    "title": "string",
    "description": "string",
    "thumbnails": {
      "default": { "url": "string", "width": "integer", "height": "integer" },
      "medium": { "url": "string", "width": "integer", "height": "integer" },
      "high": { "url": "string", "width": "integer", "height": "integer" },
      "standard": { "url": "string", "width": "integer", "height": "integer" },
      "maxres": { "url": "string", "width": "integer", "height": "integer" }
    },
    "channelTitle": "string",
    "type": "string",
    "groupId": "string"
  },
  "contentDetails": {
    "upload": { "videoId": "string" },
    "like": { "resourceId": {} },
    "favorite": { "resourceId": {} },
    "comment": { "resourceId": {} },
    "subscription": { "resourceId": {} },
    "playlistItem": { "resourceId": {}, "playlistId": "string" },
    "recommendation": { "resourceId": {}, "reason": "string", "seedResourceId": {} },
    "social": {
      "type": "string",
      "resourceId": {},
      "author": "string",
      "referenceUrl": "string",
      "imageUrl": "string"
    }
  }
}
```

## Properties

### Standard Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#activity` |
| `etag` | string | Resource version identifier |
| `id` | string | Unique activity identifier |

### Snippet Object

Contains basic activity details:

| Property | Type | Description |
|----------|------|-------------|
| `snippet.publishedAt` | datetime | ISO 8601 formatted timestamp |
| `snippet.channelId` | string | YouTube channel identifier |
| `snippet.title` | string | Primary resource title |
| `snippet.description` | string | Resource description |
| `snippet.thumbnails` | object | Maps of associated images (default, medium, high, standard, maxres) |
| `snippet.channelTitle` | string | Channel name |
| `snippet.type` | string | Activity classification |
| `snippet.groupId` | string | Identifier for related user events |

### Activity Types

Valid `snippet.type` values:

- `channelItem`
- `favorite`
- `like`
- `playlistItem`
- `promotedItem`
- `recommendation`
- `social`
- `subscription`
- `upload`

### ContentDetails Object

Provides context-specific information based on activity type:

| Activity Type | ContentDetails Properties | Description |
|---------------|---------------------------|-------------|
| `upload` | `videoId` | ID of uploaded video |
| `like` | `resourceId` | Identifies rated resource |
| `favorite` | `resourceId` | Identifies favorited resource |
| `comment` | `resourceId` | Resource receiving the comment |
| `subscription` | `resourceId` | Channel subscribed to |
| `playlistItem` | `resourceId`, `playlistId` | Video added to playlist |
| `recommendation` | `resourceId`, `reason`, `seedResourceId` | Recommended resource with reason and seed info |
| `social` | `type`, `resourceId`, `author`, `referenceUrl`, `imageUrl` | Social network post details |

### Social Activity Details

For activities where `type` is "social," the `contentDetails.social` section provides:

| Property | Type | Description |
|----------|------|-------------|
| `type` | string | Social network name: `facebook`, `googlePlus`, `twitter`, `unspecified` |
| `resourceId` | object | Identifies associated YouTube resource (video, channel, playlist) |
| `author` | string | Post author name |
| `referenceUrl` | string | Social post URL |
| `imageUrl` | string | Author's profile image |
