---
source: https://openrouter.ai/docs/sdks/typescript/parameters
scraped: 2026-01-08
---

# Parameters

The ParametersT endpoint retrieves a model's supported parameters along with data about their popularity.

## Available Operations

- **getParameters** - Fetches a model's supported parameters and popularity metrics

## getParameters Method

**Purpose:** Get a model's supported parameters and data about which are most popular

### Basic Usage Example

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter();

async function run() {
  const result = await openRouter.parameters.getParameters({
    bearer: process.env["OPENROUTER_BEARER"] ?? "",
  }, {
    author: "<value>",
    slug: "<value>",
    provider: "Google AI Studio",
  });

  console.log(result);
}

run();
```

### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { parametersGetParameters } from "@openrouter/sdk/funcs/parametersGetParameters.js";

const openRouter = new OpenRouterCore();

async function run() {
  const res = await parametersGetParameters(openRouter, {
    bearer: process.env["OPENROUTER_BEARER"] ?? "",
  }, {
    author: "<value>",
    slug: "<value>",
    provider: "Google AI Studio",
  });
  if (res.ok) {
    const { value: result } = res;
    console.log(result);
  } else {
    console.log("parametersGetParameters failed:", res.error);
  }
}

run();
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `security` | GetParametersSecurity | Yes | Authentication credentials required |
| `request` | GetParametersRequest | Yes | The request object for the API call |
| `options` | RequestOptions | No | HTTP request configuration |
| `options.fetchOptions` | RequestInit | No | Headers and fetch options (excluding method/body) |
| `options.retries` | RetryConfig | No | Automatic retry configuration |

### Request Object Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `author` | string | Yes | Model author identifier |
| `slug` | string | Yes | Model slug identifier |
| `provider` | string | No | Specific provider (e.g., "Google AI Studio") |

## Response

Returns a `Promise<GetParametersResponse>` containing the model's parameters and usage data.

## Error Handling

| Status | Format | Description |
|--------|--------|-------------|
| 401 | application/json | Unauthorized |
| 404 | application/json | Not Found |
| 500 | application/json | Server Error |
| 4XX, 5XX | Various formats | General Error |
