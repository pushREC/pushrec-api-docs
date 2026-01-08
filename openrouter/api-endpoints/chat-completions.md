---
source: https://openrouter.ai/docs/api/api-reference/chat/send-chat-completion-request
scraped: 2026-01-08
type: api-endpoint
---

# Chat Completions

## Endpoint Overview

**Method:** POST
**URL:** `https://openrouter.ai/api/v1/chat/completions`

This endpoint enables chat completion requests supporting both streaming and non-streaming modes across multiple model providers.

## Authentication

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| Authorization | string | Yes | API key as bearer token |
| Content-Type | string | Yes | Must be `application/json` |

## Request Body Schema

### Core Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `messages` | array | Yes | Array of message objects with role and content |
| `model` | string | No | Model identifier for the request |
| `temperature` | number | No | Sampling temperature (default: 1) |
| `top_p` | number | No | Nucleus sampling parameter (default: 1) |
| `stream` | boolean | No | Enable streaming responses (default: false) |
| `max_tokens` | number | No | Maximum completion tokens |
| `max_completion_tokens` | number | No | Alternative max token specification |

### Message Roles

| Role | Description |
|------|-------------|
| `system` | System instructions |
| `user` | User input |
| `assistant` | Model responses |
| `developer` | Developer messages |
| `tool` | Tool response messages |

### Message Content Types

- Text content
- Image URLs (with detail levels: auto, low, high)
- Input audio
- Input/output video

### Advanced Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `frequency_penalty` | number | Penalize frequent tokens |
| `presence_penalty` | number | Penalize new tokens |
| `stop` | string/array | Stop sequences |
| `seed` | number | Reproducible randomness |
| `logprobs` | boolean | Return log probabilities |
| `top_logprobs` | number | Top log probability count |

### Provider Control

```json
{
  "provider": {
    "order": ["provider1", "provider2"],
    "only": ["provider_list"],
    "ignore": ["provider_list"],
    "allow_fallbacks": true,
    "data_collection": "allow|deny",
    "max_price": {
      "prompt": "number",
      "completion": "number",
      "image": "number",
      "audio": "number",
      "request": "number"
    }
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| `order` | array | Provider precedence |
| `only` | array | Allowed providers |
| `ignore` | array | Excluded providers |
| `allow_fallbacks` | boolean | Enable backup providers |
| `data_collection` | string | Data handling preference (allow/deny) |
| `max_price` | object | Maximum price constraints |

### Response Format Options

| Format | Description |
|--------|-------------|
| `text` | Plain text |
| `json_object` | JSON output |
| `json_schema` | Structured JSON with schema |
| `grammar` | GBNF grammar constraints |
| `python` | Python code output |

### Plugins

| Plugin | Description |
|--------|-------------|
| `auto-router` | Automatic provider selection |
| `moderation` | Content moderation |
| `web` | Web search integration |
| `file-parser` | Document parsing with OCR options |
| `response-healing` | Response repair |

## Response Schema

### Success Response (200)

```json
{
  "id": "string",
  "object": "chat.completion",
  "created": "number",
  "model": "string",
  "choices": [
    {
      "index": "number",
      "message": {
        "role": "assistant",
        "content": "string",
        "tool_calls": [],
        "reasoning": "string"
      },
      "finish_reason": "stop|length|tool_calls|content_filter|error",
      "logprobs": {},
      "reasoning_details": []
    }
  ],
  "usage": {
    "prompt_tokens": "number",
    "completion_tokens": "number",
    "total_tokens": "number",
    "prompt_tokens_details": {},
    "completion_tokens_details": {}
  }
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique completion identifier |
| `object` | string | Object type ("chat.completion") |
| `created` | number | Unix timestamp |
| `model` | string | Model used |
| `choices` | array | Array of completion choices |
| `choices[].index` | number | Choice index |
| `choices[].message` | object | Response message |
| `choices[].message.role` | string | Always "assistant" |
| `choices[].message.content` | string | Response content |
| `choices[].message.tool_calls` | array | Tool calls made |
| `choices[].message.reasoning` | string | Reasoning content |
| `choices[].finish_reason` | string | Completion stop reason |
| `choices[].logprobs` | object | Log probabilities |
| `choices[].reasoning_details` | array | Detailed reasoning |
| `usage` | object | Token usage statistics |
| `usage.prompt_tokens` | number | Prompt token count |
| `usage.completion_tokens` | number | Completion token count |
| `usage.total_tokens` | number | Total token count |

### Finish Reasons

| Reason | Description |
|--------|-------------|
| `stop` | Natural completion |
| `length` | Max tokens reached |
| `tool_calls` | Tool calls requested |
| `content_filter` | Content filtered |
| `error` | Error occurred |

## HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Successful completion |
| 400 | Invalid parameters |
| 401 | Unauthorized (invalid API key) |
| 429 | Rate limit exceeded |
| 500 | Internal server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/chat/completions"
headers = {
    "Authorization": "Bearer <token>",
    "Content-Type": "application/json"
}
payload = {
    "model": "openai/gpt-4",
    "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Hello, how are you?"}
    ],
    "temperature": 0.7,
    "max_tokens": 1000
}
response = requests.post(url, json=payload, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/chat/completions';
const options = {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer <token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    model: 'openai/gpt-4',
    messages: [
      {role: 'system', content: 'You are a helpful assistant.'},
      {role: 'user', content: 'Hello, how are you?'}
    ],
    temperature: 0.7,
    max_tokens: 1000
  })
};

try {
  const response = await fetch(url, options);
  const data = await response.json();
  console.log(data);
} catch (error) {
  console.error(error);
}
```

### Go

```go
package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
	"io"
)

func main() {
	url := "https://openrouter.ai/api/v1/chat/completions"
	payload := map[string]interface{}{
		"model": "openai/gpt-4",
		"messages": []map[string]string{
			{"role": "system", "content": "You are a helpful assistant."},
			{"role": "user", "content": "Hello, how are you?"},
		},
		"temperature": 0.7,
		"max_tokens":  1000,
	}
	jsonPayload, _ := json.Marshal(payload)

	req, _ := http.NewRequest("POST", url, bytes.NewBuffer(jsonPayload))
	req.Header.Add("Authorization", "Bearer <token>")
	req.Header.Add("Content-Type", "application/json")

	res, _ := http.DefaultClient.Do(req)
	defer res.Body.Close()
	body, _ := io.ReadAll(res.Body)
	fmt.Println(string(body))
}
```

### cURL

```bash
curl -X POST "https://openrouter.ai/api/v1/chat/completions" \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-4",
    "messages": [
      {"role": "system", "content": "You are a helpful assistant."},
      {"role": "user", "content": "Hello, how are you?"}
    ],
    "temperature": 0.7,
    "max_tokens": 1000
  }'
```

### Streaming Example (JavaScript)

```javascript
const url = 'https://openrouter.ai/api/v1/chat/completions';
const response = await fetch(url, {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer <token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    model: 'openai/gpt-4',
    messages: [{role: 'user', content: 'Hello!'}],
    stream: true
  })
});

const reader = response.body.getReader();
const decoder = new TextDecoder();

while (true) {
  const {done, value} = await reader.read();
  if (done) break;

  const chunk = decoder.decode(value);
  const lines = chunk.split('\n').filter(line => line.startsWith('data: '));

  for (const line of lines) {
    const data = line.slice(6);
    if (data === '[DONE]') continue;
    const parsed = JSON.parse(data);
    process.stdout.write(parsed.choices[0]?.delta?.content || '');
  }
}
```
