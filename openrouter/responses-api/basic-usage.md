---
source: https://openrouter.ai/docs/api/reference/responses/basic-usage
scraped: 2026-01-08
---

# Basic Usage

The Responses API Beta enables text generation through simple string inputs or structured message arrays.

> **Note:** This API is **in beta stage and may have breaking changes**.

## Simple String Input

Pass a direct text query with model specification and token limits:

### Request

```bash
curl https://openrouter.ai/api/v1/responses \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-4o",
    "input": "What is the meaning of life?",
    "max_output_tokens": 500
  }'
```

### TypeScript

```typescript
const response = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${process.env.OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    input: 'What is the meaning of life?',
    max_output_tokens: 500,
  }),
});

const data = await response.json();
console.log(data.output[0].content[0].text);
```

### Python

```python
import requests

response = requests.post(
    'https://openrouter.ai/api/v1/responses',
    headers={
        'Authorization': f'Bearer {OPENROUTER_API_KEY}',
        'Content-Type': 'application/json',
    },
    json={
        'model': 'openai/gpt-4o',
        'input': 'What is the meaning of life?',
        'max_output_tokens': 500,
    },
)

data = response.json()
print(data['output'][0]['content'][0]['text'])
```

## Structured Messages Input

Use message arrays with role-based content for complex conversations:

### Request

```json
{
  "model": "openai/gpt-4o",
  "input": [
    {
      "type": "message",
      "role": "user",
      "content": [
        {
          "type": "input_text",
          "text": "Explain quantum computing in simple terms"
        }
      ]
    }
  ],
  "max_output_tokens": 1000
}
```

### TypeScript

```typescript
const response = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${process.env.OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    input: [
      {
        type: 'message',
        role: 'user',
        content: [
          {
            type: 'input_text',
            text: 'Explain quantum computing in simple terms',
          },
        ],
      },
    ],
    max_output_tokens: 1000,
  }),
});
```

## Response Structure

Responses follow a standardized format:

```json
{
  "id": "resp_abc123def456",
  "object": "response",
  "created": 1704067200,
  "model": "openai/gpt-4o",
  "output": [
    {
      "type": "message",
      "role": "assistant",
      "content": [
        {
          "type": "output_text",
          "text": "The generated response text..."
        }
      ]
    }
  ],
  "usage": {
    "input_tokens": 15,
    "output_tokens": 150,
    "total_tokens": 165
  },
  "status": "completed"
}
```

### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique response identifier |
| `object` | string | Always `"response"` |
| `created` | integer | Unix timestamp of creation |
| `model` | string | Model used for generation |
| `output` | array | Array of output messages |
| `usage` | object | Token usage metrics |
| `status` | string | Completion status |

## Streaming

Enable real-time generation by setting `stream: true`:

### Request

```json
{
  "model": "openai/gpt-4o",
  "input": "Tell me a story",
  "max_output_tokens": 1000,
  "stream": true
}
```

### TypeScript Streaming

```typescript
const response = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${process.env.OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    input: 'Tell me a story',
    max_output_tokens: 1000,
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
      // Process streaming delta
      if (data.type === 'response.output_text.delta') {
        process.stdout.write(data.delta);
      }
    }
  }
}
```

### Streaming Events

The API returns Server-Sent Events (SSE) with progressive content deltas:

```
data: {"type": "response.created", "response": {...}}
data: {"type": "response.output_text.delta", "delta": "Hello"}
data: {"type": "response.output_text.delta", "delta": " there"}
data: {"type": "response.output_text.delta", "delta": "!"}
data: {"type": "response.output_text.done", "text": "Hello there!"}
data: {"type": "response.done", "response": {...}}
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `model` | string | Yes | Model identifier |
| `input` | string/array | Yes | Text or structured messages |
| `stream` | boolean | No | Enable streaming output |
| `max_output_tokens` | integer | No | Maximum tokens to generate |
| `temperature` | number | No | Sampling temperature (0-2) |
| `top_p` | number | No | Nucleus sampling parameter |

## Multi-Turn Conversations

Since the API is stateless, **always include the complete conversation history in each request**.

Assistant responses require `id` and `status` fields for proper context maintenance:

```json
{
  "model": "openai/gpt-4o",
  "input": [
    {
      "type": "message",
      "role": "user",
      "content": [{"type": "input_text", "text": "What is 2+2?"}]
    },
    {
      "type": "message",
      "id": "msg_prev123",
      "role": "assistant",
      "status": "completed",
      "content": [{"type": "output_text", "text": "2+2 equals 4."}]
    },
    {
      "type": "message",
      "role": "user",
      "content": [{"type": "input_text", "text": "And what is that times 3?"}]
    }
  ],
  "max_output_tokens": 100
}
```

## Error Handling

Implement try-catch blocks to handle non-200 HTTP responses and network failures:

```typescript
try {
  const response = await fetch('https://openrouter.ai/api/v1/responses', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      model: 'openai/gpt-4o',
      input: 'Hello',
    }),
  });

  if (!response.ok) {
    const error = await response.json();
    throw new Error(`API Error: ${error.error.message}`);
  }

  const data = await response.json();
  console.log(data.output[0].content[0].text);

} catch (error) {
  console.error('Request failed:', error.message);
}
```
