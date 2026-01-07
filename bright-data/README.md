# Bright Data API Documentation

> **Status:** Documentation Reference
> **Last Updated:** 2026-01-08
> **Source:** docs.brightdata.com

## Important Note

Bright Data provides OpenAPI specs embedded in their blog documentation. The specs are available for:
- **SERP API** - Search engine results
- **Web Unlocker API** - Anti-bot bypass

Specs can be copied from: https://brightdata.com/blog/ai/bright-data-openapi-specs

## Quick Start

```bash
# Set API token
export BRIGHTDATA_API_TOKEN="your-token"

# Web Unlocker request
curl -X POST "https://api.brightdata.com/request" \
  -H "Authorization: Bearer $BRIGHTDATA_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "zone": "unlocker",
    "url": "https://example.com",
    "format": "raw"
  }'
```

## Key APIs

| API | Description |
|-----|-------------|
| **Web Unlocker** | Bypass anti-bot, CAPTCHA solving |
| **SERP API** | Search engine scraping (Google, Bing, Yandex) |
| **Proxy Manager** | Proxy infrastructure management |
| **Marketplace** | Pre-collected datasets |
| **Web Scraper** | Custom scraping jobs |

## Authentication

- **Type:** Bearer Token
- **Header:** `Authorization: Bearer {token}`
- **Get Token:** https://brightdata.com/cp/api_tokens

## Resources

- [API Docs](https://docs.brightdata.com/api-reference/introduction)
- [OpenAPI Blog](https://brightdata.com/blog/ai/bright-data-openapi-specs)
- [Python SDK](https://github.com/brightdata/bright-data-sdk-python)
- [LlamaIndex Integration](https://developers.llamaindex.ai/python/framework-api-reference/tools/brightdata/)
