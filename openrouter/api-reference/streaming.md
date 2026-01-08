---
source: https://openrouter.ai/docs/api/reference/streaming
scraped: 2026-01-08
---

# Streaming

OpenRouter enables real-time model responses through streaming. To activate this feature, set `stream: true` in your request parameters. The system delivers model output in chunks rather than as a single complete response.

## Enabling Streaming

```json
{
  "model": "openai/gpt-4o",
  "messages": [{"role": "user", "content": "Hello!"}],
  "stream": true
}
```

## Implementation Examples

### TypeScript SDK

```typescript
import OpenRouter from 'openrouter';

const client = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

const stream = await client.chat.completions.create({
  model: 'openai/gpt-4o',
  messages: [{ role: 'user', content: 'Hello!' }],
  stream: true,
});

for await (const chunk of stream) {
  const content = chunk.choices[0]?.delta?.content;
  if (content) {
    process.stdout.write(content);
  }
}
```

### Python

```python
import requests
import json

url = "https://openrouter.ai/api/v1/chat/completions"
headers = {
    "Authorization": f"Bearer {OPENROUTER_API_KEY}",
    "Content-Type": "application/json"
}
data = {
    "model": "openai/gpt-4o",
    "messages": [{"role": "user", "content": "Hello!"}],
    "stream": True
}

response = requests.post(url, headers=headers, json=data, stream=True)

for line in response.iter_lines():
    if line:
        line = line.decode('utf-8')
        if line.startswith('data: '):
            data = line[6:]
            if data != '[DONE]':
                chunk = json.loads(data)
                content = chunk['choices'][0]['delta'].get('content', '')
                print(content, end='', flush=True)
```

### Fetch API (Browser)

```javascript
const response = await fetch('https://openrouter.ai/api/v1/chat/completions', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    messages: [{ role: 'user', content: 'Hello!' }],
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
      const data = line.slice(6);
      if (data !== '[DONE]') {
        const parsed = JSON.parse(data);
        const content = parsed.choices[0]?.delta?.content;
        if (content) {
          console.log(content);
        }
      }
    }
  }
}
```

## SSE Comment Handling

The service occasionally transmits keepalive comments like `: OPENROUTER PROCESSING` to prevent connection timeouts. Per SSE specifications, these can be safely ignored, though developers may use them for UX improvements such as loading indicators.

## Stream Cancellation

Cancellation is supported through `AbortController` in JavaScript and event flags in Python.

### JavaScript Cancellation

```javascript
const controller = new AbortController();

const response = await fetch('https://openrouter.ai/api/v1/chat/completions', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    messages: [{ role: 'user', content: 'Hello!' }],
    stream: true,
  }),
  signal: controller.signal,
});

// To cancel:
controller.abort();
```

### Python Cancellation

```python
import threading

cancel_event = threading.Event()

def stream_with_cancellation():
    response = requests.post(url, headers=headers, json=data, stream=True)
    for line in response.iter_lines():
        if cancel_event.is_set():
            response.close()
            break
        # Process line...

# To cancel:
cancel_event.set()
```

**Note:** Cancellation only works for streaming requests with supported providers. Approximately 20 providers support cancellation. Unsupported providers will continue processing regardless of cancellation attempts.

## Error Handling

Errors manifest differently based on timing:

### Pre-Stream Errors

Return standard JSON responses with appropriate HTTP status codes:

| Status | Description |
|--------|-------------|
| 400 | Bad Request |
| 401 | Unauthorized |
| 402 | Payment Required |
| 429 | Rate Limited |
| 502 | Bad Gateway |
| 503 | Service Unavailable |

### Mid-Stream Errors

Appear as SSE events with error objects while maintaining HTTP 200 status:

```
data: {"error": {"code": "provider_error", "message": "..."}, "choices": [{"finish_reason": "error"}]}
```

## Streaming Response Format

```
data: {"id":"gen-123","choices":[{"delta":{"content":"Hello"}}]}
data: {"id":"gen-123","choices":[{"delta":{"content":" there"}}]}
data: {"id":"gen-123","choices":[{"delta":{"content":"!"}}]}
data: {"id":"gen-123","choices":[{"delta":{},"finish_reason":"stop"}]}
data: [DONE]
```
