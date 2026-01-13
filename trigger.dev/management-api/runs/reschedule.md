# Reschedule Run - Trigger.dev API Documentation

## Overview
The Reschedule Run endpoint updates a delayed run with a new delay, functioning only when the run is in the DELAYED state.

## Endpoint Details
- **Method:** POST
- **Path:** `/api/v1/runs/{runId}/reschedule`
- **Base URL:** https://api.trigger.dev

## Authentication
Requires a project-specific Secret API key (prefixed with `tr_dev_`, `tr_prod_`, `tr_stg_`, etc.) passed as a Bearer token in the Authorization header. The SDK defaults to using the `TRIGGER_SECRET_KEY` environment variable.

## Path Parameters
**runId** (required, string): The run identifier beginning with `run_`, returned when triggering a task.

## Request Body
**delay** (required): Accepts either:
- Duration string format: `"1d"`, `"6h"`, `"10m"`, `"11s"` (example: `"1hr"`)
- ISO 8601 datetime: `"2024-06-25T15:45:26.000Z"`

## TypeScript Example
```typescript
import { runs } from "@trigger.dev/sdk";

const handle = await runs.reschedule("run_1234", {
  delay: new Date("2024-06-29T20:45:56.340Z")
});
```

## Response (200 Success)
Returns a run object including:
- `id`: Run identifier
- `status`: Current run status (PENDING_VERSION, DELAYED, QUEUED, etc.)
- `taskIdentifier`: Associated task name
- `createdAt`, `updatedAt`: Timestamps
- `attempts`: Array of execution attempts
- `payload`, `output`: Request/response data
- `metadata`: Custom run metadata
- `delayedUntil`: Scheduled execution time
- Additional fields for cost, duration, tags, and related runs

## Error Responses
- **400 Bad Request:** Invalid or missing run ID; failed to create new run
- **401 Unauthorized:** Invalid or missing API key
- **404 Not Found:** Run not found

## Related Operations
- Previous: Cancel Run endpoint
- Next: Update Metadata endpoint
