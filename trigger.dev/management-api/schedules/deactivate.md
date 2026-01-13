# Deactivate Schedule - Trigger.dev Documentation

## Overview
This endpoint deactivates a schedule by its ID. It only works with `IMPERATIVE` schedules created through the dashboard or SDK functions like `schedules.create()`.

## Endpoint Details

**Method:** POST
**Path:** `/api/v1/schedules/{schedule_id}/deactivate`
**Base URL:** `https://api.trigger.dev`

## Authentication

**Header:** Authorization (required)
**Type:** Bearer token

Use your project-specific Secret API key (prefixes: `tr_dev_`, `tr_prod_`, `tr_stg_`, etc.). The SDK automatically uses the `TRIGGER_SECRET_KEY` environment variable if available.

## Parameters

**Path Parameter:**
- `schedule_id` (string, required): The unique schedule identifier

## Response

**Status Code:** 200
**Content Type:** application/json

### Response Schema

Returns a schedule object containing:
- `id`: Schedule identifier (prefixed with 'sched_')
- `task`: The scheduled task ID
- `type`: Schedule type (`IMPERATIVE` or `DECLARATIVE`)
- `active`: Boolean indicating active status
- `deduplicationKey`: Prevents duplicate schedules
- `externalId`: Custom identifier (user ID, org ID, etc.)
- `generator`: CRON configuration with expression and description
- `timezone`: IANA format timezone (defaults to UTC)
- `nextRun`: ISO 8601 datetime of next execution
- `environments`: Array of environment objects with id, type, and userName

## TypeScript Example

```typescript
import { schedules } from "@trigger.dev/sdk";

const schedule = await schedules.deactivate(scheduleId);
```

## Error Responses

- **401:** Unauthorized request
- **404:** Resource not found
