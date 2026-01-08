---
source: https://openrouter.ai/docs/guides/overview/models
scraped: 2026-01-08
---

# OpenRouter Models API

## Overview

OpenRouter provides unified access to 400+ language models through a standardized API. You can explore models on their website or via the API, with an RSS feed available for updates.

## Models API Standard

The Models API offers freely available information about all LLMs through a standardized JSON response format cached at the edge for production reliability.

## API Response Structure

### Root Object

The API returns data within a wrapper containing an array of model objects.

### Model Object Fields

| Field | Type | Purpose |
|-------|------|---------|
| `id` | string | Unique model identifier used in API requests |
| `canonical_slug` | string | Permanent, unchanging slug identifier |
| `name` | string | Human-readable display name |
| `created` | number | Unix timestamp of addition date |
| `description` | string | Detailed description of the model's capabilities |
| `context_length` | number | Maximum token context window |
| `architecture` | Architecture | Technical capability details |
| `pricing` | Pricing | Lowest available price structure |
| `top_provider` | TopProvider | Primary provider configuration |
| `per_request_limits` | object | Rate limiting info (nullable) |
| `supported_parameters` | string[] | Supported API parameters |

### Architecture Object

```typescript
{
  "input_modalities": string[],
  "output_modalities": string[],
  "tokenizer": string,
  "instruct_type": string | null
}
```

### Pricing Object

All values in USD per token/request/unit; `"0"` indicates free access.

```typescript
{
  "prompt": string,
  "completion": string,
  "request": string,
  "image": string,
  "web_search": string,
  "internal_reasoning": string,
  "input_cache_read": string,
  "input_cache_write": string
}
```

### Top Provider Object

```typescript
{
  "context_length": number,
  "max_completion_tokens": number,
  "is_moderated": boolean
}
```

## Supported Parameters

Available parameters include:

- `tools`
- `tool_choice`
- `max_tokens`
- `temperature`
- `top_p`
- `reasoning`
- `include_reasoning`
- `structured_outputs`
- `response_format`
- `stop`
- `frequency_penalty`
- `presence_penalty`
- `seed`

## Tokenization Note

Different models tokenize text differently—some use multi-character chunks (GPT, Claude, Llama) while others tokenize by character (PaLM). This variation affects token counts and costs. Use the `usage` field in responses to verify actual token consumption.
