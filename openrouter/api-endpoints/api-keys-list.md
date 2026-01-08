---
source: https://openrouter.ai/docs/api/api-reference/api-keys/list
scraped: 2026-01-08
type: api-endpoint
---

# List API Keys

## Endpoint Overview

**Method:** GET
**URL:** `https://openrouter.ai/api/v1/keys`

This endpoint retrieves all API keys associated with an account.

## Authentication

Requires bearer token authentication via the `Authorization` header.

## Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `include_disabled` | string | No | Whether to include disabled API keys in the response |
| `offset` | string | No | Number of API keys to skip for pagination |

## Response Schema

### Success Response (200)

Returns an object containing a `data` array of API key objects.

```json
{
  "data": [
    {
      "hash": "string",
      "name": "string",
      "label": "string",
      "disabled": "boolean",
      "limit": "number | null",
      "limit_remaining": "number | null",
      "usage": "number",
      "usage_daily": "number",
      "usage_weekly": "number",
      "usage_monthly": "number",
      "byok_usage": "number",
      "byok_usage_daily": "number",
      "byok_usage_weekly": "number",
      "byok_usage_monthly": "number",
      "created_at": "string",
      "updated_at": "string | null",
      "expires_at": "string | null"
    }
  ]
}
```

### API Key Object Properties

| Field | Type | Description |
|-------|------|-------------|
| `hash` | string | Unique identifier |
| `name` | string | API key name |
| `label` | string | Human-readable label |
| `disabled` | boolean | Active status |
| `limit` | number/null | Spending limit for the API key in USD |
| `limit_remaining` | number/null | Available balance |
| `usage` | number | OpenRouter credit usage (in USD) |
| `usage_daily` | number | Current day usage (in USD) |
| `usage_weekly` | number | Current week usage (in USD) |
| `usage_monthly` | number | Current month usage (in USD) |
| `byok_usage` | number | External BYOK usage total |
| `byok_usage_daily` | number | External BYOK daily usage |
| `byok_usage_weekly` | number | External BYOK weekly usage |
| `byok_usage_monthly` | number | External BYOK monthly usage |
| `created_at` | string | ISO 8601 creation timestamp |
| `updated_at` | string/null | Last modification timestamp |
| `expires_at` | string/null | Expiration timestamp |

## HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Successful response |
| 401 | Missing or invalid authentication |
| 429 | Rate limit exceeded |
| 500 | Internal server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/keys"
headers = {"Authorization": "Bearer <token>"}
params = {"include_disabled": "true", "offset": "0"}  # optional
response = requests.get(url, headers=headers, params=params)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/keys';
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
	url := "https://openrouter.ai/api/v1/keys"
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
curl -X GET "https://openrouter.ai/api/v1/keys?include_disabled=true&offset=0" \
  -H "Authorization: Bearer <token>"
```
