# Realtime Authentication for Trigger.dev

## Overview

The documentation explains two token types for Trigger.dev's Realtime API: **Public Access Tokens** for subscribing to runs and **Trigger Tokens** for frontend task triggering.

## Public Access Tokens

### Creation & Basic Usage

You create these tokens via `auth.createPublicToken()` in backend code. By default, they have no permissions and expire after 15 minutes.

### Scoping Options

Tokens can be restricted to specific:
- **Run IDs**: `runs: ["run_1234", "run_5678"]`
- **Tasks**: `tasks: ["my-task-1", "my-task-2"]`
- **Tags**: `tags: ["my-tag-1", "my-tag-2"]`
- **Batches**: `batch: "batch_1234"`

These scopes can be combined. For example: `{ tasks: [...], tags: [...] }` limits access to runs matching both conditions.

### Customizing Expiration

The `expirationTime` parameter accepts:
- String format (e.g., `"1hr"`, `"24hr"`) following jose package conventions
- Unix timestamp (number)
- Date object

Valid time units include: "sec", "minute", "hour", "day", "week", "year"

### Auto-Generated Tokens

When triggering tasks from your backend, the returned handle includes a `publicAccessToken` field. These auto-expire after 15 minutes and scope to specific triggered runs.

## Trigger Tokens

### Purpose & Security

These tokens enable frontend task triggering. They're more secure than Public Access Tokens—typically single-use and scoped to specific tasks.

### Creating Trigger Tokens

Use `auth.createTriggerPublicToken()` with a task identifier or array of task identifiers.

### Configuration Options

- **Multiple Tasks**: Pass an array: `["my-task-1", "my-task-2"]`
- **Multiple Use**: Set `multipleUse: true` (use cautiously)
- **Custom Expiration**: Same format as Public Access Tokens; defaults to 15 minutes

## Using the Tokens

**Backend**: Use tokens with the Realtime API via documented subscribe functions

**Frontend**: Use with React hooks for triggering tasks or subscribing to run updates
