# Authentication - Trigger.dev

## Overview

The Trigger.dev management API supports two authentication methods, both intended for backend server use only:

1. **Secret Key** (`secretKey`) - scoped to a specific environment
2. **Personal Access Token (PAT)** (`personalAccessToken`) - scoped to a user across all orgs/projects

Both provide full project access and should never be exposed in frontend code.

## Key Differences

**Secret Key Authentication:**
- Format: begins with `tr_dev_` or `tr_prod_`
- Scope: specific environment in a project
- Works with most endpoints

**Personal Access Token (PAT):**
- Format: begins with `tr_pat_`
- Scope: all accessible organizations, projects, and environments
- Requires `projectRef` argument when calling API functions
- Enables cross-project access for a specific user

## Configuration Example

Using the SDK, you configure authentication via the `configure()` function:

```typescript
import { configure, runs } from "@trigger.dev/sdk";

// Secret key approach
configure({
  secretKey: process.env["TRIGGER_SECRET_KEY"],
});

// PAT approach
configure({
  secretKey: process.env["TRIGGER_ACCESS_TOKEN"],
});
```

When using a PAT, you must provide additional arguments:

```typescript
runs.list("prof_1234", {
  limit: 10,
  status: ["COMPLETED"],
  projectRef: "tr_proj_1234567890",
});
```

## Endpoint Support Table

Different endpoints support different authentication methods. Key endpoints include:

- `task.trigger` - secret key only
- `runs.list` - both methods
- `envvars.list` - both methods
- `schedules.list` - secret key only

## Preview Branch Targeting

When managing resources scoped to preview branches, include the `previewBranch` option in SDK configuration or use the `x-trigger-branch` header in HTTP requests.

**SDK:**
```typescript
configure({
  secretKey: process.env["TRIGGER_ACCESS_TOKEN"],
  previewBranch: "feature-xyz",
});
```

**cURL:**
```bash
curl --request PUT \
  --url https://api.trigger.dev/api/v1/projects/{projectRef}/envvars/preview/DATABASE_URL \
  --header 'x-trigger-branch: feature-xyz'
```

The branch header only applies to the `preview` environment and has no effect on `dev`, `staging`, or `prod`.
