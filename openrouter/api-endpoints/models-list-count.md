---
source: https://openrouter.ai/docs/api/api-reference/models/list-models-count
scraped: 2026-01-08
type: api-endpoint
---

# Get Total Count of Available Models

## Endpoint Overview

**GET** `https://openrouter.ai/api/v1/models/count`

Retrieves the total quantity of accessible models from OpenRouter's service.

## Authentication

### Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | Bearer token for API authentication |

## Request

No request body required. This is a simple GET request.

### Example Request

```
GET https://openrouter.ai/api/v1/models/count
```

## Response Schema

### Success (200)

```json
{
  "data": {
    "count": 250
  }
}
```

### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `data.count` | number | Total number of available models |

### Error Responses

| Status | Meaning |
|--------|---------|
| 500 | Internal Server Error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/models/count"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/models/count';
const options = {
  method: 'GET',
  headers: {'Authorization': 'Bearer <token>'}
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X GET https://openrouter.ai/api/v1/models/count \
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
    url := "https://openrouter.ai/api/v1/models/count"

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

uri = URI('https://openrouter.ai/api/v1/models/count')
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
        HttpResponse<String> response = Unirest.get("https://openrouter.ai/api/v1/models/count")
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
$response = $client->request('GET', 'https://openrouter.ai/api/v1/models/count', [
    'headers' => [
        'Authorization' => 'Bearer <token>'
    ]
]);
echo $response->getBody();
```

### C#

```csharp
using RestSharp;

var client = new RestClient("https://openrouter.ai/api/v1/models/count");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <token>");
IRestResponse response = client.Execute(request);
Console.WriteLine(response.Content);
```

### Swift

```swift
import Foundation

let url = URL(string: "https://openrouter.ai/api/v1/models/count")!
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
