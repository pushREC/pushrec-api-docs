# Update metadata - Trigger.dev API Documentation

## Page Overview
This documentation page describes the **Update metadata** endpoint for the Trigger.dev Runs API, which allows developers to modify run metadata after a run has been created.

## Endpoint Details

**HTTP Method:** PUT

**Path:** `/api/v1/runs/{runId}/metadata`

**Base URL:** `https://api.trigger.dev`

## Description
"Update the metadata of a run." This endpoint enables modifications to custom metadata attached to task execution runs.

## Code Example
```typescript
import { metadata, task } from "@trigger.dev/sdk";

export const myTask = task({
  id: "my-task",
  run: async () => {
    await metadata.save({ key: "value" });
  }
});
```

## Authentication
**Authorization Header (Required):** Bearer token using project-specific Secret API key (format: `tr_dev_*`, `tr_prod_*`, `tr_stg_*`)

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `runId` | string | Yes | "The ID of a run, starts with `run_`. The run ID will be returned when you trigger a run on a task." |

## Request Body
**Content-Type:** `application/json`

| Field | Type | Description |
|-------|------|-------------|
| `metadata` | object | "The new metadata to set on the run." Example: `{ "key": "value" }` |

## Response

**Status Code:** 200 (Success)

**Response Body:**
```json
{
  "metadata": {}
}
```

Returns an object containing "The updated metadata of the run."

## Error Responses

- **400:** Invalid request (invalid/missing run ID or invalid metadata)
- **401:** Unauthorized (invalid or missing API key)
- **404:** Resource not found (task run not found)
