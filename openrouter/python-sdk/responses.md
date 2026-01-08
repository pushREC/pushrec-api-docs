---
source: https://openrouter.ai/docs/sdks/python/responses
scraped: 2026-01-08
---

# Responses - Python SDK

## Overview

The `beta.responses` endpoint creates streaming or non-streaming responses using the OpenResponses API format.

## Core Method: send()

This method generates AI responses with extensive configuration options for customization.

### Basic Usage

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.beta.responses.send(service_tier="auto", stream=False)

    with res as event_stream:
        for event in event_stream:
            print(event, flush=True)
```

## Key Parameters

### Input & Content

| Parameter | Type | Description |
|-----------|------|-------------|
| `input` | str/List | Request data as string or array of items |
| `instructions` | str | Additional guidance for response generation |
| `prompt` | PromptConfig | OpenAI-compatible prompt configuration |

### Model Selection

| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | str | Single model identifier |
| `models` | List[str] | List of model identifiers |
| `service_tier` | str | Service tier preference ("auto" supported) |

### Output Configuration

| Parameter | Type | Description |
|-----------|------|-------------|
| `text` | TextConfig | Text formatting and verbosity settings |
| `modalities` | List[str] | Output types ("text", "image") |
| `max_output_tokens` | int | Token limit specification |
| `reasoning` | ReasoningConfig | Reasoning mode configuration with summary options |

### Advanced Features

| Parameter | Type | Description |
|-----------|------|-------------|
| `tools` | List[Tool] | Define callable functions for the model |
| `tool_choice` | str/ToolChoice | Tool selection strategy |
| `parallel_tool_calls` | bool | Enable concurrent tool execution |
| `temperature` | float | Sampling temperature |
| `top_p` | float | Nucleus sampling parameter |
| `top_k` | int | Top-k sampling parameter |
| `image_config` | ImageConfig | Provider-specific image generation settings |
| `plugins` | List[Plugin] | Enable optional plugins with custom settings |

### Tracking & Context

| Parameter | Type | Description |
|-----------|------|-------------|
| `user` | str | End-user identifier (max 128 characters) |
| `session_id` | str | Request grouping identifier (max 128 characters) |
| `metadata` | Dict | Custom key-value pairs (16 max, specific character limits) |

### Caching & Continuity

| Parameter | Type | Description |
|-----------|------|-------------|
| `prompt_cache_key` | str | Cache identifier |
| `previous_response_id` | str | Link to prior responses |

## Streaming Example

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.beta.responses.send(
        input="Tell me about AI",
        model="openai/gpt-4",
        stream=True
    )

    with res as event_stream:
        for event in event_stream:
            print(event, flush=True)
```

## Response & Error Handling

Returns `operations.CreateResponsesResponse` with streaming event support.

### Handled HTTP Errors

| Status Code | Description |
|-------------|-------------|
| 400 | Bad Request |
| 401 | Unauthorized |
| 402 | Payment Required |
| 404 | Not Found |
| 408 | Timeout |
| 413 | Payload Too Large |
| 422 | Unprocessable Entity |
| 429 | Rate Limited |
| 500 | Internal Server Error |
| 501 | Not Implemented |
| 502 | Bad Gateway |
| 503 | Service Unavailable |
| 524 | Edge Timeout |
| 529 | Provider Overloaded |

**Note:** The Python SDK and docs are currently in beta.
