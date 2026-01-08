---
source: https://openrouter.ai/docs/api/reference/responses/tool-calling
scraped: 2026-01-08
---

# Tool Calling

OpenRouter's Responses API Beta enables comprehensive function calling capabilities, supporting parallel execution and complex multi-step workflows.

> **Note:** This API is **in beta stage and may have breaking changes**.

## Tool Definition

Tools follow OpenAI's function calling format, requiring type, name, description, and JSON Schema parameters.

```json
{
  "tools": [
    {
      "type": "function",
      "name": "get_weather",
      "description": "Get the current weather for a location",
      "parameters": {
        "type": "object",
        "properties": {
          "location": {
            "type": "string",
            "description": "The city and state, e.g., San Francisco, CA"
          },
          "unit": {
            "type": "string",
            "enum": ["celsius", "fahrenheit"],
            "description": "Temperature unit"
          }
        },
        "required": ["location"]
      }
    }
  ]
}
```

## Basic Usage

### cURL

```bash
curl https://openrouter.ai/api/v1/responses \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-4o",
    "input": "What is the weather in Tokyo?",
    "tools": [
      {
        "type": "function",
        "name": "get_weather",
        "description": "Get current weather for a location",
        "parameters": {
          "type": "object",
          "properties": {
            "location": {"type": "string"}
          },
          "required": ["location"]
        }
      }
    ],
    "max_output_tokens": 500
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
    model: 'openai/gpt-4o',
    input: 'What is the weather in Tokyo?',
    tools: [
      {
        type: 'function',
        name: 'get_weather',
        description: 'Get current weather for a location',
        parameters: {
          type: 'object',
          properties: {
            location: { type: 'string' },
          },
          required: ['location'],
        },
      },
    ],
    max_output_tokens: 500,
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
        'model': 'openai/gpt-4o',
        'input': 'What is the weather in Tokyo?',
        'tools': [
            {
                'type': 'function',
                'name': 'get_weather',
                'description': 'Get current weather for a location',
                'parameters': {
                    'type': 'object',
                    'properties': {
                        'location': {'type': 'string'},
                    },
                    'required': ['location'],
                },
            },
        ],
        'max_output_tokens': 500,
    },
)

data = response.json()
print(data['output'])
```

## Tool Choice Control

Three options govern tool execution:

| Value | Description |
|-------|-------------|
| `auto` | Model decides whether to invoke tools |
| `none` | Prevents any tool calls |
| `{type: 'function', name: 'tool_name'}` | Forces specific tool execution |

### Force Specific Tool

```json
{
  "model": "openai/gpt-4o",
  "input": "What is the weather?",
  "tools": [...],
  "tool_choice": {
    "type": "function",
    "name": "get_weather"
  }
}
```

## Response Structure

When tools are invoked, responses include function call details:

```json
{
  "id": "resp_abc123",
  "object": "response",
  "created": 1704067200,
  "model": "openai/gpt-4o",
  "output": [
    {
      "type": "function_call",
      "id": "fc_xyz789",
      "call_id": "call_abc123",
      "name": "get_weather",
      "arguments": "{\"location\": \"Tokyo, Japan\"}"
    }
  ],
  "usage": {
    "input_tokens": 50,
    "output_tokens": 25,
    "total_tokens": 75
  },
  "status": "completed"
}
```

### Function Call Fields

| Field | Type | Description |
|-------|------|-------------|
| `type` | string | Always `"function_call"` |
| `id` | string | Unique function call identifier |
| `call_id` | string | Call identifier for response matching |
| `name` | string | Function name to invoke |
| `arguments` | string | JSON string of function arguments |

## Multiple Tools

Define multiple tools for the model to choose from:

```json
{
  "model": "openai/gpt-4o",
  "input": "What is the weather in Tokyo and what time is it there?",
  "tools": [
    {
      "type": "function",
      "name": "get_weather",
      "description": "Get current weather",
      "parameters": {
        "type": "object",
        "properties": {
          "location": {"type": "string"}
        },
        "required": ["location"]
      }
    },
    {
      "type": "function",
      "name": "get_time",
      "description": "Get current time in a timezone",
      "parameters": {
        "type": "object",
        "properties": {
          "timezone": {"type": "string"}
        },
        "required": ["timezone"]
      }
    }
  ]
}
```

## Parallel Execution

The API supports parallel tool calls when appropriate:

```json
{
  "output": [
    {
      "type": "function_call",
      "id": "fc_1",
      "call_id": "call_weather",
      "name": "get_weather",
      "arguments": "{\"location\": \"Tokyo\"}"
    },
    {
      "type": "function_call",
      "id": "fc_2",
      "call_id": "call_time",
      "name": "get_time",
      "arguments": "{\"timezone\": \"Asia/Tokyo\"}"
    }
  ]
}
```

## Providing Tool Results

After executing tools, provide results using `function_call_output`:

```json
{
  "model": "openai/gpt-4o",
  "input": [
    {
      "type": "message",
      "role": "user",
      "content": [{"type": "input_text", "text": "What is the weather in Tokyo?"}]
    },
    {
      "type": "function_call",
      "id": "fc_xyz789",
      "call_id": "call_abc123",
      "name": "get_weather",
      "arguments": "{\"location\": \"Tokyo, Japan\"}"
    },
    {
      "type": "function_call_output",
      "call_id": "call_abc123",
      "output": "{\"temperature\": 22, \"unit\": \"celsius\", \"condition\": \"sunny\"}"
    }
  ],
  "tools": [...],
  "max_output_tokens": 500
}
```

### Complete Conversation Flow

```typescript
// Step 1: Initial request with tools
const response1 = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${apiKey}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    input: 'What is the weather in Tokyo?',
    tools: [weatherTool],
  }),
});

const data1 = await response1.json();
const functionCall = data1.output.find(o => o.type === 'function_call');

// Step 2: Execute the function
const weatherResult = await getWeather(JSON.parse(functionCall.arguments));

// Step 3: Continue conversation with tool result
const response2 = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${apiKey}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    input: [
      { type: 'message', role: 'user', content: [{ type: 'input_text', text: 'What is the weather in Tokyo?' }] },
      functionCall,
      { type: 'function_call_output', call_id: functionCall.call_id, output: JSON.stringify(weatherResult) },
    ],
    tools: [weatherTool],
  }),
});

const data2 = await response2.json();
console.log(data2.output[0].content[0].text);
```

## Streaming with Tools

Real-time monitoring of tool execution:

```typescript
const response = await fetch('https://openrouter.ai/api/v1/responses', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${apiKey}`,
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    model: 'openai/gpt-4o',
    input: 'What is the weather in Tokyo?',
    tools: [weatherTool],
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
        case 'response.function_call.delta':
          console.log('Function call building:', data);
          break;
        case 'response.function_call.done':
          console.log('Function call complete:', data.function_call);
          break;
      }
    }
  }
}
```

## Best Practices

1. **Clear Descriptions**: Provide detailed function descriptions for better model selection
2. **Valid JSON Schemas**: Ensure parameters follow proper JSON Schema format
3. **Error Handling**: Implement robust handling for function execution failures
4. **Independent Tools**: Design tools to work independently for parallel execution
5. **Context Maintenance**: Include tool responses in conversation history for multi-turn interactions
