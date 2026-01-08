---
source: https://openrouter.ai/docs/guides/routing/model-variants/online
scraped: 2026-01-08
---

# Online Variant

## Core Functionality

The `:online` variant activates real-time web search for any model available on OpenRouter. According to the documentation, this feature "enables real-time web search capabilities for any model on OpenRouter."

## Implementation

Adding `:online` to a model ID is straightforward. For example:

```json
{
  "model": "openai/gpt-5.2:online"
}
```

This represents a simplified approach to what can also be accomplished through the web plugin configuration.

## Equivalent Configuration

The shorthand method above matches this longer form:

```json
{
  "model": "openrouter/auto",
  "plugins": {
    "web": {}
  }
}
```

## Primary Use Cases

The feature's main advantage is incorporating search results into responses, making it useful when "queries require up-to-date information beyond the model's training data." This addresses scenarios where current events or recently published information matters.

## Additional Resources

The documentation directs readers to a Web Search guide for more comprehensive details about this plugin's capabilities.
