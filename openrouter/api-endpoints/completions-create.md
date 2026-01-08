---
source: https://openrouter.ai/docs/api/api-reference/completions/create-completions
scraped: 2026-01-08
type: api-endpoint
---

# Create Completions

## Endpoint Overview

**Method:** POST
**URL:** `https://openrouter.ai/api/v1/completions`

Creates a completion for the provided prompt and parameters. Supports both streaming and non-streaming modes.

## Authentication

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| Authorization | string | Yes | API key as bearer token |
| Content-Type | string | Yes | Must be `application/json` |

## Request Parameters

### Required Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `prompt` | string/array | Yes | Can be a string, array of strings, array of numbers, or nested number arrays |

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | string | Model identifier |
| `models` | array | Array of model identifiers |
| `max_tokens` | integer | Token limit for response |
| `temperature` | number | Sampling temperature (0-2 range typical) |
| `top_p` | number | Nucleus sampling parameter |
| `frequency_penalty` | number | Penalizes token repetition |
| `presence_penalty` | number | Penalizes new tokens |
| `stream` | boolean | Enable streaming (default: false) |
| `stop` | string/array | Stopping sequence(s) |
| `n` | integer | Number of completions |
| `echo` | boolean | Include prompt in response |
| `response_format` | object | Output format specification |
| `seed` | integer | For reproducible outputs |
| `logprobs` | integer | Log probabilities to return |
| `user` | string | User identifier |
| `metadata` | object | Custom key-value pairs |

### Response Format Options

| Format | Description |
|--------|-------------|
| `text` | Plain text output |
| `json_object` | JSON output |
| `json_schema` | Structured JSON with schema |
| `grammar` | GBNF grammar constraints |
| `python` | Python code output |

## Response Schema

### Success Response (200)

```json
{
  "id": "string",
  "object": "text_completion",
  "created": "number",
  "model": "string",
  "provider": "string",
  "choices": [
    {
      "text": "string",
      "index": "number",
      "finish_reason": "stop|length|content_filter",
      "logprobs": "object | null"
    }
  ],
  "usage": {
    "prompt_tokens": "number",
    "completion_tokens": "number",
    "total_tokens": "number"
  }
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique completion identifier |
| `object` | string | Object type ("text_completion") |
| `created` | number | Unix timestamp |
| `model` | string | Model used |
| `provider` | string | Provider used |
| `choices` | array | Array of completion choices |
| `choices[].text` | string | Generated text |
| `choices[].index` | number | Choice index |
| `choices[].finish_reason` | string | Completion stop reason |
| `choices[].logprobs` | object/null | Log probabilities |
| `usage` | object | Token usage statistics |
| `usage.prompt_tokens` | number | Prompt token count |
| `usage.completion_tokens` | number | Completion token count |
| `usage.total_tokens` | number | Total token count |

### Finish Reasons

| Reason | Description |
|--------|-------------|
| `stop` | Natural completion or stop sequence reached |
| `length` | Max tokens reached |
| `content_filter` | Content filtered |

## HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Successful response |
| 400 | Invalid parameters |
| 401 | Invalid API key |
| 429 | Rate limit exceeded |
| 500 | Server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/completions"
headers = {
    "Authorization": "Bearer <token>",
    "Content-Type": "application/json"
}
payload = {
    "model": "openai/gpt-3.5-turbo-instruct",
    "prompt": "Once upon a time",
    "max_tokens": 100,
    "temperature": 0.7
}
response = requests.post(url, json=payload, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/completions';
const options = {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer <token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    model: 'openai/gpt-3.5-turbo-instruct',
    prompt: 'Once upon a time',
    max_tokens: 100,
    temperature: 0.7
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
	url := "https://openrouter.ai/api/v1/completions"
	payload := map[string]interface{}{
		"model":       "openai/gpt-3.5-turbo-instruct",
		"prompt":      "Once upon a time",
		"max_tokens":  100,
		"temperature": 0.7,
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

### Ruby

```ruby
require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("https://openrouter.ai/api/v1/completions")
request = Net::HTTP::Post.new(uri)
request["Authorization"] = "Bearer <token>"
request["Content-Type"] = "application/json"
request.body = JSON.dump({
  model: "openai/gpt-3.5-turbo-instruct",
  prompt: "Once upon a time",
  max_tokens: 100,
  temperature: 0.7
})

response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(request)
end

puts JSON.parse(response.body)
```

### cURL

```bash
curl -X POST "https://openrouter.ai/api/v1/completions" \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-3.5-turbo-instruct",
    "prompt": "Once upon a time",
    "max_tokens": 100,
    "temperature": 0.7
  }'
```

### Streaming Example (Python)

```python
import requests

url = "https://openrouter.ai/api/v1/completions"
headers = {
    "Authorization": "Bearer <token>",
    "Content-Type": "application/json"
}
payload = {
    "model": "openai/gpt-3.5-turbo-instruct",
    "prompt": "Once upon a time",
    "max_tokens": 100,
    "stream": True
}

response = requests.post(url, json=payload, headers=headers, stream=True)

for line in response.iter_lines():
    if line:
        line = line.decode('utf-8')
        if line.startswith('data: '):
            data = line[6:]
            if data != '[DONE]':
                import json
                parsed = json.loads(data)
                print(parsed['choices'][0]['text'], end='', flush=True)
```
