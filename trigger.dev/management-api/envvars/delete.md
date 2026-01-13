# Delete Env Var - Trigger.dev API Documentation

## Overview
This endpoint enables deletion of a specific environment variable associated with a particular project and environment within Trigger.dev.

## API Endpoint
**DELETE** `/api/v1/projects/{projectRef}/envvars/{env}/{name}`

## Description
"Delete a specific environment variable for a specific project and environment."

## Path Parameters

| Parameter | Type | Required | Details |
|-----------|------|----------|---------|
| `projectRef` | string | Yes | "The external ref of the project. You can find this in the project settings. Starts with `proj_`." |
| `env` | enum | Yes | Environment identifier; accepts: `dev`, `staging`, `prod` |
| `name` | string | Yes | "The name of the environment variable." |

## Authentication
The endpoint requires authorization via either:
- **Secret API Key** (header): Begins with `tr_dev_`, `tr_prod`, `tr_stg`, etc.
- **Personal Access Token**: Starts with `tr_pat_`

## Response

### Success (200)
```json
{
  "success": true
}
```

**Response Description:** "Environment variable deleted successfully"

## SDK Usage

### Outside of a Task
```typescript
import { envvars } from "@trigger.dev/sdk";
await envvars.del("proj_yubjwjsfkxnylobaqvqz", "dev", "SLACK_API_KEY");
```

### Inside a Task
```typescript
import { envvars, task } from "@trigger.dev/sdk";

export const myTask = task({
  id: "my-task",
  run: async () => {
    // projectRef and env are automatically inferred
    await envvars.del("SLACK_API_KEY");
  }
})
```

## Error Responses
- **400**: Invalid request parameters or body
- **401**: Unauthorized request
- **404**: Resource not found
