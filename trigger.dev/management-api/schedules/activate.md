# Activate Schedule - Trigger.dev Documentation

## Overview
This endpoint activates a schedule by its ID. It only works on `IMPERATIVE` schedules created via the dashboard or SDK functions like `schedules.create()`.

## API Endpoint
**POST** `/api/v1/schedules/{schedule_id}/activate`

## Usage Example
```typescript
import { schedules } from "@trigger.dev/sdk";

const schedule = await schedules.activate(scheduleId);
```

## Authentication
Requires a project-specific Secret API key (starting with `tr_dev_`, `tr_prod_`, `tr_stg_`, etc.). The SDK defaults to the `TRIGGER_SECRET_KEY` environment variable. Manual configuration:

```typescript
import { configure } from "@trigger.dev/sdk";
configure({ accessToken: "tr_dev_1234" });
```

## Path Parameters
- **schedule_id** (string, required): The unique schedule identifier

## Success Response (200)
Returns the updated schedule object with these fields:
- `id`: Schedule ID (prefixed with 'sched_')
- `task`: Scheduled task identifier
- `type`: Schedule type (IMPERATIVE or DECLARATIVE)
- `active`: Boolean indicating active status
- `deduplicationKey`: Prevents duplicate schedules
- `externalId`: Custom identifier (user ID, org ID, etc.)
- `generator`: Contains `type` (CRON), `expression`, and `description`
- `timezone`: IANA format timezone (defaults to UTC)
- `nextRun`: ISO 8601 datetime of next execution
- `environments`: Array of environment objects with `id`, `type`, and `userName`

## Example Response
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
  "environments": [{ "id": "<string>", "type": "<string>", "userName": "<string>" }]
}
```

## Error Responses
- **401**: Unauthorized (invalid API key)
- **404**: Schedule not found
