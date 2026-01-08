---
source: https://openrouter.ai/docs/api/reference/limits
scraped: 2026-01-08
---

# Rate Limits

OpenRouter implements rate limiting to ensure fair usage across all users. The platform uses a global capacity governance system.

## Checking Your Limits

Query the key information endpoint to check your rate limits and remaining credits:

```bash
curl https://openrouter.ai/api/v1/key \
  -H "Authorization: Bearer $OPENROUTER_API_KEY"
```

## Response Structure

```json
{
  "data": {
    "label": "My API Key",
    "limit": 100.0,
    "usage": 45.23,
    "limit_remaining": 54.77,
    "is_free_tier": false,
    "rate_limit": {
      "requests": 200,
      "interval": "10s"
    }
  }
}
```

### Response Fields

| Field | Description |
|-------|-------------|
| `label` | Your API key's display name |
| `limit` | Credit limit set on the key |
| `usage` | Total credits used |
| `limit_remaining` | Remaining credit balance |
| `is_free_tier` | Whether using free tier |
| `rate_limit.requests` | Requests allowed per interval |
| `rate_limit.interval` | Time window for rate limit |

## Rate Limit Types

### Global Capacity

OpenRouter implements a global capacity governance system. Additional accounts do not increase rate limits. However, different models have different rate limits, so you can distribute load across models if encountering limits.

### Free Model Restrictions

Models with IDs ending in `:free` variants have specific limitations:

| User Type | Per-Minute Limit | Daily Limit |
|-----------|------------------|-------------|
| Minimal credit purchase | Lower | Stricter |
| Standard credit purchase | Higher | More generous |

### DDoS Protection

Cloudflare's DDoS protection will block requests that dramatically exceed reasonable usage.

## Account Status

### Negative Balance

Accounts with negative credit balances receive `402 Payment Required` errors, even for free models.

```json
{
  "error": {
    "code": 402,
    "message": "Insufficient credits"
  }
}
```

### Restoring Access

Restoring a positive credit balance immediately restores API access.

## Rate Limit Headers

Rate limit information is included in response headers:

| Header | Description |
|--------|-------------|
| `X-RateLimit-Limit` | Maximum requests allowed |
| `X-RateLimit-Remaining` | Requests remaining in window |
| `X-RateLimit-Reset` | Unix timestamp when limit resets |

## Handling Rate Limits

### Exponential Backoff

```python
import time
import requests

def make_request_with_retry(url, headers, data, max_retries=5):
    for attempt in range(max_retries):
        response = requests.post(url, headers=headers, json=data)

        if response.status_code == 429:
            wait_time = 2 ** attempt  # Exponential backoff
            time.sleep(wait_time)
            continue

        return response

    raise Exception("Max retries exceeded")
```

### JavaScript Example

```javascript
async function makeRequestWithRetry(url, options, maxRetries = 5) {
  for (let attempt = 0; attempt < maxRetries; attempt++) {
    const response = await fetch(url, options);

    if (response.status === 429) {
      const waitTime = Math.pow(2, attempt) * 1000;
      await new Promise(resolve => setTimeout(resolve, waitTime));
      continue;
    }

    return response;
  }

  throw new Error('Max retries exceeded');
}
```

## Best Practices

1. **Monitor Usage**: Regularly check your credit balance and rate limits
2. **Implement Backoff**: Use exponential backoff for rate limit errors
3. **Distribute Load**: Spread requests across different models when possible
4. **Cache Responses**: Avoid redundant API calls by caching results
5. **Use Streaming**: Streaming requests are more efficient for long responses
