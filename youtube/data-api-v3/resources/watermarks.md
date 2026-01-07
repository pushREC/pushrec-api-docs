---
source: https://developers.google.com/youtube/v3/docs/watermarks
scraped: 2026-01-07
api: YouTube Data API v3
resource: Watermarks
---

# YouTube Data API - Watermarks Resource Documentation

## Resource Overview

A watermark resource displays an image during a channel's video playbacks with the option to link to a target channel. This feature enables content creators to brand their video content with customizable watermark imagery and linking behavior.

## Complete Resource Schema

```json
{
  "timing": {
    "type": "string",
    "offsetMs": "unsigned long",
    "durationMs": "unsigned long"
  },
  "position": {
    "type": "string",
    "cornerPosition": "string"
  },
  "imageUrl": "string",
  "imageBytes": "bytes",
  "targetChannelId": "string"
}
```

## Property Definitions

| Property | Type | Description |
|----------|------|-------------|
| `timing` | object | Encapsulates timing information for watermark display during playback |
| `timing.type` | string | Determines measurement method: `offsetFromStart` or `offsetFromEnd` |
| `timing.offsetMs` | unsigned long | Time offset in milliseconds when watermark appears |
| `timing.durationMs` | unsigned long | Display duration in milliseconds |
| `position` | object | Spatial positioning information within the video player |
| `position.type` | string | Position method; valid value: `corner` |
| `position.cornerPosition` | string | Corner location; valid value: `topRight` |
| `imageUrl` | string | Generated URL for the watermark image (returned by API) |
| `imageBytes` | bytes | Watermark image size in bytes |
| `targetChannelId` | string | YouTube channel ID that the watermark links to |

## API Methods

| Method | Description |
|--------|-------------|
| set | Uploads a watermark image to YouTube and configures it for a specific channel |
| unset | Deletes a channel's watermark image and removes the watermark configuration |

## Timing Configuration

The timing object controls when watermarks appear during video playback:

- **offsetFromStart**: Offset measured from video beginning
- **offsetFromEnd**: Offset measured from video conclusion
- Both use millisecond precision for timing values

## Position Configuration

Watermarks position exclusively in the upper right corner via the `topRight` value setting the `cornerPosition` property.
