---
source: https://openrouter.ai/docs/guides/features/message-transforms
scraped: 2026-01-08
---

# Message Transforms

OpenRouter provides a `transforms` parameter to handle prompts exceeding model context limits through middle-out compression.

## Basic Implementation

The feature enables automatic compression via `transforms: ["middle-out"]` in requests, working across all OpenRouter models.

```json
{
  "model": "openai/gpt-4",
  "messages": [...],
  "transforms": ["middle-out"]
}
```

## How It Works

The system removes or truncates content from the middle of prompts to fit within context windows. This approach leverages research showing that LLMs pay less attention to the middle of sequences.

## Message Limits

Beyond token constraints, Claude models enforce maximum message counts. When exceeded with middle-out enabled, the transform preserves the first half and final half of messages.

## Model Selection

OpenRouter seeks models with context length at least 50% of total required tokens. If unavailable, it defaults to the highest-capacity model.

## Default Behavior

Endpoints with 8,192 tokens or less context automatically enable middle-out compression.

To disable automatic compression:

```json
{
  "transforms": []
}
```

## Error Handling

Without compression enabled, oversized requests fail with suggestions to either:

- Reduce content length
- Activate middle-out compression

## Use Cases

The feature supports use cases where perfect recall is not required, making it ideal for:

- Managing lengthy conversation histories
- Extensive reference material
- Large document summarization
- Long-running agent conversations
