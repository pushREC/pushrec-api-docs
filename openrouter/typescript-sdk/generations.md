---
source: https://openrouter.ai/docs/sdks/typescript/generations
scraped: 2026-01-08
---

# Generations

The Generations method provides access to generation history endpoints within the OpenRouter TypeScript SDK, currently in beta status.

## Available Operation

The SDK includes one primary operation: `getGeneration`, which retrieves request and usage metadata for a specific generation.

## getGeneration Method

**Purpose:** Get request & usage metadata for a generation

### Basic Usage

The method is accessible through the OpenRouter client instance:

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.generations.getGeneration({
  id: "<id>",
});
```

### Standalone Implementation

For improved tree-shaking performance, developers can use the standalone function approach:

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { generationsGetGeneration } from "@openrouter/sdk/funcs/generationsGetGeneration.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await generationsGetGeneration(openRouter, {
  id: "<id>",
});
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `request` | GetGenerationRequest | Yes | The request object for the API call |
| `options` | RequestOptions | No | Configuration for HTTP requests, including fetch options and retry settings |

## Response

`Promise<operations.GetGenerationResponse>`

## Error Handling

The method may return various HTTP error responses:

| Status | Description |
|--------|-------------|
| 401 | Unauthorized |
| 402 | Payment Required |
| 404 | Not Found |
| 429 | Too Many Requests |
| 500 | Internal Server Error |
| 502 | Bad Gateway |
| 524 | Edge Network Timeout |
| 529 | Provider Overloaded |
