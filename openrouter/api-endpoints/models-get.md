---
source: https://openrouter.ai/docs/api/api-reference/models/get-models
scraped: 2026-01-08
type: api-endpoint
---

# List All Models

## Endpoint Overview

**GET** `https://openrouter.ai/api/v1/models`

Retrieves a list of models or RSS feed with comprehensive metadata about each model available through OpenRouter.

## Authentication

### Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | Bearer token for API authentication |

## Request Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `category` | string | No | Filter models by category |
| `supported_parameters` | string | No | Filter by supported parameters |
| `use_rss` | string | No | Return RSS feed format |
| `use_rss_chat_links` | string | No | Include chat links in RSS |

### Example Request

```
GET https://openrouter.ai/api/v1/models?category=chat
```

## Response Schema

### Success (200)

Returns a `ModelsListResponse` object containing an array of model objects.

```json
{
  "data": [
    {
      "id": "anthropic/claude-3-opus",
      "canonical_slug": "anthropic/claude-3-opus",
      "name": "Claude 3 Opus",
      "created": 1709510400,
      "description": "Most powerful Claude model...",
      "pricing": {
        "prompt": "0.015",
        "completion": "0.075",
        "request": "0",
        "image": "0.024",
        "audio": "0",
        "cache_read": "0.0015",
        "cache_write": "0.01875",
        "web_search": "0"
      },
      "context_length": 200000,
      "architecture": {
        "tokenizer": "claude",
        "instruct_type": "claude",
        "input_modalities": ["text", "image"],
        "output_modalities": ["text"]
      },
      "top_provider": {
        "context_length": 200000,
        "is_moderated": true
      },
      "per_request_limits": {
        "prompt_tokens": 100000,
        "completion_tokens": 4096
      },
      "supported_parameters": [
        "temperature",
        "top_p",
        "top_k",
        "max_tokens",
        "tools",
        "reasoning"
      ],
      "default_parameters": {
        "temperature": 1.0,
        "top_p": 1.0,
        "frequency_penalty": 0
      }
    }
  ]
}
```

### Model Object Properties

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique model identifier |
| `canonical_slug` | string | URL-friendly model name |
| `name` | string | Display name |
| `created` | number | Unix timestamp |
| `description` | string | Model overview |
| `pricing` | object | Cost breakdown |
| `context_length` | number | Maximum token capacity |
| `architecture` | object | Model architecture details |
| `top_provider` | object | Provider information |
| `per_request_limits` | object \| null | Token thresholds |
| `supported_parameters` | array | Available API parameters |
| `default_parameters` | object | Default parameter values |

### Pricing Object

| Field | Type | Description |
|-------|------|-------------|
| `prompt` | string | Cost per prompt token (USD) |
| `completion` | string | Cost per completion token (USD) |
| `request` | string | Per-request cost (USD) |
| `image` | string | Cost per image (USD) |
| `audio` | string | Cost per audio second (USD) |
| `cache_read` | string | Cache read cost (USD) |
| `cache_write` | string | Cache write cost (USD) |
| `web_search` | string | Web search cost (USD) |

### Architecture Object

| Field | Type | Description |
|-------|------|-------------|
| `tokenizer` | string | Tokenizer type |
| `instruct_type` | string \| null | Instruction format type |
| `input_modalities` | array | Supported input types |
| `output_modalities` | array | Supported output types |

### Input Modalities

- `text`
- `image`
- `file`
- `audio`
- `video`

### Output Modalities

- `text`
- `image`
- `embeddings`

### Supported Parameters

Common supported parameters include:
- `temperature`
- `top_p`
- `top_k`
- `frequency_penalty`
- `presence_penalty`
- `repetition_penalty`
- `max_tokens`
- `tools`
- `tool_choice`
- `reasoning`
- `web_search_options`
- `stop`
- `seed`
- `logprobs`
- `response_format`

### Error Responses

| Status | Meaning |
|--------|---------|
| 200 | Success with model list |
| 400 | Invalid request parameters |
| 500 | Server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/models"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/models';
const options = {
  method: 'GET',
  headers: {'Authorization': 'Bearer <token>'}
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X GET https://openrouter.ai/api/v1/models \
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
    url := "https://openrouter.ai/api/v1/models"

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

uri = URI('https://openrouter.ai/api/v1/models')
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
        HttpResponse<String> response = Unirest.get("https://openrouter.ai/api/v1/models")
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
$response = $client->request('GET', 'https://openrouter.ai/api/v1/models', [
    'headers' => [
        'Authorization' => 'Bearer <token>'
    ]
]);
echo $response->getBody();
```

### C#

```csharp
using RestSharp;

var client = new RestClient("https://openrouter.ai/api/v1/models");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <token>");
IRestResponse response = client.Execute(request);
Console.WriteLine(response.Content);
```

### Swift

```swift
import Foundation

let url = URL(string: "https://openrouter.ai/api/v1/models")!
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
