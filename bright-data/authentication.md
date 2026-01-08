# Bright Data API Authentication

> **Last Updated:** 2026-01-08

## Authentication Method

Bright Data uses **Bearer Token** authentication for all API endpoints.

## Obtaining Your API Key

1. Log in to Bright Data: https://brightdata.com/login
2. Navigate to API Tokens: https://brightdata.com/cp/api_tokens
3. Create a new API token or copy existing one
4. Store securely (treat as a password)

## Using Authentication

### Header Format

```
Authorization: Bearer YOUR_API_KEY
```

### Required Headers

All API requests require:

```http
Authorization: Bearer YOUR_API_KEY
Content-Type: application/json
```

## Examples

### cURL

```bash
curl -X POST "https://api.brightdata.com/datasets/v3/trigger?dataset_id=gd_youtube_video" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '[{"url": "https://www.youtube.com/watch?v=VIDEO_ID"}]'
```

### Python (requests)

```python
import requests

API_KEY = "YOUR_API_KEY"

headers = {
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

response = requests.post(
    "https://api.brightdata.com/datasets/v3/trigger",
    headers=headers,
    params={"dataset_id": "gd_youtube_video", "format": "json"},
    json=[{"url": "https://www.youtube.com/watch?v=VIDEO_ID"}]
)

print(response.json())
```

### JavaScript (fetch)

```javascript
const API_KEY = "YOUR_API_KEY";

const response = await fetch(
  "https://api.brightdata.com/datasets/v3/trigger?dataset_id=gd_youtube_video&format=json",
  {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${API_KEY}`,
      "Content-Type": "application/json"
    },
    body: JSON.stringify([
      { url: "https://www.youtube.com/watch?v=VIDEO_ID" }
    ])
  }
);

const data = await response.json();
console.log(data);
```

### Node.js (axios)

```javascript
const axios = require('axios');

const API_KEY = "YOUR_API_KEY";

const response = await axios.post(
  "https://api.brightdata.com/datasets/v3/trigger",
  [{ url: "https://www.youtube.com/watch?v=VIDEO_ID" }],
  {
    headers: {
      "Authorization": `Bearer ${API_KEY}`,
      "Content-Type": "application/json"
    },
    params: {
      dataset_id: "gd_youtube_video",
      format: "json"
    }
  }
);

console.log(response.data);
```

## Environment Variables

Best practice: Store API key in environment variable.

### Bash

```bash
export BRIGHTDATA_API_TOKEN="your_api_key_here"

# Use in requests
curl -H "Authorization: Bearer $BRIGHTDATA_API_TOKEN" ...
```

### Python

```python
import os

API_KEY = os.environ.get("BRIGHTDATA_API_TOKEN")
```

### Node.js

```javascript
const API_KEY = process.env.BRIGHTDATA_API_TOKEN;
```

## Security Best Practices

1. **Never commit API keys** to version control
2. **Use environment variables** in production
3. **Rotate keys periodically**
4. **Limit key permissions** if supported
5. **Monitor usage** for unexpected patterns
6. **Use secrets manager** in production (AWS Secrets Manager, HashiCorp Vault, etc.)

## Error Responses

### 401 Unauthorized

```json
{
  "error": "Unauthorized",
  "message": "Invalid or missing API key"
}
```

**Solutions:**
- Verify API key is correct
- Check for typos or extra whitespace
- Ensure "Bearer " prefix is included
- Confirm key hasn't been revoked

### 403 Forbidden

```json
{
  "error": "Forbidden",
  "message": "Insufficient permissions"
}
```

**Solutions:**
- Check API key has required permissions
- Verify account subscription includes requested features
- Contact support for permission issues
