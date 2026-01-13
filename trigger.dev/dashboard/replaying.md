# Replaying Documentation

## Overview

A replay is a copy of a run with the same payload but against the latest version in that environment. This allows you to retry a failed run with your most recent code.

## Replaying from the UI

### From a Run
1. Click the Replay button in the top right corner of the run details page
2. Confirm replay settings in the modal that appears
3. You can optionally edit the payload (if available) and select which environment to replay in

### From Runs List
1. Click the action button (three dots) on a run in the runs list
2. Select "replay" from the popover menu

## Replaying Using the SDK

You can programmatically replay runs with the SDK:

```typescript
const replayedRun = await runs.replay(run.id);
```

When you trigger a task using `trigger()` or `batchTrigger()`, you receive a run handle containing an `id` property. Use this ID to replay the run later.

You can also access the run ID from within a task's execution context:

```typescript
export const simpleChildTask = task({
  id: "simple-child-task",
  run: async (payload, { ctx }) => {
    const runId = ctx.run.id;
  },
});
```

The run ID and other contextual information are available via the `ctx` parameter, which you can store in a database for future replays.

## Bulk Replaying

Refer to the Bulk Actions documentation for instructions on replaying multiple runs simultaneously.
