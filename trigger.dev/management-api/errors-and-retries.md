# Errors and Retries - Trigger.dev Documentation

## Overview
This page explains how to handle errors and manage automatic retries when using the Trigger.dev management API SDK.

## Handling Errors

When SDK methods fail to connect to the API server or receive non-successful responses, they throw an `ApiError` that developers can catch and handle.

**Key points:**
- The error object contains `status`, `headers`, and `body` properties
- Developers should use `instanceof ApiError` to distinguish API errors from other error types

**Example error handling:**
```typescript
import { runs, APIError } from "@trigger.dev/sdk";

async function main() {
  try {
    const run = await runs.retrieve("run_1234");
  } catch (error) {
    if (error instanceof ApiError) {
      console.error(`API error: ${error.status}, ${error.headers}, ${error.body}`);
    } else {
      console.error(`Unknown error: ${error.message}`);
    }
  }
}
```

## Retries

**Default behavior:**
- SDK automatically retries failed requests (network errors, server errors)
- Default: up to 3 retry attempts with exponential backoff

**Customization options:**

The `configure` function accepts `requestOptions` with retry settings:

```typescript
configure({
  requestOptions: {
    retry: {
      maxAttempts: 5,
      minTimeoutInMs: 1000,
      maxTimeoutInMs: 5000,
      factor: 1.8,
      randomize: true,
    },
  },
});
```

**Per-request customization:**

All SDK functions accept `requestOptions` as the final parameter:

```typescript
const run = await runs.retrieve("run_1234", {
  retry: {
    maxAttempts: 1, // Disables retries
  },
});
```

## Important Note

When executing inside a task, the SDK ignores custom retry options for certain functions (`task.trigger`, `task.batchTrigger`) and instead uses retry settings optimized for task execution environments.
