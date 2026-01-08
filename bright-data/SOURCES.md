---
source: 'https://docs.brightdata.com'
scraped: '2026-01-08'
api_provider: 'Bright Data'
discovery_tier: 2
verified: true
---
# Bright Data API - Source Registry

## Primary Sources Fetched

| Source | URL | Type | Status | Content |
|--------|-----|------|--------|---------|
| OpenAPI Blog | https://brightdata.com/blog/ai/bright-data-openapi-specs | Blog | Active | Embedded specs |
| YouTube Docs | https://docs.brightdata.com/scraping-automation/youtube | Docs | Redirects | Navigation only |
| API Reference | https://docs.brightdata.com/api-reference/introduction | Docs | 404 | Moved |
| Web Scraper Overview | https://docs.brightdata.com/scraping-automation/web-scraper-api/overview | Docs | Active | Partial |
| Async Requests | https://docs.brightdata.com/api-reference/rest-api/scraper/asynchronous-requests | Docs | Active | Complete |
| Monitor Progress | https://docs.brightdata.com/api-reference/rest-api/scraper/monitor-progress | Docs | Active | Complete |
| YouTube Product | https://brightdata.com/products/web-scraper/youtube | Product | Active | Complete |
| YouTube Datasets | https://brightdata.com/products/datasets/youtube | Product | Active | Complete |
| Quick Start | https://docs.brightdata.com/datasets/scrapers/scrapers-library/quickstart | Docs | Active | Complete |
| Web Scraper | https://brightdata.com/products/web-scraper | Product | Active | Complete |

## Spec Locations

```
No downloadable OpenAPI spec file available.
Specs embedded in blog post only.
See: https://brightdata.com/blog/ai/bright-data-openapi-specs
```

## Information Extracted

### From docs.brightdata.com

- Endpoint URLs and methods
- Authentication (Bearer token)
- Request/response formats
- Status values (running, ready, failed)
- Query parameters

### From brightdata.com/products

- YouTube scraper capabilities (10 scrapers)
- Data fields available
- Pricing tiers
- Output formats
- Delivery methods
- Dataset statistics (3.9B+ records)

## Documentation Structure Discovery

```
docs.brightdata.com/
├── api-reference/
│   ├── rest-api/
│   │   └── scraper/
│   │       ├── asynchronous-requests ✓
│   │       ├── synchronous-requests (404)
│   │       └── download-results
│   └── web-scraper-api/
│       ├── data-collection-apis/
│       ├── management-apis/
│       │   └── monitor-progress ✓
│       └── delivery-apis/
│           └── download-snapshot ✓
└── scraping-automation/
    └── web-scraper-api/
        └── overview ✓
```

## Last Updated

- **Documentation Reviewed**: 2026-01-08
- **Spec Format**: OpenAPI 3.0 (embedded in blog)
- **API Version**: v3

## Verification

| Item | Status |
|------|--------|
| Endpoint URLs | Verified |
| Authentication method | Verified |
| Request format | Verified |
| Response format | Verified |
| Pricing | Verified (product pages) |
| YouTube scrapers | Verified (10 available) |
| Dataset IDs | Partial (pattern known) |
| Rate limits | Not documented |

## Notes

1. **Many doc URLs return 404**: Documentation restructured recently
2. **OpenAPI specs embedded**: Not downloadable, must copy from blog
3. **Dataset IDs**: Pattern is `gd_youtube_[type]`, exact IDs from dashboard
4. **Transcript scraping**: Not natively supported by Bright Data
5. **Rate limits**: Undocumented, use async for large jobs
6. **Pricing current**: 25% promo code APIS25 active

## SDK Resources

| SDK | URL | Status |
|-----|-----|--------|
| Python SDK | https://github.com/brightdata/bright-data-sdk-python | Active |
| JavaScript SDK | Not officially documented | Unknown |
| Postman Collection | In docs (api-reference/postman-collection) | Active |

## Support Channels

- Documentation: https://docs.brightdata.com
- Help Center: https://help.brightdata.com
- Dashboard: https://brightdata.com/cp
- API Tokens: https://brightdata.com/cp/api_tokens
- Scraper Library: https://brightdata.com/cp/scrapers/browse
