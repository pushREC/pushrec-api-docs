# Retrieve Env Var - Trigger.dev Documentation

## Overview
This endpoint retrieves a specific environment variable for a particular project and environment from the Trigger.dev API.

## Endpoint Details

**Method:** GET

**Path:** `/api/v1/projects/{projectRef}/envvars/{env}/{name}`

**Base URL:** `https://api.trigger.dev`

## Description
"Retrieve a specific environment variable for a specific project and environment."

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `projectRef` | string | Yes | External project reference from project settings, starts with `proj_` |
| `env` | enum | Yes | Environment: `dev`, `staging`, or `prod` |
| `name` | string | Yes | The environment variable name |

## Authentication

Two authorization options are available:

1. **Secret Key** - Project-specific API key (starts with `tr_dev_`, `tr_prod`, etc.), found in dashboard API Keys section
2. **Personal Access Token** - User-specific token (starts with `tr_pat_`) generated in account settings

## Response

**Status Code:** 200 (Success)

**Content-Type:** application/json

**Response Body:**
```json
{
  "value": "slack_123456"
}
```

The response contains a `value` field (string, required) with the environment variable's content.

## Code Examples

**Outside of a Task:**
```typescript
import { envvars } from "@trigger.dev/sdk";

const variable = await envvars.retrieve("proj_yubjwjsfkxnylobaqvqz", "dev", "SLACK_API_KEY");
console.log(`Value: ${variable.value}`);
```

**Inside a Task:**
```typescript
import { envvars, task } from "@trigger.dev/sdk";

export const myTask = task({
  id: "my-task",
  run: async () => {
    const variable = await envvars.retrieve("SLACK_API_KEY");
    console.log(`Value: ${variable.value}`);
  }
})
```

## Error Responses

- **400** - Invalid request parameters
- **401** - Unauthorized request
- **404** - Resource not found
