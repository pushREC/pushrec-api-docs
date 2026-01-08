---
source: https://openrouter.ai/docs/api/api-reference/api-keys/create-keys
scraped: 2026-01-08
type: api-endpoint
---

# Create a New API Key

## Endpoint Details

**Method:** POST
**URL:** `https://openrouter.ai/api/v1/keys`
**Content-Type:** `application/json`

## Authentication

Requires a bearer token passed via the Authorization header.

## Request Parameters

### Headers

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| Authorization | string | Yes | Bearer token authentication |
| Content-Type | string | Yes | Must be `application/json` |

### Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | Yes | Identifier for the new API key |
| `limit` | number/null | No | Optional spending limit for the API key in USD |
| `limit_reset` | string/null | No | Reset frequency (daily, weekly, monthly); resets at midnight UTC |
| `include_byok_in_limit` | boolean | No | Whether to include BYOK usage in the limit |
| `expires_at` | string/null | No | Optional ISO 8601 UTC timestamp when the API key should expire |

### Limit Reset Values

| Value | Description |
|-------|-------------|
| `daily` | Resets at midnight UTC daily |
| `weekly` | Resets at midnight UTC weekly |
| `monthly` | Resets at midnight UTC monthly |

## Response Schema

### Success Response (201 Created)

Returns an object containing the API key and complete key information:

```json
{
  "key": "string",
  "data": {
    "hash": "string",
    "name": "string",
    "label": "string",
    "disabled": "boolean",
    "limit": "number | null",
    "limit_remaining": "number | null",
    "limit_reset": "string | null",
    "include_byok_in_limit": "boolean",
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
}
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `key` | string | The actual API key string (displayed only once) |
| `data.hash` | string | Unique identifier for the key |
| `data.name` | string | Key name |
| `data.label` | string | Human-readable label |
| `data.disabled` | boolean | Whether the key is disabled |
| `data.limit` | number/null | Spending limit in USD |
| `data.limit_remaining` | number/null | Remaining balance in USD |
| `data.limit_reset` | string/null | Reset frequency configuration |
| `data.include_byok_in_limit` | boolean | Whether BYOK usage counts toward limit |
| `data.usage` | number | Total OpenRouter credit usage |
| `data.usage_daily` | number | Current day usage |
| `data.usage_weekly` | number | Current week usage |
| `data.usage_monthly` | number | Current month usage |
| `data.byok_usage` | number | Total BYOK usage |
| `data.byok_usage_daily` | number | Current day BYOK usage |
| `data.byok_usage_weekly` | number | Current week BYOK usage |
| `data.byok_usage_monthly` | number | Current month BYOK usage |
| `data.created_at` | string | ISO 8601 creation timestamp |
| `data.updated_at` | string/null | Last modification timestamp |
| `data.expires_at` | string/null | Expiration timestamp |

## HTTP Status Codes

| Code | Description |
|------|-------------|
| 201 | API key created successfully |
| 400 | Invalid request parameters |
| 401 | Missing or invalid authentication |
| 429 | Rate limit exceeded |
| 500 | Server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/keys"
headers = {
    "Authorization": "Bearer <token>",
    "Content-Type": "application/json"
}
payload = {
    "name": "my-new-key",
    "limit": 100,
    "limit_reset": "monthly",
    "include_byok_in_limit": False,
    "expires_at": "2025-12-31T23:59:59Z"
}
response = requests.post(url, json=payload, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/keys';
const options = {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer <token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    name: 'my-new-key',
    limit: 100,
    limit_reset: 'monthly',
    include_byok_in_limit: false,
    expires_at: '2025-12-31T23:59:59Z'
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
	url := "https://openrouter.ai/api/v1/keys"
	payload := map[string]interface{}{
		"name":                  "my-new-key",
		"limit":                 100,
		"limit_reset":           "monthly",
		"include_byok_in_limit": false,
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
curl -X POST "https://openrouter.ai/api/v1/keys" \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "my-new-key",
    "limit": 100,
    "limit_reset": "monthly",
    "include_byok_in_limit": false
  }'
```
