---
source: https://openrouter.ai/docs/sdks/typescript/embeddings
scraped: 2026-01-08
---

# Embeddings

The OpenRouter TypeScript SDK provides two primary embeddings operations:

1. **generate** - Submit an embedding request
2. **listModels** - List all embeddings models

## Generate Embeddings

The `generate` method submits embedding requests to the router.

### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.embeddings.generate({
  input: "<value>",
  model: "Taurus",
});
```

### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { embeddingsGenerate } from "@openrouter/sdk/funcs/embeddingsGenerate.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await embeddingsGenerate(openRouter, {
  input: "<value>",
  model: "Taurus",
});
```

## List Available Models

The `listModels` operation returns available embedding models and their properties without requiring request parameters.

### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.embeddings.listModels();
```

### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { embeddingsListModels } from "@openrouter/sdk/funcs/embeddingsListModels.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await embeddingsListModels(openRouter);
```

## Configuration Options

Both methods accept optional request configuration including:

| Parameter | Description |
|-----------|-------------|
| `fetchOptions` | Custom HTTP headers via RequestInit |
| `retries` | Automatic retry policies through RetryConfig |

## Error Handling

The API handles multiple HTTP status codes:

### 4xx Errors

| Status | Description |
|--------|-------------|
| 400 | Bad requests |
| 401 | Authorization failures |
| 402 | Payment required |
| 404 | Missing resources |
| 429 | Rate limits exceeded |

### 5xx Errors

| Status | Description |
|--------|-------------|
| 500 | Server issues |
| 524 | Edge network timeout |
| 529 | Provider overload |

## Note

The SDK and documentation remain in beta development.
