# Trigger.dev API Documentation: Task Trigger Endpoint

## Overview
This documentation page describes the **POST /api/v1/tasks/{taskIdentifier}/trigger** endpoint, which enables triggering tasks by their identifier in the Trigger.dev system.

## Core Functionality
The endpoint allows developers to initiate task execution by specifying a task's ID and providing execution parameters.

## Key Parameters

**Path Parameter:**
- `taskIdentifier` (string, required): The unique identifier of a task

**Request Body:**
- `payload` (any): JSON data passed to the task
- `context` (any): Additional JSON context information
- `options` (object): Execution configuration including:
  - `queue.name` (string): Shared queue identifier
  - `queue.concurrencyLimit` (integer, 0-1000): Maximum concurrent executions
  - `concurrencyKey` (string): Scope limiting to specific keys
  - `idempotencyKey` (string): Prevents duplicate run creation
  - `ttl` (string/number): Time-to-live for run execution
  - `delay` (string): Execution delay using formats like "1h" or date strings
  - `tags` (array/string): Up to 5 labels per run
  - `machine` (enum): Compute preset selection

## Response
**Success (200):**
```json
{
  "id": "run_1234"
}
```
Returns the created run's unique identifier.

## Authentication
Requires a project-specific Secret API key (prefixed `tr_dev_`, `tr_prod_`, etc.) via Bearer token in Authorization header. The SDK defaults to the `TRIGGER_SECRET_KEY` environment variable.

## Code Examples
The documentation provides TypeScript, cURL, and Python examples demonstrating payload structure and queue configuration.
