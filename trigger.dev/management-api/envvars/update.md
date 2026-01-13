# Update Env Var - Trigger.dev Documentation

## Overview
This endpoint allows you to update a specific environment variable for a particular project and environment within Trigger.dev.

## Endpoint Details

**Method:** PUT
**Path:** `/api/v1/projects/{projectRef}/envvars/{env}/{name}`
**Base URL:** `https://api.trigger.dev`

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `projectRef` | string | Yes | "The external ref of the project. You can find this in the project settings. Starts with `proj_`." |
| `env` | enum | Yes | The environment (dev, staging, or prod) |
| `name` | string | Yes | "The name of the environment variable." |

## Request Body

**Content-Type:** `application/json`

```json
{
  "value": "slack_123456"
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `value` | string | Yes | The new value for the environment variable |

## Response

**Status Code:** 200 (Success)

```json
{
  "success": true
}
```

## Authentication

Two authentication methods are supported:

1. **Secret API Key** (Bearer Token): "Use your project-specific Secret API key. Will start with `tr_dev_`, `tr_prod`, `tr_stg`, etc."

2. **Personal Access Token** (Bearer Token): "Use your user-specific Personal Access Token, which you can generate from the Trigger.dev dashboard in your account settings."

## Code Examples

**TypeScript - Outside of a task:**
```typescript
import { envvars } from "@trigger.dev/sdk";
await envvars.update("proj_yubjwjsfkxnylobaqvqz", "dev", "SLACK_API_KEY", {
  value: "slack_123456"
});
```

**TypeScript - Inside a task:**
```typescript
import { envvars, task } from "@trigger.dev/sdk";

export const myTask = task({
  id: "my-task",
  run: async () => {
    await envvars.update("SLACK_API_KEY", {
      value: "slack_123456"
    });
  }
})
```

## Error Responses

- **400:** Invalid request parameters or body
- **401:** Unauthorized request
- **404:** Resource not found
