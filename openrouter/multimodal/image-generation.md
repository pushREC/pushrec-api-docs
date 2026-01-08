---
source: https://openrouter.ai/docs/guides/overview/multimodal/image-generation
scraped: 2026-01-08
---

# Image Generation

## Overview

OpenRouter enables AI-powered image creation through models with `"image"` in their output modalities. Users access these capabilities via the `/api/v1/chat/completions` endpoint by specifying the `modalities` parameter.

## Model Discovery Methods

- Filter the Models page by output modalities
- Use the Chatroom's Image button for automatic model selection

## Configuration Options (Gemini Models)

| Option | Values |
|--------|--------|
| Aspect ratios | 1:1 to 21:9 |
| Image sizes | 1K (standard), 2K, or 4K resolution |

Combined `image_config` parameters are supported.

## Response Format

Images return as base64-encoded data URLs, typically in PNG format within the `images` field of the assistant message.

## Implementation Examples

### TypeScript SDK

```typescript
import OpenRouter from '@openrouter/sdk';

const client = new OpenRouter();

const response = await client.chat.completions.create({
  model: 'google/gemini-2.5-flash-preview',
  modalities: ['text', 'image'],
  messages: [
    {
      role: 'user',
      content: 'Generate an image of a sunset over mountains'
    }
  ]
});

// Extract generated image
const images = response.choices[0].message.images;
if (images && images.length > 0) {
  console.log('Generated image:', images[0]);
}
```

### Python

```python
import requests

response = requests.post(
    'https://openrouter.ai/api/v1/chat/completions',
    headers={
        'Authorization': 'Bearer YOUR_API_KEY',
        'Content-Type': 'application/json'
    },
    json={
        'model': 'google/gemini-2.5-flash-preview',
        'modalities': ['text', 'image'],
        'messages': [
            {
                'role': 'user',
                'content': 'Generate an image of a sunset over mountains'
            }
        ]
    }
)

data = response.json()
images = data['choices'][0]['message'].get('images', [])
```

### TypeScript (Fetch)

```typescript
const response = await fetch('https://openrouter.ai/api/v1/chat/completions', {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer YOUR_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    model: 'google/gemini-2.5-flash-preview',
    modalities: ['text', 'image'],
    messages: [
      {
        role: 'user',
        content: 'Generate an image of a sunset over mountains'
      }
    ]
  })
});

const data = await response.json();
const images = data.choices[0].message.images;
```

## Streaming Support

Image generation works with streaming enabled (`stream: true`), processing image chunks progressively.

## Compatible Models

Examples include:

- Google Gemini 2.5
- Black Forest Labs Flux variants
- Sourceful Riverflow

These are models specifically designed for generation tasks.

## Best Practices

- Supply detailed, specific prompts
- Select generation-capable models
- Implement error handling for image fields
- Account for different rate limits
- Plan base64 data storage strategies
