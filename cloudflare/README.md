# Cloudflare API Documentation

> **Status:** Complete
> **Last Updated:** 2026-01-08
> **Source:** api.cloudflare.com

## Contents

| Type | Description |
|------|-------------|
| `openapi.yaml` | Official OpenAPI 3.0 spec (344K+ lines) |
| `SOURCES.md` | Source tracking |
| `COVERAGE.md` | Coverage report |

## Quick Start

```bash
# Set API token
export CLOUDFLARE_API_TOKEN="your-token-here"

# Verify token
curl "https://api.cloudflare.com/client/v4/user/tokens/verify" \
  -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN"

# List zones
curl "https://api.cloudflare.com/client/v4/zones" \
  -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN"
```

## Key Endpoints

| Category | Endpoint | Description |
|----------|----------|-------------|
| **Zones** | `GET /client/v4/zones` | List zones |
| **DNS** | `GET /client/v4/zones/{id}/dns_records` | List DNS records |
| **DNS** | `POST /client/v4/zones/{id}/dns_records` | Create DNS record |
| **Workers** | `PUT /client/v4/accounts/{id}/workers/scripts/{name}` | Deploy worker |
| **Analytics** | `GET /client/v4/zones/{id}/analytics/dashboard` | Get analytics |

## Authentication

- **Type:** Bearer Token or API Key + Email
- **Header:** `Authorization: Bearer {token}` or `X-Auth-Key` + `X-Auth-Email`
- **Get Token:** https://dash.cloudflare.com/profile/api-tokens

## Resources

- [API Docs](https://developers.cloudflare.com/api)
- [API Reference](https://api.cloudflare.com/)
- [Python Client](https://github.com/cloudflare/cloudflare-python)
- [OpenAPI Schemas](https://github.com/cloudflare/api-schemas)
