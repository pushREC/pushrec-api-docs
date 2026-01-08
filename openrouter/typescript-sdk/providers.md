---
source: https://openrouter.ai/docs/sdks/typescript/providers
scraped: 2026-01-08
---

# Providers

This documentation covers the Providers method for the OpenRouter TypeScript SDK, which enables retrieving provider information through API endpoints.

## Available Operations

The SDK offers one primary operation:

- **list** - Retrieve all available providers

## List Providers Implementation

### Standard Usage

The basic approach uses the OpenRouter SDK class:

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

async function run() {
  const result = await openRouter.providers.list();
  console.log(result);
}

run();
```

### Core Function Approach

For optimal tree-shaking, use the standalone function method:

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { providersList } from "@openrouter/sdk/funcs/providersList.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

async function run() {
  const res = await providersList(openRouter);
  if (res.ok) {
    const { value: result } = res;
    console.log(result);
  } else {
    console.log("providersList failed:", res.error);
  }
}

run();
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `options` | RequestOptions | No | HTTP request configuration options |
| `options.fetchOptions` | RequestInit | No | Underlying HTTP request options (all Request options except method/body) |
| `options.retries` | RetryConfig | No | Configuration for automatic retry behavior under failure conditions |

## Response & Errors

**Success Response:** `Promise<ListProvidersResponse>`

**Possible Errors:**

| Status | Error Type | Content Type |
|--------|------------|--------------|
| 500 | InternalServerResponseError | application/json |
| 4XX, 5XX | OpenRouterDefaultError | any |

## Note

The SDK and documentation remain in beta status.
