---
source: https://openrouter.ai/docs/guides/features/presets
scraped: 2026-01-08
---

# Presets

Presets function as reusable LLM configuration templates. They encapsulate all the settings needed for a specific use case, enabling developers to manage model behavior without modifying application code.

## Key Features

Presets manage five configuration categories:

- Provider routing preferences
- Model selection with fallback options
- System prompts
- Generation parameters (temperature, top_p, etc.)
- Provider inclusion/exclusion rules

## Implementation Methods

Three approaches exist for preset integration:

### 1. Direct Reference

Use `@preset/preset-slug` as the model parameter:

```json
{
  "model": "@preset/my-preset-slug"
}
```

### 2. Dedicated Field

Separate `preset` parameter alongside model specification:

```json
{
  "model": "openai/gpt-4",
  "preset": "preset-slug"
}
```

### 3. Combined Syntax

`model@preset/name` format:

```json
{
  "model": "openai/gpt-4@preset/my-preset"
}
```

## Strategic Advantages

### Code Maintainability

Separation between your application code and LLM configuration allows cleaner, more semantic implementations.

### Configuration Flexibility

Teams can switch to new model versions, adjust prompts, and modify parameters without code deployment.

## Organizational Features

- Shared presets across organization members promote consistency
- Version history enables rollback capabilities
- Request parameters shallow-merge with preset configurations, allowing runtime overrides
