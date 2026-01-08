---
source: https://openrouter.ai/docs/sdks/python/credits
scraped: 2026-01-08
---

# Credits - Python SDK

## Overview

The Credits API provides endpoints for managing credit accounts with OpenRouter's Python SDK, currently in beta.

## Available Operations

### 1. Get Credits

**Purpose:** Retrieve total credits purchased and used for the authenticated user.

**Basic Usage:**

```python
from openrouter import OpenRouter
import os

with OpenRouter(
    api_key=os.getenv("OPENROUTER_API_KEY", ""),
) as open_router:
    res = open_router.credits.get_credits()
    print(res)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `retries` | Optional[RetryConfig] | No | Override default client retry behavior |

**Response:** `operations.GetCreditsResponse`

**Possible Errors:**

| Error | Status Code |
|-------|-------------|
| Unauthorized | 401 |
| Forbidden | 403 |
| Internal Server Error | 500 |
| General OpenRouter errors | 4XX, 5XX |

---

### 2. Create Coinbase Charge

**Purpose:** Create a Coinbase charge for cryptocurrency payments.

**Basic Usage:**

```python
from openrouter import OpenRouter, operations
import os

with OpenRouter() as open_router:
    res = open_router.credits.create_coinbase_charge(
        security=operations.CreateCoinbaseChargeSecurity(
            bearer=os.getenv("OPENROUTER_BEARER", ""),
        ),
        amount=100,
        sender="0x1234567890123456789012345678901234567890",
        chain_id=1
    )
    print(res)
```

**Required Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `security` | CreateCoinbaseChargeSecurity | Authentication credentials |
| `amount` | float | Payment amount |
| `sender` | str | Wallet address |
| `chain_id` | int | Blockchain network identifier |

**Optional Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `retries` | RetryConfig | Override default retry behavior |

**Response:** `operations.CreateCoinbaseChargeResponse`

**Possible Errors:**

| Error | Status Code |
|-------|-------------|
| Bad Request | 400 |
| Unauthorized | 401 |
| Too Many Requests | 429 |
| Internal Server Error | 500 |
| General OpenRouter errors | 4XX, 5XX |

**Note:** The Python SDK and docs are currently in beta.
