---
source: https://openrouter.ai/docs/api/api-reference/o-auth/exchange-auth-code-for-api-key
scraped: 2026-01-08
type: api-endpoint
---

# Exchange Authorization Code for API Key

## Endpoint Overview

**POST** `https://openrouter.ai/api/v1/auth/keys`

This endpoint facilitates OAuth token exchange, allowing applications to convert an authorization code from the PKCE flow for a user-controlled API key.

## Authentication

### Headers

| Header | Required | Description |
|--------|----------|-------------|
| `Authorization` | Yes | Bearer token format |
| `Content-Type` | Yes | application/json |

## Request Body

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `code` | string | Yes | Authorization code from OAuth redirect |
| `code_verifier` | string | No | Code verifier for PKCE validation |
| `code_challenge_method` | string | No | Method used (S256 or plain) |

### Example Request Body

```json
{
  "code": "authorization_code_from_redirect",
  "code_verifier": "your_code_verifier_string",
  "code_challenge_method": "S256"
}
```

## Response Schema

### Success (200)

```json
{
  "key": "string",
  "user_id": "string or null"
}
```

| Field | Type | Description |
|-------|------|-------------|
| `key` | string | API key for OpenRouter requests |
| `user_id` | string \| null | Associated user ID |

### Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request - Invalid parameters |
| 403 | Forbidden - Insufficient permissions |
| 500 | Internal Server Error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/auth/keys"
payload = {
    "code": "authorization_code",
    "code_verifier": "code_verifier_string"
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
const url = 'https://openrouter.ai/api/v1/auth/keys';
const options = {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer <token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    code: 'authorization_code',
    code_verifier: 'code_verifier_string'
  })
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X POST https://openrouter.ai/api/v1/auth/keys \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "code": "authorization_code",
    "code_verifier": "code_verifier_string"
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
    url := "https://openrouter.ai/api/v1/auth/keys"
    payload := map[string]string{
        "code":          "authorization_code",
        "code_verifier": "code_verifier_string",
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

uri = URI('https://openrouter.ai/api/v1/auth/keys')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri)
request['Authorization'] = 'Bearer <token>'
request['Content-Type'] = 'application/json'
request.body = {
  code: 'authorization_code',
  code_verifier: 'code_verifier_string'
}.to_json

response = http.request(request)
puts response.body
```
