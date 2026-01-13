# Trigger.dev React Hooks Documentation

## Overview

This documentation covers frontend task triggering using React hooks from Trigger.dev. The material explains how to securely trigger tasks from client-side applications.

## Key Concept

The documentation emphasizes: "For triggering tasks from your frontend, you need to use 'trigger' tokens. These can only be used once to trigger a task and are more secure than regular Public Access Tokens."

## Available Hooks

Three primary hooks are provided:

1. **useTaskTrigger** - Basic task triggering without automatic subscription
2. **useRealtimeTaskTrigger** - Combines triggering with live run updates
3. **useRealtimeTaskTriggerWithStreams** - Adds stream data reception to realtime functionality

## useTaskTrigger Details

This hook returns an object containing:
- `submit`: Function to trigger the task with payload
- `handle`: Run identifier and public access token for the triggered execution
- `isLoading`: Boolean indicating submission status
- `error`: Error information if triggering fails

The submit function accepts a payload and optional parameters like tags for organizing runs.

## Advanced Patterns

The handle object enables chaining with subscription hooks while maintaining type safety through TypeScript generics. This allows developers to trigger a task, then immediately subscribe to updates using separate hooks.

The `useRealtimeTaskTriggerWithStreams` variant enables receiving streaming data emitted during task execution, requiring a STREAMS type parameter defining the structure of streamed content.
