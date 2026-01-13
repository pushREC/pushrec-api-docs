# List Runs - Trigger.dev Documentation

## Overview
This endpoint retrieves runs from a specific environment, supporting filtering by status, creation date, task identifier, version, and other criteria.

## Endpoint Details
- **Method:** GET
- **Path:** `/api/v1/runs`
- **Base URL:** `https://api.trigger.dev`

## Authentication
Requires a project-specific Secret API key (prefixed with `tr_dev_`, `tr_prod_`, `tr_stg_`, etc.). The SDK defaults to the `TRIGGER_SECRET_KEY` environment variable.

## Query Parameters

### Pagination (`page`)
- **size:** Number of runs per page (10-100, default: 25)
- **after:** Run ID to start page after (forward pagination)
- **before:** Run ID to start page before (backward pagination)

### Filtering (`filter`)
- **createdAt.from/to:** Date range filtering
- **createdAt.period:** Period format (e.g., "1d")
- **status:** Array of statuses (PENDING_VERSION, QUEUED, EXECUTING, REATTEMPTING, FROZEN, COMPLETED, CANCELED, FAILED, CRASHED, INTERRUPTED, SYSTEM_FAILURE)
- **taskIdentifier:** Filter by task identifier(s)
- **version:** Filter by worker version(s)
- **bulkAction:** Filter by bulk action ID
- **schedule:** Filter by schedule ID
- **isTest:** Boolean for test runs
- **tag:** Filter by attached tag(s)

## Response Format

### Success (200)
Returns object containing:
- **data:** Array of run objects with fields including id, status, taskIdentifier, environment details, timestamps, version, idempotencyKey, cost metrics, and duration
- **pagination:** Contains "next" and "previous" run IDs for cursor-based navigation

### Error (400)
Invalid query parameters return error code and detailed message with path information.

## Code Examples

### Basic List
```typescript
import { runs } from "@trigger.dev/sdk";
let page = await runs.list({ limit: 20 });
for (const run of page.data) {
  console.log(`Run ID: ${run.id}, Status: ${run.status}`);
}
```

### Manual Pagination
```typescript
while (page.hasNextPage()) {
  page = await page.getNextPage();
}
```

### Auto-Pagination
```typescript
const allRuns = [];
for await (const run of runs.list({ limit: 20 })) {
  allRuns.push(run);
}
```

### Filtered Query
```typescript
const response = await runs.list({
  status: ["QUEUED", "EXECUTING"],
  taskIdentifier: ["my-task", "my-other-task"],
  from: new Date("2024-04-01T00:00:00Z"),
  to: new Date(),
});
```

## Run Object Fields
- **id:** Unique identifier (prefixed "run_")
- **status:** Current execution state
- **taskIdentifier:** Associated task name
- **env:** Environment details (id, name, user for dev environments)
- **isTest:** Boolean test indicator
- **createdAt/updatedAt:** Timestamps
- **version:** Worker version number
- **idempotencyKey:** Optional duplicate prevention key
- **startedAt/finishedAt:** Execution timeline
- **delayedUntil:** Scheduled execution time if delayed
- **ttl:** Time-to-live specification
- **expiredAt:** Expiration timestamp if TTL exceeded
- **tags:** Array of attached identifiers
- **costInCents/baseCostInCents:** Billing metrics
- **durationMs:** Compute duration excluding waits
