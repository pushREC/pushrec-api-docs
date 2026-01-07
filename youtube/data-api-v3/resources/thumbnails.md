---
source: https://developers.google.com/youtube/v3/docs/thumbnails
scraped: 2026-01-07
api: YouTube Data API v3
resource: Thumbnails
---

# YouTube Data API - Thumbnails Resource Documentation

## Resource Overview

A **thumbnail** resource identifies different image sizes associated with various YouTube resources. Key characteristics include:

- Resources contain a `snippet.thumbnails` property that is an object identifying available thumbnail images
- The thumbnail resource comprises a series of objects where each object name (`default`, `medium`, `high`, etc.) refers to the image size
- Different resource types support different thumbnail sizes
- Resources of the same type may have varying thumbnail dimensions based on original content resolution
- Each thumbnail object contains `url`, `width`, and `height` properties (width and height may not always be returned)
- When custom thumbnails are uploaded, they're resized to match required dimensions without aspect ratio changes, potentially including black bars

## JSON Schema Representation

```json
{
  "default": {
    "url": "string",
    "width": "unsigned integer",
    "height": "unsigned integer"
  },
  "medium": {
    "url": "string",
    "width": "unsigned integer",
    "height": "unsigned integer"
  },
  "high": {
    "url": "string",
    "width": "unsigned integer",
    "height": "unsigned integer"
  },
  "standard": {
    "url": "string",
    "width": "unsigned integer",
    "height": "unsigned integer"
  },
  "maxres": {
    "url": "string",
    "width": "unsigned integer",
    "height": "unsigned integer"
  }
}
```

## Property Descriptions

| Property | Type | Description |
|----------|------|-------------|
| `default` | object | Default thumbnail (120x90px for videos; 88x88px for channels) |
| `default.url` | string | Image URL |
| `default.width` | unsigned integer | Image width |
| `default.height` | unsigned integer | Image height |
| `medium` | object | Higher resolution version (320x180px for videos; 240x240px for channels) |
| `medium.url` | string | Image URL |
| `medium.width` | unsigned integer | Image width |
| `medium.height` | unsigned integer | Image height |
| `high` | object | High resolution version (480x360px for videos; 800x800px for channels) |
| `high.url` | string | Image URL |
| `high.width` | unsigned integer | Image width |
| `high.height` | unsigned integer | Image height |
| `standard` | object | Higher resolution than `high` (640x480px, available for some videos) |
| `standard.url` | string | Image URL |
| `standard.width` | unsigned integer | Image width |
| `standard.height` | unsigned integer | Image height |
| `maxres` | object | Highest resolution version (1280x720px, available for some videos) |
| `maxres.url` | string | Image URL |
| `maxres.width` | unsigned integer | Image width |
| `maxres.height` | unsigned integer | Image height |

## Available Methods

| Method | Description |
|--------|-------------|
| `set` | Uploads a custom video thumbnail to YouTube and sets it for a video |

## Notes

- Dimension availability varies by resource type and original content resolution
- `standard` and `maxres` are not available for all videos
