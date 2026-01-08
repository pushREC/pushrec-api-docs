---
source: https://openrouter.ai/docs/api/api-reference/o-auth/create-auth-keys-code
scraped: 2026-01-08
type: api-endpoint
---

# Create Authorization Code

## Endpoint Overview

**POST** `https://openrouter.ai/api/v1/auth/keys/code`

This endpoint facilitates the creation of authorization codes for PKCE flow implementation, enabling generation of user-controlled API keys.

## Authentication

### Required Headers

| Header | Description |
|--------|-------------|
| `Authorization` | Bearer token (API key) |
| `Content-Type` | application/json |

## Request Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `callback_url` | string (URI) | Yes | The callback URL to redirect to after authorization. Note: only https URLs on ports 443 and 3000 are allowed. |
| `code_challenge` | string | No | PKCE code challenge for enhanced security |
| `code_challenge_method` | string (enum) | No | Method used to generate challenge: `S256` or `plain` |
| `limit` | number | No | Credit limit for the generated API key |
| `expires_at` | string (date-time) | No | Optional expiration timestamp for the API key |

### Example Request Body

```json
{
  "callback_url": "https://yourapp.com/callback",
  "code_challenge": "E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM",
  "code_challenge_method": "S256",
  "limit": 100,
  "expires_at": "2025-12-31T23:59:59Z"
}
```

## Response Schema

### Success (200)

```json
{
  "data": {
    "id": "string",
    "app_id": "number",
    "created_at": "string"
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| `data.id` | string | Authorization code ID |
| `data.app_id` | number | Application ID |
| `data.created_at` | string | ISO 8601 timestamp |

### Error Responses

| Status | Meaning |
|--------|---------|
| 200 | Successfully created authorization code |
| 400 | Invalid request parameters or malformed input |
| 401 | Authentication required or invalid credentials |
| 500 | Unexpected server error |

## Code Examples

### Python

```python
import requests

url = "https://openrouter.ai/api/v1/auth/keys/code"
payload = {
    "callback_url": "https://yourapp.com/callback",
    "code_challenge": "E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM",
    "code_challenge_method": "S256"
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
const url = 'https://openrouter.ai/api/v1/auth/keys/code';
const options = {
  method: 'POST',
  headers: {
    'Authorization': 'Bearer <token>',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    callback_url: 'https://yourapp.com/callback',
    code_challenge: 'E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM',
    code_challenge_method: 'S256'
  })
};
const response = await fetch(url, options);
console.log(await response.json());
```

### cURL

```bash
curl -X POST https://openrouter.ai/api/v1/auth/keys/code \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "callback_url": "https://yourapp.com/callback",
    "code_challenge": "E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM",
    "code_challenge_method": "S256"
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
    url := "https://openrouter.ai/api/v1/auth/keys/code"
    payload := map[string]interface{}{
        "callback_url":         "https://yourapp.com/callback",
        "code_challenge":       "E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM",
        "code_challenge_method": "S256",
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

uri = URI('https://openrouter.ai/api/v1/auth/keys/code')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri)
request['Authorization'] = 'Bearer <token>'
request['Content-Type'] = 'application/json'
request.body = {
  callback_url: 'https://yourapp.com/callback',
  code_challenge: 'E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM',
  code_challenge_method: 'S256'
}.to_json

response = http.request(request)
puts response.body
```
