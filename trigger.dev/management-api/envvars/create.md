# Create Env Var - Trigger.dev API Documentation

## Overview
This endpoint creates a new environment variable for a specific project and environment within Trigger.dev.

## Endpoint Details

**HTTP Method:** POST

**URL Path:** `/api/v1/projects/{projectRef}/envvars/{env}`

**Base URL:** `https://api.trigger.dev`

## Description
"Create a new environment variable for a specific project and environment."

## Authentication
Two authentication methods are supported:
- **Secret Key** (Bearer token starting with `tr_dev_`, `tr_prod`, `tr_stg`, etc.)
- **Personal Access Token** (Bearer token starting with `tr_pat_`)

Both can be configured via the SDK or environment variables (`TRIGGER_SECRET_KEY` or `TRIGGER_ACCESS_TOKEN`).

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `projectRef` | string | Yes | External project reference (starts with `proj_`), found in project settings |
| `env` | enum | Yes | Environment: `dev`, `staging`, or `prod` |

## Request Body

**Content-Type:** `application/json`

| Field | Type | Required | Example |
|-------|------|----------|---------|
| `name` | string | Yes | `SLACK_API_KEY` |
| `value` | string | Yes | `slack_123456` |

## Response

**Status Code:** 200

**Response Body:**
```json
{
  "success": true
}
```

## Code Examples

**TypeScript - Outside a Task:**
```typescript
import { envvars } from "@trigger.dev/sdk";
await envvars.create("proj_yubjwjsfkxnylobaqvqz", "dev", {
  name: "SLACK_API_KEY",
  value: "slack_123456"
});
```

**TypeScript - Inside a Task:**
```typescript
import { envvars, task } from "@trigger.dev/sdk";

export const myTask = task({
  id: "my-task",
  run: async () => {
    await envvars.create({
      name: "SLACK_API_KEY",
      value: "slack_123456"
    });
  }
})
```

## Error Responses

- **400:** Invalid request parameters or body
- **401:** Unauthorized request
- **404:** Resource not found
