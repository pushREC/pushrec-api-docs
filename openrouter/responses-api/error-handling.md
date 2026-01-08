---
source: https://openrouter.ai/docs/api/reference/responses/error-handling
scraped: 2026-01-08
---

# Error Handling

The Responses API Beta implements a structured approach to error management.

> **Note:** This API is **in beta stage and may have breaking changes**.

## Stateless Operation

The API operates on a **stateless model** - each request stands independently without persistent conversation history. Users must transmit the complete conversation context with every request.

## Error Response Structure

All errors return in a consistent format:

```json
{
  "error": {
    "code": "invalid_prompt",
    "message": "Detailed error description"
  },
  "metadata": null
}
```

### Error Fields

| Field | Type | Description |
|-------|------|-------------|
| `error.code` | string | Error type identifier |
| `error.message` | string | Human-readable error description |
| `metadata` | object/null | Additional error context (when available) |

## Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| `invalid_prompt` | 400 | Request validation failures |
| `rate_limit_exceeded` | 429 | Request volume exceeded |
| `server_error` | 500+ | Internal processing issues |
| `invalid_api_key` | 401 | Invalid or missing API key |
| `insufficient_credits` | 402 | Account has no credits |
| `model_not_found` | 404 | Requested model unavailable |
| `context_length_exceeded` | 400 | Input exceeds model limit |

## Error Examples

### Invalid Prompt (400)

```json
{
  "error": {
    "code": "invalid_prompt",
    "message": "The 'input' field is required"
  },
  "metadata": null
}
```

### Rate Limit Exceeded (429)

```json
{
  "error": {
    "code": "rate_limit_exceeded",
    "message": "Rate limit exceeded. Please retry after 60 seconds."
  },
  "metadata": {
    "retry_after": 60
  }
}
```

### Server Error (500)

```json
{
  "error": {
    "code": "server_error",
    "message": "An internal server error occurred. Please try again."
  },
  "metadata": null
}
```

### Insufficient Credits (402)

```json
{
  "error": {
    "code": "insufficient_credits",
    "message": "Your account has insufficient credits. Please add credits to continue."
  },
  "metadata": {
    "credits_remaining": 0.0
  }
}
```

## Error Handling Examples

### TypeScript

```typescript
async function makeRequest(input: string) {
  try {
    const response = await fetch('https://openrouter.ai/api/v1/responses', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${process.env.OPENROUTER_API_KEY}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        model: 'openai/gpt-4o',
        input,
        max_output_tokens: 1000,
      }),
    });

    if (!response.ok) {
      const errorData = await response.json();
      const { code, message } = errorData.error;

      switch (code) {
        case 'invalid_prompt':
          console.error('Invalid request:', message);
          break;
        case 'rate_limit_exceeded':
          const retryAfter = errorData.metadata?.retry_after || 60;
          console.log(`Rate limited. Retrying in ${retryAfter}s`);
          await sleep(retryAfter * 1000);
          return makeRequest(input); // Retry
        case 'insufficient_credits':
          console.error('Please add credits to your account');
          break;
        case 'server_error':
          console.error('Server error, please retry');
          break;
        default:
          console.error(`Error ${code}: ${message}`);
      }

      throw new Error(message);
    }

    return await response.json();

  } catch (error) {
    if (error instanceof TypeError) {
      console.error('Network error:', error.message);
    }
    throw error;
  }
}

function sleep(ms: number) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
```

### Python

```python
import requests
import time

def make_request(input_text, max_retries=3):
    for attempt in range(max_retries):
        try:
            response = requests.post(
                'https://openrouter.ai/api/v1/responses',
                headers={
                    'Authorization': f'Bearer {OPENROUTER_API_KEY}',
                    'Content-Type': 'application/json',
                },
                json={
                    'model': 'openai/gpt-4o',
                    'input': input_text,
                    'max_output_tokens': 1000,
                },
            )

            if response.status_code == 200:
                return response.json()

            error_data = response.json()
            error = error_data.get('error', {})
            code = error.get('code')
            message = error.get('message')

            if code == 'rate_limit_exceeded':
                retry_after = error_data.get('metadata', {}).get('retry_after', 60)
                print(f'Rate limited. Waiting {retry_after}s...')
                time.sleep(retry_after)
                continue

            elif code == 'insufficient_credits':
                raise Exception('Insufficient credits. Please add funds.')

            elif code == 'invalid_prompt':
                raise ValueError(f'Invalid request: {message}')

            elif code == 'server_error':
                wait_time = 2 ** attempt
                print(f'Server error. Retrying in {wait_time}s...')
                time.sleep(wait_time)
                continue

            else:
                raise Exception(f'Error {code}: {message}')

        except requests.exceptions.RequestException as e:
            print(f'Network error: {e}')
            if attempt < max_retries - 1:
                time.sleep(2 ** attempt)
                continue
            raise

    raise Exception('Max retries exceeded')
```

## Streaming Error Handling

Errors during streaming are delivered via SSE events:

```typescript
const response = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${apiKey}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    input: 'Hello',
    stream: true,
  }),
});

const reader = response.body.getReader();
const decoder = new TextDecoder();

while (true) {
  const { done, value } = await reader.read();
  if (done) break;

  const chunk = decoder.decode(value);
  const lines = chunk.split('\n');

  for (const line of lines) {
    if (line.startsWith('data: ')) {
      const data = JSON.parse(line.slice(6));

      // Check for error events
      if (data.type === 'response.failed') {
        console.error('Response failed:', data.error);
        break;
      }

      if (data.type === 'response.error') {
        console.error('Response error:', data.error);
        break;
      }

      if (data.type === 'error') {
        console.error('Error:', data.error);
        break;
      }

      // Process normal content
      if (data.type === 'response.output_text.delta') {
        process.stdout.write(data.delta);
      }
    }
  }
}
```

### Streaming Error Events

| Event Type | Description |
|------------|-------------|
| `response.failed` | Request failed before processing |
| `response.error` | Error during response generation |
| `error` | General error event |

## Best Practices

1. **Always Check Status**: Verify `response.ok` or status codes before parsing
2. **Implement Retry Logic**: Use exponential backoff for transient errors
3. **Handle Rate Limits**: Respect `retry_after` values from rate limit errors
4. **Log Errors**: Keep detailed logs for debugging
5. **User Feedback**: Provide meaningful error messages to users
6. **Graceful Degradation**: Have fallback behavior for non-critical failures

## Rate Limit Handling

```typescript
async function requestWithBackoff(input: string, maxRetries = 5) {
  for (let attempt = 0; attempt < maxRetries; attempt++) {
    const response = await fetch('https://openrouter.ai/api/v1/responses', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${apiKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        model: 'openai/gpt-4o',
        input,
      }),
    });

    if (response.status === 429) {
      const retryAfter = response.headers.get('Retry-After') || 60;
      console.log(`Rate limited. Waiting ${retryAfter}s...`);
      await new Promise(r => setTimeout(r, Number(retryAfter) * 1000));
      continue;
    }

    if (!response.ok) {
      const error = await response.json();
      throw new Error(error.error.message);
    }

    return await response.json();
  }

  throw new Error('Max retries exceeded');
}
```
