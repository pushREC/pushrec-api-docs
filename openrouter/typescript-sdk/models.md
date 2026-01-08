---
source: https://openrouter.ai/docs/sdks/typescript/models/models
scraped: 2026-01-08
---

# Models

The Models API provides endpoints to retrieve information about available AI models. The documentation covers three main operations for querying model data through the TypeScript SDK.

## Key Operations

### 1. Count Models

**Purpose:** Retrieves the total number of available models.

This is a simple operation requiring only an API key, with no additional parameters needed.

#### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.models.count();
```

#### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { modelsCount } from "@openrouter/sdk/funcs/modelsCount.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await modelsCount(openRouter);
```

---

### 2. List All Models

**Purpose:** Returns comprehensive information about all models and their properties.

The operation accepts a request object and supports standard HTTP options and retry configuration.

#### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.models.list();
```

#### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { modelsList } from "@openrouter/sdk/funcs/modelsList.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await modelsList(openRouter);
```

---

### 3. List Models for User

**Purpose:** Provides a filtered list based on individual user provider preferences.

This operation requires bearer token authentication and returns the same model list structure as the general list endpoint.

#### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.models.listForUser({
  bearer: process.env["OPENROUTER_BEARER"] ?? "",
});
```

#### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { modelsListForUser } from "@openrouter/sdk/funcs/modelsListForUser.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await modelsListForUser(openRouter, {
  bearer: process.env["OPENROUTER_BEARER"] ?? "",
});
```

## Implementation Approaches

The SDK offers two implementation methods:

| Approach | Description |
|----------|-------------|
| Class-based | Using the `OpenRouter` client class for straightforward usage |
| Standalone functions | Using `OpenRouterCore` with functions like `modelsList` for better tree-shaking optimization |

## Error Handling

All endpoints may return errors including:

| Status | Description | Applicable Operations |
|--------|-------------|----------------------|
| 400 | Bad Request | list operation |
| 401 | Unauthorized | user-specific listing |
| 500 | Internal Server Error | all operations |
| 4XX/5XX | General catch-all | all operations |

## Configuration Options

Requests support standard options including:

| Option | Description |
|--------|-------------|
| `fetchOptions` | Custom fetch parameters via RequestInit |
| `retries` | Retry configuration via RetryConfig |
| Custom HTTP headers | Through RequestInit options |
