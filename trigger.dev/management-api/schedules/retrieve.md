# Retrieve Schedule - Trigger.dev

## Overview
This endpoint retrieves a schedule by its ID from the Trigger.dev API.

## Endpoint Details

**Method:** GET
**Path:** `/api/v1/schedules/{schedule_id}`
**Base URL:** `https://api.trigger.dev`

## Authentication

**Header:** Authorization (required)
**Type:** Bearer token

Use your project-specific Secret API key, which starts with `tr_dev_`, `tr_prod_`, `tr_stg_`, etc. Found in your Trigger.dev project dashboard's API Keys section.

The TypeScript SDK defaults to the `TRIGGER_SECRET_KEY` environment variable. To set it manually:

```typescript
import { configure } from "@trigger.dev/sdk";
configure({ accessToken: "tr_dev_1234" });
```

## Path Parameters

**schedule_id** (string, required): The unique identifier of the schedule (e.g., "sched_1234")

## TypeScript Example

```typescript
import { schedules } from "@trigger.dev/sdk";

const schedule = await schedules.retrieve(scheduleId);
```

## Response (200 - Success)

Returns a schedule object with these properties:

- **id**: Schedule identifier, prefixed with "sched_"
- **task**: The scheduled task identifier
- **type**: Either "DECLARATIVE" (code-defined) or "IMPERATIVE" (dashboard/SDK-created)
- **active**: Boolean indicating if the schedule is currently active
- **deduplicationKey**: Key to prevent duplicate schedules
- **externalId**: Custom identifier (user ID, org ID, etc.)
- **generator**: Object containing:
  - type: "CRON"
  - expression: Cron expression (e.g., "0 0 * * *")
  - description: Human-readable description
- **timezone**: IANA format timezone (defaults to UTC)
- **nextRun**: ISO 8601 datetime of next execution
- **environments**: Array of environment objects with id, type, and userName

### Example Response

```json
{
  "id": "sched_1234",
  "task": "my-scheduled-task",
  "type": "IMPERATIVE",
  "active": true,
  "deduplicationKey": "dedup_key_1234",
  "externalId": "user_1234",
  "generator": {
    "type": "CRON",
    "expression": "0 0 * * *",
    "description": "Every day at midnight"
  },
  "timezone": "America/New_York",
  "nextRun": "2024-04-01T00:00:00Z",
  "environments": [
    {
      "id": "<string>",
      "type": "<string>",
      "userName": "<string>"
    }
  ]
}
```

## Error Responses

- **401**: Unauthorized request
- **404**: Resource not found
