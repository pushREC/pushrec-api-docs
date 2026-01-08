---
source: https://openrouter.ai/docs/sdks/python/embeddings
scraped: 2026-01-08
---

# Embeddings - Python SDK

## Overview

The OpenRouter Python SDK provides embeddings functionality through two main operations for text embedding tasks.

## Key Operations

### generate()

Submits embedding requests to create vector representations of text.

**Basic Usage:**

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.embeddings.generate(
        input="Your text to embed",
        model="openai/text-embedding-ada-002"
    )
    print(res)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `input` | str/List[str] | Yes | The text to embed |
| `model` | str | Yes | Target embedding model |
| `encoding_format` | str | No | Output encoding format |
| `dimensions` | int | No | Number of dimensions |
| `user` | str | No | End-user identifier |
| `provider` | ProviderConfig | No | Provider routing preferences |
| `input_type` | str | No | Type of input content |
| `retries` | RetryConfig | No | Custom retry configuration |

---

### list_models()

Retrieves all available embeddings models and their properties.

**Basic Usage:**

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.embeddings.list_models()
    print(res)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `retries` | RetryConfig | No | Custom retry configuration |

## Response & Error Handling

Both operations return structured responses and handle multiple HTTP error codes:

| Status Code | Description |
|-------------|-------------|
| 400 | Bad Request |
| 401 | Unauthorized |
| 402 | Payment Required |
| 404 | Not Found |
| 429 | Too Many Requests |
| 500 | Internal Server Error |
| 502 | Bad Gateway |
| 503 | Service Unavailable |
| 524 | Edge Network Timeout |
| 529 | Provider Overloaded |

## Implementation Pattern

The SDK uses a context manager pattern: users initialize an `OpenRouter` client with an API key, then call methods on the `embeddings` namespace to perform operations.

**Note:** The documentation indicates the Python SDK is currently in beta with known issues tracked on GitHub.
