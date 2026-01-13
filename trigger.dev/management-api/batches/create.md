# Create Batch API Documentation

## Overview
The Create Batch endpoint is **Phase 1 of a 2-phase batch API** system. It establishes a batch record and can optionally pause the parent run when using `batchTriggerAndWait`. Following batch creation, items stream via `POST /api/v3/batches/{batchId}/items`.

## Endpoint Details

**Method:** POST
**URL:** `https://api.trigger.dev/api/v3/batches`
**Response Code:** 202 (Accepted)

## Authentication
Requires bearer token authentication in the format: `Bearer <token>`

## Request Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `runCount` | integer | Yes | Expected batch item count; must be ≥ 1 |
| `parentRunId` | string | No | Parent run identifier for `batchTriggerAndWait` |
| `resumeParentOnCompletion` | boolean | No | Resumes parent upon batch completion; set true for `batchTriggerAndWait` |
| `idempotencyKey` | string | No | Ensures idempotency; returns existing batch if key matches |

## Success Response (202)

```json
{
  "id": "<string>",
  "runCount": 123,
  "isCached": true,
  "idempotencyKey": "<string>"
}
```

**Response Fields:**
- `id`: Batch identifier for streaming items
- `runCount`: Expected item quantity
- `isCached`: Indicates cached/idempotent response
- `idempotencyKey`: Key provided in request (if applicable)

## Error Responses

- **400:** Invalid request (negative/exceeding runCount)
- **422:** Validation failure
- **429:** Rate limit exceeded
- **500:** Server error

## cURL Example

```bash
curl --request POST \
  --url https://api.trigger.dev/api/v3/batches \
  --header 'Authorization: Bearer <token>' \
  --header 'Content-Type: application/json' \
  --data '{
    "runCount": 2,
    "parentRunId": "<string>",
    "resumeParentOnCompletion": true,
    "idempotencyKey": "<string>"
  }'
```
