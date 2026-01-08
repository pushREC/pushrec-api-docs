---
source: https://openrouter.ai/docs/sdks/typescript/responses
scraped: 2026-01-08
---

# Responses

The documentation covers the `beta.responses` endpoint for the OpenRouter TypeScript SDK, currently in beta status with issues tracked on GitHub.

## Key Method: send()

**Purpose:** Creates streaming or non-streaming responses using the OpenResponses API format.

## Usage Patterns

The SDK provides two implementation approaches:

### Class-based Usage

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.beta.responses.send({});
```

### Standalone Function

Using `betaResponsesSend()` from the core library for better tree-shaking:

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { betaResponsesSend } from "@openrouter/sdk/funcs/betaResponsesSend.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await betaResponsesSend(openRouter, {});
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `request` | OpenResponsesRequest | Yes | The request object for the API call |
| `options` | RequestOptions | No | HTTP configuration |
| `options.fetchOptions` | RequestInit | No | Custom headers |
| `options.retries` | RetryConfig | No | Retry configuration |

## Response

**Return Type:** `Promise<CreateResponsesResponse>`

## Error Handling

The endpoint handles multiple error scenarios:

| Status | Description |
|--------|-------------|
| 401 | Authentication failures |
| 402 | Payment issues |
| 429 | Rate limiting |
| 5XX | Server-side errors |

Each status code has specific error types for proper handling.

## Implementation Notes

The documentation emphasizes using `OpenRouterCore` for optimal performance and includes code snippets demonstrating both initialization and execution patterns.
