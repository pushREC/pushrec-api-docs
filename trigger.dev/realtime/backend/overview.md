# Backend Overview - Trigger.dev Realtime API

## Core Functionality

The Trigger.dev backend realtime API enables server-side code and tasks to interact with runs and streaming data. The documentation identifies three primary capabilities:

1. **Subscribe Functions** - Enable asynchronous iteration over run updates
2. **Metadata Management** - Allow real-time updates and subscriptions to run metadata
3. **Streams** - Facilitate reading and consuming real-time streaming data from tasks

## Authentication Methods

The API supports dual authentication approaches:

- **Server-side**: API keys (automatically configured within tasks)
- **Client-side**: Public Access Tokens with designated scopes

The documentation references a separate authentication guide for detailed token creation and usage instructions.

## Quick Example

The provided code sample demonstrates basic usage:

```typescript
import { runs, tasks } from "@trigger.dev/sdk";

const handle = await tasks.trigger("my-task", { some: "data" });

for await (const run of runs.subscribeToRun(handle.id)) {
  console.log(`Run ${run.id} status: ${run.status}`);
}
```

This illustrates triggering a task and subscribing to live status updates through an async iterator pattern.

## Related Resources

The documentation links to supplementary guides covering realtime streams emission from tasks and comprehensive authentication procedures.
