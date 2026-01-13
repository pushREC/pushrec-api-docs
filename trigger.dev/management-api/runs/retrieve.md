# Retrieve Run API Documentation

## Overview
The "Retrieve run" endpoint retrieves comprehensive information about a task execution, including status, payload, output, and attempt details.

## Endpoint Details
- **Method:** GET
- **Path:** `/api/v3/runs/{runId}`
- **Base URL:** `https://api.trigger.dev`

## Authentication
Requires a project-specific Secret API key (prefixed with `tr_dev_`, `tr_prod`, `tr_stg`, etc.) via Bearer token authentication. Public API keys omit payload and output fields for security.

## Path Parameters
- **runId** (required, string): The unique run identifier beginning with `run_`

## Response Schema

### Core Properties
- **id**: Unique run identifier (prefixed `run_`)
- **status**: Run state - one of PENDING_VERSION, DELAYED, QUEUED, EXECUTING, REATTEMPTING, FROZEN, COMPLETED, CANCELED, FAILED, CRASHED, INTERRUPTED, or SYSTEM_FAILURE
- **taskIdentifier**: Task name executed
- **createdAt/updatedAt**: ISO 8601 timestamps
- **startedAt/finishedAt**: Execution timestamps
- **durationMs**: Compute time in milliseconds (excludes waits)

### Payload & Output
- **payload**: Input data sent to task (omitted with Public API keys)
- **output**: Task result (omitted with Public API keys)
- **payloadPresignedUrl/outputPresignedUrl**: 5-minute download links for large payloads

### Metadata & Configuration
- **version**: Worker version number
- **idempotencyKey**: Duplicate prevention identifier
- **isTest**: Boolean indicating test execution
- **ttl**: Time-to-live specification (format: "1h42m" or seconds)
- **tags**: Array of filterable tags (max 10, 1-128 characters each)
- **metadata**: Custom key-value data
- **costInCents/baseCostInCents**: Billing information (excludes DEV runs)

### Attempt Information
Array containing execution attempts with id, status, timestamps, and error details including message, name, and stack trace.

### Related Runs
Object containing hierarchical run relationships: root, parent, and children.

### Schedule Information
If triggered by schedule, includes id, generator type (CRON), expression, description, externalId, and deduplicationKey.

## TypeScript SDK Example
```typescript
const result = await runs.retrieve("run_1234");
if (result.isSuccess) {
  console.log("Output:", result.output);
}
for (const attempt of result.attempts) {
  if (attempt.status === "FAILED") {
    console.log("Error:", attempt.error);
  }
}
```

## HTTP Status Codes
- **200**: Successful response
- **400**: Invalid or missing run ID
- **401**: Invalid/missing API key
- **404**: Run not found
