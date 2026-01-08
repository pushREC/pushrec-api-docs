---
source: https://openrouter.ai/docs/api/api-reference/generations/get-generation
scraped: 2026-01-08
type: api-endpoint
---

# Get Request & Usage Metadata for a Generation

## Endpoint Overview

**GET** `https://openrouter.ai/api/v1/generation`

Retrieves comprehensive metadata about a specific generation, including request details and usage information.

## Authentication

### Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | API key as bearer token |

## Request Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | Yes | Unique identifier for the generation |

### Example Request

```
GET https://openrouter.ai/api/v1/generation?id=gen_abc123xyz
```

## Response Schema

### Success (200)

```json
{
  "id": "gen_abc123xyz",
  "model": "anthropic/claude-3-opus",
  "created_at": "2025-12-15T10:30:00Z",
  "total_cost": 0.0234,
  "cache_discount": 0.005,
  "upstream_inference_cost": 0.0184,
  "tokens_prompt": 1500,
  "tokens_completion": 500,
  "latency": 2340,
  "generation_time": 2100,
  "finish_reason": "stop",
  "streamed": true,
  "cancelled": false,
  "provider_name": "Anthropic",
  "api_type": "completions"
}
```

### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique generation identifier |
| `model` | string | Model used for generation |
| `created_at` | string | ISO 8601 timestamp |
| `total_cost` | double | USD cost |
| `cache_discount` | double \| null | Caching discount amount |
| `upstream_inference_cost` | double \| null | Provider's charge |
| `tokens_prompt` | integer | Prompt token count |
| `tokens_completion` | integer | Completion token count |
| `latency` | integer \| null | Total milliseconds |
| `generation_time` | integer \| null | Generation duration in ms |
| `finish_reason` | string \| null | Completion reason |
| `streamed` | boolean \| null | Response streaming status |
| `cancelled` | boolean \| null | Cancellation status |
| `provider_name` | string \| null | Serving provider name |
| `api_type` | string \| null | Either "completions" or "embeddings" |

### Finish Reasons

Common values for `finish_reason`:
- `stop` - Natural completion
- `length` - Max tokens reached
- `content_filter` - Content filtered
- `tool_calls` - Tool/function call made

### Error Responses

| Status | Meaning |
|--------|---------|
| 401 | Authentication required or invalid credentials |
| 402 | Insufficient credits or quota |
| 404 | Generation not found |
| 429 | Rate limit exceeded |
| 500 | Server error |
| 502 | Provider API failure |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/generation"
params = {"id": "gen_abc123xyz"}
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, params=params, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/generation?id=gen_abc123xyz';
const options = {
  method: 'GET',
  headers: {'Authorization': 'Bearer <token>'}
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X GET "https://openrouter.ai/api/v1/generation?id=gen_abc123xyz" \
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
    url := "https://openrouter.ai/api/v1/generation?id=gen_abc123xyz"

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

uri = URI('https://openrouter.ai/api/v1/generation?id=gen_abc123xyz')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Get.new(uri)
request['Authorization'] = 'Bearer <token>'

response = http.request(request)
puts response.body
```

### Java

```java
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;

public class Main {
    public static void main(String[] args) throws Exception {
        HttpResponse<String> response = Unirest.get("https://openrouter.ai/api/v1/generation")
            .queryString("id", "gen_abc123xyz")
            .header("Authorization", "Bearer <token>")
            .asString();
        System.out.println(response.getBody());
    }
}
```

### PHP

```php
<?php
$client = new \GuzzleHttp\Client();
$response = $client->request('GET', 'https://openrouter.ai/api/v1/generation', [
    'headers' => [
        'Authorization' => 'Bearer <token>'
    ],
    'query' => [
        'id' => 'gen_abc123xyz'
    ]
]);
echo $response->getBody();
```

### C#

```csharp
using RestSharp;

var client = new RestClient("https://openrouter.ai/api/v1/generation?id=gen_abc123xyz");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <token>");
IRestResponse response = client.Execute(request);
Console.WriteLine(response.Content);
```

### Swift

```swift
import Foundation

let url = URL(string: "https://openrouter.ai/api/v1/generation?id=gen_abc123xyz")!
var request = URLRequest(url: url)
request.httpMethod = "GET"
request.setValue("Bearer <token>", forHTTPHeaderField: "Authorization")

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let data = data {
        print(String(data: data, encoding: .utf8)!)
    }
}
task.resume()
```
