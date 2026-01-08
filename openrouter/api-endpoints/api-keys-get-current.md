---
source: https://openrouter.ai/docs/api/api-reference/api-keys/get-current-key
scraped: 2026-01-08
type: api-endpoint
---

# Get Current API Key

## Endpoint Overview

**Method:** GET
**URL:** `https://openrouter.ai/api/v1/key`

This endpoint retrieves information about the API key associated with the current authentication session.

## Request

### Headers

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| Authorization | string | Yes | Bearer token format containing your API key |

## Response Schema

### Success Response (200 OK)

The successful response returns detailed API key information:

```json
{
  "data": {
    "label": "string",
    "limit": "number | null",
    "usage": "number",
    "usage_daily": "number",
    "usage_weekly": "number",
    "usage_monthly": "number",
    "byok_usage": "number",
    "byok_usage_daily": "number",
    "byok_usage_weekly": "number",
    "byok_usage_monthly": "number",
    "is_free_tier": "boolean",
    "is_provisioning_key": "boolean",
    "limit_remaining": "number | null",
    "limit_reset": "string | null",
    "include_byok_in_limit": "boolean",
    "expires_at": "string | null",
    "rate_limit": {
      "requests": "number",
      "interval": "string",
      "note": "string"
    }
  }
}
```

### Response Properties

| Field | Type | Description |
|-------|------|-------------|
| `label` | string | Human-readable identifier for your key |
| `limit` | number/null | Spending cap in USD |
| `limit_remaining` | number/null | Available balance in USD |
| `limit_reset` | string/null | Reset frequency configuration |
| `usage` | number | Total OpenRouter credit consumption |
| `usage_daily` | number | Current day usage |
| `usage_weekly` | number | Current week usage |
| `usage_monthly` | number | Current month usage |
| `byok_usage` | number | Total external BYOK provider spending |
| `byok_usage_daily` | number | Current day BYOK spending |
| `byok_usage_weekly` | number | Current week BYOK spending |
| `byok_usage_monthly` | number | Current month BYOK spending |
| `is_free_tier` | boolean | Indicates free account status |
| `is_provisioning_key` | boolean | Denotes provisioning key type |
| `include_byok_in_limit` | boolean | Whether external costs count toward spending cap |
| `expires_at` | string/null | ISO 8601 expiration timestamp (null if no expiration) |
| `rate_limit` | object | Rate limit configuration |
| `rate_limit.requests` | number | Number of requests allowed |
| `rate_limit.interval` | string | Time interval for rate limit |
| `rate_limit.note` | string | Additional rate limit information |

## HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Successful retrieval |
| 401 | Unauthorized - Authentication failed or missing credentials |
| 500 | Internal Server Error - Unexpected server issue |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/key"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/key';
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
	url := "https://openrouter.ai/api/v1/key"
	req, _ := http.NewRequest("GET", url, nil)
	req.Header.Add("Authorization", "Bearer <token>")
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

uri = URI.parse("https://openrouter.ai/api/v1/key")
request = Net::HTTP::Get.new(uri)
request["Authorization"] = "Bearer <token>"

response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(request)
end

puts JSON.parse(response.body)
```

### cURL

```bash
curl -X GET "https://openrouter.ai/api/v1/key" \
  -H "Authorization: Bearer <token>"
```
