---
source: https://openrouter.ai/docs/guides/routing/model-variants/extended
scraped: 2026-01-08
---

# Extended Variant

## Overview

The `:extended` variant allows access to Claude models with larger context windows than standard versions.

## Implementation

To utilize this feature, append `:extended` to your model identifier. Here's the syntax:

```json
{
  "model": "anthropic/claude-sonnet-4.5:extended"
}
```

## Key Benefits

According to the documentation, these variants deliver "larger context windows than the standard model versions, allowing you to process longer inputs and maintain more conversation history."

This enhancement enables handling of more substantial documents and extended dialogue without losing prior context.
