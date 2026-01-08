---
source: https://ai.google.dev/pricing
scraped: 2025-01-08
---

# Gemini Vision API - Pricing & Rate Limits

## Pricing Overview

Pricing is based on **tokens** (input + output). Image inputs are converted to tokens based on resolution.

---

## Model Pricing (Vision/Image Input)

### Gemini 3 Models

| Model | Input (per 1M tokens) | Output (per 1M tokens) |
|-------|----------------------|------------------------|
| gemini-3-pro-preview | $2.00 | $12.00 (<200k prompt) / $18.00 (>200k prompt) |
| gemini-3-pro-preview (batch) | $1.00 | $6.00 / $9.00 |
| gemini-3-flash-preview | TBD | TBD |

### Gemini 2.5 Models

| Model | Input (per 1M tokens) | Output (per 1M tokens) |
|-------|----------------------|------------------------|
| gemini-2.5-pro | $1.25 (<200k) / $2.50 (>200k) | $10.00 (<200k) / $15.00 (>200k) |
| gemini-2.5-pro (batch) | $0.625 / $1.25 | $5.00 / $7.50 |
| gemini-2.5-flash | $0.15 (<200k) / $0.30 (>200k) | $0.60 (<200k) / $1.50 (>200k) |
| gemini-2.5-flash (batch) | $0.075 / $0.15 | $0.30 / $0.75 |
| gemini-2.5-flash-lite | $0.01 (<200k) / $0.02 (>200k) | $0.08 (<200k) / $0.15 (>200k) |

### Gemini 2.0 Models

| Model | Input (per 1M tokens) | Output (per 1M tokens) |
|-------|----------------------|------------------------|
| gemini-2.0-flash | $0.10 | $0.40 |
| gemini-2.0-flash (batch) | $0.05 | $0.20 |
| gemini-2.0-flash-lite | $0.075 | $0.30 |

---

## Image Token Costs

### Token Calculation by Model

**Gemini 1.5 / 2.0 / 2.5 Models:**
- Images <= 384px (both dimensions): **258 tokens**
- Larger images: Tiled to 768x768px, **258 tokens per tile**

**Gemini 3 Models (Variable):**
| Resolution | Tokens per Image |
|------------|-----------------|
| Low | 280 |
| Medium (default) | 560 |
| High | 1,120 |
| Ultra-High | 2,240 |

### Cost Examples (Gemini 2.5 Flash)

| Image Size | Tokens | Cost (Input) |
|------------|--------|--------------|
| Small (384x384) | 258 | $0.000039 |
| Medium (768x768) | 258 | $0.000039 |
| Large (1536x1536) | 1,032 | $0.000155 |
| Very Large (3072x3072) | 4,128 | $0.000619 |

---

## Free Tier

### Included

- Free input & output tokens (limited)
- Access to Google AI Studio
- Limited access to certain models
- 500 requests/day for Google Search grounding

### Limitations

- Lower rate limits
- Content may be used to improve products
- Some models restricted

### Eligible Countries

Free tier availability varies by region. Check [eligibility page](https://ai.google.dev/pricing) for current list.

---

## Rate Limits

### Limit Dimensions

| Metric | Description |
|--------|-------------|
| RPM | Requests per minute |
| TPM | Tokens per minute (input) |
| RPD | Requests per day |

**Note:** Exceeding ANY limit triggers rate limit error. RPD resets at midnight Pacific Time.

### Tier System

| Tier | Qualification |
|------|---------------|
| Free | Eligible countries, no billing |
| Tier 1 | Paid billing account linked |
| Tier 2 | >$250 cumulative spend + 30 days |
| Tier 3 | >$1,000 cumulative spend + 30 days |

### Rate Limits by Model (Approximate)

**Free Tier:**
| Model | RPM | TPM | RPD |
|-------|-----|-----|-----|
| gemini-2.5-flash | 15 | 1M | 1,500 |
| gemini-2.0-flash | 15 | 1M | 1,500 |
| gemini-2.5-pro | 2 | 250K | 50 |

**Paid Tier (Tier 1+):**
| Model | RPM | TPM | RPD |
|-------|-----|-----|-----|
| gemini-2.5-flash | 2,000 | 4M | 10,000+ |
| gemini-2.0-flash | 2,000 | 4M | 10,000+ |
| gemini-2.5-pro | 1,000 | 4M | 10,000+ |

*Note: Actual limits vary by tier and may change. Check [AI Studio rate limits tab](https://aistudio.google.com) for current values.*

---

## Batch API Pricing

**50% discount** on standard pricing.

| Limit | Value |
|-------|-------|
| Concurrent batch requests | 100 |
| Input file size | 2GB max |
| File storage | 20GB max |

---

## Files API

**Cost:** FREE

- No charge for file uploads
- No charge for storage (up to 20GB per project)
- Files expire after 48 hours

---

## Context Caching

Cache frequently used prompts/context to reduce costs:

| Operation | Cost |
|-----------|------|
| Cache write | Standard input token rate |
| Cache read | 25% of standard input rate |
| Storage | Per token per hour |

---

## Google Search Grounding

| Tier | Free Quota | Additional Cost |
|------|------------|-----------------|
| Free | 500 RPD | N/A |
| Paid | 1,500 RPD | $35 per 1,000 prompts |

---

## Handling Rate Limits

### Error Response

```json
{
  "error": {
    "code": 429,
    "message": "Resource has been exhausted (e.g. check quota).",
    "status": "RESOURCE_EXHAUSTED"
  }
}
```

### Best Practices

1. **Implement exponential backoff:**
```python
import time

def call_with_retry(func, max_retries=5):
    for i in range(max_retries):
        try:
            return func()
        except RateLimitError:
            wait = (2 ** i) + random.random()
            time.sleep(wait)
    raise Exception("Max retries exceeded")
```

2. **Monitor usage:**
   - Check AI Studio rate limits tab
   - Use Cloud Console quotas dashboard

3. **Request increase:**
   - Fill out [quota increase form](https://ai.google.dev/gemini-api/docs/rate-limits)
   - No guarantees on approval

---

## Cost Optimization Tips

1. **Use appropriate model:**
   - Flash models for simple tasks (10x cheaper)
   - Pro models only when needed

2. **Optimize image size:**
   - Resize images to optimal resolution
   - Smaller images = fewer tokens

3. **Use batch API:**
   - 50% discount for non-real-time workloads

4. **Enable context caching:**
   - Reuse system prompts and context

5. **Choose right resolution (Gemini 3):**
   - Use "low" resolution if detail not critical

---

## Billing Setup

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create or select project
3. Enable billing
4. Link project to AI Studio

**Payment methods:** Credit card, bank account, invoicing (enterprise)
