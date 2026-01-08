---
source: https://openrouter.ai/docs/api/api-reference/embeddings/create-embeddings
scraped: 2026-01-08
type: api-endpoint
---

# Create Embeddings

## Endpoint Overview

**POST** `https://openrouter.ai/api/v1/embeddings`

Submits an embedding request to the embeddings router.

## Authentication

API key as bearer token in Authorization header.

### Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | Bearer token format |
| `Content-Type` | Yes | application/json |

## Request Parameters

### Required Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `input` | string \| array | Yes | Text or content to embed |
| `model` | string | Yes | The embedding model identifier |

### Input Formats

The `input` parameter accepts:
- Single string
- Array of strings
- Array of numbers (token arrays)
- Complex content objects with text and image_url types

```json
// Single string
"input": "Text to embed"

// Array of strings
"input": ["Text one", "Text two", "Text three"]

// Array of token IDs
"input": [1234, 5678, 9012]

// Complex content object
"input": [
  {"type": "text", "text": "Sample text"},
  {"type": "image_url", "image_url": "https://example.com/image.jpg"}
]
```

### Optional Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `encoding_format` | string | Output format: `float` or `base64` |
| `dimensions` | integer | Output dimensions specification |
| `user` | string | User identifier string |
| `input_type` | string | Content type specification |
| `provider` | object | Advanced routing preferences |

### Example Request Body

```json
{
  "input": "The quick brown fox jumps over the lazy dog",
  "model": "openai/text-embedding-3-small",
  "encoding_format": "float",
  "dimensions": 1536
}
```

## Response Schema

### Success (200)

```json
{
  "object": "list",
  "data": [
    {
      "object": "embedding",
      "embedding": [0.0023064255, -0.009327292, ...],
      "index": 0
    }
  ],
  "model": "openai/text-embedding-3-small",
  "usage": {
    "prompt_tokens": 8,
    "total_tokens": 8,
    "cost": 0.000001
  }
}
```

### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `object` | string | Always "list" |
| `data` | array | Array of embedding objects |
| `data[].object` | string | Always "embedding" |
| `data[].embedding` | array \| string | Float array or base64 string |
| `data[].index` | integer | Position in input array |
| `model` | string | Model name used |
| `usage.prompt_tokens` | integer | Tokens in the prompt |
| `usage.total_tokens` | integer | Total tokens processed |
| `usage.cost` | number | Cost in USD |

### Error Responses

| Status | Meaning |
|--------|---------|
| 200 | Embedding response |
| 400 | Invalid request parameters |
| 401 | Authentication required |
| 402 | Insufficient credits |
| 429 | Rate limit exceeded |
| 500 | Server error |
| 502 | Bad gateway |
| 503 | Service unavailable |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/embeddings"
payload = {
    "input": "The quick brown fox jumps over the lazy dog",
    "model": "openai/text-embedding-3-small"
}
headers = {
    "Authorization": "Bearer <token>",
    "Content-Type": "application/json"
}
response = requests.post(url, json=payload, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/embeddings';
const options = {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer <token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    input: 'The quick brown fox jumps over the lazy dog',
    model: 'openai/text-embedding-3-small'
  })
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X POST https://openrouter.ai/api/v1/embeddings \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "input": "The quick brown fox jumps over the lazy dog",
    "model": "openai/text-embedding-3-small"
  }'
```

### Go

```go
package main

import (
    "bytes"
    "encoding/json"
    "net/http"
)

func main() {
    url := "https://openrouter.ai/api/v1/embeddings"
    payload := map[string]interface{}{
        "input": "The quick brown fox jumps over the lazy dog",
        "model": "openai/text-embedding-3-small",
    }
    jsonPayload, _ := json.Marshal(payload)

    req, _ := http.NewRequest("POST", url, bytes.NewBuffer(jsonPayload))
    req.Header.Set("Authorization", "Bearer <token>")
    req.Header.Set("Content-Type", "application/json")

    client := &http.Client{}
    resp, _ := client.Do(req)
    defer resp.Body.Close()
}
```

### Ruby

```ruby
require 'net/http'
require 'json'

uri = URI('https://openrouter.ai/api/v1/embeddings')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri)
request['Authorization'] = 'Bearer <token>'
request['Content-Type'] = 'application/json'
request.body = {
  input: 'The quick brown fox jumps over the lazy dog',
  model: 'openai/text-embedding-3-small'
}.to_json

response = http.request(request)
puts response.body
```

### Java

```java
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;

public class Main {
    public static void main(String[] args) throws Exception {
        HttpResponse<String> response = Unirest.post("https://openrouter.ai/api/v1/embeddings")
            .header("Authorization", "Bearer <token>")
            .header("Content-Type", "application/json")
            .body("{\"input\": \"The quick brown fox jumps over the lazy dog\", \"model\": \"openai/text-embedding-3-small\"}")
            .asString();
        System.out.println(response.getBody());
    }
}
```

### PHP

```php
<?php
$client = new \GuzzleHttp\Client();
$response = $client->request('POST', 'https://openrouter.ai/api/v1/embeddings', [
    'headers' => [
        'Authorization' => 'Bearer <token>',
        'Content-Type' => 'application/json'
    ],
    'json' => [
        'input' => 'The quick brown fox jumps over the lazy dog',
        'model' => 'openai/text-embedding-3-small'
    ]
]);
echo $response->getBody();
```

### C#

```csharp
using RestSharp;

var client = new RestClient("https://openrouter.ai/api/v1/embeddings");
var request = new RestRequest(Method.POST);
request.AddHeader("Authorization", "Bearer <token>");
request.AddHeader("Content-Type", "application/json");
request.AddJsonBody(new {
    input = "The quick brown fox jumps over the lazy dog",
    model = "openai/text-embedding-3-small"
});
IRestResponse response = client.Execute(request);
Console.WriteLine(response.Content);
```

### Swift

```swift
import Foundation

let url = URL(string: "https://openrouter.ai/api/v1/embeddings")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("Bearer <token>", forHTTPHeaderField: "Authorization")
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let payload: [String: Any] = [
    "input": "The quick brown fox jumps over the lazy dog",
    "model": "openai/text-embedding-3-small"
]
request.httpBody = try? JSONSerialization.data(withJSONObject: payload)

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let data = data {
        print(String(data: data, encoding: .utf8)!)
    }
}
task.resume()
```
