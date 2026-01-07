---
source: https://developers.google.com/youtube/v3/docs/subscriptions
scraped: 2026-01-07
api_provider: Google
discovery_tier: 3
verified: false
method: webfetch
---
 Subscriptions Resource

## Overview

A subscription resource represents a YouTube user's subscription, notifying them when new videos are added to a channel or when specific actions occur, such as uploads, ratings, or comments.

## Available Methods

| Method | Purpose |
|--------|---------|
| `list` | Returns subscription resources matching API request criteria |
| `insert` | Adds a subscription for the authenticated user's channel |
| `delete` | Removes a subscription |

## Resource Representation

```json
{
  "kind": "youtube#subscription",
  "etag": "string",
  "id": "string",
  "snippet": {
    "publishedAt": "datetime",
    "channelTitle": "string",
    "title": "string",
    "description": "string",
    "resourceId": {
      "kind": "string",
      "channelId": "string"
    },
    "channelId": "string",
    "thumbnails": {
      "default": { "url": "string", "width": "integer", "height": "integer" },
      "medium": { "url": "string", "width": "integer", "height": "integer" },
      "high": { "url": "string", "width": "integer", "height": "integer" }
    }
  },
  "contentDetails": {
    "totalItemCount": "unsigned integer",
    "newItemCount": "unsigned integer",
    "activityType": "string"
  },
  "subscriberSnippet": {
    "title": "string",
    "description": "string",
    "channelId": "string",
    "thumbnails": {
      "default": { "url": "string", "width": "integer", "height": "integer" },
      "medium": { "url": "string", "width": "integer", "height": "integer" },
      "high": { "url": "string", "width": "integer", "height": "integer" }
    }
  }
}
```

## Properties

### Core Fields

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Always `youtube#subscription` |
| `etag` | string | Resource version identifier |
| `id` | string | Unique YouTube subscription identifier |

### Snippet Properties

| Property | Type | Description |
|----------|------|-------------|
| `snippet.publishedAt` | datetime | Subscription creation timestamp (ISO 8601) |
| `snippet.channelTitle` | string | Title of the channel that the subscriber belongs to |
| `snippet.title` | string | Title of the subscription (subscribed channel's title) |
| `snippet.description` | string | Description of the subscribed channel |
| `snippet.resourceId` | object | Identifies the subscribed resource |
| `snippet.resourceId.kind` | string | Type of resource (usually `youtube#channel`) |
| `snippet.resourceId.channelId` | string | Channel ID of the subscribed channel |
| `snippet.channelId` | string | YouTube channel ID of the subscriber |
| `snippet.thumbnails` | object | Thumbnail images for the subscribed channel |

### ContentDetails Properties

| Property | Type | Description |
|----------|------|-------------|
| `contentDetails.totalItemCount` | unsigned integer | Approximate total number of items in the subscription |
| `contentDetails.newItemCount` | unsigned integer | Number of new items since last read |
| `contentDetails.activityType` | string | Type of activity notifications: `all` or `uploads` |

### SubscriberSnippet Properties

| Property | Type | Description |
|----------|------|-------------|
| `subscriberSnippet.title` | string | Subscriber's channel title |
| `subscriberSnippet.description` | string | Subscriber's channel description |
| `subscriberSnippet.channelId` | string | Subscriber's channel ID |
| `subscriberSnippet.thumbnails` | object | Subscriber's channel thumbnails |

## Thumbnail Sizes

| Size | Videos | Channels |
|------|--------|----------|
| `default` | 120x90 px | 88x88 px |
| `medium` | 320x180 px | 240x240 px |
| `high` | 480x360 px | 800x800 px |

Each thumbnail object contains:
- `url` - Image URL
- `width` - Width in pixels
- `height` - Height in pixels

## Activity Type Values

| Value | Description |
|-------|-------------|
| `all` | Notifications for all channel activity |
| `uploads` | Notifications for new uploads only |

## Authorization Scopes

Subscription operations may require one of:
- `https://www.googleapis.com/auth/youtube`
- `https://www.googleapis.com/auth/youtube.force-ssl`
- `https://www.googleapis.com/auth/youtubepartner`
