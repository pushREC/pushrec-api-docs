# React Hooks Overview - Trigger.dev Documentation

## Core Purpose
The `@trigger.dev/react-hooks` package enables developers to interact with Trigger.dev's Realtime API directly from React applications, supporting real-time subscriptions and task triggering from frontend code.

## Installation
Three package managers are supported:
- **npm**: `npm add @trigger.dev/react-hooks`
- **pnpm**: `pnpm add @trigger.dev/react-hooks`
- **yarn**: `yarn install @trigger.dev/react-hooks`

## Authentication Requirements
All hooks mandate authentication using a Public Access Token, passed via the `accessToken` configuration option. The implementation example demonstrates the `useRealtimeRun` hook usage pattern with both required authentication credentials and an optional `baseURL` parameter for self-hosted instances.

## Hook Categories Provided

Four primary classifications of hooks are available:

1. **Triggering Hooks** - Enable task execution from frontend interfaces
2. **Subscribe Hooks** - Monitor runs, batches, metadata, and related data streams
3. **Streams Hooks** - Access real-time streaming data from executing tasks
4. **SWR Hooks** - Implement data fetching with client-side caching via the SWR library

## SWR vs. Realtime Approaches

Two architectural patterns exist. SWR hooks leverage the external SWR library for single fetch-and-cache operations. Realtime hooks use Trigger.dev's native Realtime infrastructure for live updates.

The documentation advises selecting Realtime hooks for most scenarios despite SWR's polling configuration capabilities, citing API rate limitations and architectural considerations as deciding factors.
