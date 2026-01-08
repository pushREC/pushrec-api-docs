---
source: https://openrouter.ai/docs/sdks/typescript/chat
scraped: 2026-01-08
---

# Chat

The Chat API endpoint enables model responses for given conversations, supporting both streaming and non-streaming modes.

## Core Implementation

The SDK provides two approaches:

### Class-based Method

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.chat.send({
  messages: [],
});
```

### Standalone Function

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { chatSend } from "@openrouter/sdk/funcs/chatSend.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await chatSend(openRouter, { messages: [] });
```

## Parameters

| Parameter | Type | Required | Purpose |
|-----------|------|----------|---------|
| `request` | ChatGenerationParams | Yes | Request object containing chat parameters |
| `options` | RequestOptions | No | HTTP request configuration |
| `options.fetchOptions` | RequestInit | No | Additional HTTP headers/settings |
| `options.retries` | RetryConfig | No | Retry behavior configuration |

## Response & Error Handling

**Returns:** `Promise<SendChatCompletionRequestResponse>`

**Error Types:**

| Error | Status Codes | Description |
|-------|--------------|-------------|
| `ChatError` | 400, 401, 429, 500 | Chat-specific errors |
| `OpenRouterDefaultError` | 4XX/5XX | Generic error responses |

## Note

The TypeScript SDK and docs are currently in beta. Report issues on GitHub.
