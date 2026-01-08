---
source: https://openrouter.ai/docs/guides/guides/usage-accounting
scraped: 2026-01-08
---

# Usage Accounting

## Core Functionality

The OpenRouter API offers built-in usage tracking that eliminates the need for separate API calls. The system provides detailed metrics including prompt tokens, completion tokens, cached tokens, and cost information directly within API responses.

## Key Features

**Tracked Metrics:**

- Prompt and completion token counts using native tokenizers
- Cost in credits
- Reasoning token counts (when applicable)
- Cached token counts (when available)

## Implementation

To activate this feature, include a parameter in your request:

```json
{
  "model": "your-model",
  "messages": [],
  "usage": {
    "include": true
  }
}
```

## Response Structure

Enabled responses include a usage object with detailed breakdowns of `prompt_tokens`, `completion_tokens`, and `total_tokens`, plus nested details for reasoning and cached tokens.

## Important Considerations

- **Performance Trade-off:** Enabling usage accounting will add a few hundred milliseconds to the last response as the API calculates token counts and costs.
- The system currently tracks cached tokens *read* from cache but not tokens *written* to cache
- Cost details include upstream provider charges (applicable to BYOK requests only)

## Alternative Method

Users can retrieve usage asynchronously via generation IDs returned from API calls, useful for historical auditing or post-completion analysis.
