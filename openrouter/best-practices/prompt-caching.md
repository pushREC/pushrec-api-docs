---
source: https://openrouter.ai/docs/guides/best-practices/prompt-caching
scraped: 2026-01-08
---

# Prompt Caching

OpenRouter enables prompt caching across multiple AI providers to reduce inference costs.

## Key Features

### Automatic vs. Manual Setup

Most providers handle caching automatically, but Anthropic requires explicit `cache_control` breakpoints per message.

### Provider Continuity

OpenRouter will make a best-effort to continue routing to the same provider to make use of the warm cache. If that provider becomes unavailable, the system routes to alternatives.

## Cache Usage Inspection

Track savings through three methods:

1. Activity page detail button
2. `/api/v1/generation` API endpoint
3. Request parameter: `usage: {include: true}`

The `cache_discount` field reveals cost reductions, with variations by provider.

## Provider-Specific Details

### OpenAI

- Cache reads cost 0.25x-0.50x standard pricing
- Writes are free
- Minimum prompt size: 1024 tokens

### Anthropic Claude

- Charges apply to both writes and reads at specified multipliers
- Supports up to four cache breakpoints with configurable TTL
- Default TTL: 5 minutes
- Extended TTL: 1 hour

### Google Gemini

- Implicit caching on 2.5 models requires no manual setup
- Cache reads cost at a reduced multiplier
- Typical TTL: 3-5 minutes
- Model-specific token minimums apply

### DeepSeek

- Automated caching with discounted read rates

### Grok

- Automated caching with discounted read rates

### Moonshot AI

- Automated caching with discounted read rates

### Groq

- Automated caching with discounted read rates

## Best Practices

- For Gemini, keep the initial portion of your message arrays consistent between requests to maximize cache hits
- Reserve Anthropic breakpoints for substantial content like:
  - Datasets
  - Reference materials
  - Extensive text bodies
