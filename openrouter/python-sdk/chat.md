---
source: https://openrouter.ai/docs/sdks/python/chat
scraped: 2026-01-08
---

# Chat - Python SDK

## Overview

The OpenRouter Python SDK provides a `send` method for creating chat completions with support for both streaming and non-streaming modes.

## Key Method: send

**Purpose:** Sends a request for model responses given a chat conversation.

## Basic Usage

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:
    res = open_router.chat.send(messages=[], stream=False)

    with res as event_stream:
        for event in event_stream:
            print(event, flush=True)
```

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `messages` | List[Message] | List of Message components (mandatory) |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | str | Specify which model to use |
| `models` | List[str] | Specify multiple models |
| `stream` | bool | Enable streaming responses |
| `temperature` | float | Control response randomness |
| `top_p` | float | Nucleus sampling parameter |
| `max_tokens` | int | Set output length limits |
| `max_completion_tokens` | int | Alternative token limit parameter |
| `tools` | List[Tool] | Provide tool definitions for function calling |
| `response_format` | ResponseFormat | Specify output format requirements |
| `provider` | ProviderConfig | Route to specific model providers |
| `session_id` | str | Group related requests (max 128 characters) |
| `retries` | RetryConfig | Override default retry behavior |

## Streaming Example

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:
    res = open_router.chat.send(
        messages=[{"role": "user", "content": "Tell me a story"}],
        model="openai/gpt-4",
        stream=True
    )

    with res as event_stream:
        for event in event_stream:
            print(event, flush=True)
```

## Error Handling

The method can return errors including:

| Status Code | Error Type |
|-------------|------------|
| 400 | ChatError |
| 401 | ChatError |
| 429 | ChatError |
| 500 | ChatError |
| 4XX, 5XX | OpenRouterDefaultError |

**Note:** The Python SDK is currently in beta; issues can be reported on GitHub.
