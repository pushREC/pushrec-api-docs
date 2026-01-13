# Import Env Vars - Trigger.dev Documentation

## Overview
This API endpoint allows uploading multiple environment variables for a specific project and environment in Trigger.dev.

## Endpoint Details

**HTTP Method:** POST

**Path:** `/api/v1/projects/{projectRef}/envvars/{env}/import`

**Base URL:** `https://api.trigger.dev`

## Description
"Upload mulitple environment variables for a specific project and environment."

## Path Parameters

1. **projectRef** (string, required)
   - The external reference for the project found in project settings
   - Format: Starts with `proj_`
   - Example: `proj_yubjwjsfkxnylobaqvqz`

2. **env** (enum<string>, required)
   - Environment selection
   - Available options: `dev`, `staging`, `prod`

## Request Body (application/json)

**variables** (object array, required)
- Array of environment variable key-value pairs
- Properties:
  - `name` (string, required): Variable name
  - `value` (string, required): Variable value

**override** (boolean, optional)
- Whether to replace existing variables
- Default: `false`

## Response

**Status 200 - Success**
```json
{
  "success": true
}
```

## Authorization

Supports two authentication methods:
- Secret API key (bearer token, starts with `tr_dev_`, `tr_prod`, `tr_stg`)
- Personal Access Token (bearer token, starts with `tr_pat_`)

## TypeScript SDK Example

```typescript
import { envvars } from "@trigger.dev/sdk";

await envvars.upload("proj_yubjwjsfkxnylobaqvqz", "dev", {
  variables: { SLACK_API_KEY: "slack_key_1234" },
  override: false
});
```

## Error Responses

- **400:** Invalid request parameters
- **401:** Unauthorized request
- **404:** Resource not found
