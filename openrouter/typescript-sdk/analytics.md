---
source: https://openrouter.ai/docs/sdks/typescript/analytics
scraped: 2026-01-08
---

# Analytics

The Analytics API provides endpoints for retrieving usage data. Currently, one operation is available: `getUserActivity`, which returns user activity metrics grouped by endpoint for the preceding 30 UTC days.

## getUserActivity Method

**Purpose:** Retrieves aggregated user activity data organized by API endpoint

### Basic Implementation

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

async function run() {
  const result = await openRouter.analytics.getUserActivity();
  console.log(result);
}

run();
```

### Standalone Function Approach

```typescript
import { OpenRouterCore } from "@openrouter/sdk/core.js";
import { analyticsGetUserActivity } from "@openrouter/sdk/funcs/analyticsGetUserActivity.js";

const openRouter = new OpenRouterCore({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

async function run() {
  const res = await analyticsGetUserActivity(openRouter);
  if (res.ok) {
    const { value: result } = res;
    console.log(result);
  } else {
    console.log("analyticsGetUserActivity failed:", res.error);
  }
}

run();
```

## Parameters & Configuration

| Parameter | Type | Required | Notes |
|-----------|------|----------|-------|
| `request` | GetUserActivityRequest | Yes | Request object containing query parameters |
| `options.fetchOptions` | RequestInit | Optional | HTTP request customization (headers, etc.) |
| `options.retries` | RetryConfig | Optional | Automatic retry configuration for failed requests |

## Response & Error Handling

**Success Response:** `Promise<GetUserActivityResponse>`

**Possible Errors:**

| Status | Error |
|--------|-------|
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 500 | Internal Server Error |
| 4XX/5XX | General OpenRouter errors |

## Note

The TypeScript SDK and docs are currently in beta.
