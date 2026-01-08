---
source: https://openrouter.ai/docs/guides/routing/model-variants/nitro
scraped: 2026-01-08
---

# Nitro Variant

## Overview

The `:nitro` variant enables accelerated model inference with reduced latency. According to the documentation, this variant is "designed for high-speed inference for faster response times."

## Implementation

To utilize this feature, append `:nitro` to your model identifier:

```json
{
  "model": "openai/gpt-5.2:nitro"
}
```

## Key Characteristics

The documentation indicates that "Nitro variants prioritize speed and low latency," making them particularly beneficial for time-sensitive scenarios requiring immediate responses. This approach suits real-time applications where response speed is a primary concern.
