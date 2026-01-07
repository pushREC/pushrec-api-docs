# Resend API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-08
> **Source:** api.resend.com

## Contents

| Type | Description |
|------|-------------|
| `openapi.yaml` | Official OpenAPI 3.1 spec |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set API key
export RESEND_API_KEY="re_xxxxxxxxxx"

# Send email
curl -X POST "https://api.resend.com/emails" \
  -H "Authorization: Bearer $RESEND_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "from": "you@example.com",
    "to": "recipient@example.com",
    "subject": "Hello",
    "html": "<p>Hello World</p>"
  }'
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Emails** | `POST /emails` | Send email |
| **Emails** | `GET /emails/{id}` | Get email |
| **Domains** | `GET /domains` | List domains |
| **Domains** | `POST /domains` | Add domain |
| **API Keys** | `GET /api-keys` | List API keys |

## Authentication

- **Type:** Bearer Token
- **Header:** `Authorization: Bearer {api_key}`
- **Get Key:** https://resend.com/api-keys

## Rate Limits

- Default: 2 requests per second
- Burst: Up to 10 requests

## Resources

- [API Docs](https://resend.com/docs)
- [API Reference](https://resend.com/docs/api-reference/introduction)
- [OpenAPI Spec](https://github.com/resend/resend-openapi)
- [Node.js SDK](https://github.com/resend/resend-node)
