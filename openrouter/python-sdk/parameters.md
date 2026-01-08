---
source: https://openrouter.ai/docs/sdks/python/parameters
scraped: 2026-01-08
---

# Parameters - Python SDK

## Overview

This documentation covers the Parameters endpoints within the OpenRouter Python SDK, which is currently in beta status.

## Available Operations

### get_parameters

Retrieves a model's supported parameters and usage popularity data.

## get_parameters Method

### Purpose

Fetches information about a model's supported parameters and which ones are most frequently used.

### Code Example

```python
from openrouter import OpenRouter, operations
import os

with OpenRouter() as open_router:
    res = open_router.parameters.get_parameters(
        security=operations.GetParametersSecurity(
            bearer=os.getenv("OPENROUTER_BEARER", ""),
        ),
        author="<value>",
        slug="<value>"
    )
    print(res)
```

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `security` | GetParametersSecurity | Authentication credentials |
| `author` | str | Model author identifier |
| `slug` | str | Model slug identifier |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `provider` | ProviderName | Provider name (e.g., OpenAI) |
| `retries` | RetryConfig | Custom retry behavior configuration |

### Response

Returns `operations.GetParametersResponse`

### Possible Errors

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized access (authentication failure) |
| 404 | Resource not found |
| 500 | Internal server error |
| 4XX, 5XX | General OpenRouter errors |

**Note:** The Python SDK and docs are currently in beta.
