---
source: https://openrouter.ai/docs/api/api-reference/api-keys/get-key
scraped: 2026-01-08
type: api-endpoint
---

# Get a Single API Key

## Endpoint Overview

**Method:** GET
**URL:** `https://openrouter.ai/api/v1/keys/{hash}`

This endpoint retrieves detailed information about a specific API key using its hash identifier.

## Request Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| hash | string | Yes | The hash identifier of the API key to retrieve |

### Headers

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| Authorization | string | Yes | API key as bearer token in Authorization header |

## Response Schema

### Success Response (200)

The response contains an API key object with the following properties:

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
    "updated_at": "string | null",
    "expires_at": "string | null"
  }
}
```

### Response Properties

| Field | Type | Description |
|-------|------|-------------|
| `hash` | string | Unique identifier for the key |
| `name` | string | Key name |
| `label` | string | Human-readable label |
| `disabled` | boolean | Enablement status |
| `limit` | number/null | Monthly spending cap in USD |
| `limit_remaining` | number/null | Remaining spending limit in USD |
| `limit_reset` | string/null | Reset type configuration |
| `include_byok_in_limit` | boolean | Whether external BYOK usage applies to limits |
| `usage` | number | Total OpenRouter credit spend (USD) |
| `usage_daily` | number | Current UTC day spending |
| `usage_weekly` | number | Current UTC week (Monday-Sunday) spending |
| `usage_monthly` | number | Current UTC month spending |
| `byok_usage` | number | Total external BYOK spend |
| `byok_usage_daily` | number | Current day BYOK spend |
| `byok_usage_weekly` | number | Current week BYOK spend |
| `byok_usage_monthly` | number | Current month BYOK spend |
| `created_at` | string | ISO 8601 creation timestamp |
| `updated_at` | string/null | ISO 8601 last modification timestamp |
| `expires_at` | string/null | ISO 8601 UTC timestamp when the API key expires |

## HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Successful retrieval |
| 401 | Missing or invalid authentication |
| 404 | API key does not exist |
| 429 | Rate limit exceeded |
| 500 | Internal server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/keys/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"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/keys/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';
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
	url := "https://openrouter.ai/api/v1/keys/{hash}"
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
curl -X GET "https://openrouter.ai/api/v1/keys/{hash}" \
  -H "Authorization: Bearer <token>"
```
