---
source: https://openrouter.ai/docs/api/api-reference/endpoints/list-endpoints-zdr
scraped: 2026-01-08
type: api-endpoint
---

# Preview ZDR Impact - List Endpoints with Zero Downtime Replacement

## Overview

This endpoint allows you to preview the impact of ZDR (Zero Downtime Replacement) on the available endpoints by retrieving a list of affected endpoints.

## Request Details

**Method:** GET
**URL:** `https://openrouter.ai/api/v1/endpoints/zdr`

### Required Parameters

| Parameter | Location | Type | Required | Description |
|-----------|----------|------|----------|-------------|
| Authorization | Header | string | Yes | Bearer token authentication required |

## Response Schema

### Success Response (200)

Returns an object containing a `data` array of endpoint objects:

```json
{
  "data": [
    {
      "name": "string",
      "model_name": "string",
      "context_length": "number",
      "pricing": {
        "prompt": "string (BigNumberUnion)",
        "completion": "string (BigNumberUnion)",
        "request": "string (BigNumberUnion)",
        "image": "string (BigNumberUnion)",
        "discount": "number"
      },
      "provider_name": "enum",
      "tag": "string",
      "quantization": "object",
      "max_completion_tokens": "number | null",
      "max_prompt_tokens": "number | null",
      "supported_parameters": ["enum values"],
      "status": "enum (-10, -5, -3, -2, -1, 0)",
      "uptime_last_30m": "number | null",
      "supports_implicit_caching": "boolean"
    }
  ]
}
```

### Endpoint Object Properties

| Property | Type | Description |
|----------|------|-------------|
| `name` | string | Endpoint identifier |
| `model_name` | string | Associated model name |
| `context_length` | number | Maximum context length |
| `pricing` | object | Pricing structure |
| `provider_name` | enum | Provider identifier (50+ providers including Anthropic, OpenAI, Google, etc.) |
| `tag` | string | Endpoint tag |
| `quantization` | object | Quantization configuration |
| `max_completion_tokens` | number/null | Maximum completion tokens |
| `max_prompt_tokens` | number/null | Maximum prompt tokens |
| `supported_parameters` | array | List of supported parameter enums |
| `status` | enum | Status code (-10, -5, -3, -2, -1, 0) |
| `uptime_last_30m` | number/null | Uptime percentage in last 30 minutes |
| `supports_implicit_caching` | boolean | Whether implicit caching is supported |

### Pricing Object Properties

| Property | Type | Description |
|----------|------|-------------|
| `prompt` | string (BigNumberUnion) | Per-token prompt cost |
| `completion` | string (BigNumberUnion) | Per-token completion cost |
| `request` | string (BigNumberUnion) | Per-request cost |
| `image` | string (BigNumberUnion) | Per-image cost |
| `discount` | number | Discount percentage |

## Error Responses

| Status Code | Description |
|-------------|-------------|
| 500 | Unexpected server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/endpoints/zdr"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/endpoints/zdr';
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
	url := "https://openrouter.ai/api/v1/endpoints/zdr"
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
curl -X GET "https://openrouter.ai/api/v1/endpoints/zdr" \
  -H "Authorization: Bearer <token>"
```
