---
source: https://openrouter.ai/docs/api/reference/responses/web-search
scraped: 2026-01-08
---

# Web Search

OpenRouter's Responses API Beta enables real-time web search integration with citation annotations.

> **Note:** This API is **in beta stage and may have breaking changes**.

## Web Search Plugin Configuration

The plugin requires an `id` parameter set to `"web"` and accepts `max_results` (1-10 range) to control search result quantity.

```json
{
  "plugins": [
    {
      "id": "web",
      "max_results": 5
    }
  ]
}
```

## Basic Usage

### cURL

```bash
curl https://openrouter.ai/api/v1/responses \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-4o",
    "input": "What are the latest developments in quantum computing?",
    "plugins": [
      {
        "id": "web",
        "max_results": 5
      }
    ],
    "max_output_tokens": 1000
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
    input: 'What are the latest developments in quantum computing?',
    plugins: [
      {
        id: 'web',
        max_results: 5,
      },
    ],
    max_output_tokens: 1000,
  }),
});

const data = await response.json();
console.log(data.output);
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
        'input': 'What are the latest developments in quantum computing?',
        'plugins': [
            {
                'id': 'web',
                'max_results': 5,
            },
        ],
        'max_output_tokens': 1000,
    },
)

data = response.json()
print(data['output'])
```

## Response Format with Citations

Responses include citation annotations with URL sources:

```json
{
  "id": "resp_abc123",
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
          "text": "Recent developments in quantum computing include IBM's new 1000-qubit processor [1] and Google's advances in error correction [2].",
          "annotations": [
            {
              "type": "url_citation",
              "url": "https://example.com/ibm-quantum",
              "title": "IBM Unveils New Quantum Processor",
              "start_index": 67,
              "end_index": 70
            },
            {
              "type": "url_citation",
              "url": "https://example.com/google-quantum",
              "title": "Google Quantum Error Correction",
              "start_index": 115,
              "end_index": 118
            }
          ]
        }
      ]
    }
  ],
  "usage": {
    "input_tokens": 20,
    "output_tokens": 150,
    "total_tokens": 170
  },
  "status": "completed"
}
```

### Citation Fields

| Field | Type | Description |
|-------|------|-------------|
| `type` | string | Always `"url_citation"` |
| `url` | string | Source URL |
| `title` | string | Page title |
| `start_index` | integer | Start position in text |
| `end_index` | integer | End position in text |

## Structured Messages with Web Search

Use multi-turn conversation format with plugin integration:

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
          "text": "What are the latest news about AI regulations?"
        }
      ]
    }
  ],
  "plugins": [
    {
      "id": "web",
      "max_results": 10
    }
  ],
  "max_output_tokens": 1500
}
```

## Online Model Variants

Alternatively, use models with built-in search using the `:online` suffix:

```json
{
  "model": "openai/gpt-4o:online",
  "input": "What happened in the stock market today?",
  "max_output_tokens": 1000
}
```

### Available Online Models

Models supporting the `:online` suffix include:

- `openai/gpt-4o:online`
- `openai/gpt-4o-mini:online`
- `anthropic/claude-3-5-sonnet:online`

## Streaming with Web Search

Real-time progress monitoring during search operations:

```typescript
const response = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${process.env.OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    input: 'What are today\'s top tech news?',
    plugins: [{ id: 'web', max_results: 5 }],
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

      switch (data.type) {
        case 'response.web_search.started':
          console.log('Web search started...');
          break;
        case 'response.web_search.results':
          console.log('Search results received:', data.results);
          break;
        case 'response.output_text.delta':
          process.stdout.write(data.delta);
          break;
      }
    }
  }
}
```

## Multi-Turn Conversations with Search

Maintain context across sequential messages:

```json
{
  "model": "openai/gpt-4o",
  "input": [
    {
      "type": "message",
      "role": "user",
      "content": [{"type": "input_text", "text": "What is the current Bitcoin price?"}]
    },
    {
      "type": "message",
      "id": "msg_prev123",
      "role": "assistant",
      "status": "completed",
      "content": [
        {
          "type": "output_text",
          "text": "The current Bitcoin price is approximately $45,000.",
          "annotations": [...]
        }
      ]
    },
    {
      "type": "message",
      "role": "user",
      "content": [{"type": "input_text", "text": "How does this compare to last month?"}]
    }
  ],
  "plugins": [
    {
      "id": "web",
      "max_results": 5
    }
  ],
  "max_output_tokens": 1000
}
```

## Rendering Citations

Example of rendering citations in a web application:

```typescript
function renderTextWithCitations(content) {
  const { text, annotations } = content;

  // Sort annotations by start_index in reverse to avoid index shifting
  const sortedAnnotations = [...annotations].sort(
    (a, b) => b.start_index - a.start_index
  );

  let result = text;

  for (const annotation of sortedAnnotations) {
    const { start_index, end_index, url, title } = annotation;
    const citationText = text.slice(start_index, end_index);
    const link = `<a href="${url}" title="${title}">${citationText}</a>`;
    result = result.slice(0, start_index) + link + result.slice(end_index);
  }

  return result;
}
```

## Best Practices

1. **Query Specificity**: Use specific, well-formed queries for better search results
2. **Result Limits**: Set appropriate `max_results` based on query complexity (1-10)
3. **Annotation Handling**: Properly parse and display citation annotations
4. **Error Management**: Handle cases where search fails or returns no results
5. **Rate Limiting**: Be mindful of rate limits when making frequent search requests

## Plugin Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | Yes | Must be `"web"` |
| `max_results` | integer | No | Number of results (1-10, default: 5) |

## Error Handling for Search

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
      input: 'Search query',
      plugins: [{ id: 'web' }],
    }),
  });

  if (!response.ok) {
    const error = await response.json();
    if (error.error.code === 'search_failed') {
      console.log('Web search failed, falling back to model knowledge');
    }
  }
} catch (error) {
  console.error('Request failed:', error);
}
```
