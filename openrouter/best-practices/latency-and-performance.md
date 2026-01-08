---
source: https://openrouter.ai/docs/guides/best-practices/latency-and-performance
scraped: 2026-01-08
---

# Latency and Performance

OpenRouter prioritizes minimal latency through edge computing infrastructure and intelligent caching strategies.

## Key Performance Features

The platform uses:
- **Edge computing** using Cloudflare Workers to stay as close as possible to your application
- Efficient data caching
- Optimized routing logic to reduce overhead

## Latency Factors to Understand

### Cache Initialization

New regions may experience temporarily elevated latency during the first 1-2 minutes as caches populate before normalizing.

### Credit Monitoring

When account balances drop to single digits or API keys approach limits, the system performs additional database checks for billing accuracy, which can increase response times until more credits are added.

### Model Routing Fallbacks

Automatic failover to alternate models or providers during outages adds latency to affected requests, though the system learns to route around known unavailable options.

## Optimization Recommendations

To improve performance, consider:

1. **Maintain a healthy credit balance** ($10-20 minimum) and enable auto-topup to avoid triggering aggressive billing checks

2. **Leverage provider preferences** if you have specific latency targets for time-to-first-token or completion speed

These strategies help align your setup with OpenRouter's infrastructure strengths while maintaining billing integrity.
