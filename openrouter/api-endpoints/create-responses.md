---
source: https://openrouter.ai/docs/api/api-reference/responses/create-responses
scraped: 2026-01-08
type: api-endpoint
---

# Create a Response

## Endpoint Overview

**POST** `https://openrouter.ai/api/v1/responses`

Creates streaming or non-streaming responses using the OpenResponses API format. The endpoint supports multiple content types including text, images, files, and audio inputs.

## Authentication

Required header: `Authorization: Bearer <token>`

## Request Parameters

### Core Fields

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `input` | string \| array | Yes | Message content - either a simple string or structured array of input items |
| `model` | string | Yes | Model identifier (e.g., `anthropic/claude-4.5-sonnet-20250929`) |
| `temperature` | number | No | Sampling temperature (0-2) |
| `top_p` | number | No | Nucleus sampling parameter (0-1) |
| `top_k` | number | No | Top-K sampling parameter |
| `max_output_tokens` | number | No | Maximum output tokens |
| `stream` | boolean | No | Enable streaming (default: false) |

### Advanced Options

| Parameter | Type | Description |
|-----------|------|-------------|
| `tools` | array | Function definitions for tool calling |
| `tool_choice` | string \| object | Tool selection strategy: "auto", "none", "required", or specific function |
| `reasoning` | object | Configuration for extended reasoning modes |
| `instructions` | string | System-level instructions |
| `metadata` | object | Custom key-value pairs for tracking |
| `prompt` | object | Prompt template with variables |
| `modalities` | array | Output types: "text" and/or "image" |
| `provider` | object | Routing preferences and constraints |
| `plugins` | array | Enable plugins like auto-router, moderation, web search |
| `user` | string | End-user identifier (max 128 chars) |
| `session_id` | string | Request grouping identifier (max 128 chars) |

### Input Message Structure

Messages follow this format:

```json
{
  "type": "message",
  "role": "user|system|assistant|developer",
  "content": "text_string OR array_of_content_items"
}
```

Content items support:
- **Text**: `{"type": "input_text", "text": "..."}`
- **Images**: `{"type": "input_image", "detail": "auto|high|low", "image_url": "..."}`
- **Files**: `{"type": "input_file", "file_data": "...", "filename": "..."}`
- **Audio**: `{"type": "input_audio", "input_audio": {"data": "...", "format": "mp3|wav"}}`

### Tool Definition

```json
{
  "type": "function",
  "name": "function_name",
  "description": "What it does",
  "parameters": {
    "type": "object",
    "properties": { /* JSON Schema */ }
  }
}
```

### Provider Configuration

Control routing behavior via the `provider` object:

```json
{
  "allow_fallbacks": true,
  "order": ["provider_slug1", "provider_slug2"],
  "only": ["Anthropic", "OpenAI"],
  "ignore": ["unreliable_provider"],
  "sort": "price|throughput|latency",
  "max_price": {
    "prompt": "0.001",
    "completion": "0.002"
  },
  "data_collection": "allow|deny",
  "zdr": true,
  "quantizations": ["int4", "fp8"]
}
```

## Response Schema

### Success Response (200)

```json
{
  "id": "response_id",
  "object": "response",
  "created_at": 1234567890,
  "model": "model_used",
  "status": "completed|incomplete|in_progress|failed|cancelled|queued",
  "output": [
    {
      "id": "item_id",
      "type": "message",
      "role": "assistant",
      "status": "completed",
      "content": [
        {
          "type": "output_text",
          "text": "Response text",
          "annotations": []
        }
      ]
    }
  ],
  "output_text": "Plain text extraction",
  "usage": {
    "input_tokens": 150,
    "input_tokens_details": { "cached_tokens": 0 },
    "output_tokens": 75,
    "output_tokens_details": { "reasoning_tokens": 0 },
    "total_tokens": 225,
    "cost": 0.00123,
    "cost_details": {
      "upstream_inference_input_cost": 0.0001,
      "upstream_inference_output_cost": 0.0002
    }
  },
  "error": null,
  "incomplete_details": null
}
```

### Output Item Types

- **Message**: Text response with optional annotations
- **Reasoning**: Extended thinking content with summary
- **Function Call**: Tool invocation with arguments
- **Web Search Call**: Search operation status
- **File Search Call**: Vector database queries
- **Image Generation Call**: Generated images

### Error Responses

| Status | Meaning | Common Causes |
|--------|---------|---------------|
| 400 | Bad Request | Invalid parameters, malformed input |
| 401 | Unauthorized | Missing or invalid API key |
| 402 | Payment Required | Insufficient credits/quota |
| 408 | Request Timeout | Operation exceeded time limit |
| 413 | Payload Too Large | Request size exceeds limits |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Server Error | Unexpected server issue |
| 502 | Bad Gateway | Upstream provider failure |
| 503 | Service Unavailable | Temporary service outage |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/responses"
payload = {
    "input": [{"type": "message", "role": "user", "content": "Hello?"}],
    "model": "anthropic/claude-4.5-sonnet-20250929",
    "temperature": 0.7
}
headers = {"Authorization": "Bearer <token>", "Content-Type": "application/json"}
response = requests.post(url, json=payload, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/responses';
const options = {
  method: 'POST',
  headers: {'Authorization': 'Bearer <token>', 'Content-Type': 'application/json'},
  body: JSON.stringify({
    input: [{type: 'message', role: 'user', content: 'Hello?'}],
    model: 'anthropic/claude-4.5-sonnet-20250929',
    temperature: 0.7
  })
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X POST https://openrouter.ai/api/v1/responses \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "input": [{"type": "message", "role": "user", "content": "Hello?"}],
    "model": "anthropic/claude-4.5-sonnet-20250929",
    "temperature": 0.7
  }'
```

## Plugins

Enable with `"plugins"` array:

| ID | Purpose | Key Options |
|----|---------|------------|
| `auto-router` | Dynamic model routing | `enabled`, `allowed_models` |
| `moderation` | Content safety checks | - |
| `web` | Web search integration | `enabled`, `max_results`, `engine` |
| `file-parser` | Document processing | `pdf` (engine: mistral-ocr, pdf-text, native) |
| `response-healing` | Fix malformed outputs | `enabled` |

## Key Notes

- All requests are processed asynchronously with a response object tracking completion status
- Streaming responses return Server-Sent Events format when `stream: true`
- Cache support via `prompt_cache_key` for cost reduction
- Reasoning configs support effort levels: minimal, low, medium, high, xhigh
- Output annotations include file citations, URL citations, and file paths
