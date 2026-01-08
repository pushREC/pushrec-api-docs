---
source: https://openrouter.ai/docs/sdks/python/generations
scraped: 2026-01-08
---

# Generations - Python SDK

## Overview

The Generations API provides access to generation history endpoints, allowing developers to retrieve request and usage metadata for generations through the OpenRouter Python SDK (currently in beta).

## Available Operations

### get_generation

Retrieves request and usage metadata for a specific generation.

## get_generation Method

### Purpose

Fetches metadata about a previously generated request, including usage information.

### Code Example

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:
    res = open_router.generations.get_generation(id="<id>")
    print(res)
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | Yes | Generation identifier |
| `retries` | Optional[utils.RetryConfig] | No | Custom retry configuration |

### Response

Returns `operations.GetGenerationResponse` object containing the generation metadata.

### Possible Errors

The endpoint may return various HTTP error responses:

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized |
| 402 | Payment Required |
| 404 | Not Found |
| 429 | Too Many Requests |
| 500 | Internal Server Error |
| 502 | Bad Gateway |
| 524 | Edge Network Timeout |
| 529 | Provider Overloaded |
| 4XX/5XX | General OpenRouter errors |

**Note:** The Python SDK and documentation are currently in beta. Issues can be reported on the project's GitHub repository.
