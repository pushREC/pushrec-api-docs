---
source: https://openrouter.ai/docs/guides/overview/multimodal/pdfs
scraped: 2026-01-08
---

# PDF Inputs

## Overview

OpenRouter enables PDF processing across all available models through the `/api/v1/chat/completions` API. Users can submit PDFs as either public URLs or base64-encoded data.

## Submission Methods

- **Direct URL access** for publicly available PDFs
- **Base64 encoding** for local or private documents

## PDF Processing Engines

The platform offers three PDF processing engines:

| Engine | Description | Cost |
|--------|-------------|------|
| **Mistral OCR** | Optimized for scanned documents and image-heavy PDFs | Per 1,000 pages |
| **PDF Text** | Best for structured text-based PDFs | No charge |
| **Native** | Leverages model-specific file capabilities | Charged as input tokens |

## Configuration

Users configure PDF processing through the `plugins` parameter:

```typescript
const response = await client.chat.completions.create({
  model: 'google/gemini-2.0-flash-001',
  messages: [
    {
      role: 'user',
      content: [
        {
          type: 'text',
          text: 'Summarize this document'
        },
        {
          type: 'file',
          file: {
            url: 'https://example.com/document.pdf'
          }
        }
      ]
    }
  ],
  plugins: [
    {
      id: 'file-parser',
      pdf: {
        engine: 'pdf-text'
      }
    }
  ]
});
```

## Cost Optimization

By sending file annotations back in subsequent requests, you can avoid re-parsing the same PDF document multiple times, which saves both processing time and costs.

This approach stores parsed file annotations from initial responses, eliminating redundant processing during follow-up interactions with identical documents.

## API Response Structure

Responses follow standard chat completion formatting, including:

- Message content
- Token usage metrics
- Model identification details
