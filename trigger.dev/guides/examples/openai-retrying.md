# Call OpenAI with Retrying - Trigger.dev Documentation

## Overview
This example demonstrates how to implement retry logic when calling OpenAI's API using Trigger.dev. The approach handles both complete API failures and empty responses by automatically retrying the operation.

## Key Concept
"Sometimes OpenAI calls can take a long time to complete, or they can fail. This task will retry if the API call fails completely or if the response is empty."

## Task Implementation

The example creates a task that:
- Initializes an OpenAI client with an API key from environment variables
- Specifies custom retry parameters overriding default configuration
- Makes a chat completion request using GPT-3.5-turbo
- Validates response content and throws errors for empty responses to trigger retries

## Retry Configuration

The task uses these retry settings:
- **maxAttempts**: 10 attempts maximum
- **factor**: 1.8 (exponential backoff multiplier)
- **minTimeoutInMs**: 500ms minimum delay
- **maxTimeoutInMs**: 30,000ms maximum delay
- **randomize**: false (deterministic timing)

## Testing the Task

To test via dashboard, use this payload:
```json
{
  "prompt": "What is the meaning of life?"
}
```

## Important Pattern

The implementation demonstrates defensive programming by checking if `chatCompletion.choices[0]?.message.content` is undefined and throwing an error to trigger retries rather than returning incomplete results.
