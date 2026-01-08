---
source: https://openrouter.ai/docs/api/api-reference/embeddings/list-embeddings-models
scraped: 2026-01-08
type: api-endpoint
---

# List All Embeddings Models

## Endpoint Overview

**GET** `https://openrouter.ai/api/v1/embeddings/models`

Retrieves a list of all available embeddings models and their properties.

## Authentication

### Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | Bearer token format |

## Request

No request body required. This is a simple GET request.

### Example Request

```
GET https://openrouter.ai/api/v1/embeddings/models
```

## Response Schema

### Success (200)

Returns a `ModelsListResponse` object containing an array of model objects.

```json
{
  "data": [
    {
      "id": "openai/text-embedding-3-small",
      "canonical_slug": "openai/text-embedding-3-small",
      "name": "OpenAI Text Embedding 3 Small",
      "created": 1705963200,
      "description": "Small, efficient embedding model...",
      "pricing": {
        "prompt": "0.00002",
        "completion": "0"
      },
      "context_length": 8191,
      "architecture": {
        "tokenizer": "cl100k_base",
        "instruct_type": null,
        "input_modalities": ["text"],
        "output_modalities": ["embeddings"]
      },
      "top_provider": {
        "context_length": 8191,
        "is_moderated": false
      },
      "per_request_limits": null,
      "supported_parameters": ["dimensions", "encoding_format"],
      "default_parameters": {}
    }
  ]
}
```

### Model Object Properties

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique identifier |
| `canonical_slug` | string | Model slug |
| `name` | string | Display name |
| `created` | number | Unix timestamp |
| `description` | string | Model details |
| `pricing` | object | PublicPricing object with prompt/completion costs |
| `context_length` | number \| null | Max tokens |
| `architecture` | object | ModelArchitecture details |
| `top_provider` | object | Provider information |
| `per_request_limits` | object \| null | Token constraints |
| `supported_parameters` | array | Array of Parameter enums |
| `default_parameters` | object | DefaultParameters object |

### Architecture Object

| Field | Type | Description |
|-------|------|-------------|
| `tokenizer` | string | Tokenizer type |
| `instruct_type` | string \| null | Instruction format |
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

### Model Groups (Enum)

Router, Media, Other, GPT, Claude, Gemini, Grok, Cohere, Nova, Qwen, Yi, DeepSeek, Mistral, Llama variants, PaLM, RWKV

### Error Responses

| Status | Meaning |
|--------|---------|
| 200 | Success - returns model list |
| 400 | Bad Request - invalid parameters |
| 500 | Internal Server Error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/embeddings/models"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/embeddings/models';
const options = {
  method: 'GET',
  headers: {'Authorization': 'Bearer <token>'}
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X GET https://openrouter.ai/api/v1/embeddings/models \
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
    url := "https://openrouter.ai/api/v1/embeddings/models"

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

uri = URI('https://openrouter.ai/api/v1/embeddings/models')
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
        HttpResponse<String> response = Unirest.get("https://openrouter.ai/api/v1/embeddings/models")
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
$response = $client->request('GET', 'https://openrouter.ai/api/v1/embeddings/models', [
    'headers' => [
        'Authorization' => 'Bearer <token>'
    ]
]);
echo $response->getBody();
```

### C#

```csharp
using RestSharp;

var client = new RestClient("https://openrouter.ai/api/v1/embeddings/models");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <token>");
IRestResponse response = client.Execute(request);
Console.WriteLine(response.Content);
```

### Swift

```swift
import Foundation

let url = URL(string: "https://openrouter.ai/api/v1/embeddings/models")!
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
