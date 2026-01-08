---
source: https://openrouter.ai/docs/sdks/typescript/endpoints
scraped: 2026-01-08
---

# Endpoints

The Endpoints API provides methods to retrieve endpoint information for models within the OpenRouter TypeScript SDK, which is currently in beta.

## Available Methods

### 1. List Endpoints (`list`)

**Purpose:** List all endpoints for a model

#### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.endpoints.list({
  author: "<value>",
  slug: "<value>",
});
```

#### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { endpointsList } from "@openrouter/sdk/funcs/endpointsList.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await endpointsList(openRouter, {
  author: "<value>",
  slug: "<value>",
});
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `author` | string | Yes | Model author identifier |
| `slug` | string | Yes | Model slug identifier |
| `options` | RequestOptions | No | HTTP request configuration including fetch options and retry settings |

#### Response

`Promise<ListEndpointsResponse>` - Endpoint information

#### Possible Errors

| Status | Error |
|--------|-------|
| 404 | Not Found |
| 500 | Internal Server Error |
| 4XX/5XX | General OpenRouter errors |

---

### 2. List ZDR Endpoints (`listZdrEndpoints`)

**Purpose:** Preview the impact of ZDR on the available endpoints

#### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const result = await openRouter.endpoints.listZdrEndpoints();
```

#### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { endpointsListZdrEndpoints } from "@openrouter/sdk/funcs/endpointsListZdrEndpoints.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const res = await endpointsListZdrEndpoints(openRouter);
```

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `options` | RequestOptions | No | HTTP request configuration |

#### Response

`Promise<ListZdrEndpointsResponse>` - ZDR-affected endpoint preview data

#### Possible Errors

| Status | Error |
|--------|-------|
| 500 | Internal Server Error |
| 4XX/5XX | General OpenRouter errors |

## SDK Import Methods

Both standard client and standalone function patterns are supported for tree-shaking optimization.

## Note

The SDK documentation indicates a beta status with an invitation to report issues on GitHub.
