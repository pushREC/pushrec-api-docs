---
source: https://openrouter.ai/docs/api/reference/responses/reasoning
scraped: 2026-01-08
---

# Reasoning

OpenRouter's Responses API Beta provides advanced reasoning features with configurable effort levels. The API allows models to expose their internal reasoning process through encrypted reasoning chains.

> **Note:** This API is **in beta stage and may have breaking changes**.

## Reasoning Configuration

The API uses a `reasoning` parameter with an `effort` setting to control computational depth.

## Effort Levels

| Level | Description | Use Case |
|-------|-------------|----------|
| `minimal` | Basic reasoning with minimal computational effort | Simple questions |
| `low` | Light reasoning for simple problems | Straightforward tasks |
| `medium` | Balanced reasoning for moderate complexity | General purpose |
| `high` | Deep reasoning for complex problems | Complex analysis |

## Basic Usage

### cURL

```bash
curl https://openrouter.ai/api/v1/responses \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/o1",
    "input": "Solve this logic puzzle: If all A are B, and some B are C, what can we conclude about A and C?",
    "reasoning": {
      "effort": "high"
    },
    "max_output_tokens": 2000
  }'
```

### TypeScript

```typescript
const response = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${process.env.OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/o1',
    input: 'Solve this logic puzzle: If all A are B, and some B are C, what can we conclude about A and C?',
    reasoning: {
      effort: 'high',
    },
    max_output_tokens: 2000,
  }),
});

const data = await response.json();
console.log(data.output);
```

### Python

```python
import requests

response = requests.post(
    'https://openrouter.ai/api/v1/responses',
    headers={
        'Authorization': f'Bearer {OPENROUTER_API_KEY}',
        'Content-Type': 'application/json',
    },
    json={
        'model': 'openai/o1',
        'input': 'Solve this logic puzzle: If all A are B, and some B are C, what can we conclude about A and C?',
        'reasoning': {
            'effort': 'high',
        },
        'max_output_tokens': 2000,
    },
)

data = response.json()
print(data['output'])
```

## Response Structure

When reasoning is enabled, responses include separate reasoning and message blocks:

```json
{
  "id": "resp_abc123",
  "object": "response",
  "created": 1704067200,
  "model": "openai/o1",
  "output": [
    {
      "type": "reasoning",
      "id": "rs_xyz789",
      "content": [
        {
          "type": "reasoning_encrypted",
          "data": "<encrypted_reasoning_chain>"
        }
      ],
      "summary": [
        {
          "type": "summary_text",
          "text": "I analyzed the logical relationship between sets A, B, and C..."
        }
      ]
    },
    {
      "type": "message",
      "role": "assistant",
      "content": [
        {
          "type": "output_text",
          "text": "Based on the premises, we cannot definitively conclude any direct relationship between A and C..."
        }
      ]
    }
  ],
  "usage": {
    "input_tokens": 25,
    "output_tokens": 150,
    "reasoning_tokens": 500,
    "total_tokens": 675
  },
  "status": "completed"
}
```

### Response Fields

| Field | Description |
|-------|-------------|
| `output[].type` | `"reasoning"` or `"message"` |
| `output[].content` | Encrypted reasoning chain (for reasoning) or output text (for message) |
| `output[].summary` | Human-readable summary of reasoning steps |
| `usage.reasoning_tokens` | Tokens consumed by reasoning process |

## Multi-Turn Conversations with Reasoning

Reasoning is maintained across conversation exchanges:

```json
{
  "model": "openai/o1",
  "input": [
    {
      "type": "message",
      "role": "user",
      "content": [{"type": "input_text", "text": "What is the square root of 144?"}]
    },
    {
      "type": "message",
      "id": "msg_prev123",
      "role": "assistant",
      "status": "completed",
      "content": [{"type": "output_text", "text": "The square root of 144 is 12."}]
    },
    {
      "type": "message",
      "role": "user",
      "content": [{"type": "input_text", "text": "Now cube that number"}]
    }
  ],
  "reasoning": {
    "effort": "medium"
  },
  "max_output_tokens": 500
}
```

## Streaming with Reasoning

Enable streaming to observe reasoning development in real-time:

```typescript
const response = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${process.env.OPENROUTER_API_KEY}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/o1',
    input: 'Explain the proof of Fermat\'s Last Theorem',
    reasoning: { effort: 'high' },
    max_output_tokens: 3000,
    stream: true,
  }),
});

const reader = response.body.getReader();
const decoder = new TextDecoder();

while (true) {
  const { done, value } = await reader.read();
  if (done) break;

  const chunk = decoder.decode(value);
  const lines = chunk.split('\n');

  for (const line of lines) {
    if (line.startsWith('data: ')) {
      const data = JSON.parse(line.slice(6));

      switch (data.type) {
        case 'response.reasoning.delta':
          // Reasoning in progress
          console.log('[Reasoning]', data.delta);
          break;
        case 'response.output_text.delta':
          // Final output
          process.stdout.write(data.delta);
          break;
      }
    }
  }
}
```

### Streaming Events for Reasoning

```
data: {"type": "response.created", "response": {...}}
data: {"type": "response.reasoning.delta", "delta": "..."}
data: {"type": "response.reasoning.done", "reasoning": {...}}
data: {"type": "response.output_text.delta", "delta": "Based on..."}
data: {"type": "response.output_text.done", "text": "..."}
data: {"type": "response.done", "response": {...}}
```

## Best Practices

1. **Match Effort to Complexity**: Use `minimal` or `low` for simple questions, `high` for complex analysis
2. **Monitor Token Usage**: Reasoning significantly increases token consumption
3. **Use Streaming**: For lengthy reasoning chains, streaming provides better user experience
4. **Review Summaries**: The `summary` field provides insight into reasoning without decryption

## Token Usage Considerations

Reasoning tokens are billed separately and can significantly increase costs:

| Effort Level | Typical Reasoning Tokens |
|--------------|-------------------------|
| `minimal` | 50-200 |
| `low` | 100-500 |
| `medium` | 300-1500 |
| `high` | 500-5000+ |

Monitor `usage.reasoning_tokens` in responses to track consumption.
