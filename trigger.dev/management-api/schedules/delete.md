# Delete Schedule - Trigger.dev API Documentation

## Overview
This documentation page describes the Delete Schedule endpoint from the Trigger.dev management API.

## Endpoint Details

**Method:** DELETE
**Path:** `/api/v1/schedules/{schedule_id}`
**Base URL:** `https://api.trigger.dev`

## Description
"Delete a schedule by its ID. This will only work on `IMPERATIVE` schedules that were created in the dashboard or using the imperative SDK functions like `schedules.create()`."

## Authentication
**Required:** Authorization header with Secret API key (Bearer token)

The key format begins with `tr_dev_`, `tr_prod_`, `tr_stg_`, etc. The TypeScript SDK defaults to the `TRIGGER_SECRET_KEY` environment variable.

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `schedule_id` | string | Yes | "The ID of the schedule." |

## Response

**Status Code:** 200
**Description:** "Schedule deleted successfully"

## Code Example

**TypeScript:**
```typescript
import { schedules } from "@trigger.dev/sdk";

await schedules.del(scheduleId);
```

## Related Operations
- Previous: Update Schedule
- Next: Deactivate Schedule
- Other Schedules API endpoints: List, Create, Retrieve, Update, Deactivate, Activate, Get timezones
