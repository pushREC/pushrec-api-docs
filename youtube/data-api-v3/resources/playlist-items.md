---
source: https://developers.google.com/youtube/v3/docs/playlistItems
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: playlistItems
---

# YouTube Data API v3 - PlaylistItems Resource Documentation

## Overview

A `playlistItem` resource represents another resource, such as a video, that is included in a playlist. It contains details about how that resource is used within the specific playlist. YouTube uses `playlistItem` resources to manage a channel's uploaded videos, with each item representing an individual uploaded video.

## Available Methods

The API provides four primary methods for managing `playlistItems`:

### list
Returns a collection of playlist items matching the API request parameters. You can retrieve all items in a specified playlist or retrieve one or more items by their unique IDs.

### insert
Adds a resource to a playlist.

### update
Modifies a playlist item, such as updating the item's position in the playlist.

### delete
Removes a playlist item from a playlist.

## Resource Schema

```json
{
  "kind": "youtube#playlistItem",
  "etag": "etag",
  "id": "string",
  "snippet": {
    "publishedAt": "datetime",
    "channelId": "string",
    "title": "string",
    "description": "string",
    "thumbnails": {
      "(key)": {
        "url": "string",
        "width": "unsigned integer",
        "height": "unsigned integer"
      }
    },
    "channelTitle": "string",
    "videoOwnerChannelTitle": "string",
    "videoOwnerChannelId": "string",
    "playlistId": "string",
    "position": "unsigned integer",
    "resourceId": {
      "kind": "string",
      "videoId": "string"
    }
  },
  "contentDetails": {
    "videoId": "string",
    "startAt": "string",
    "endAt": "string",
    "note": "string",
    "videoPublishedAt": "datetime"
  },
  "status": {
    "privacyStatus": "string"
  }
}
```

## Properties Reference

### Root Properties

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Identifies the API resource's type as `youtube#playlistItem` |
| `etag` | etag | The Etag of this resource |
| `id` | string | Unique identifier for the playlist item |
| `snippet` | object | Contains basic details about the playlist item |
| `contentDetails` | object | Included when the item is a YouTube video; contains additional video information |
| `status` | object | Contains the playlist item's privacy status |

### snippet Properties

| Property | Type | Description |
|----------|------|-------------|
| `publishedAt` | datetime | Date/time item was added to playlist (ISO 8601 format) |
| `channelId` | string | ID of the user who added the item to the playlist |
| `title` | string | The item's title |
| `description` | string | The item's description |
| `thumbnails` | object | Map of thumbnail images associated with the item |
| `channelTitle` | string | Channel title of the playlist's channel |
| `videoOwnerChannelTitle` | string | Channel title that uploaded this video |
| `videoOwnerChannelId` | string | Channel ID that uploaded this video |
| `playlistId` | string | ID of the playlist containing this item |
| `position` | unsigned integer | Zero-based index indicating the item's position in the playlist |
| `resourceId` | object | Contains info to uniquely identify the included resource |

### snippet.thumbnails Properties

Valid thumbnail keys include:
- **default**: 120px x 90px (videos) or 88px x 88px (channels)
- **medium**: 320px x 180px (videos) or 240px x 240px (channels)
- **high**: 480px x 360px (videos) or 800px x 800px (channels)
- **standard**: 640px x 480px (available for some videos)
- **maxres**: 1280px x 720px (highest resolution, available for some videos)

Each thumbnail object contains:
- `url`: Image URL
- `width`: Image width
- `height`: Image height

### contentDetails Properties

| Property | Type | Description |
|----------|------|-------------|
| `videoId` | string | Unique YouTube video identifier |
| `startAt` | string | **Deprecated** - Start time in seconds (ignored if set) |
| `endAt` | string | **Deprecated** - End time in seconds (ignored if set) |
| `note` | string | User-generated note (max 280 characters) |
| `videoPublishedAt` | datetime | Date/time video was published (ISO 8601 format) |

### status Properties

| Property | Type | Description |
|----------|------|-------------|
| `privacyStatus` | string | The playlist item's privacy status (set via videos.insert or videos.update) |

## Key Features

- Retrieve uploaded videos for any channel using the uploads playlist ID from the channel resource
- Use zero-based indexing for item positions within playlists
- Access video-specific details through the `contentDetails` object
- Manage privacy settings through the `status` object
- Support for multiple thumbnail resolutions to optimize display across different use cases
