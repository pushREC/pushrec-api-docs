---
source: https://openrouter.ai/docs/guides/overview/multimodal/overview
scraped: 2026-01-08
---

# OpenRouter Multimodal Capabilities

OpenRouter provides a unified API supporting multiple input types: images, PDFs, audio, and video files sent to compatible models.

## Supported Input Types

The platform handles five modalities:

| Modality | Description |
|----------|-------------|
| **Images** | Vision models analyze, describe, or perform OCR on image files |
| **Image Generation** | Text-to-image models create images from descriptions |
| **PDFs** | Document processing with intelligent parsing for text and scanned content |
| **Audio** | Speech-capable models transcribe and analyze audio |
| **Video** | Video-capable models perform analysis, detection, and action recognition |

## API Implementation

All modality types use the `/api/v1/chat/completions` endpoint with a messages parameter. Content types include:

| Modality | Content Type |
|----------|--------------|
| Images | `image_url` |
| PDFs | `file` |
| Audio | `input_audio` |
| Video | `video_url` |

## Data Format Options

OpenRouter accepts two input approaches:

### URLs

Direct links for public content (recommended for efficiency with large files).

### Base64 Encoding

Required for local files or private content, using format-specific data URIs.

## Key Constraints

- Model compatibility varies by modality; the system filters available models automatically
- Multiple modalities combine in single requests
- File quantity limits depend on provider and model
- Video URL support is provider-specific (YouTube only for Gemini on AI Studio)

## Pricing Structure

Costs vary by type:

- Images typically charge per image or input tokens
- PDFs may charge for OCR
- Audio and video pricing depends on duration and resolution
