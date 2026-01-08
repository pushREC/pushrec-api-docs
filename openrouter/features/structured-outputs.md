---
source: https://openrouter.ai/docs/guides/features/structured-outputs
scraped: 2026-01-08
---

# Structured Outputs

OpenRouter's structured outputs feature enforces JSON Schema validation on AI responses, allowing you to:

- Enforce specific JSON Schema validation on model responses
- Get consistent, type-safe outputs

## Implementation Requirements

To use this feature, include a `response_format` parameter with:

- `type` set to `json_schema`
- A `json_schema` object containing your schema definition
- The `strict: true` setting for precise adherence

```json
{
  "model": "openai/gpt-4",
  "messages": [
    {"role": "user", "content": "Extract the person's name and age from: John is 25 years old"}
  ],
  "response_format": {
    "type": "json_schema",
    "json_schema": {
      "name": "person_info",
      "strict": true,
      "schema": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "description": "The person's full name"
          },
          "age": {
            "type": "integer",
            "description": "The person's age in years"
          }
        },
        "required": ["name", "age"],
        "additionalProperties": false
      }
    }
  }
}
```

## Supported Models

The feature works with:

- OpenAI models (GPT-4o and later)
- Google Gemini models
- Anthropic Claude (Sonnet 4.5 and Opus 4.1)
- Most open-source models
- Fireworks-provided models

## Best Practices

1. **Include descriptions**: Add clear descriptions to your schema properties to guide the model

2. **Use strict mode**: Always set `strict: true` to ensure the model follows your schema exactly

## Additional Capabilities

- **Streaming support**: Structured outputs work with streaming responses
- **Response Healing plugin**: Available to reduce invalid JSON risks
- **Error handling**: Proper error responses for unsupported models and invalid schemas

## Benefits

The feature simplifies response parsing by guaranteeing format consistency, eliminating:

- Hallucinated fields
- Parsing errors
- Inconsistent data types
- Missing required properties
