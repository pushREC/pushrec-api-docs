---
source: https://openrouter.ai/docs/guides/overview/multimodal/images
scraped: 2026-01-08
---

# Image Inputs

## Overview

The OpenRouter API enables vision model capabilities through the `/api/v1/chat/completions` endpoint. Multiple images can be sent in separate content array entries, with limits varying by provider and model.

## Image Input Methods

OpenRouter supports two approaches:

1. **Direct URLs** — more efficient for publicly accessible images
2. **Base64 encoding** — required for local or private images

**Best Practice:** Send the text prompt first, then the images to ensure proper content parsing.

## Implementation Examples

### URL-Based Images

The TypeScript SDK approach involves structuring messages with `image_url` type objects containing publicly accessible image URLs.

```typescript
import OpenRouter from '@openrouter/sdk';

const client = new OpenRouter();

const response = await client.chat.completions.create({
  model: 'google/gemini-2.0-flash-001',
  messages: [
    {
      role: 'user',
      content: [
        {
          type: 'text',
          text: 'What is in this image?'
        },
        {
          type: 'image_url',
          image_url: {
            url: 'https://example.com/image.jpg'
          }
        }
      ]
    }
  ]
});
```

### Base64-Encoded Images

Local files require encoding before transmission.

```python
import base64
import requests

# Read and encode the image
with open('image.jpg', 'rb') as image_file:
    base64_image = base64.b64encode(image_file.read()).decode('utf-8')

response = requests.post(
    'https://openrouter.ai/api/v1/chat/completions',
    headers={
        'Authorization': 'Bearer YOUR_API_KEY',
        'Content-Type': 'application/json'
    },
    json={
        'model': 'google/gemini-2.0-flash-001',
        'messages': [
            {
                'role': 'user',
                'content': [
                    {
                        'type': 'text',
                        'text': 'What is in this image?'
                    },
                    {
                        'type': 'image_url',
                        'image_url': {
                            'url': f'data:image/jpeg;base64,{base64_image}'
                        }
                    }
                ]
            }
        ]
    }
)
```

## Supported Formats

| Format | MIME Type |
|--------|-----------|
| PNG | `image/png` |
| JPEG | `image/jpeg` |
| WebP | `image/webp` |
| GIF | `image/gif` |
