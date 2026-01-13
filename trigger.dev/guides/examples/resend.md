# Send a Sequence of Emails Using Resend with Trigger.dev

## Overview

This documentation demonstrates how to implement a multi-email workflow that distributes messages over several days using Resend and Trigger.dev.

**Key Concept:** "Each email is wrapped in retry.onThrow. This will retry the block of code if an error is thrown."

The approach uses:
- **retry.onThrow** for individual email error handling (up to 3 attempts per email)
- **wait.for** to pause execution between sends without consuming resources
- Default task-level retrying as a secondary safety net

## Task Implementation

### Setup
```typescript
import { Resend } from "resend";

const resend = new Resend(process.env.RESEND_ASP_KEY);

export const emailSequence = task({
  id: "email-sequence",
  run: async (payload: { userId: string; email: string; name: string }) => {
    // Task execution logic
  },
});
```

### Email Sending Pattern

Each email follows this structure:
1. Invoke `retry.onThrow` with an async callback
2. Attempt to send via `resend.emails.send()`
3. Throw errors to trigger retries
4. Return successful data
5. Set `maxAttempts: 3` for individual email resilience

### Timing Workflow

- **First email:** Sends immediately upon task trigger
- **Wait period:** Pause 3 days using `await wait.for({ days: 3 })`
- **Second email:** Sends after delay expires
- **Pattern:** Repeat as needed for additional messages

## Testing

Use this payload structure in the dashboard:
```json
{
  "userId": "123",
  "email": "<your-test-email>",
  "name": "Alice Testington"
}
```

Replace the email address with an actual test account for validation.

## Benefits

- **Resource efficiency:** Paused tasks don't consume compute during wait periods
- **Granular error handling:** Individual email failures don't halt the entire workflow
- **Production-ready:** Combines atomic versioning with built-in retry mechanisms
