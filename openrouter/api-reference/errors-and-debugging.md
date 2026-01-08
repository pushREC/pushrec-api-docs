---
source: https://openrouter.ai/docs/api/reference/errors-and-debugging
scraped: 2026-01-08
---

# Errors and Debugging

## Error Response Structure

OpenRouter returns errors in a consistent JSON format with an `error` object containing a `code`, `message`, and optional `metadata`.

```json
{
  "error": {
    "code": 400,
    "message": "Invalid request: missing required parameter 'model'",
    "metadata": {}
  }
}
```

The HTTP status code mirrors the `error.code` value for request-level issues.

## HTTP Status Codes

| Status | Description |
|--------|-------------|
| **400** | Invalid or missing parameters, CORS issues |
| **401** | Invalid credentials or expired OAuth sessions |
| **402** | Insufficient account credits |
| **403** | Input flagged by required moderation |
| **408** | Request timeout |
| **429** | Rate limiting active |
| **502** | Model provider unavailable or returned invalid response |
| **503** | No available provider matching routing requirements |

## Error Metadata

### Moderation Errors

```json
{
  "error": {
    "code": 403,
    "message": "Content flagged by moderation",
    "metadata": {
      "reasons": ["violence", "hate"],
      "flagged_input": "The first 100 characters of flagged content...",
      "provider_name": "openai",
      "model_slug": "gpt-4o"
    }
  }
}
```

| Field | Description |
|-------|-------------|
| `reasons` | Array of moderation categories triggered |
| `flagged_input` | Truncated to first 100 characters |
| `provider_name` | Provider that performed moderation |
| `model_slug` | Model identifier |

### Provider Errors

```json
{
  "error": {
    "code": 502,
    "message": "Provider error",
    "metadata": {
      "provider_name": "anthropic",
      "raw": "Original error message from provider"
    }
  }
}
```

| Field | Description |
|-------|-------------|
| `provider_name` | Upstream provider that failed |
| `raw` | Original error details from the provider |

## Streaming Error Handling

### Pre-Stream Errors

Follow standard error format with appropriate HTTP status codes.

### Mid-Stream Errors

Arrive as Server-Sent Events while maintaining HTTP 200 status:

```
data: {"error": {"code": 500, "message": "Provider disconnected"}, "choices": [{"finish_reason": "error"}]}
```

The error appears at the **top level** alongside standard response fields, with `finish_reason: 'error'` to terminate the stream.

## Responses API Error Handling

The Responses API uses typed events for error communication:

| Event Type | Description |
|------------|-------------|
| `response.failed` | Request failed before processing |
| `response.error` | Error during response generation |
| `error` | General error event |

### Automatic Error Transformation

The Responses API transforms certain errors into successful completions:

| Original Error | Transformed To |
|---------------|----------------|
| `context_length_exceeded` | `finish_reason: "length"` |
| `max_tokens_exceeded` | `finish_reason: "length"` |
| Similar limit errors | `finish_reason: "length"` |

## Debugging Feature

OpenRouter offers a `debug` option (streaming only) that exposes parameter transformations via `echo_upstream_body`.

### Enable Debug Mode

```json
{
  "model": "openai/gpt-4o",
  "messages": [{"role": "user", "content": "Hello"}],
  "stream": true,
  "debug": true
}
```

### Debug Response

The first SSE event includes upstream request details:

```
data: {"debug": {"echo_upstream_body": {"model": "gpt-4o", "messages": [...], "temperature": 1.0, ...}}}
```

This reveals:
- How OpenRouter converts your request to provider-specific formats
- Default values applied to omitted parameters
- Parameter mapping and transformations

**Important:** Debug mode is for development only and may expose sensitive information. Do not use in production.

## Error Handling Examples

### Python

```python
import requests

response = requests.post(
    'https://openrouter.ai/api/v1/chat/completions',
    headers={'Authorization': f'Bearer {api_key}'},
    json={'model': 'openai/gpt-4o', 'messages': [{'role': 'user', 'content': 'Hi'}]}
)

if response.status_code != 200:
    error = response.json().get('error', {})
    print(f"Error {error.get('code')}: {error.get('message')}")

    # Handle specific errors
    if response.status_code == 402:
        print("Please add credits to your account")
    elif response.status_code == 429:
        print("Rate limited - implementing backoff")
```

### TypeScript

```typescript
try {
  const response = await fetch('https://openrouter.ai/api/v1/chat/completions', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      model: 'openai/gpt-4o',
      messages: [{ role: 'user', content: 'Hi' }],
    }),
  });

  if (!response.ok) {
    const error = await response.json();
    console.error(`Error ${error.error.code}: ${error.error.message}`);

    switch (response.status) {
      case 402:
        console.log('Please add credits to your account');
        break;
      case 429:
        console.log('Rate limited - implementing backoff');
        break;
      case 502:
        console.log('Provider unavailable - try another model');
        break;
    }
  }
} catch (e) {
  console.error('Network error:', e);
}
```

### Streaming Error Detection

```typescript
for await (const chunk of stream) {
  const data = JSON.parse(chunk);

  // Check for mid-stream error
  if (data.error) {
    console.error(`Stream error: ${data.error.message}`);
    break;
  }

  // Check for error finish reason
  if (data.choices?.[0]?.finish_reason === 'error') {
    console.error('Stream terminated with error');
    break;
  }

  // Process normal content
  const content = data.choices?.[0]?.delta?.content;
  if (content) {
    process.stdout.write(content);
  }
}
```

## Common Error Scenarios

| Scenario | Error Code | Resolution |
|----------|------------|------------|
| Missing API key | 401 | Add Authorization header |
| Invalid API key | 401 | Check key at openrouter.ai/keys |
| No credits | 402 | Add credits to account |
| Content moderated | 403 | Modify input content |
| Rate limited | 429 | Implement exponential backoff |
| Model unavailable | 502 | Try different model or provider |
| No matching provider | 503 | Adjust routing requirements |
