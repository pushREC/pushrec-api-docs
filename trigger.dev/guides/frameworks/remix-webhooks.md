# Triggering Tasks with Webhooks in Remix - Documentation Summary

## Overview
This guide demonstrates how to trigger Trigger.dev tasks from webhook handlers in a Remix application.

## Prerequisites
- A Remix project configured with Trigger.dev
- cURL installed locally for testing POST requests

## Implementation

### Webhook Handler Setup
Create a file at `app/routes/api.webhook-handler.ts` or `.js` with the following structure:

The handler should:
1. Accept incoming POST requests
2. Parse JSON payload from the request body
3. Use `tasks.trigger()` to invoke a task with the webhook data
4. Return a 200 response confirming receipt

**Key imports needed:**
- `ActionFunctionArgs` from `@remix-run/node`
- `tasks` from `@trigger.dev/sdk`
- The specific task to be triggered

## Local Testing Workflow

### Step 1: Start Services
Run your Remix app using `npm run dev` (or equivalent package manager command). In a separate terminal, start the Trigger.dev development server with `npx trigger.dev@latest dev`.

### Step 2: Send Test Request
Use cURL to POST JSON data to your webhook endpoint:
```
curl -X POST -H "Content-Type: application/json" \
-d '{"Name": "John Doe", "Age": "87"}' \
http://localhost:5173/api/webhook-handler
```

### Step 3: Verify Execution
Confirm successful execution by:
- Observing a 200 response in the terminal
- Checking the Trigger.dev dashboard for a completed run
- Verifying the payload appears correctly in the run details

## Resources
A complete example project is available on GitHub (triggerdotdev/examples repository).
