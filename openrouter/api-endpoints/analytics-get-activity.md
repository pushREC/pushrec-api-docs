---
source: https://openrouter.ai/docs/api/api-reference/analytics/get-user-activity
scraped: 2026-01-08
type: api-endpoint
---

# Get User Activity Grouped by Endpoint

## Endpoint Overview

**GET** `https://openrouter.ai/api/v1/activity`

Returns user activity data grouped by endpoint for the last 30 (completed) UTC days.

## Authentication

### Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | Bearer token for API authentication |

## Request Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `date` | string | No | Filter results to a specific UTC date in YYYY-MM-DD format from the last 30 days |

### Example Request

```
GET https://openrouter.ai/api/v1/activity?date=2025-12-15
```

## Response Schema

### Success (200)

The response returns an object containing a `data` array of activity items.

```json
{
  "data": [
    {
      "date": "2025-12-15",
      "model": "openai/gpt-4.1",
      "model_permaslug": "openai/gpt-4.1:2025-04-14",
      "endpoint_id": "endpoint_abc123",
      "provider_name": "OpenAI",
      "usage": 0.0523,
      "byok_usage_inference": 0.0,
      "requests": 150,
      "prompt_tokens": 45000,
      "completion_tokens": 12000,
      "reasoning_tokens": 0
    }
  ]
}
```

### Activity Item Fields

| Field | Type | Description |
|-------|------|-------------|
| `date` | string | Activity date (YYYY-MM-DD) |
| `model` | string | Model identifier (e.g., "openai/gpt-4.1") |
| `model_permaslug` | string | Versioned model identifier |
| `endpoint_id` | string | Unique endpoint identifier |
| `provider_name` | string | Provider name serving the endpoint |
| `usage` | number | Total cost in USD (OpenRouter credits) |
| `byok_usage_inference` | number | BYOK inference cost in USD |
| `requests` | number | Total request count |
| `prompt_tokens` | number | Total prompt tokens consumed |
| `completion_tokens` | number | Total completion tokens generated |
| `reasoning_tokens` | number | Total reasoning tokens used |

### Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid date format or out-of-range date |
| 401 | Missing or invalid authentication credentials |
| 403 | Requires provisioning API keys only |
| 500 | Server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/activity"
params = {"date": "2025-12-15"}
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, params=params, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/activity?date=2025-12-15';
const options = {
  method: 'GET',
  headers: {'Authorization': 'Bearer <token>'}
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X GET "https://openrouter.ai/api/v1/activity?date=2025-12-15" \
  -H "Authorization: Bearer <token>"
```

### Go

```go
package main

import (
    "net/http"
    "io/ioutil"
)

func main() {
    url := "https://openrouter.ai/api/v1/activity?date=2025-12-15"

    req, _ := http.NewRequest("GET", url, nil)
    req.Header.Set("Authorization", "Bearer <token>")

    client := &http.Client{}
    resp, _ := client.Do(req)
    defer resp.Body.Close()

    body, _ := ioutil.ReadAll(resp.Body)
    println(string(body))
}
```

### Ruby

```ruby
require 'net/http'
require 'json'

uri = URI('https://openrouter.ai/api/v1/activity?date=2025-12-15')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Get.new(uri)
request['Authorization'] = 'Bearer <token>'

response = http.request(request)
puts response.body
```
