---
source: https://openrouter.ai/docs/guides/features/plugins/web-search
scraped: 2026-01-08
---

# Web Search Plugin

OpenRouter enables real-time web search by appending `:online` to model slugs or activating the `web` plugin. This adds current information to AI responses across any available model.

## Basic Implementation

Two equivalent approaches exist:

### Shorthand Method

```json
{
  "model": "openai/gpt-5.2:online"
}
```

### Plugin Method

```json
{
  "model": "openrouter/auto",
  "plugins": [
    {
      "id": "web"
    }
  ]
}
```

## Search Engines

The platform supports two search backends:

| Engine | Description |
|--------|-------------|
| **Native search** | Built-in capabilities for OpenAI, Anthropic, Perplexity, and xAI models |
| **Exa search** | Used as fallback or explicitly specified for other models |

Native search is used by default when the engine parameter remains unspecified for supported providers.

### Specifying Search Engine

```json
{
  "plugins": [
    {
      "id": "web",
      "engine": "exa"
    }
  ]
}
```

## Customization Options

| Parameter | Default | Description |
|-----------|---------|-------------|
| `max_results` | 5 | Number of search results to include |
| `search_prompt` | (varies) | Text that introduces web findings to the model |

```json
{
  "plugins": [
    {
      "id": "web",
      "max_results": 10,
      "search_prompt": "Here are relevant web search results:"
    }
  ]
}
```

## Citation Format

Results include standardized annotations following OpenAI's Chat Completion Message schema:

- URL citations with titles
- Content excerpts
- Character position indices within responses

## Cost Structure

### Exa Pricing

- $4 per 1,000 results
- $0.02 per request at default settings (5 results)

### Native Pricing

Provider-specific rates based on search context size:

| Context Level | Description |
|---------------|-------------|
| Low | Minimal search context |
| Medium | Standard search context |
| High | Extended search context |

Rates vary by provider (OpenAI, Anthropic, Perplexity, xAI).
