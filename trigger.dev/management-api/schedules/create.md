# Create Schedule - Trigger.dev

## Overview
This endpoint creates a new `IMPERATIVE` schedule that triggers tasks based on specified options.

## Endpoint Details

**Method:** POST
**Path:** `/api/v1/schedules`
**Base URL:** `https://api.trigger.dev`

## Request Body

Required fields:
- **task** (string): The task identifier to schedule
- **cron** (string): Cron expression defining the schedule
- **deduplicationKey** (string): Prevents duplicate schedule creation

Optional fields:
- **externalId** (string): Custom identifier (e.g., user ID, org ID)
- **timezone** (string): IANA format timezone (defaults to "UTC"). Respects daylight savings time. Example: `"America/New_York"`

## Response (200 OK)

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

## Response Fields

- **id**: Unique schedule identifier (prefixed with 'sched_')
- **type**: Schedule type (`IMPERATIVE` or `DECLARATIVE`)
- **active**: Boolean indicating if schedule is active
- **generator**: Contains cron expression and human-readable description
- **nextRun**: ISO 8601 timestamp of next execution

## Authentication

Use project-specific Secret API key with `Bearer` scheme. Key format: `tr_dev_*`, `tr_prod_*`, `tr_stg_*`, etc.

Configure via environment variable `TRIGGER_SECRET_KEY` or SDK's `configure()` function.

## TypeScript Example

```typescript
import { schedules } from "@trigger.dev/sdk";

const schedule = await schedules.create({
  task: 'my-task',
  cron: '0 0 * * *',
  deduplicationKey: 'my-schedule',
  timezone: 'America/New_York'
});
```
