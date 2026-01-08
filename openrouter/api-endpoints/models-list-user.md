---
source: https://openrouter.ai/docs/api/api-reference/models/list-models-user
scraped: 2026-01-08
type: api-endpoint
---

# List Models Filtered by User Provider Preferences

## Endpoint Overview

This GET endpoint retrieves AI models filtered according to the authenticated user's provider preferences from OpenRouter's API.

**URL:** `https://openrouter.ai/api/v1/models/user`

**Method:** GET

## Request Details

### Authentication

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| Authorization | string | Yes | Bearer token required |

## Response Structure

### Success Response (200)

Returns a `ModelsListResponse` object containing an array of `Model` objects with the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique model identifier |
| `canonical_slug` | string | URL-friendly model name |
| `hugging_face_id` | string, nullable | HuggingFace identifier if available |
| `name` | string | Display name |
| `created` | number | Unix timestamp of creation |
| `description` | string | Model details |
| `pricing` | PublicPricing | Cost structure including prompt, completion, request, image, audio, and caching rates |
| `context_length` | number, nullable | Maximum token context |
| `architecture` | ModelArchitecture | Tokenizer, instruction type, modalities |
| `top_provider` | TopProviderInfo | Provider context length, max completion tokens, moderation status |
| `per_request_limits` | PerRequestLimits | Maximum prompt and completion tokens |
| `supported_parameters` | array | Supported API parameters like temperature, top_p, tools, etc. |
| `default_parameters` | DefaultParameters | Default temperature, top_p, frequency_penalty values |

### Error Responses

| Status Code | Description |
|-------------|-------------|
| 401 | Unauthorized - Invalid or missing authentication |
| 500 | Internal Server Error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/models/user"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/models/user';
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
	url := "https://openrouter.ai/api/v1/models/user"
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

uri = URI.parse("https://openrouter.ai/api/v1/models/user")
request = Net::HTTP::Get.new(uri)
request["Authorization"] = "Bearer <token>"

response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(request)
end

puts JSON.parse(response.body)
```

### cURL

```bash
curl -X GET "https://openrouter.ai/api/v1/models/user" \
  -H "Authorization: Bearer <token>"
```
