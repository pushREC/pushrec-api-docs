---
source: https://openrouter.ai/docs/api/api-reference/api-keys/delete-keys
scraped: 2026-01-08
type: api-endpoint
---

# Delete an API Key

## Endpoint Overview

The delete API key endpoint removes an existing API key from your OpenRouter account.

**Method:** DELETE
**URL:** `https://openrouter.ai/api/v1/keys/{hash}`

## Request Parameters

### Path Parameter

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| hash | string | Yes | The hash identifier of the API key to delete |

### Header

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| Authorization | string | Yes | API key as bearer token in Authorization header |

## Response Schema

### Success Response (200)

```json
{
  "deleted": true
}
```

The response contains a boolean confirmation field indicating successful deletion.

| Field | Type | Description |
|-------|------|-------------|
| `deleted` | boolean | Confirmation of successful deletion |

## HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | API key deleted successfully |
| 401 | Unauthorized - Missing or invalid authentication |
| 404 | Not Found - API key does not exist |
| 429 | Too Many Requests - Rate limit exceeded |
| 500 | Internal Server Error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/keys/{hash}"
headers = {"Authorization": "Bearer <token>"}
response = requests.delete(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/keys/{hash}';
const options = {method: 'DELETE', headers: {Authorization: 'Bearer <token>'}};

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
	req, _ := http.NewRequest("DELETE", url, nil)
	req.Header.Add("Authorization", "Bearer <token>")
	res, _ := http.DefaultClient.Do(req)
	defer res.Body.Close()
	body, _ := io.ReadAll(res.Body)
	fmt.Println(string(body))
}
```

### cURL

```bash
curl -X DELETE "https://openrouter.ai/api/v1/keys/{hash}" \
  -H "Authorization: Bearer <token>"
```

### Ruby

```ruby
require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("https://openrouter.ai/api/v1/keys/{hash}")
request = Net::HTTP::Delete.new(uri)
request["Authorization"] = "Bearer <token>"

response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(request)
end

puts JSON.parse(response.body)
```
