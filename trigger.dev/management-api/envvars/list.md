# List Env Vars - Trigger.dev Documentation

## Overview
This page documents the "List Env Vars" API endpoint for retrieving environment variables from a Trigger.dev project.

## Endpoint Details

**Method:** GET
**Path:** `/api/v1/projects/{projectRef}/envvars/{env}`

## Description
The endpoint enables users to retrieve all environment variables configured for a specific project and environment combination.

## Parameters

### Path Parameters
- **projectRef** (string, required): The external project reference, typically starting with `proj_`
- **env** (enum, required): Target environment - options are `dev`, `staging`, or `prod`

### Authorization
Accepts two authentication methods:
- Secret API Key (bearer token format, starts with `tr_dev_`, `tr_prod`, `tr_stg`)
- Personal Access Token (bearer token format, starts with `tr_pat_`)

## Response

**Status 200 - Success**
Returns an array of objects with properties:
- `name` (string): Variable name (e.g., "SLACK_API_KEY")
- `value` (string): Variable value (e.g., "slack_123456")

## Code Examples

**TypeScript (Outside Task):**
```typescript
import { envvars, configure } from "@trigger.dev/sdk";
const variables = await envvars.list("proj_yubjwjsfkxnylobaqvqz", "dev");
for (const variable of variables) {
  console.log(`Name: ${variable.name}, Value: ${variable.value}`);
}
```

**TypeScript (Inside Task):**
```typescript
import { envvars, task } from "@trigger.dev/sdk";
export const myTask = task({
  id: "my-task",
  run: async () => {
    const variables = await envvars.list();
    for (const variable of variables) {
      console.log(`Name: ${variable.name}, Value: ${variable.value}`);
    }
  }
})
```

## Error Responses
- **400**: Invalid request parameters
- **401**: Unauthorized request
- **404**: Resource not found
