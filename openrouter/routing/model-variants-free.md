---
source: https://openrouter.ai/docs/guides/routing/model-variants/free
scraped: 2026-01-08
---

# Free Variant

## Overview

The `:free` variant suffix enables access to complimentary model versions through OpenRouter. This feature allows developers to use AI models without incurring costs.

## Implementation

To utilize this capability, append `:free` to your model identifier:

```json
{
  "model": "meta-llama/llama-3.2-3b-instruct:free"
}
```

## Key Considerations

According to the documentation, "Free variants provide access to models without cost, but may have different rate limits or availability compared to paid versions." This means while there's no financial expense, users should anticipate potential differences in service parameters and uptime reliability.
