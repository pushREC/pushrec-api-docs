# Cancel Run - Trigger.dev API Documentation

## Overview
The Cancel Run endpoint allows you to cancel an in-progress task run. If the run has already completed, the operation has no effect.

## Endpoint Details

**Method:** POST
**Path:** `/api/v2/runs/{runId}/cancel`
**Base URL:** `https://api.trigger.dev`

## TypeScript Example

```typescript
import { runs } from "@trigger.dev/sdk";

await runs.cancel("run_1234");
```

## Parameters

### Path Parameter

**runId** (required, string)
- The run's unique identifier, prefixed with `run_`
- Example: `"run_1234"`
- This ID is provided when you trigger a task

### Authorization

**Header:** `Authorization`
**Type:** Bearer token
**Description:** Use your project-specific Secret API key, prefixed with `tr_dev_`, `tr_prod_`, or `tr_stg_`

The SDK automatically uses the `TRIGGER_SECRET_KEY` environment variable. Alternatively, configure it manually:

```typescript
import { configure } from "@trigger.dev/sdk";
configure({ accessToken: "tr_dev_1234" });
```

## Response

### Success (200 OK)
```json
{
  "id": "run_1234"
}
```

The response contains the ID of the canceled run.

### Error Responses

- **400 Bad Request:** Invalid or missing run ID
- **401 Unauthorized:** Invalid or missing API key
- **404 Not Found:** Run doesn't exist

## Key Characteristics

- Only affects runs currently in progress
- Completed runs are unaffected by cancellation requests
- Returns the canceled run's ID upon success
