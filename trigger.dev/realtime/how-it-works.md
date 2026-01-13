# Trigger.dev Realtime API: How It Works

## Architecture

The Realtime API is constructed on top of Electric SQL, an open-source PostgreSQL syncing engine. Trigger.dev wraps this foundation to provide developers with a straightforward interface for subscribing to task runs and receiving real-time updates.

## Run Change Events

Subscriptions receive notifications when runs experience state transitions, including:

- Run lifecycle state changes (documented in the run lifecycle section)
- Addition or removal of run tags
- Updates to run metadata

## Run Object Structure

The run object format returned through Realtime subscriptions differs from the management API equivalent. It's optimized specifically for streaming update scenarios. Complete schema details are available in the dedicated run object documentation.

## Basic Usage Patterns

After triggering a task, developers can use `runs.subscribeToRun(handle.id)` to establish an async iterator that yields updates whenever the run changes. This pattern enables real-time UI updates, status logging, or other reactive behaviors.

Alternative subscription methods include:
- `runs.subscribeToRunsWithTag()` for filtering by specific tags
- `runs.subscribeToBatch()` for monitoring multiple triggered runs

## Run Metadata Integration

The metadata API allows attaching custom data to runs, enabling use cases like:
- Linking related resources
- Tracking user/organization references
- Recording progress or custom status information

Metadata updates can be monitored through both React hooks and backend functions, creating a bridge between Trigger.dev tasks and frontend/backend applications.

## Service Limits

Concurrent subscription limits vary by plan tier. Exceeding these limits triggers errors during subscription attempts. Consult the pricing page for plan-specific details.

## Additional Resources

- Blog post on real-time architecture handling 20,000 updates per second
- React Hooks documentation for frontend implementation
- Backend functions guide for server-side subscriptions
