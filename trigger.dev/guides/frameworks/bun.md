# Bun Guide - Trigger.dev Documentation

## Overview
This guide demonstrates setting up Trigger.dev in an existing Bun project, testing an example task, and viewing the run.

## Important Limitation
> "The trigger.dev CLI does not yet support Bun. So you will need to run the CLI using Node.js. Bun will still be used to execute your tasks, even in the `dev` environment."

The CLI requires Node.js execution while tasks themselves run on Bun.

## Prerequisites
- Bun project setup
- TypeScript installed
- Active Trigger.dev account
- New Trigger.dev project created

## Known Issues
OpenTelemetry instrumentation compatibility is limited with Bun because it doesn't support Node's `register` hook, affecting libraries dependent on this mechanism.

## Initial Setup Steps

### 1. CLI Initialization
Run the init command in your project root:
```bash
npx trigger.dev@latest init --runtime bun
```

This command:
- Logs into the CLI (if needed)
- Creates `trigger.config.ts` in the project root
- Prompts for `/trigger` directory location
- Generates `/src/trigger/example.[ts/js]` with sample code
- Optionally installs the "Hello World" example task

### 2. Update example.ts for Bun
Replace the generated example file contents with Bun-specific implementation:

```typescript
import { Database } from "bun:sqlite";
import { task } from "@trigger.dev/sdk";

export const bunTask = task({
  id: "bun-task",
  run: async (payload: { query: string }) => {
    const db = new Database(":memory:");
    const query = db.query("select 'Hello world' as message;");
    console.log(query.get()); // => { message: "Hello world" }

    return {
      message: "Query executed",
    };
  },
});
```

This example creates an in-memory SQLite database and executes a query.

### 3. Run Dev Command
Execute the development server:
```bash
npx trigger.dev@latest dev
```

The dev command monitors your `/trigger` directory, registers tasks with Trigger.dev, manages runs, and can update `@trigger.dev/*` packages (with user confirmation).

### 4. Test via Dashboard
Access the Test page from the CLI output URLs. Select the example task and execute the test run without needing payload input.

### 5. View Run Results
The run page displays live-updating status. Terminal output also shows task status and run log links.

## Key Takeaways
- Bun runtime executes tasks while Node.js runs the CLI
- SQLite integration via `bun:sqlite` is supported
- Dashboard provides real-time run monitoring
- CLI dev mode simplifies local development and testing
