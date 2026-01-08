---
source: https://openrouter.ai/docs/api/api-reference/providers/list-providers
scraped: 2026-01-08
type: api-endpoint
---

# List All Providers

## Endpoint Overview

**Method:** GET
**URL:** `https://openrouter.ai/api/v1/providers`

Retrieves a comprehensive list of all available providers in the OpenRouter API ecosystem.

## Authentication

Required bearer token in the Authorization header:

```
Authorization: Bearer <token>
```

## Request Parameters

| Parameter | Location | Type | Required | Description |
|-----------|----------|------|----------|-------------|
| Authorization | Header | string | Yes | API key as bearer token in Authorization header |

## Response Schema

### Success Response (200 OK)

The successful response contains a JSON object with a `data` array. Each provider object includes:

```json
{
  "data": [
    {
      "name": "string",
      "slug": "string",
      "privacy_policy_url": "string | null",
      "terms_of_service_url": "string | null",
      "status_page_url": "string | null"
    }
  ]
}
```

### Provider Object Properties

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Display name of the provider |
| `slug` | string | URL-friendly identifier for the provider |
| `privacy_policy_url` | string/null | URL to the provider's privacy policy |
| `terms_of_service_url` | string/null | URL to the provider's terms of service |
| `status_page_url` | string/null | URL to the provider's status page |

## Error Responses

| Status Code | Description |
|-------------|-------------|
| 500 | Internal Server Error - Unexpected server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/providers"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/providers';
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
	url := "https://openrouter.ai/api/v1/providers"
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

uri = URI.parse("https://openrouter.ai/api/v1/providers")
request = Net::HTTP::Get.new(uri)
request["Authorization"] = "Bearer <token>"

response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(request)
end

puts JSON.parse(response.body)
```

### cURL

```bash
curl -X GET "https://openrouter.ai/api/v1/providers" \
  -H "Authorization: Bearer <token>"
```
