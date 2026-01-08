---
source: https://openrouter.ai/docs/guides/routing/model-fallbacks
scraped: 2026-01-08
---

# Model Fallbacks

## Overview

OpenRouter enables automatic failover functionality by accepting a `models` parameter containing an array of model IDs in priority order. When the primary model encounters issues—such as provider downtime, rate limiting, or content moderation refusals—the system automatically attempts subsequent models in the sequence.

## Core Functionality

The fallback mechanism activates for various error scenarios including "context length validation errors, moderation flags for filtered models, rate-limiting, [and] downtime."

## Implementation

The documentation provides three approaches for implementation:

1. **OpenRouter SDK (TypeScript)** - Direct parameter passing to `chat.send()`
2. **Fetch API** - Raw HTTP requests to the OpenRouter endpoint
3. **Python** - Using the requests library for API calls

## Cost Structure

Pricing applies to whichever model ultimately processes the request, identifiable via the `model` attribute in the response body.

## OpenAI SDK Integration

Users can leverage fallbacks with OpenAI's official SDK by nesting the models array within the `extra_body` parameter, allowing the specified primary model to serve as the initial attempt before trying fallback options.

## Error Handling

If all models in the fallback sequence fail, OpenRouter returns the final error encountered rather than attempting additional recovery strategies.
