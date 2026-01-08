---
source: https://openrouter.ai/docs/sdks/python/apikeys
scraped: 2026-01-08
---

# API Keys - Python SDK

## Overview

The APIKeys method documentation covers API key management endpoints for the OpenRouter Python SDK, currently in beta.

## Available Operations

The SDK provides six key operations:

### 1. list

List API keys with optional filtering and pagination.

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.api_keys.list()
    print(res)
```

### 2. create

Create a new API key with customizable settings.

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.api_keys.create(
        name="my-new-key",
        limit=100.0,  # USD spending limit
        limit_reset_type="monthly",  # daily, weekly, monthly
        expires_at="2025-12-31T23:59:59Z",
        include_byok_usage=True
    )
    print(res)
```

### 3. update

Update an API key to modify existing configuration.

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.api_keys.update(
        hash="<key_hash>",
        name="updated-key-name",
        disabled=False,
        limit=200.0,
        limit_reset_type="weekly",
        include_byok_usage=True
    )
    print(res)
```

### 4. delete

Delete an API key permanently.

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.api_keys.delete(hash="<key_hash>")
    print(res)
```

### 5. get

Get a single API key by its hash identifier.

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.api_keys.get(hash="<key_hash>")
    print(res)
```

### 6. get_current_key_metadata

Retrieve metadata for the currently authenticated key.

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.api_keys.get_current_key_metadata()
    print(res)
```

## Key Features

### Creation Parameters

- **Spending limits** (in USD)
- **Limit reset schedules** (daily, weekly, monthly)
- **Expiration timestamps**
- **BYOK usage inclusion** options

### Update Capabilities

- Modification of name
- Disabled status
- Spending limits
- Reset types
- BYOK settings

### Authentication

Requires setting the `OPENROUTER_API_KEY` environment variable, used consistently across all operations.

## Common Error Responses

All endpoints may return:

| Error | Status Code |
|-------|-------------|
| Unauthorized | 401 |
| Too Many Requests | 429 |
| Internal Server Error | 500 |
| General errors | 4XX/5XX |

**Note:** The Python SDK and docs are currently in beta.
