# Respond to Customer Inquiry and Check for Inappropriate Content

## Overview

This guide demonstrates **parallelization** - running multiple tasks simultaneously rather than sequentially. The example creates a workflow that responds to customer inquiries while simultaneously checking content for inappropriate material.

## Key Concepts

The workflow uses three main tasks:

1. **generateCustomerResponse** - Generates helpful replies using OpenAI's o1-mini model
2. **checkInappropriateContent** - Validates text for harmful/offensive content
3. **handleCustomerQuestion** - Orchestrates parallel execution of both tasks

## Implementation Details

### Task Structure

Each task is defined with:
- Unique identifier (id)
- Async run function accepting a payload
- Integration with Vercel's AI SDK for LLM interactions
- Experimental telemetry enabled for logging

### Parallel Execution

The orchestrator uses `batch.triggerByTaskAndWait()` to:
- Trigger both analysis tasks simultaneously
- Wait for both to complete before proceeding
- Access results from each run (responseRun, moderationRun)

### Logic Flow

The workflow implements conditional logic:
- If content flagged as inappropriate, return rejection message
- If response generation succeeds, return generated content
- Otherwise, throw error indicating processing failure

## Testing

To test via dashboard:
1. Navigate to Test page
2. Select "handle-customer-question" task
3. Provide sample payload: `{"question": "Can you explain 2FA?"}`

The system processes both checks concurrently, delivering final response only after both operations complete.
