---
source: https://openrouter.ai/docs/api/api-reference/credits/create-coinbase-charge
scraped: 2026-01-08
type: api-endpoint
---

# Create a Coinbase Charge for Crypto Payment

## Endpoint Overview

**POST** `https://openrouter.ai/api/v1/credits/coinbase`

Creates a Coinbase charge for crypto payment, enabling developers to initiate blockchain-based payment transactions.

## Authentication

### Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | Bearer token (API authentication) |
| `Content-Type` | Yes | application/json |

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `amount` | double | Yes | Credit amount for the charge |
| `sender` | string | Yes | Ethereum wallet address initiating the transaction |
| `chain_id` | string | Yes | Blockchain network identifier |

### Supported Chain IDs

| Chain ID | Network |
|----------|---------|
| `"1"` | Ethereum |
| `"137"` | Polygon |
| `"8453"` | Base |

### Example Request Body

```json
{
  "amount": 250.75,
  "sender": "0x1234567890abcdef1234567890abcdef12345678",
  "chain_id": "1"
}
```

## Response Schema

### Success (200)

Returns transaction calldata with this structure:

```json
{
  "data": {
    "id": "string",
    "created_at": "string",
    "expires_at": "string",
    "web3_data": {
      "transfer_intent": {
        "call_data": {
          "deadline": "string",
          "fee_amount": "string",
          "id": "string",
          "operator": "string",
          "prefix": "string",
          "recipient": "string",
          "recipient_amount": "string",
          "recipient_currency": "string",
          "refund_destination": "string",
          "signature": "string"
        },
        "metadata": {
          "chain_id": "number",
          "contract_address": "string",
          "sender": "string"
        }
      }
    }
  }
}
```

### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `data.id` | string | Unique charge identifier |
| `data.created_at` | string | ISO 8601 timestamp of creation |
| `data.expires_at` | string | ISO 8601 timestamp of expiration |
| `data.web3_data.transfer_intent.call_data` | object | Transaction call data for blockchain execution |
| `data.web3_data.transfer_intent.metadata` | object | Chain and contract metadata |

### Error Responses

| Status | Meaning |
|--------|---------|
| 200 | Success - calldata returned |
| 400 | Invalid credit amount or request body |
| 401 | Authentication required or invalid credentials |
| 429 | Rate limit exceeded |
| 500 | Unexpected server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/credits/coinbase"
payload = {
    "amount": 250.75,
    "sender": "0x1234567890abcdef1234567890abcdef12345678",
    "chain_id": "1"
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
const url = 'https://openrouter.ai/api/v1/credits/coinbase';
const options = {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer <token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    amount: 250.75,
    sender: '0x1234567890abcdef1234567890abcdef12345678',
    chain_id: '1'
  })
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X POST https://openrouter.ai/api/v1/credits/coinbase \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "amount": 250.75,
    "sender": "0x1234567890abcdef1234567890abcdef12345678",
    "chain_id": "1"
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
    url := "https://openrouter.ai/api/v1/credits/coinbase"
    payload := map[string]interface{}{
        "amount":   250.75,
        "sender":   "0x1234567890abcdef1234567890abcdef12345678",
        "chain_id": "1",
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

uri = URI('https://openrouter.ai/api/v1/credits/coinbase')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri)
request['Authorization'] = 'Bearer <token>'
request['Content-Type'] = 'application/json'
request.body = {
  amount: 250.75,
  sender: '0x1234567890abcdef1234567890abcdef12345678',
  chain_id: '1'
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
        HttpResponse<String> response = Unirest.post("https://openrouter.ai/api/v1/credits/coinbase")
            .header("Authorization", "Bearer <token>")
            .header("Content-Type", "application/json")
            .body("{\"amount\": 250.75, \"sender\": \"0x1234567890abcdef1234567890abcdef12345678\", \"chain_id\": \"1\"}")
            .asString();
        System.out.println(response.getBody());
    }
}
```

### PHP

```php
<?php
$client = new \GuzzleHttp\Client();
$response = $client->request('POST', 'https://openrouter.ai/api/v1/credits/coinbase', [
    'headers' => [
        'Authorization' => 'Bearer <token>',
        'Content-Type' => 'application/json'
    ],
    'json' => [
        'amount' => 250.75,
        'sender' => '0x1234567890abcdef1234567890abcdef12345678',
        'chain_id' => '1'
    ]
]);
echo $response->getBody();
```

### C#

```csharp
using RestSharp;

var client = new RestClient("https://openrouter.ai/api/v1/credits/coinbase");
var request = new RestRequest(Method.POST);
request.AddHeader("Authorization", "Bearer <token>");
request.AddHeader("Content-Type", "application/json");
request.AddJsonBody(new {
    amount = 250.75,
    sender = "0x1234567890abcdef1234567890abcdef12345678",
    chain_id = "1"
});
IRestResponse response = client.Execute(request);
Console.WriteLine(response.Content);
```

### Swift

```swift
import Foundation

let url = URL(string: "https://openrouter.ai/api/v1/credits/coinbase")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("Bearer <token>", forHTTPHeaderField: "Authorization")
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let payload: [String: Any] = [
    "amount": 250.75,
    "sender": "0x1234567890abcdef1234567890abcdef12345678",
    "chain_id": "1"
]
request.httpBody = try? JSONSerialization.data(withJSONObject: payload)

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let data = data {
        print(String(data: data, encoding: .utf8)!)
    }
}
task.resume()
```
