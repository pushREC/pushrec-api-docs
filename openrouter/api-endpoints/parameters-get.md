---
source: https://openrouter.ai/docs/api/api-reference/parameters/get-parameters
scraped: 2026-01-08
type: api-endpoint
---

# Get Model Parameters

## Overview

This endpoint retrieves supported parameters for a specific model and analytics about their usage popularity.

## Endpoint Details

**Method:** GET
**URL:** `https://openrouter.ai/api/v1/parameters/{author}/{slug}`

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `author` | string | Yes | Model author identifier |
| `slug` | string | Yes | Model slug identifier |

## Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `provider` | string | No | Provider name (see enum values below) |

## Headers

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| `Authorization` | string | Yes | API key as bearer token |

## Supported Providers

The following providers are supported:

- AI21
- AionLabs
- Alibaba
- Amazon Bedrock
- Amazon Nova
- Anthropic
- Arcee AI
- Azure
- BaseTen
- Black Forest Labs
- Cerebras
- Cloudflare
- Cohere
- DeepInfra
- DeepSeek
- Fireworks
- Google
- Groq
- Mistral
- OpenAI
- Perplexity
- SambaNova
- Together
- And 30+ others

## Supported Parameters

Models may support any of the following parameters:

- `temperature`
- `top_p`
- `top_k`
- `min_p`
- `top_a`
- `frequency_penalty`
- `presence_penalty`
- `repetition_penalty`
- `max_tokens`
- `logit_bias`
- `logprobs`
- `top_logprobs`
- `seed`
- `response_format`
- `structured_outputs`
- `stop`
- `tools`
- `tool_choice`
- `parallel_tool_calls`
- `include_reasoning`
- `reasoning`
- `reasoning_effort`
- `web_search_options`
- `verbosity`

## Response Format

### Success Response (200 OK)

```json
{
  "data": {
    "model": "string",
    "supported_parameters": ["string"]
  }
}
```

| Property | Type | Description |
|----------|------|-------------|
| `data.model` | string | Model identifier |
| `data.supported_parameters` | array | List of supported parameter names |

## HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Returns the parameters for the specified model |
| 401 | Authentication required or invalid credentials |
| 404 | Model or provider does not exist |
| 500 | Unexpected server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/parameters/{author}/{slug}"
headers = {"Authorization": "Bearer <token>"}
params = {"provider": "openai"}  # optional
response = requests.get(url, headers=headers, params=params)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/parameters/{author}/{slug}';
const options = {method: 'GET', headers: {Authorization: 'Bearer <token>'}};

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
	"fmt"
	"net/http"
	"io"
)

func main() {
	url := "https://openrouter.ai/api/v1/parameters/{author}/{slug}"
	req, _ := http.NewRequest("GET", url, nil)
	req.Header.Add("Authorization", "Bearer <token>")
	res, _ := http.DefaultClient.Do(req)
	defer res.Body.Close()
	body, _ := io.ReadAll(res.Body)
	fmt.Println(string(body))
}
```

### cURL

```bash
curl -X GET "https://openrouter.ai/api/v1/parameters/{author}/{slug}?provider=openai" \
  -H "Authorization: Bearer <token>"
```
