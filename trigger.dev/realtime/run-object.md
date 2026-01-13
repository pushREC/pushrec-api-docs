# The Run Object - Trigger.dev Documentation

## Overview

The run object serves as the primary data structure returned by Realtime subscriptions (e.g., `runs.subscribeToRun()`). It encompasses comprehensive information about task executions, including identifiers, payloads, outputs, and execution metadata.

## Core Properties

**Required Fields:**
- `id` (string): Unique run identifier
- `taskIdentifier` (string): Task name/identifier
- `payload` (object): Input data provided to the task
- `createdAt` (Date): Run creation timestamp
- `updatedAt` (Date): Last modification timestamp
- `number` (number): Sequential run number
- `status` (RunStatus): Current execution state
- `durationMs` (number): Execution time in milliseconds
- `costInCents` (number): Total run cost
- `baseCostInCents` (number): Base cost before additional charges
- `tags` (string[]): Associated tag labels
- `isTest` (boolean): Test run indicator

**Optional Fields:**
- `output` (object): Task result/return value
- `idempotencyKey` (string): Idempotent execution identifier
- `expiredAt`, `finishedAt`, `startedAt`, `queuedAt`, `delayedUntil` (Date): Various timestamps
- `ttl` (string): Time-to-live duration
- `metadata` (Record): Custom data attached to run
- `error` (SerializedError): Failure information

## Run Status Enum

Possible status values include: `WAITING_FOR_DEPLOY`, `QUEUED`, `EXECUTING`, `REATTEMPTING`, `FROZEN`, `COMPLETED`, `CANCELED`, `FAILED`, `CRASHED`, `INTERRUPTED`, `SYSTEM_FAILURE`, `DELAYED`, `EXPIRED`, and `TIMED_OUT`.

## Type Safety

Developers can achieve type-safe access by passing task types as generics:

```typescript
for await (const run of runs.subscribeToRun<typeof myTask>(handle.id)) {
  // Type-safe payload and output access
}
```

When using `subscribeToRunsWithTag`, pass a union of possible task types and narrow using `taskIdentifier`:

```typescript
for await (const run of runs.subscribeToRunsWithTag<typeof myTask | typeof myOtherTask>("my-tag")) {
  switch (run.taskIdentifier) {
    case "my-task": // Type-safe here
  }
}
```

This pattern works across all realtime subscription functions: `subscribeToRun`, `subscribeToRunsWithTag`, and `subscribeToBatch`.
