---
source: https://openrouter.ai/docs/api/reference/authentication
scraped: 2026-01-08
---

# Authentication

OpenRouter employs Bearer token authentication with API keys that offer enhanced functionality compared to direct model API keys. These keys allow users to set credit limits for apps, and they can be used in OAuth flows.

## Setup Process

1. **Create an API key** at [openrouter.ai/keys](https://openrouter.ai/keys) with optional credit limits
2. **Set the Authorization header** using your Bearer token
3. **Configure base URL** to `https://openrouter.ai/api/v1` when using SDKs

## Authentication Header

```
Authorization: Bearer sk-or-v1-xxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

## Implementation Examples

### OpenRouter SDK (Recommended)

```typescript
import OpenRouter from 'openrouter';

const client = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

const response = await client.chat.completions.create({
  model: 'openai/gpt-4o',
  messages: [{ role: 'user', content: 'Hello!' }],
});
```

### OpenAI SDK (Compatible)

```typescript
import OpenAI from 'openai';

const client = new OpenAI({
  apiKey: process.env.OPENROUTER_API_KEY,
  baseURL: 'https://openrouter.ai/api/v1',
});

const response = await client.chat.completions.create({
  model: 'openai/gpt-4o',
  messages: [{ role: 'user', content: 'Hello!' }],
});
```

### Python with OpenAI SDK

```python
from openai import OpenAI

client = OpenAI(
    api_key=os.environ.get("OPENROUTER_API_KEY"),
    base_url="https://openrouter.ai/api/v1",
)

response = client.chat.completions.create(
    model="openai/gpt-4o",
    messages=[{"role": "user", "content": "Hello!"}],
)
```

### Raw HTTP Request (cURL)

```bash
curl https://openrouter.ai/api/v1/chat/completions \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-4o",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

### Raw HTTP Request (Fetch)

```javascript
const response = await fetch('https://openrouter.ai/api/v1/chat/completions', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${process.env.OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    messages: [{ role: 'user', content: 'Hello!' }],
  }),
});
```

## Optional Headers

These headers enhance ranking visibility on OpenRouter:

| Header | Description | Example |
|--------|-------------|---------|
| `HTTP-Referer` | Your site URL | `https://myapp.com` |
| `X-Title` | Your site/app name | `My AI App` |

```bash
curl https://openrouter.ai/api/v1/chat/completions \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "HTTP-Referer: https://myapp.com" \
  -H "X-Title: My AI App" \
  -H "Content-Type: application/json" \
  -d '{...}'
```

## Security Recommendations

**You must protect your API keys and never commit them to public repositories.**

### Best Practices

1. **Use environment variables** - Never hardcode API keys
2. **Avoid public repositories** - Keep keys out of version control
3. **Immediate rotation** - Delete and replace exposed keys immediately
4. **Monitor notifications** - Watch for compromise alerts via email

### Environment Variables

```bash
# .env file (add to .gitignore!)
OPENROUTER_API_KEY=sk-or-v1-xxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

```python
# Python
import os
api_key = os.environ.get("OPENROUTER_API_KEY")
```

```javascript
// Node.js
const apiKey = process.env.OPENROUTER_API_KEY;
```

## Key Compromise Detection

OpenRouter monitors for exposed keys through:

- GitHub scanning partnerships
- Automated detection systems
- Community reports

If your key is detected as compromised, you will receive an email notification. **Immediately delete the key and create a new one.**

## OAuth Flows

API keys support OAuth flows for user authentication. See the OAuth documentation for implementation details.

## Key Management

Manage your API keys at [openrouter.ai/keys](https://openrouter.ai/keys):

- Create new keys with custom labels
- Set credit limits per key
- View usage statistics
- Delete compromised keys
- Track key creation dates
