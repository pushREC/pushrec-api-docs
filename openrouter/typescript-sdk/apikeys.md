---
source: https://openrouter.ai/docs/sdks/typescript/apikeys
scraped: 2026-01-08
---

# API Keys

The APIKeys section provides API key management functionality through the OpenRouter TypeScript SDK, which is currently in beta. Users can manage their authentication credentials through six primary operations.

## Available Operations

| Operation | HTTP Method | Endpoint | Description |
|-----------|-------------|----------|-------------|
| list | GET | `/keys` | Retrieve all API keys |
| create | POST | `/keys` | Generate new API keys |
| update | PATCH | `/keys/{hash}` | Modify existing keys |
| delete | DELETE | `/keys/{hash}` | Remove keys |
| get | GET | `/keys/{hash}` | Fetch individual key details |
| getCurrentKeyMetadata | GET | `/key` | Access metadata for the active authentication key |

## Implementation Approaches

### Standard Object-Oriented Approach

Uses the `OpenRouter` class directly:

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.apiKeys.list();
```

### Standalone Functions for Tree-Shaking

For optimal tree-shaking performance, developers can employ standalone functions with `OpenRouterCore`:

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { apiKeysList } from "@openrouter/sdk/funcs/apiKeysList.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await apiKeysList(openRouter);
```

## Common Parameters

All operations support these optional configuration parameters:

| Parameter | Description |
|-----------|-------------|
| `fetchOptions` | Customizable HTTP request settings |
| `retries` | Automatic retry configuration for failed requests |

## Error Handling

Operations may return various error types:

| Status | Error |
|--------|-------|
| 400 | Bad Request - Invalid request parameters (create/update operations) |
| 401 | Unauthorized - Invalid or missing authentication credentials |
| 404 | Not Found - Key not found for get/update/delete operations |
| 429 | Too Many Requests - Rate limiting exceeded |
| 500 | Internal Server Error - Server-side issues |
