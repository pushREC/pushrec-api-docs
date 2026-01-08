---
source: https://openrouter.ai/docs/api/api-reference/credits/get-credits
scraped: 2026-01-08
type: api-endpoint
---

# Get Remaining Credits

## Endpoint Overview

**GET** `https://openrouter.ai/api/v1/credits`

Retrieves account credit information for authenticated users.

## Authentication

### Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | Bearer token format |

## Request

No request body required. This is a simple GET request.

### Example Request

```
GET https://openrouter.ai/api/v1/credits
```

## Response Schema

### Success (200)

```json
{
  "total_credits": 100.00,
  "total_usage": 25.50
}
```

| Field | Type | Description |
|-------|------|-------------|
| `total_credits` | number | Total credits purchased |
| `total_usage` | number | Total credits used |

### Error Responses

| Status | Meaning |
|--------|---------|
| 401 | Authentication required or invalid credentials |
| 403 | Only provisioning keys can fetch credits |
| 500 | Internal server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/credits"
headers = {"Authorization": "Bearer <token>"}
response = requests.get(url, headers=headers)
print(response.json())
```

### JavaScript

```javascript
const url = 'https://openrouter.ai/api/v1/credits';
const options = {
  method: 'GET',
  headers: {'Authorization': 'Bearer <token>'}
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X GET https://openrouter.ai/api/v1/credits \
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
    url := "https://openrouter.ai/api/v1/credits"

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

uri = URI('https://openrouter.ai/api/v1/credits')
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
        HttpResponse<String> response = Unirest.get("https://openrouter.ai/api/v1/credits")
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
$response = $client->request('GET', 'https://openrouter.ai/api/v1/credits', [
    'headers' => [
        'Authorization' => 'Bearer <token>'
    ]
]);
echo $response->getBody();
```

### C#

```csharp
using RestSharp;

var client = new RestClient("https://openrouter.ai/api/v1/credits");
var request = new RestRequest(Method.GET);
request.AddHeader("Authorization", "Bearer <token>");
IRestResponse response = client.Execute(request);
Console.WriteLine(response.Content);
```

### Swift

```swift
import Foundation

let url = URL(string: "https://openrouter.ai/api/v1/credits")!
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
