---
source: https://developers.notion.com/reference/request-limits
scraped: 2026-01-08
---

# Request Limits

## Rate Limits

The Notion API implements rate limiting to maintain consistent service across all users. **The standard rate limit is an average of three requests per second per integration**, though burst requests beyond this average are permitted.

When rate-limited, the API returns a `"rate_limited"` error code with HTTP status 429. The response includes a `Retry-After` header specifying the minimum wait time in seconds before retrying.

### Handling Rate Limits

Developers should implement one of two strategies:

1. **Respect the Retry-After header** – Wait the specified duration before resending requests
2. **Implement backoff logic** – Use request queues to gradually consume pending requests, slowing the request rate until 429 responses cease

**Note**: Rate limits may change in the future as Notion balances demand and reliability, and different pricing tiers may eventually receive distinct limits.

## Size Limits

Beyond rate limiting, Notion enforces maximum sizes for request parameters and structural depth. Requests exceeding these limits return a `"validation_error"` (HTTP 400) with detailed error information.

### Property Value Constraints

| Property Type | Specific Limit | Maximum Size |
|---------------|----------------|--------------|
| Rich text content | text.content | 2,000 characters |
| Rich text URLs | text.link.url | 2,000 characters |
| Equations | equation.expression | 1,000 characters |
| Block arrays | All block types | 100 elements |
| Standard URLs | Any URL field | 2,000 characters |
| Email addresses | Any email | 200 characters |
| Phone numbers | Any phone number | 200 characters |
| Multi-select options | Any selection | 100 options |
| Relations | Related pages | 100 pages |
| People mentions | User assignments | 100 users |

### Overall Payload Limits

| Limit | Maximum |
|-------|---------|
| Block elements | 1,000 |
| Total request size | 500KB |
