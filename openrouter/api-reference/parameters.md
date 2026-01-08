---
source: https://openrouter.ai/docs/api/reference/parameters
scraped: 2026-01-08
---

# Parameters

OpenRouter supports comprehensive sampling parameters to control model behavior.

## Core Sampling Controls

### Temperature

| Property | Value |
|----------|-------|
| Parameter | `temperature` |
| Range | 0.0 - 2.0 |
| Default | 1.0 |

Adjusts response variety. Lower settings yield predictable outputs, while higher values encourage diversity. At zero, responses become deterministic.

```json
{
  "temperature": 0.7
}
```

### Top P (Nucleus Sampling)

| Property | Value |
|----------|-------|
| Parameter | `top_p` |
| Range | 0.0 - 1.0 |
| Default | 1.0 |

Restricts choices to tokens whose cumulative probability reaches the threshold, functioning as a dynamic alternative to fixed token limits.

```json
{
  "top_p": 0.9
}
```

### Top K

| Property | Value |
|----------|-------|
| Parameter | `top_k` |
| Range | Integer >= 0 |
| Default | 0 (disabled) |

Narrows token selection to a fixed number of most likely options. A value of 1 forces selection of the single most probable token.

```json
{
  "top_k": 50
}
```

## Penalty Parameters

### Frequency Penalty

| Property | Value |
|----------|-------|
| Parameter | `frequency_penalty` |
| Range | -2.0 to 2.0 |
| Default | 0.0 |

Scales with token occurrence frequency in input. Positive values reduce repetition.

```json
{
  "frequency_penalty": 0.5
}
```

### Presence Penalty

| Property | Value |
|----------|-------|
| Parameter | `presence_penalty` |
| Range | -2.0 to 2.0 |
| Default | 0.0 |

Applies uniform penalty regardless of frequency. Encourages topic diversity.

```json
{
  "presence_penalty": 0.5
}
```

### Repetition Penalty

| Property | Value |
|----------|-------|
| Parameter | `repetition_penalty` |
| Range | 0.0 - 2.0 |
| Default | 1.0 |

Reduces input token recurrence based on original probability.

```json
{
  "repetition_penalty": 1.1
}
```

## Advanced Filtering

### Min P

| Property | Value |
|----------|-------|
| Parameter | `min_p` |
| Range | 0.0 - 1.0 |
| Default | 0.0 |

Dynamic probability-based filtering relative to the most likely token.

```json
{
  "min_p": 0.1
}
```

### Top A

| Property | Value |
|----------|-------|
| Parameter | `top_a` |
| Range | 0.0 - 1.0 |
| Default | 0.0 |

Alternative dynamic probability filtering mechanism.

```json
{
  "top_a": 0.1
}
```

## Output Control

### Max Tokens

| Property | Value |
|----------|-------|
| Parameter | `max_tokens` |
| Range | 1 to context length |

Sets the maximum number of tokens to generate.

```json
{
  "max_tokens": 1000
}
```

### Seed

| Property | Value |
|----------|-------|
| Parameter | `seed` |
| Type | Integer |

Enables deterministic outputs when set to the same value across requests.

```json
{
  "seed": 12345
}
```

### Stop Sequences

| Property | Value |
|----------|-------|
| Parameter | `stop` |
| Type | String or Array |

Terminates generation immediately upon matching specified tokens.

```json
{
  "stop": ["\n\n", "END"]
}
```

## Structured Responses

### Response Format

Enables JSON mode for structured outputs:

```json
{
  "response_format": {
    "type": "json_object"
  }
}
```

### Structured Outputs (JSON Schema)

Enforces response adherence to a JSON schema:

```json
{
  "response_format": {
    "type": "json_schema",
    "json_schema": {
      "name": "response",
      "strict": true,
      "schema": {
        "type": "object",
        "properties": {
          "name": { "type": "string" },
          "age": { "type": "integer" }
        },
        "required": ["name", "age"]
      }
    }
  }
}
```

## Function Calling

### Tools Definition

```json
{
  "tools": [
    {
      "type": "function",
      "function": {
        "name": "get_weather",
        "description": "Get current weather for a location",
        "parameters": {
          "type": "object",
          "properties": {
            "location": {
              "type": "string",
              "description": "City name"
            }
          },
          "required": ["location"]
        }
      }
    }
  ]
}
```

### Tool Choice

| Value | Description |
|-------|-------------|
| `"auto"` | Model decides whether to use tools |
| `"none"` | Prevents tool usage |
| `{"type": "function", "function": {"name": "..."}}` | Forces specific tool |

```json
{
  "tool_choice": "auto"
}
```

### Parallel Tool Calls

| Property | Value |
|----------|-------|
| Parameter | `parallel_tool_calls` |
| Type | Boolean |
| Default | true |

Determines whether tools execute sequentially or simultaneously.

```json
{
  "parallel_tool_calls": true
}
```

## Verbosity

| Property | Value |
|----------|-------|
| Parameter | `verbosity` |
| Values | `"low"`, `"medium"`, `"high"` |

Constrains response detail levels.

```json
{
  "verbosity": "medium"
}
```

## Complete Example

```json
{
  "model": "openai/gpt-4o",
  "messages": [
    {"role": "user", "content": "Write a short poem about AI"}
  ],
  "temperature": 0.8,
  "top_p": 0.95,
  "max_tokens": 500,
  "frequency_penalty": 0.3,
  "presence_penalty": 0.3,
  "stop": ["\n\n\n"],
  "response_format": {"type": "json_object"}
}
```
