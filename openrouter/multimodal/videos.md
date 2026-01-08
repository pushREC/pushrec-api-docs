---
source: https://openrouter.ai/docs/guides/overview/multimodal/videos
scraped: 2026-01-08
---

# Video Inputs

## Overview

OpenRouter enables video processing through its API using two methods:

- **Direct URLs** for publicly accessible videos
- **Base64-encoded data URLs** for local or private files

The service supports video inputs exclusively via the `/api/v1/chat/completions` API endpoint with the `video_url` content type.

## Supported Formats

| Format | MIME Type |
|--------|-----------|
| MP4 | `video/mp4` |
| MPEG | `video/mpeg` |
| MOV | `video/mov` |
| WebM | `video/webm` |

## Implementation Methods

### URL-Based Approach

Developers can pass publicly accessible video links directly, though provider support varies.

```typescript
const response = await client.chat.completions.create({
  model: 'google/gemini-2.0-flash-001',
  messages: [
    {
      role: 'user',
      content: [
        {
          type: 'text',
          text: 'Describe what happens in this video'
        },
        {
          type: 'video_url',
          video_url: {
            url: 'https://example.com/video.mp4'
          }
        }
      ]
    }
  ]
});
```

### Base64 Encoding

Local videos require encoding as data URLs:

```typescript
import fs from 'fs';

const videoBuffer = fs.readFileSync('video.mp4');
const base64Video = videoBuffer.toString('base64');

const response = await client.chat.completions.create({
  model: 'google/gemini-2.0-flash-001',
  messages: [
    {
      role: 'user',
      content: [
        {
          type: 'text',
          text: 'Describe what happens in this video'
        },
        {
          type: 'video_url',
          video_url: {
            url: `data:video/mp4;base64,${base64Video}`
          }
        }
      ]
    }
  ]
});
```

## Provider Limitations

Video URL support differs by provider:

| Provider | Limitation |
|----------|------------|
| Google AI Studio | YouTube links only |
| Google Vertex AI | Base64-encoded data URLs only |
| Other providers | Check model-specific documentation |

## Optimization Guidance

- Compress videos to reduce processing time
- Trim unnecessary segments
- Balance quality against file size
- Use 720p for general analysis
- Use 1080p+ for detailed object detection and text recognition

## Common Applications

- Video summarization
- Object recognition
- Scene analysis
- Sports evaluation
- Surveillance monitoring
- Educational content examination
