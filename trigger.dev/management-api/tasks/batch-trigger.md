# Batch Trigger API Documentation Summary

## Overview
The Batch Trigger endpoint allows triggering multiple tasks simultaneously, supporting up to 1,000 payloads with SDK 4.3.1+ (500 in earlier versions).

## Endpoint Details
- **Method:** POST
- **Path:** `/api/v1/tasks/batch`
- **Base URL:** `https://api.trigger.dev`

## Authentication
Requires a project-specific Secret API key (starting with `tr_dev_`, `tr_prod_`, `tr_stg_`, etc.) passed as a Bearer token in the Authorization header.

## Request Body
The request accepts an `items` array containing objects with:

- **task** (required): Task identifier matching the `id` in your task definition
- **payload**: JSON data passed to the task
- **context**: Optional JSON metadata
- **options**: Configuration object including:
  - `queue`: Name and concurrency limit settings
  - `concurrencyKey`: Scope concurrency to specific keys
  - `idempotencyKey`: Prevent duplicate runs
  - `ttl`: Time-to-live (e.g., "1h42m")
  - `delay`: Execution delay
  - `tags`: Categorization (up to 5 per run, max 64 chars)
  - `machine`: Preset machine type (micro, small-1x, small-2x, etc.)

## Response
**Status 200:**
```json
{
  "batchId": "batch_1234",
  "runs": ["<run_id_1>", "<run_id_2>"]
}
```

Returns the batch ID and array of triggered run IDs.

## Code Example
TypeScript SDK usage demonstrates configuring payload, idempotency keys, concurrency settings, and queue parameters for batch operations.

## Error Responses
- **400**: Invalid request parameters
- **401**: Unauthorized request
- **404**: Resource not found
