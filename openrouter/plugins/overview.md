---
source: https://openrouter.ai/docs/guides/features/plugins/overview
scraped: 2026-01-08
---

# Plugins Overview

OpenRouter provides plugins that enhance model capabilities with features like real-time web search, PDF processing, and automatic JSON repair across any supported model.

## Available Plugins

| Plugin | Description |
|--------|-------------|
| **Web Search** | Augment LLM responses with real-time web search results |
| **PDF Inputs** | Handles parsing and extraction from uploaded PDF documents |
| **Response Healing** | Automatically fix malformed JSON responses from LLMs |

## API Implementation

Plugins are activated by including a `plugins` array in chat completion requests. Each plugin requires an `id` and may accept optional configuration parameters.

```json
{
  "model": "openai/gpt-4",
  "messages": [...],
  "plugins": [
    {
      "id": "web",
      "max_results": 5
    },
    {
      "id": "response-healing"
    }
  ]
}
```

Multiple plugins can be combined in a single request with different settings.

## Configuration Options

Users and organization administrators can establish default plugin settings through the Plugins settings page.

### Key Features

- Enabling/disabling plugins globally across all requests
- Customizing plugin-specific parameters
- Enforcing settings via "Prevent overrides" toggle (admin-only in organizations)

### Setting Hierarchy

Request-level configurations take priority over account defaults, unless "Prevent overrides" is activated for a specific plugin.

### Disabling Default Plugins

Disabled default plugins can be turned off per-request using `"enabled": false`:

```json
{
  "plugins": [
    {
      "id": "web",
      "enabled": false
    }
  ]
}
```

## Model Shortcuts

Convenient syntax exists for common plugins—appending `:online` to a model ID automatically enables web search functionality:

```json
{
  "model": "openai/gpt-5.2:online"
}
```
