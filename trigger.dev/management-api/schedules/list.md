# List Schedules - Trigger.dev Documentation

## Overview
This endpoint retrieves all schedules from your Trigger.dev project with optional pagination support.

## Endpoint Details
- **Method:** GET
- **Path:** `/api/v1/schedules`
- **Base URL:** https://api.trigger.dev

## Authentication
Requires a project-specific Secret API key beginning with `tr_dev_`, `tr_prod_`, `tr_stg_`, etc. The SDK automatically uses the `TRIGGER_SECRET_KEY` environment variable if available.

## Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `page` | integer | Page number for schedule listing |
| `perPage` | integer | Number of schedules per page |

## Response (200 - Success)

Returns an object containing:

**Data Array** - Each schedule object includes:
- `id`: Schedule identifier (prefixed with `sched_`)
- `task`: Associated task identifier
- `type`: Schedule type (IMPERATIVE or DECLARATIVE)
- `active`: Boolean indicating active status
- `deduplicationKey`: Prevents duplicate schedules
- `externalId`: Custom identifier (user/org ID, etc.)
- `generator`: Contains cron expression, type, and description
- `timezone`: IANA format timezone (defaults to UTC)
- `nextRun`: ISO 8601 datetime of next execution
- `environments`: Array of environment objects

**Pagination Object:**
- `currentPage`: Current page number
- `totalPages`: Total pages available
- `count`: Items per page

## Code Example

```typescript
import { schedules } from "@trigger.dev/sdk";

const allSchedules = await schedules.list();
```

## Response Example

```json
{
  "data": [{
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
    "environments": [{"id": "", "type": "", "userName": ""}]
  }],
  "pagination": {
    "currentPage": 123,
    "totalPages": 123,
    "count": 123
  }
}
```
