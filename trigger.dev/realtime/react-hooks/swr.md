# SWR Hooks - Trigger.dev Documentation

## Overview

The SWR hooks utilize the `swr` library for data fetching and caching without real-time updates. These are beneficial when you need to retrieve data once and cache it locally.

## Key Hook

**useRun**: Fetches a run by its identifier.

```typescript
const { run, error, isLoading } = useRun(runId);
```

You can provide type safety by passing your task type:

```typescript
const { run, error, isLoading } = useRun<typeof myTask>(runId, {
  refreshInterval: 0,
});
```

The returned run object matches the schema from the Trigger.dev API's run retrieval endpoint.

## Configuration Options

- **revalidateOnFocus**: Updates data when window regains focus
- **revalidateOnReconnect**: Updates data when browser reconnects to network
- **refreshInterval**: Polling interval in milliseconds (not recommended; use Realtime hooks instead)

## Return Values

- **error**: Error object if fetch failed
- **isLoading**: Boolean indicating active data fetch
- **isValidating**: Boolean indicating ongoing revalidation
- **isError**: Boolean indicating fetch failure

## Important Note

"While SWR can be configured to poll for updates, we recommend using our other Realtime hooks for most use-cases due to rate-limits and the way the Trigger.dev API works."
