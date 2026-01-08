---
source: https://openrouter.ai/docs/sdks/python/endpoints
scraped: 2026-01-08
---

# Endpoints - Python SDK

## Overview

The Endpoints section provides methods to retrieve endpoint information for models within the OpenRouter Python SDK, which is currently in beta.

## Available Operations

### 1. list - List all endpoints for a model

**Purpose:** Retrieves all available endpoints for a specified model.

**Basic Usage:**

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.endpoints.list(author="<value>", slug="<value>")
    print(res)
```

**Required Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `author` | str | Model author identifier |
| `slug` | str | Model slug identifier |

**Optional Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `retries` | RetryConfig | Configuration to customize retry behavior |

**Possible Response Errors:**

| Status Code | Error Type |
|-------------|------------|
| 404 | NotFoundResponseError |
| 500 | InternalServerResponseError |
| 4XX, 5XX | OpenRouterDefaultError |

---

### 2. list_zdr_endpoints - Preview ZDR impact on endpoints

**Purpose:** Preview the impact of ZDR (Zero Data Retention) on the available endpoints.

**Basic Usage:**

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.endpoints.list_zdr_endpoints()
    print(res)
```

**Optional Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `retries` | RetryConfig | Configuration to customize retry behavior |

**Possible Response Errors:**

| Status Code | Error Type |
|-------------|------------|
| 500 | InternalServerResponseError |
| 4XX, 5XX | OpenRouterDefaultError |

---

## Beta Status Notice

The Python SDK and documentation are currently in beta. Users can report issues via the [GitHub repository](https://github.com/OpenRouterTeam/python-sdk/issues).
