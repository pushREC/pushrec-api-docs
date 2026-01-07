---
source: https://developers.google.com/youtube/v3/docs/search
scraped: 2026-01-07
method: webfetch
api: youtube-data-v3
resource: search
---

# YouTube Data API v3 Search Resource Documentation

## Overview

The Search resource represents information about a YouTube video, channel, or playlist that matches search parameters. Search results do not contain persistent data themselves-they point to uniquely identifiable resources.

## Resource Representation

```json
{
  "kind": "youtube#searchResult",
  "etag": "etag",
  "id": {
    "kind": "string",
    "videoId": "string",
    "channelId": "string",
    "playlistId": "string"
  },
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
    "liveBroadcastContent": "string"
  }
}
```

## Property Definitions

| Property | Type | Description |
|----------|------|-------------|
| `kind` | string | Identifies the API resource type as `youtube#searchResult` |
| `etag` | etag | The Etag of this resource |
| `id` | object | Contains information to uniquely identify the matched resource |
| `id.kind` | string | The type of the API resource |
| `id.videoId` | string | Video ID if the result is a video match |
| `id.channelId` | string | Channel ID if the result is a channel match |
| `id.playlistId` | string | Playlist ID if the result is a playlist match |
| `snippet` | object | Contains basic details (title, description, channel info, publish date, thumbnails) |
| `snippet.publishedAt` | datetime | Resource creation date in ISO 8601 format |
| `snippet.channelId` | string | ID of the channel that published the resource |
| `snippet.title` | string | The search result title |
| `snippet.description` | string | Description of the search result |
| `snippet.thumbnails` | object | Map of thumbnail images with multiple resolutions |
| `snippet.channelTitle` | string | Title of the publishing channel |
| `snippet.liveBroadcastContent` | string | Values: `upcoming`, `live`, or `none` |

## Thumbnail Image Specifications

| Resolution | Dimensions | Availability |
|------------|-----------|--------------|
| `default` | 120x90px (video), 88x88px (channel) | All results |
| `medium` | 320x180px (video), 240x240px (channel) | All results |
| `high` | 480x360px (video), 800x800px (channel) | All results |
| `standard` | 640x480px | Some videos/resources |
| `maxres` | 1280x720px | Some videos/resources |

## Available Methods

**list** - Returns a collection of search results that match the query parameters specified in the API request by default identifying matching videos, channels, and playlists. Results can be filtered to specific resource types.

## Key Features

- Search results provide information about matching resources without containing permanent data
- The `id` object's `kind` property determines result type (video, channel, or playlist)
- Multiple thumbnail resolutions enable responsive image selection
- Live broadcast status is indicated via the `liveBroadcastContent` property
