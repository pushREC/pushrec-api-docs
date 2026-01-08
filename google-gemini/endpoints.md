---
source: https://ai.google.dev/api/rest
scraped: 2025-01-08
---

# Gemini Vision API - Endpoints Reference

## Base URL

```
https://generativelanguage.googleapis.com/v1beta/
```

## Content Generation

### Generate Content (Synchronous)

Generate text/multimodal response from image input.

```
POST /v1beta/models/{model}:generateContent
```

**Path Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | string | Model ID (e.g., `gemini-2.5-flash`) |

**Headers:**

| Header | Value |
|--------|-------|
| `x-goog-api-key` | Your API key |
| `Content-Type` | `application/json` |

**Request Body:**

```json
{
  "contents": [
    {
      "parts": [
        {
          "text": "Describe this image"
        },
        {
          "inline_data": {
            "mime_type": "image/jpeg",
            "data": "BASE64_ENCODED_IMAGE"
          }
        }
      ]
    }
  ],
  "generationConfig": {
    "temperature": 0.7,
    "maxOutputTokens": 2048
  }
}
```

**Response:**

```json
{
  "candidates": [
    {
      "content": {
        "parts": [
          {
            "text": "The image shows..."
          }
        ],
        "role": "model"
      },
      "finishReason": "STOP",
      "avgLogprobs": -0.123
    }
  ],
  "usageMetadata": {
    "promptTokenCount": 258,
    "candidatesTokenCount": 150,
    "totalTokenCount": 408
  }
}
```

### Generate Content (Streaming)

Stream response chunks via Server-Sent Events.

```
POST /v1beta/models/{model}:streamGenerateContent
```

**Request:** Same as `generateContent`

**Response:** Server-Sent Events stream with partial responses.

---

## Files API (For Large Images)

### Upload File

Upload image files larger than 20MB inline limit.

```
POST /upload/v1beta/files
```

**Headers:**

| Header | Value |
|--------|-------|
| `x-goog-api-key` | Your API key |
| `Content-Type` | `multipart/related` |

**Request (Resumable Upload):**

1. **Initial Request** - Send metadata:

```bash
curl -X POST \
  -H "x-goog-api-key: YOUR_API_KEY" \
  -H "X-Goog-Upload-Protocol: resumable" \
  -H "X-Goog-Upload-Command: start" \
  -H "X-Goog-Upload-Header-Content-Length: FILE_SIZE" \
  -H "X-Goog-Upload-Header-Content-Type: image/jpeg" \
  -H "Content-Type: application/json" \
  -d '{"file": {"display_name": "my-image.jpg"}}' \
  "https://generativelanguage.googleapis.com/upload/v1beta/files"
```

2. **Upload Content** - Use returned upload URL:

```bash
curl -X POST \
  -H "X-Goog-Upload-Offset: 0" \
  -H "X-Goog-Upload-Command: upload, finalize" \
  -H "Content-Length: FILE_SIZE" \
  --data-binary @image.jpg \
  "UPLOAD_URL_FROM_STEP_1"
```

**Response:**

```json
{
  "file": {
    "name": "files/abc123xyz",
    "displayName": "my-image.jpg",
    "mimeType": "image/jpeg",
    "sizeBytes": "1234567",
    "createTime": "2025-01-08T12:00:00Z",
    "expirationTime": "2025-01-10T12:00:00Z",
    "uri": "https://generativelanguage.googleapis.com/v1beta/files/abc123xyz"
  }
}
```

### Get File Metadata

```
GET /v1beta/files/{file_id}
```

**Response:** File object with metadata (name, URI, size, expiration).

### List Files

```
GET /v1beta/files
```

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `pageSize` | integer | Max files to return (default 10) |
| `pageToken` | string | Pagination token |

### Delete File

```
DELETE /v1beta/files/{file_id}
```

**Response:** Empty body on success (204 No Content).

---

## Using Uploaded Files in Requests

Reference uploaded files by URI in `generateContent`:

```json
{
  "contents": [
    {
      "parts": [
        {
          "text": "Describe this image"
        },
        {
          "file_data": {
            "mime_type": "image/jpeg",
            "file_uri": "https://generativelanguage.googleapis.com/v1beta/files/abc123xyz"
          }
        }
      ]
    }
  ]
}
```

---

## Image Input Methods

### Method 1: Inline Base64

For images under 20MB total request size.

```json
{
  "inline_data": {
    "mime_type": "image/jpeg",
    "data": "BASE64_ENCODED_DATA"
  }
}
```

### Method 2: Files API URI

For larger images (up to 2GB).

```json
{
  "file_data": {
    "mime_type": "image/jpeg",
    "file_uri": "https://generativelanguage.googleapis.com/v1beta/files/FILE_ID"
  }
}
```

### Method 3: Public URL (Vertex AI)

For publicly accessible images.

```json
{
  "file_data": {
    "mime_type": "image/jpeg",
    "file_uri": "https://example.com/image.jpg"
  }
}
```

---

## Token Calculation

### Gemini 1.5 Models

- **Both dimensions <= 384px**: 258 tokens
- **Larger images**: Tiled (256-768px tiles), resized to 768x768, each tile = 258 tokens

### Gemini 2.0/2.5 Models

- **Both dimensions <= 384px**: 258 tokens
- **Larger images**: Tiled to 768x768 pixels, each tile = 258 tokens

### Gemini 3 Models

Variable sequence length per image:
- **Low**: 280 tokens
- **Medium**: 560 tokens (default)
- **High**: 1120 tokens
- **Ultra-High**: 2240 tokens

---

## Object Detection (Gemini 2.0+)

Request bounding boxes with specific prompt:

```json
{
  "contents": [
    {
      "parts": [
        {
          "inline_data": {
            "mime_type": "image/jpeg",
            "data": "BASE64_IMAGE"
          }
        },
        {
          "text": "Detect all objects in this image and return bounding boxes"
        }
      ]
    }
  ]
}
```

**Response format:** Bounding boxes normalized to 0-1000 scale:
- `[y_min, x_min, y_max, x_max]`

---

## Segmentation (Gemini 2.5+)

Request contour masks:

```json
{
  "contents": [
    {
      "parts": [
        {
          "inline_data": {
            "mime_type": "image/jpeg",
            "data": "BASE64_IMAGE"
          }
        },
        {
          "text": "Segment the main subject in this image"
        }
      ]
    }
  ]
}
```

**Response:** Base64-encoded PNG probability maps.

---

## Error Responses

| HTTP Code | Error | Description |
|-----------|-------|-------------|
| 400 | INVALID_ARGUMENT | Malformed request or invalid image format |
| 401 | UNAUTHENTICATED | Missing or invalid API key |
| 403 | PERMISSION_DENIED | API key lacks required permissions |
| 429 | RESOURCE_EXHAUSTED | Rate limit exceeded |
| 500 | INTERNAL | Server error |

**Rate Limit Error Response:**

```json
{
  "error": {
    "code": 429,
    "message": "Resource has been exhausted (e.g. check quota).",
    "status": "RESOURCE_EXHAUSTED"
  }
}
```

---

## Available Models for Vision

| Model ID | Description |
|----------|-------------|
| `gemini-3-pro-preview` | Latest, most capable |
| `gemini-3-flash-preview` | Fast, latest generation |
| `gemini-2.5-pro` | Stable, high capability |
| `gemini-2.5-flash` | Fast, good balance |
| `gemini-2.5-flash-lite` | Lightweight, fastest |
| `gemini-2.0-flash` | Previous generation |
| `gemini-2.0-flash-lite` | Previous, lightweight |
