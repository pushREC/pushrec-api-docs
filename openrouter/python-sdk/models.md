---
source: https://openrouter.ai/docs/sdks/python/models/models
scraped: 2026-01-08
---

# Models - Python SDK

## Overview

The Models API provides endpoints for retrieving information about available AI models. The SDK currently includes three main operations for model discovery and filtering.

## Key Operations

### 1. Count Models

Retrieves the total number of available models.

**Basic Usage:**

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.models.count()
    print(res)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `retries` | RetryConfig | No | Custom retry configuration |

**Response:** `ModelsCountResponse`

**Possible Errors:**

| Status Code | Description |
|-------------|-------------|
| 500 | Internal Server Error |
| 4XX, 5XX | General OpenRouter errors |

---

### 2. List All Models

Returns comprehensive information about all models and their properties.

**Basic Usage:**

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.models.list(
        category="chat",
        supported_parameters="tools"
    )
    print(res)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `category` | str | No | Filter by model categorization |
| `supported_parameters` | str | No | Filter by capability |
| `retries` | RetryConfig | No | Custom retry configuration |

**Possible Errors:**

| Status Code | Description |
|-------------|-------------|
| 400 | Bad Request |
| 500 | Internal Server Error |
| 4XX, 5XX | General OpenRouter errors |

---

### 3. List Models for User

Provides a personalized model list filtered by individual user provider preferences.

**Basic Usage:**

```python
from openrouter import OpenRouter, operations
import os

with OpenRouter() as open_router:

    res = open_router.models.list_for_user(
        security=operations.ListModelsForUserSecurity(
            bearer=os.getenv("OPENROUTER_BEARER", ""),
        )
    )
    print(res)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `security` | ListModelsForUserSecurity | Yes | Bearer token authentication |
| `retries` | RetryConfig | No | Custom retry configuration |

**Possible Errors:**

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized |
| 500 | Internal Server Error |
| 4XX, 5XX | General OpenRouter errors |

---

## Authentication Methods

The SDK supports two authentication approaches:

| Method | Use Case |
|--------|----------|
| **API Key Authentication** | Used for general `count()` and `list()` operations |
| **Bearer Token Authentication** | Required for `list_for_user()` operations |

**Note:** The Python SDK and docs are currently in beta.
