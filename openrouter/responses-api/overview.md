---
source: https://openrouter.ai/docs/api/reference/responses/overview
scraped: 2026-01-08
---

# Responses API Overview

OpenRouter offers a **stateless, OpenAI-compatible API** for unified access to multiple AI models through the Responses API.

> **Note:** This API is **in beta stage and may have breaking changes**.

## Base URL

```
https://openrouter.ai/api/v1/responses
```

## Authentication

Requires Bearer token via the `Authorization` header with your OpenRouter API key.

```bash
curl https://openrouter.ai/api/v1/responses \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{...}'
```

## Stateless Operation

The API operates in a stateless manner, meaning **each request is independent and no conversation state is persisted** between calls. Users must supply complete conversation history with every request.

## Capabilities

The Responses API supports four primary functions:

| Capability | Description |
|------------|-------------|
| **Basic Text I/O** | Simple text input/output interactions |
| **Advanced Reasoning** | Configurable reasoning effort levels |
| **Function Calling** | Tool/function calling with parallel execution support |
| **Web Search** | Real-time web search with citation features |

## Basic Request

```json
{
  "model": "openai/gpt-4o",
  "input": "What is the capital of France?",
  "max_output_tokens": 1000
}
```

## Basic Response

```json
{
  "id": "resp_abc123",
  "object": "response",
  "created": 1704067200,
  "model": "openai/gpt-4o",
  "output": [
    {
      "type": "message",
      "role": "assistant",
      "content": [
        {
          "type": "output_text",
          "text": "The capital of France is Paris."
        }
      ]
    }
  ],
  "usage": {
    "input_tokens": 10,
    "output_tokens": 8,
    "total_tokens": 18
  },
  "status": "completed"
}
```

## Error Response

```json
{
  "error": {
    "code": "invalid_prompt",
    "message": "Detailed error description"
  },
  "metadata": null
}
```

## Rate Limiting

Standard OpenRouter rate limiting policies apply to all Responses API requests. See the [Limits documentation](/api-reference/limits.md) for details.

## Key Differences from Chat Completions API

| Feature | Chat Completions | Responses API |
|---------|------------------|---------------|
| Endpoint | `/chat/completions` | `/responses` |
| Input Format | `messages` array | `input` string or structured |
| Output Format | `choices` array | `output` array |
| Reasoning | Not supported | Configurable effort levels |
| Web Search | Not built-in | Native plugin support |
| Status | Production | Beta |

## Next Steps

- [Basic Usage](/responses-api/basic-usage.md) - Simple text generation
- [Reasoning](/responses-api/reasoning.md) - Advanced reasoning capabilities
- [Tool Calling](/responses-api/tool-calling.md) - Function calling integration
- [Web Search](/responses-api/web-search.md) - Real-time search with citations
- [Error Handling](/responses-api/error-handling.md) - Error management
