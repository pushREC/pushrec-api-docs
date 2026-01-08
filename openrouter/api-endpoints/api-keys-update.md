---
source: https://openrouter.ai/docs/api/api-reference/api-keys/update-keys
scraped: 2026-01-08
type: api-endpoint
---

# Update an API Key

## Endpoint Overview

**Method:** PATCH
**URL:** `https://openrouter.ai/api/v1/keys/{hash}`
**Content-Type:** application/json

## Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| hash | string | Yes | The hash identifier of the API key to update |

## Authentication

Bearer token required in Authorization header.

## Request Body

All fields are optional:

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | New name for the API key |
| `disabled` | boolean | Whether to disable the API key |
| `limit` | number/null | New spending limit for the API key in USD |
| `limit_reset` | string/null | Reset frequency: daily, weekly, monthly, or null |
| `include_byok_in_limit` | boolean | Whether to include BYOK usage in the limit |

### Limit Reset Values

| Value | Description |
|-------|-------------|
| `daily` | Resets at midnight UTC daily |
| `weekly` | Resets at midnight UTC weekly |
| `monthly` | Resets at midnight UTC monthly |
| `null` | No automatic reset |

## Response Schema

### Success Response (200)

Returns the updated API key object:

```json
{
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
    "updated_at": "string",
    "expires_at": "string | null"
  }
}
```

### Response Properties

| Field | Type | Description |
|-------|------|-------------|
| `hash` | string | Unique identifier for the key |
| `name` | string | Updated key name |
| `label` | string | Human-readable label |
| `disabled` | boolean | Current enablement status |
| `limit` | number/null | Spending limit in USD |
| `limit_remaining` | number/null | Remaining spending limit |
| `limit_reset` | string/null | Reset frequency configuration |
| `include_byok_in_limit` | boolean | Whether BYOK usage counts toward limit |
| `usage` | number | Total OpenRouter credit usage |
| `usage_daily` | number | Current day usage |
| `usage_weekly` | number | Current week usage |
| `usage_monthly` | number | Current month usage |
| `byok_usage` | number | Total BYOK usage |
| `byok_usage_daily` | number | Current day BYOK usage |
| `byok_usage_weekly` | number | Current week BYOK usage |
| `byok_usage_monthly` | number | Current month BYOK usage |
| `created_at` | string | ISO 8601 creation timestamp |
| `updated_at` | string | ISO 8601 last modification timestamp |
| `expires_at` | string/null | Expiration timestamp |

## HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 400 | Invalid request parameters |
| 401 | Missing or invalid authentication |
| 404 | API key not found |
| 429 | Rate limit exceeded |
| 500 | Server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/keys/{hash}"
headers = {
    "Authorization": "Bearer <token>",
    "Content-Type": "application/json"
}
payload = {
    "name": "updated-key-name",
    "disabled": False,
    "limit": 200,
    "limit_reset": "monthly",
    "include_byok_in_limit": True
}
response = requests.patch(url, json=payload, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/keys/{hash}';
const options = {
  method: 'PATCH',
  headers: {
    'Authorization': 'Bearer <token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    name: 'updated-key-name',
    disabled: false,
    limit: 200,
    limit_reset: 'monthly',
    include_byok_in_limit: true
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
	url := "https://openrouter.ai/api/v1/keys/{hash}"
	payload := map[string]interface{}{
		"name":                  "updated-key-name",
		"disabled":              false,
		"limit":                 200,
		"limit_reset":           "monthly",
		"include_byok_in_limit": true,
	}
	jsonPayload, _ := json.Marshal(payload)

	req, _ := http.NewRequest("PATCH", url, bytes.NewBuffer(jsonPayload))
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
curl -X PATCH "https://openrouter.ai/api/v1/keys/{hash}" \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "updated-key-name",
    "disabled": false,
    "limit": 200,
    "limit_reset": "monthly",
    "include_byok_in_limit": true
  }'
```
