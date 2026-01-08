---
source: https://openrouter.ai/docs/sdks/python/completions
scraped: 2026-01-08
---

# Completions - Python SDK

## Overview

The completions endpoint creates text completions based on provided prompts, supporting both streaming and non-streaming operations.

## Key Operation: generate

This method produces completions for specified prompts and parameters.

### Basic Usage

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.completions.generate(prompt=[], stream=False)
    print(res)
```

## Parameters

### Required

| Parameter | Type | Description |
|-----------|------|-------------|
| `prompt` | str/List[str] | The input prompt for completion |

### Optional

| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | str | Model selection |
| `models` | List[str] | Multiple model selection |
| `max_tokens` | int | Token limit for response |
| `temperature` | float | Output randomness (0-2) |
| `top_p` | float | Nucleus sampling parameter |
| `stream` | bool | Enable streaming responses |
| `stop` | str/List[str] | Stop sequences |
| `frequency_penalty` | float | Reduce token repetition |
| `presence_penalty` | float | Discourage new tokens |
| `best_of` | int | Generate multiple completions |
| `echo` | bool | Echo back the prompt |
| `logit_bias` | Dict | Modify token probabilities |
| `logprobs` | int | Include log probabilities |
| `n` | int | Number of completions |
| `seed` | int | Random seed for reproducibility |
| `suffix` | str | Text to append after completion |
| `user` | str | End-user identifier |
| `metadata` | Dict | Custom metadata |
| `response_format` | ResponseFormat | Output format specification |
| `stream_options` | StreamOptions | Streaming configuration |
| `retries` | RetryConfig | Custom retry configuration |

## Response

Returns a `CompletionResponse` component object.

## Error Handling

The endpoint may return:

| Status Code | Error Type |
|-------------|------------|
| 400 | ChatError |
| 401 | ChatError |
| 429 | ChatError |
| 500 | ChatError |
| 4XX, 5XX | OpenRouterDefaultError |

**Note:** The Python SDK is currently in beta. Report issues on GitHub.
