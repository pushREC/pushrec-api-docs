---
source: https://openrouter.ai/docs/sdks/typescript/credits
scraped: 2026-01-08
---

# Credits

The Credits API provides endpoints for managing user account credits within the OpenRouter TypeScript SDK, currently in beta.

## Available Operations

### 1. getCredits

**Purpose:** Retrieve total credits purchased and used for the authenticated user.

#### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.credits.getCredits();
```

#### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { creditsGetCredits } from "@openrouter/sdk/funcs/creditsGetCredits.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await creditsGetCredits(openRouter);
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `options` | RequestOptions | No | HTTP configuration |
| `options.fetchOptions` | RequestInit | No | Custom request headers and settings |
| `options.retries` | RetryConfig | No | Retry configuration for failed requests |

#### Possible Error Responses

| Status | Error |
|--------|-------|
| 401 | Unauthorized |
| 403 | Forbidden |
| 500 | Internal Server Error |

---

### 2. createCoinbaseCharge

**Purpose:** Generate a Coinbase charge for cryptocurrency payments.

#### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.credits.createCoinbaseCharge({
  bearer: process.env["OPENROUTER_BEARER"] ?? "",
}, {
  amount: 100,
  sender: "0x1234567890123456789012345678901234567890",
  chainId: 1,
});
```

#### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { creditsCreateCoinbaseCharge } from "@openrouter/sdk/funcs/creditsCreateCoinbaseCharge.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await creditsCreateCoinbaseCharge(openRouter, {
  bearer: process.env["OPENROUTER_BEARER"] ?? "",
}, {
  amount: 100,
  sender: "0x1234567890123456789012345678901234567890",
  chainId: 1,
});
```

#### Required Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `security` | CreateCoinbaseChargeSecurity | Yes | Bearer token authentication |
| `request` | CreateChargeRequest | Yes | Request object (amount, sender address, chain ID) |

#### Possible Error Responses

| Status | Error |
|--------|-------|
| 400 | Bad Request |
| 401 | Unauthorized |
| 429 | Too Many Requests |
| 500 | Internal Server Error |

## Note

Both methods support tree-shaking optimization through standalone function imports from `@openrouter/sdk/funcs/`.
