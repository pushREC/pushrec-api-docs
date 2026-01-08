---
source: https://openrouter.ai/docs/sdks/typescript/completions
scraped: 2026-01-08
---

# Completions

The completions method creates text completions from prompts, supporting both streaming and non-streaming modes.

## Basic Usage

The SDK offers two implementation approaches:

### Class-based Method

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.completions.generate({
  prompt: "<value>",
});
```

### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { completionsGenerate } from "@openrouter/sdk/funcs/completionsGenerate.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await completionsGenerate(openRouter, {
  prompt: "<value>",
});
```

## Parameters

The `generate` method accepts:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `request` | CompletionParams | Yes | Completion parameters object |
| `options` | RequestOptions | No | HTTP configuration including fetch options and retry settings |

## Response & Error Handling

**Returns:** A Promise resolving to a completion response object.

**Potential Errors:**

| Error | Status Codes |
|-------|--------------|
| `ChatError` | 400, 401, 429, 500 |
| `OpenRouterDefaultError` | 4XX, 5XX |

## Note

The TypeScript SDK is currently in beta. Issues can be reported on GitHub.
