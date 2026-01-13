# Replay Run - Trigger.dev API Documentation

## Overview
The Replay Run endpoint creates a new execution with identical payload and options from a previous run.

## Endpoint Details

**Method:** POST
**Path:** `/api/v1/runs/{runId}/replay`
**Base URL:** `https://api.trigger.dev`

## Description
"Creates a new run with the same payload and options as the original run."

## TypeScript Example
```typescript
import { runs } from "@trigger.dev/sdk";

const handle = await runs.replay("run_1234");
```

## Path Parameters

**runId** (required, string)
- Description: "The ID of an run, starts with `run_`. The run ID will be returned when you trigger a run on a task."
- Example: `run_1234`

## Authentication

**Authorization Header** (required)
- Type: Bearer token
- Format: Project-specific Secret API key (prefixes: `tr_dev_`, `tr_prod_`, `tr_stg_`, etc.)
- Location: API Keys section of Trigger.dev project dashboard
- SDK Default: Uses `TRIGGER_SECRET_KEY` environment variable if available

## Responses

**200 - Success**
- Content-Type: application/json
- Response body contains `id` field with the new run's identifier

**400 - Invalid Request**
- Possible errors: "Invalid or missing run ID" or "Failed to create new run"

**401 - Unauthorized**
- Error: "Invalid or Missing API key"

**404 - Not Found**
- Error: "Run not found"
