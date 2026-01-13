# Trigger.dev Management API - Overview

## Page Content Summary

**Title:** Overview - Trigger.dev

**Description:** "Using the Trigger.dev management API"

## Installation Section

The management API is available through the same `@trigger.dev/sdk` package used for defining and triggering tasks. If already installed in your project, you can skip this step.

### Installation Commands

**npm:**
```
npm i @trigger.dev/sdk@latest
```

**pnpm:**
```
pnpm add @trigger.dev/sdk@latest
```

**yarn:**
```
yarn add @trigger.dev/sdk@latest
```

## Usage Section

All v3 functionality is provided through the `@trigger.dev/sdk` module. You can import the entire module or individual resources as needed.

### Code Example

```typescript
import { configure, runs } from "@trigger.dev/sdk";

configure({
  // this is the default and if the `TRIGGER_SECRET_KEY` environment variable is set, can omit calling configure
  secretKey: process.env["TRIGGER_SECRET_KEY"],
});

async function main() {
  const runs = await runs.list({
    limit: 10,
    status: ["COMPLETED"],
  });
}

main().catch(console.error);
```

## Key Takeaways

- The SDK provides a unified interface for management API operations
- Configuration via environment variables is supported
- The `runs` resource allows filtering by status and pagination
