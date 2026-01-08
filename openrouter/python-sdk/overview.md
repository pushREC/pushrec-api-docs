---
source: https://openrouter.ai/docs/sdks/python/overview
scraped: 2026-01-08
---

# OpenRouter Python SDK Overview

The OpenRouter Python SDK is a type-safe toolkit for building AI applications with access to 300+ language models through a unified API. The SDK is currently in beta status.

## Key Features

### Auto-generated Updates

The SDK is automatically generated from OpenRouter's OpenAPI specifications and updates with every API change, ensuring new models appear in IDE autocomplete instantly.

### Type Safety

All parameters, response fields, and configuration options include Python type hints and Pydantic validation. Invalid configurations are caught at runtime with clear error messages.

### Streaming Support

The SDK provides type-safe streaming responses where full type information for streaming responses is available through event iteration.

### Async Operations

Developers can use async/await patterns with the `send_async()` method for non-blocking requests.

## Installation

The SDK supports three installation methods:

```bash
# Recommended
uv add openrouter

# Alternative methods
pip install openrouter
poetry add openrouter
```

**Requirements:** Python 3.9 or higher

**API Keys:** Obtainable at [openrouter.ai/settings/keys](https://openrouter.ai/settings/keys)

## Basic Usage

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:
    res = open_router.chat.send(
        messages=[{"role": "user", "content": "Hello!"}],
        model="openai/gpt-4",
        temperature=0.7,
        stream=False
    )
    print(res)
```

## Getting Help

GitHub issues can be reported at the [official repository](https://github.com/OpenRouterTeam/python-sdk/issues) for SDK bugs and feature requests.

**Note:** The Python SDK and docs are currently in beta.
