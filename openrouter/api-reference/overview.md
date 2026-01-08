---
source: https://openrouter.ai/docs/api/reference/overview
scraped: 2026-01-08
---

# API Reference Overview

OpenRouter provides a normalized API interface that mirrors OpenAI's Chat API while supporting multiple AI model providers. The key distinction is that **OpenRouter normalizes the schema across models and providers so you only need to learn one.**

## Request Structure

The API accepts POST requests to `/api/v1/chat/completions` with either `messages` or `prompt` parameters.

### Core Request Options

| Parameter | Description |
|-----------|-------------|
| `model` | Model selection with provider prefix |
| `max_tokens` | Output control (range 1 to context length) |
| `temperature` | Sampling temperature (0-2) |
| `response_format` | For structured JSON outputs |
| `top_p` | Nucleus sampling parameter |
| `top_k` | Top-k sampling parameter |
| `frequency_penalty` | Penalty for frequent tokens |
| `presence_penalty` | Penalty for present tokens |
| `tools` | Tool/function calling definitions |
| `tool_choice` | Tool selection strategy |
| `stream` | Enable streaming via SSE (`true`/`false`) |

### Authentication Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | Bearer token with API key |
| `HTTP-Referer` | Optional | Your site URL for app identification |
| `X-Title` | Optional | Your site name for app identification |

## Response Structure

Responses normalize completion data across providers with a consistent schema.

### Response Fields

| Field | Description |
|-------|-------------|
| `choices` | Array containing either `message` (non-streaming) or `delta` (streaming) objects |
| `finish_reason` | Standardized to: `tool_calls`, `stop`, `length`, `content_filter`, or `error` |
| `usage` | Token usage with normalized counts via GPT-4o tokenizer |

### Native Token Counts

Native token counts are available through the `/api/v1/generation` endpoint for precise billing.

## Features

- **Assistant Prefill**: Guide responses by prefilling assistant content
- **Graceful Degradation**: Unsupported parameters are ignored rather than causing failures
- **Provider Normalization**: Consistent schema regardless of underlying provider

## Example Request

```bash
curl https://openrouter.ai/api/v1/chat/completions \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-4o",
    "messages": [
      {"role": "user", "content": "Hello!"}
    ]
  }'
```

## Example Response

```json
{
  "id": "gen-1234567890",
  "object": "chat.completion",
  "created": 1704067200,
  "model": "openai/gpt-4o",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "Hello! How can I help you today?"
      },
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 10,
    "completion_tokens": 12,
    "total_tokens": 22
  }
}
```
