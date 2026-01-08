---
source: https://openrouter.ai/docs/guides/best-practices/reasoning-tokens
scraped: 2026-01-08
---

# Reasoning Tokens

## Overview

Reasoning tokens (or "thinking tokens") enable AI models to show their step-by-step problem-solving process. The OpenRouter API normalizes reasoning across different providers through a unified `reasoning` parameter.

Key points:
- Reasoning tokens appear in the `reasoning` field of responses
- They count as output tokens for billing purposes
- Some models (like OpenAI's o-series) don't return reasoning despite using it internally

## Configuration Options

The `reasoning` parameter accepts several configuration types:

### Effort Levels (for OpenAI/Grok models)

| Level | Description |
|-------|-------------|
| `xhigh` | Maximum reasoning allocation |
| `high` | High reasoning allocation |
| `medium` | Medium reasoning allocation |
| `low` | Low reasoning allocation |
| `minimal` | Minimal reasoning allocation |
| `none` | No reasoning |

Controls token allocation percentages (95% down to 10%).

### Max Tokens (for Anthropic/Gemini/Qwen models)

Direct specification of maximum reasoning tokens:

```json
"reasoning": {
  "max_tokens": 2000
}
```

Range: 1024-128,000 tokens minimum/maximum

### Exclusion Option

Model reasons internally but omits from response:

```json
"reasoning": {
  "exclude": true
}
```

### Quick Enable

Activates medium effort by default:

```json
"reasoning": {
  "enabled": true
}
```

## Provider-Specific Implementation

### Anthropic Models

Use `reasoning.max_tokens` or `reasoning.effort`. The formula calculates budget as:

```
max(min(max_tokens * effort_ratio, 128000), 1024)
```

**Critical requirement**: Your `max_tokens` value must exceed reasoning budget to allow response generation.

## Preserving Reasoning Blocks

For multi-turn conversations (especially with tool use), include `reasoning_details` unchanged when passing messages back to maintain reasoning continuity and context flow.

## Response Structure

Responses include `reasoning_details` arrays containing three object types:

| Type | Description |
|------|-------------|
| **Summary** | High-level overview |
| **Encrypted** | Protected/redacted reasoning |
| **Text** | Raw reasoning with optional signatures |

Both streaming and non-streaming responses support this structure.
