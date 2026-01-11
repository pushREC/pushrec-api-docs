---
source: 'https://fal.ai/models/fal-ai/nano-banana-pro/api'
scraped: '2026-01-11'
api_provider: 'FAL.ai'
model_provider: 'Google DeepMind'
model_name: 'Gemini 3 Pro Image'
discovery_tier: 1
verified: true
title: "Nano Banana Pro (Google Gemini 3 Pro Image)"
---

# Nano Banana Pro (Google Gemini 3 Pro Image)

> Google DeepMind's state-of-the-art text-to-image and image-editing model with unprecedented fidelity, accurate text rendering, 4K resolution support, search-grounded generation, and multi-reference fusion.

## Quick Reference

| Property | Value |
|----------|-------|
| **Model ID** | `nano-banana-pro` |
| **Provider** | Google DeepMind |
| **Official Name** | Gemini 3 Pro Image |
| **Pricing** | $0.15/image (4K: $0.30, Web search: +$0.015) |
| **Commercial Use** | Allowed |

---

## Endpoints

### 1. Text-to-Image

**Endpoint:** `fal-ai/nano-banana-pro`

**Base URLs:**
- Sync: `https://fal.run/fal-ai/nano-banana-pro`
- Queue: `https://queue.fal.run/fal-ai/nano-banana-pro`
- Health: `https://fal.run/fal-ai/nano-banana-pro/health`

#### Parameters

| Parameter | Type | Default | Options/Range | Description |
|-----------|------|---------|---------------|-------------|
| `prompt` | string | **required** | 3-50000 chars | Text description for image generation |
| `num_images` | integer | 1 | 1-4 | Number of images to generate |
| `aspect_ratio` | enum | "1:1" | 21:9, 16:9, 3:2, 4:3, 5:4, 1:1, 4:5, 3:4, 2:3, 9:16 | Output aspect ratio |
| `resolution` | enum | "1K" | 1K, 2K, 4K | Output resolution tier |
| `output_format` | enum | "png" | jpeg, png, webp | Image format |
| `sync_mode` | boolean | false | true/false | Wait for completion |
| `enable_web_search` | boolean | false | true/false | Ground generation with web search |
| `limit_generations` | boolean | false | true/false | Apply usage limits |

#### Request Example

```json
{
  "prompt": "A serene Japanese garden with cherry blossoms and a koi pond, morning light",
  "num_images": 1,
  "aspect_ratio": "16:9",
  "resolution": "2K",
  "output_format": "png"
}
```

#### Response Schema

```json
{
  "images": [
    {
      "url": "https://storage.googleapis.com/falserverless/.../output.png",
      "file_name": "output.png",
      "content_type": "image/png",
      "width": 2560,
      "height": 1440,
      "file_size": 2048576
    }
  ],
  "description": "Generated image description"
}
```

---

### 2. Image Editing

**Endpoint:** `fal-ai/nano-banana-pro/edit`

**Base URLs:**
- Sync: `https://fal.run/fal-ai/nano-banana-pro/edit`
- Queue: `https://queue.fal.run/fal-ai/nano-banana-pro/edit`

#### Parameters

| Parameter | Type | Default | Options/Range | Description |
|-----------|------|---------|---------------|-------------|
| `prompt` | string | **required** | 3-50000 chars | Edit instruction |
| `image_urls` | array[string] | **required** | 1-14 URLs | Reference images for editing |
| `num_images` | integer | 1 | 1-4 | Number of outputs |
| `aspect_ratio` | enum | "auto" | auto, 21:9, 16:9, 3:2, 4:3, 5:4, 1:1, 4:5, 3:4, 2:3, 9:16 | Output aspect ratio |
| `resolution` | enum | "1K" | 1K, 2K, 4K | Output resolution tier |
| `output_format` | enum | "png" | jpeg, png, webp | Image format |
| `sync_mode` | boolean | false | true/false | Wait for completion |
| `enable_web_search` | boolean | false | true/false | Ground with web search |

#### Multi-Reference Fusion

The edit endpoint supports **up to 14 reference images** for:
- Character consistency across generations
- Style transfer from multiple sources
- Composite image creation
- Scene modification with preserved elements

#### Request Example

```json
{
  "prompt": "Apply the visual style of Figure 2 to the scene in Figure 1, maintaining the composition",
  "image_urls": [
    "https://example.com/scene.jpg",
    "https://example.com/style-reference.jpg"
  ],
  "num_images": 1,
  "aspect_ratio": "auto",
  "resolution": "2K",
  "output_format": "png"
}
```

---

## SDK Examples

### JavaScript/TypeScript

```javascript
import { fal } from "@fal-ai/client";

// Configure credentials
fal.config({
  credentials: process.env.FAL_KEY
});

// Text-to-Image
const result = await fal.subscribe("fal-ai/nano-banana-pro", {
  input: {
    prompt: "A warm infographic with cream background (#FAF9F5) and terracotta accents (#D97B4A)",
    aspect_ratio: "16:9",
    resolution: "2K",
    output_format: "png"
  },
  logs: true
});

console.log(result.data.images[0].url);

// Image Editing with references
const editResult = await fal.subscribe("fal-ai/nano-banana-pro/edit", {
  input: {
    prompt: "Apply the visual style of Figure 1 to create a new infographic about AI learning",
    image_urls: ["https://example.com/style-reference.png"],
    aspect_ratio: "16:9",
    resolution: "2K"
  },
  logs: true
});
```

### Python

```python
import fal_client

# Text-to-Image
result = fal_client.subscribe(
    "fal-ai/nano-banana-pro",
    arguments={
        "prompt": "A warm infographic with cream background (#FAF9F5) and terracotta accents (#D97B4A)",
        "aspect_ratio": "16:9",
        "resolution": "2K",
        "output_format": "png"
    }
)

print(result["images"][0]["url"])

# Image Editing
edit_result = fal_client.subscribe(
    "fal-ai/nano-banana-pro/edit",
    arguments={
        "prompt": "Apply the visual style of Figure 1 to create a new infographic",
        "image_urls": ["https://example.com/style-reference.png"],
        "aspect_ratio": "16:9",
        "resolution": "2K"
    }
)
```

### cURL

```bash
# Text-to-Image
curl -X POST "https://fal.run/fal-ai/nano-banana-pro" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "A warm infographic with cream background",
    "aspect_ratio": "16:9",
    "resolution": "2K",
    "output_format": "png"
  }'

# Image Editing
curl -X POST "https://fal.run/fal-ai/nano-banana-pro/edit" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Apply the style of Figure 1",
    "image_urls": ["https://example.com/reference.png"],
    "aspect_ratio": "auto",
    "resolution": "2K"
  }'
```

---

## Pricing

| Tier | Cost | Notes |
|------|------|-------|
| 1K | $0.15/image | Standard resolution |
| 2K | $0.15/image | Enhanced resolution (same price) |
| 4K | $0.30/image | Premium resolution (2x base) |
| Web Search | +$0.015 | Additional per request |

**Value:** For $1.00, you can generate ~7 images at standard/2K resolution.

---

## Capabilities

| Capability | Supported | Notes |
|------------|-----------|-------|
| Text-to-Image | Yes | High-fidelity generation |
| Image Editing | Yes | Via /edit endpoint |
| Text Rendering | Yes | Accurate text in images |
| Native 4K | Yes | Up to 5120×2880 |
| Multi-Reference | Yes | Up to 14 images |
| Style Transfer | Yes | Via edit endpoint |
| Web Search Grounding | Yes | Current information integration |
| Commercial Use | Yes | Allowed |

---

## Best Practices

### For Infographics

```
Create a premium infographic with warm, intellectual aesthetics:

COLORS (EXACT HEX):
- Background: #FAF9F5 (warm cream)
- Primary text: #141413 (deep charcoal)
- Accent: #D97B4A (terracotta/rust)
- Highlight: #E8A87C (peach/salmon)
- Cards: #FFFFFF (pure white)

STYLE:
- Generous whitespace
- Organic flowing lines
- Simple line-art icons
- No cold tech blues or neon
- Paper texture for warmth
- Clean, editorial aesthetic

[SPECIFIC CONTENT]
```

### For Style Consistency

1. Generate first image with detailed style prompt
2. Upload first image to FAL.ai CDN
3. Use edit endpoint with first image as reference for subsequent generations
4. Reference "Figure 1" in prompts to maintain style

---

## Rate Limits

- **Free Tier:** ~200 requests per sandbox period
- **Standard:** No explicit limit documented
- **Enterprise:** Custom SLAs available

---

## Error Handling

| HTTP Code | Meaning | Resolution |
|-----------|---------|------------|
| 401 | Invalid API key | Check FAL_KEY |
| 422 | Invalid parameters | Validate input schema |
| 429 | Rate limited | Wait and retry |
| 500 | Server error | Retry with backoff |

---

## Related Endpoints

| Endpoint | Purpose |
|----------|---------|
| `fal-ai/nano-banana-pro` | Text-to-image generation |
| `fal-ai/nano-banana-pro/edit` | Image editing with references |
| `fal-ai/nano-banana-pro/health` | Service status check |

---

*Documentation harvested: 2026-01-11*
*Source: https://fal.ai/models/fal-ai/nano-banana-pro/api*
*Generated by api-docs-finder skill*
