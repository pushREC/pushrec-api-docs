---
source: https://openrouter.ai/docs/sdks/python/providers
scraped: 2026-01-08
---

# Providers - Python SDK

## Overview

The Providers endpoint enables users to retrieve information about available providers through the OpenRouter Python SDK, which is currently in beta.

## Key Operation: List Providers

The primary function allows developers to list all available providers.

### Implementation Example

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.providers.list()
    print(res)
```

### API Details

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `retries` | RetryConfig | No | Optional retry configuration to customize default client behavior |

**Response Type:**

Returns `operations.ListProvidersResponse`

**Error Handling:**

| Status Code | Description | Format |
|-------------|-------------|--------|
| 500 | Internal server errors | application/json |
| 4XX/5XX | Default OpenRouter errors | various |

## Status Note

The SDK and documentation remain in beta, with issue reporting available through the project's GitHub repository.
