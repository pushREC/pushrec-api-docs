# Update Schedule - Trigger.dev

## Overview
This endpoint allows you to modify an existing schedule by its ID. It only works with `IMPERATIVE` schedules created via the dashboard or SDK functions like `schedules.create()`.

## Endpoint Details
- **Method:** PUT
- **Path:** `/api/v1/schedules/{schedule_id}`
- **Base URL:** https://api.trigger.dev

## Authentication
Requires a project-specific Secret API key (prefixed with `tr_dev_`, `tr_prod_`, `tr_stg_`, etc.). The SDK automatically uses the `TRIGGER_SECRET_KEY` environment variable if available.

## Path Parameters
- **schedule_id** (string, required): The unique identifier of the schedule to update

## Request Body (application/json)
- **task** (string, required): The task identifier to be triggered
- **cron** (string, required): CRON expression defining the schedule frequency
- **externalId** (string, optional): Custom identifier for tracking purposes
- **timezone** (string, optional): IANA timezone format (e.g., "America/New_York"). Defaults to UTC and respects daylight savings time.

## Response (200 OK)
Returns the updated schedule object containing:
- **id**: Schedule identifier (prefixed with 'sched_')
- **task**: Triggered task identifier
- **type**: "IMPERATIVE" or "DECLARATIVE"
- **active**: Boolean indicating if schedule is active
- **deduplicationKey**: Prevents duplicate schedule creation
- **externalId**: Custom identifier if provided
- **generator**: Object with type, CRON expression, and description
- **timezone**: Configured timezone
- **nextRun**: ISO 8601 timestamp of next execution
- **environments**: Array of environment objects (id, type, userName)

## TypeScript SDK Example
```typescript
import { schedules } from "@trigger.dev/sdk";

const updatedSchedule = await schedules.update(scheduleId, {
  task: 'my-updated-task',
  cron: '0 0 * * *'
});
```

## Error Responses
- **400**: Invalid request parameters
- **401**: Unauthorized
- **404**: Schedule not found
- **422**: Unprocessable entity
