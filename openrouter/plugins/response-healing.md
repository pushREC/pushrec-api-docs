---
source: https://openrouter.ai/docs/guides/features/plugins/response-healing
scraped: 2026-01-08
---

# Response Healing Plugin

The Response Healing plugin provides automatic validation and repair of imperfect JSON responses from AI models.

## Activation Requirements

The plugin activates for non-streaming requests when you:

1. Include `response_format` with `type: "json_schema"` or `type: "json_object"`
2. Add the plugin to your configuration

```json
{
  "model": "openai/gpt-4",
  "messages": [...],
  "response_format": {
    "type": "json_schema",
    "json_schema": {...}
  },
  "plugins": [
    {
      "id": "response-healing"
    }
  ]
}
```

## Issues It Resolves

The plugin addresses several common formatting problems:

| Issue | Description |
|-------|-------------|
| **Syntax errors** | Fixes missing brackets, commas, and quotes |
| **Markdown wrapping** | Extracts JSON from code blocks |
| **Mixed content** | Isolates JSON from surrounding text |
| **Trailing commas** | Removes invalid trailing syntax |
| **Unquoted keys** | Converts JavaScript-style objects to valid JSON |

## Implementation Examples

### TypeScript

```typescript
const response = await openrouter.chat.completions.create({
  model: "openai/gpt-4",
  messages: [
    { role: "user", content: "Return a JSON object with name and age" }
  ],
  response_format: {
    type: "json_schema",
    json_schema: {
      name: "person",
      schema: {
        type: "object",
        properties: {
          name: { type: "string" },
          age: { type: "integer" }
        }
      }
    }
  },
  plugins: [{ id: "response-healing" }]
});
```

### Python

```python
response = client.chat.completions.create(
    model="openai/gpt-4",
    messages=[
        {"role": "user", "content": "Return a JSON object with name and age"}
    ],
    response_format={
        "type": "json_schema",
        "json_schema": {
            "name": "person",
            "schema": {
                "type": "object",
                "properties": {
                    "name": {"type": "string"},
                    "age": {"type": "integer"}
                }
            }
        }
    },
    extra_body={
        "plugins": [{"id": "response-healing"}]
    }
)
```

## Important Constraints

1. **Non-streaming only**: This feature only applies to non-streaming requests

2. **Truncation limitations**: Severely truncated responses (those cut off by `max_tokens`) cannot be reliably repaired, as the malformation may be structural rather than syntactic

## Best Practices

- Use alongside `strict: true` in your JSON schema for maximum reliability
- Set appropriate `max_tokens` to avoid truncation
- Combine with structured outputs for type-safe responses
