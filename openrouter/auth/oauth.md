---
source: https://openrouter.ai/docs/guides/overview/auth/oauth
scraped: 2026-01-08
---

# OAuth PKCE

OpenRouter enables secure one-click user authentication through "Proof Key for Code Exchange (PKCE)," a modern OAuth standard.

## Key Implementation Steps

### Step 1: Redirect to OpenRouter

Direct users to OpenRouter's authentication endpoint with your callback URL and optional code challenge:

```
https://openrouter.ai/auth?callback_url=<YOUR_SITE_URL>&code_challenge=<CODE_CHALLENGE>&code_challenge_method=S256
```

The S256 method is recommended for enhanced security, using "the base64 encoding of the sha256 hash of `code_verifier`."

### Step 2: Exchange Authorization Code

After user authorization, extract the returned `code` parameter and POST it to `https://openrouter.ai/api/v1/auth/keys`:

```json
{
  "code": "<CODE_FROM_QUERY_PARAM>",
  "code_verifier": "<CODE_VERIFIER>",
  "code_challenge_method": "<METHOD>"
}
```

This returns a user-controlled API key.

### Step 3: Make Authenticated Requests

Use the obtained key to authorize API calls via Bearer token authentication.

## Important Notes

- Localhost testing uses `http://localhost:3000` as the callback URL
- The code challenge parameter is optional but strongly recommended
- Common errors include mismatched challenge methods, invalid credentials, or incorrect HTTP protocols

The documentation provides TypeScript examples using both the official SDK and fetch API for implementation.
