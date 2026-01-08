---
source: https://ai.google.dev/gemini-api/docs/vision
scraped: 2025-01-08
provider: Google
api: Gemini Vision API
version: v1beta
---

# Google Gemini Vision API

> Multimodal image analysis and understanding using Google's Gemini models.

## Quick Start

### Base URL

```
https://generativelanguage.googleapis.com/v1beta/models/
```

### Authentication

Include API key in request header:

```bash
curl -X POST \
  -H "x-goog-api-key: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent"
```

Get your API key: [Google AI Studio](https://aistudio.google.com/apikey)

### Basic Vision Request

```python
from google import genai

client = genai.Client(api_key="YOUR_API_KEY")

# Inline image (base64)
response = client.models.generate_content(
    model="gemini-2.5-flash",
    contents=[
        {"inline_data": {"mime_type": "image/jpeg", "data": BASE64_IMAGE}},
        "Describe this image"
    ]
)
print(response.text)
```

## Supported Models

| Model | Vision | Context Window | Max Images/Request |
|-------|--------|----------------|-------------------|
| gemini-3-pro-preview | Yes | 1M tokens | 900 |
| gemini-3-flash-preview | Yes | 1M tokens | 900 |
| gemini-2.5-pro | Yes | 1M tokens | 3,000 |
| gemini-2.5-flash | Yes | 1M tokens | 3,600 |
| gemini-2.0-flash | Yes | 1M tokens | 3,600 |

## Supported Image Formats

| Format | MIME Type |
|--------|-----------|
| PNG | `image/png` |
| JPEG | `image/jpeg` |
| WebP | `image/webp` |
| HEIC | `image/heic` |
| HEIF | `image/heif` |

## Image Size Limits

| Method | Max Size |
|--------|----------|
| Inline (base64) | 20 MB total request |
| Files API upload | 2 GB per file |
| Cloud Storage | 30 MB per file |
| HTTP URL | 15 MB |

## Vision Capabilities

- **Image captioning** - Describe image contents
- **Visual Q&A** - Answer questions about images
- **Object detection** (Gemini 2.0+) - Bounding boxes (0-1000 scale)
- **Segmentation** (Gemini 2.5+) - Contour masks as base64 PNG
- **Multi-image analysis** - Compare/analyze up to 3,600 images

## Documentation Index

| File | Description |
|------|-------------|
| [endpoints.md](endpoints.md) | Complete API reference |
| [authentication.md](authentication.md) | Auth methods and security |
| [pricing.md](pricing.md) | Costs and rate limits |
| [SOURCES.md](SOURCES.md) | Source URLs and scrape dates |
| [COVERAGE.md](COVERAGE.md) | Documentation coverage metrics |

## Code Examples

### Python - Upload and Analyze Image

```python
from google import genai

client = genai.Client(api_key="YOUR_API_KEY")

# Upload image via Files API (for large files)
uploaded_file = client.files.upload(file="path/to/image.jpg")

# Generate content with uploaded file
response = client.models.generate_content(
    model="gemini-2.5-flash",
    contents=["What objects are in this image?", uploaded_file]
)
print(response.text)
```

### cURL - Inline Image

```bash
curl -X POST \
  -H "x-goog-api-key: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "contents": [{
      "parts": [
        {"text": "Describe this image"},
        {"inline_data": {"mime_type": "image/jpeg", "data": "BASE64_IMAGE_DATA"}}
      ]
    }]
  }' \
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent"
```

### JavaScript - Multiple Images

```javascript
import { GoogleGenAI } from "@google/genai";

const ai = new GoogleGenAI({ apiKey: "YOUR_API_KEY" });

const response = await ai.models.generateContent({
  model: "gemini-2.5-flash",
  contents: [
    { inlineData: { mimeType: "image/jpeg", data: image1Base64 } },
    { inlineData: { mimeType: "image/jpeg", data: image2Base64 } },
    { text: "Compare these two images" }
  ]
});
```

## Best Practices

1. **Image placement** - Place single images before text prompts
2. **Resolution** - Use higher resolution for better accuracy
3. **Multiple images** - Index images clearly ("image 1", "image 2")
4. **Avoid** - Blurry, rotated, or low-quality images

## Limitations

- Cannot reliably identify non-celebrity individuals
- Limited spatial reasoning accuracy
- Cannot interpret medical imagery diagnostically
- Files API uploads expire after 48 hours

## Related Resources

- [Official Vision Guide](https://ai.google.dev/gemini-api/docs/vision)
- [Files API Documentation](https://ai.google.dev/gemini-api/docs/files)
- [Gemini Cookbook](https://github.com/google-gemini/cookbook)
- [Rate Limits](https://ai.google.dev/gemini-api/docs/rate-limits)
