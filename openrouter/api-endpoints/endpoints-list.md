---
source: https://openrouter.ai/docs/api/api-reference/endpoints/list-endpoints
scraped: 2026-01-08
type: api-endpoint
---

# List All Endpoints for a Model

## Endpoint Overview

**Method:** GET
**URL:** `https://openrouter.ai/api/v1/models/{author}/{slug}/endpoints`

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| author | string | Yes | Model author identifier |
| slug | string | Yes | Model slug identifier |

### Headers

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| Authorization | string | Yes | API key as bearer token in Authorization header |

## Response Schema

### Success Response (200)

Returns a structured object containing model information and available endpoints.

#### Root Properties

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique model identifier |
| `name` | string | Display name |
| `created` | number | Unix timestamp |
| `description` | string | Model description |
| `architecture` | object | Technical specifications |
| `endpoints` | array | Available service endpoints |

### Architecture Object

Contains model capabilities including:

| Property | Type | Description |
|----------|------|-------------|
| `tokenizer` | object | Tokenizer configuration |
| `instruct_type` | enum | Instruction format (claude, chatml, llama3, etc.) |
| `modality` | string/null | Primary modality type |
| `input_modalities` | array | Supported input types (text, image, file, audio, video) |
| `output_modalities` | array | Supported outputs (text, image, embeddings) |

### Endpoint Object Properties

| Property | Type | Description |
|----------|------|-------------|
| `name` | string | Endpoint name |
| `model_name` | string | Associated model name |
| `provider_name` | string | Provider identifier |
| `context_length` | number | Maximum context length |
| `max_completion_tokens` | number | Maximum completion tokens |
| `max_prompt_tokens` | number | Maximum prompt tokens |
| `pricing` | object | Pricing information with prompt/completion rates |
| `supported_parameters` | array | Supported parameters (temperature, top_p, max_tokens, etc.) |
| `status` | enum | Status code (0, -1, -2, -3, -5, -10) |
| `uptime_last_30m` | number/null | Uptime percentage in last 30 minutes |
| `supports_implicit_caching` | boolean | Whether implicit caching is supported |

## Error Responses

| Status Code | Description |
|-------------|-------------|
| 404 | Model does not exist |
| 500 | Unexpected server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/models/{author}/{slug}/endpoints"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/models/{author}/{slug}/endpoints';
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
	url := "https://openrouter.ai/api/v1/models/{author}/{slug}/endpoints"
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
curl -X GET "https://openrouter.ai/api/v1/models/{author}/{slug}/endpoints" \
  -H "Authorization: Bearer <token>"
```
