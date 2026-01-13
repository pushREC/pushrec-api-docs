# Get Timezones - Trigger.dev API Reference

## Overview
This endpoint retrieves all supported timezones that can be used with Trigger.dev's schedule tasks feature.

## Endpoint Details

**Method:** GET
**Path:** `/api/v1/timezones`
**Base URL:** `https://api.trigger.dev`

## Query Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `excludeUtc` | boolean | Optional. Defaults to false. When set to true, UTC is excluded from results |

## Response

**Status Code:** 200 (application/json)

### Response Schema

The API returns an object containing a single array property:

- **`timezones`** (string[]): Array of timezone identifiers in IANA format

## Example Usage

### TypeScript/SDK
```typescript
import { schedules } from "@trigger.dev/sdk";

const { timezones } = await schedules.timezones();
```

## Sample Response

The response includes approximately 400+ timezone identifiers, including:
- UTC
- Africa/* (e.g., Africa/Abidjan, Africa/Cairo, Africa/Johannesburg)
- America/* (e.g., America/New_York, America/Los_Angeles, America/Toronto)
- Asia/* (e.g., Asia/Tokyo, Asia/Shanghai, Asia/Dubai)
- Europe/* (e.g., Europe/London, Europe/Paris, Europe/Moscow)
- Australia/* (e.g., Australia/Sydney, Australia/Melbourne)
- And additional regional timezones

## Use Cases

This endpoint is typically used to:
- Populate timezone dropdown selectors in schedule creation interfaces
- Validate timezone values before creating or updating schedules
- Display available timezone options to end users
