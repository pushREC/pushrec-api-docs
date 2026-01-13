# Stream Batch Items - Trigger.dev API Documentation

## Overview
The "Stream batch items" endpoint represents Phase 2 of Trigger.dev's 2-phase batch API. This operation accepts an NDJSON (newline-delimited JSON) stream of batch items and enqueues them for processing.

## Key Characteristics

**Endpoint Details:**
- Method: POST
- Path: `/api/v3/batches/{batchId}/items`
- Base URL: `https://api.trigger.dev`

**Content Processing:**
The system processes streaming data with backpressure, meaning items are enqueued as they arrive rather than waiting for the complete stream. The batch becomes sealed and ready for processing upon successful stream completion.

## Required Parameters

**Authorization:**
A Bearer token authentication header is mandatory for all requests using the format `Bearer <token>`.

**Path Parameter:**
- `batchId` (string, required): The batch identifier returned from the initial POST `/api/v3/batches` call

## Request Body Format

The request body accepts NDJSON format with two supported content types:
- `application/x-ndjson`
- `application/ndjson`

Each line represents a `BatchItemNDJSON` object. The documentation provides this example structure:
```
{"index":0,"task":"my-task","payload":{"key":"value1"}}
{"index":1,"task":"my-task","payload":{"key":"value2"}}
```

## Response Structure (200 Success)

The successful response includes:
- `id` (string): The batch identifier
- `itemsAccepted` (integer): Successfully processed items count
- `itemsDeduplicated` (integer): Items already enqueued (duplicates)
- `sealed` (boolean): Whether the batch is ready for processing
- `enqueuedCount` (integer, conditional): Present only when `sealed=false`
- `expectedCount` (integer, conditional): Present only when `sealed=false`

## Error Responses

- **400**: Invalid request (malformed JSON or oversized items)
- **401**: Missing or invalid API key
- **415**: Incorrect Content-Type header
- **422**: Validation error
- **500**: Server error
