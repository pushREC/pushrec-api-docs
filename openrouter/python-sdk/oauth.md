---
source: https://openrouter.ai/docs/sdks/python/oauth
scraped: 2026-01-08
---

# OAuth - Python SDK

## Overview

The OpenRouter Python SDK provides OAuth authentication endpoints for exchanging authorization codes and creating API keys through a PKCE (Proof Key for Code Exchange) flow.

## Key Operations

### 1. Exchange Authorization Code for API Key

**Purpose:** Convert an OAuth authorization code into a user-controlled API key.

**Basic Usage:**

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.oauth.exchange_code(
        code="<authorization_code>",
        code_verifier="<pkce_verifier>",
        code_challenge_method="S256"
    )
    print(res)
```

**Required Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `code` | str | The authorization code from OAuth redirect |

**Optional Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `code_verifier` | str | For PKCE verification |
| `code_challenge_method` | str | Method used to generate the code challenge (e.g., S256) |
| `retries` | RetryConfig | Custom retry configuration |

**Possible Errors:**

| Status Code | Format |
|-------------|--------|
| 400 | application/json |
| 403 | application/json |
| 500 | application/json |

---

### 2. Create Authorization Code

**Purpose:** Generate an authorization code to initiate the PKCE flow for API key creation.

**Basic Usage:**

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:

    res = open_router.oauth.create_code(
        callback_url="https://example.com/callback",
        code_challenge="<challenge>",
        code_challenge_method="S256",
        limit=100.0,
        expires_at="2025-12-31T23:59:59Z"
    )
    print(res)
```

**Required Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `callback_url` | str | HTTPS redirect URL (limited to ports 443 and 3000) |

**Optional Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `code_challenge` | str | PKCE security parameter |
| `code_challenge_method` | str | Challenge generation method |
| `limit` | float | Credit limit for the generated API key |
| `expires_at` | str | Expiration date for the API key |
| `retries` | RetryConfig | Custom retry configuration |

**Possible Errors:**

| Status Code | Format |
|-------------|--------|
| 400 | application/json |
| 401 | application/json |
| 500 | application/json |

---

## PKCE Flow Overview

1. Generate a `code_verifier` (random string)
2. Create a `code_challenge` from the verifier using SHA256
3. Call `create_code()` with the challenge
4. User authorizes via the returned URL
5. Exchange the authorization code using `exchange_code()` with the original verifier

**Note:** The Python SDK and docs are currently in beta. Report issues on GitHub.
