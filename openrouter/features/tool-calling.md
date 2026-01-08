---
source: https://openrouter.ai/docs/guides/features/tool-calling
scraped: 2026-01-08
---

# Tool & Function Calling

OpenRouter standardizes tool calling (function calling) across multiple AI models and providers. This feature enables LLMs to request external tools without directly executing them—the user's system executes the tool and returns results to the model.

## Core Workflow

The process involves three sequential steps:

1. **Initial Request**: Send a prompt with available tools defined
2. **Tool Execution**: Execute the model's requested tool locally
3. **Follow-up Request**: Send tool results back to the model for final response generation

## Request Structure

### Step 1: Initial Inference Request

Define tools in the request body with function specifications including name, description, and parameter schemas.

```json
{
  "model": "openai/gpt-4",
  "messages": [
    {"role": "user", "content": "Search for books about AI"}
  ],
  "tools": [
    {
      "type": "function",
      "function": {
        "name": "search_books",
        "description": "Search for books in the Project Gutenberg library",
        "parameters": {
          "type": "object",
          "properties": {
            "query": {
              "type": "string",
              "description": "The search query"
            }
          },
          "required": ["query"]
        }
      }
    }
  ]
}
```

### Step 2: Client-Side Execution

After the model responds with `tool_calls`, execute the requested function locally using the provided arguments.

```typescript
// Model responds with tool_calls
const toolCall = response.choices[0].message.tool_calls[0];
const args = JSON.parse(toolCall.function.arguments);

// Execute locally
const result = await searchBooks(args.query);
```

### Step 3: Follow-up Request

Include the original messages, assistant's tool call request, tool results, and tool definitions again (required for validation).

```json
{
  "model": "openai/gpt-4",
  "messages": [
    {"role": "user", "content": "Search for books about AI"},
    {"role": "assistant", "tool_calls": [...]},
    {
      "role": "tool",
      "tool_call_id": "call_abc123",
      "content": "{\"results\": [...]}"
    }
  ],
  "tools": [...]
}
```

## Key Implementation Points

- Map tool calls to local functions
- Parse tool call arguments from JSON
- Return results as structured data
- Include tools parameter in every request

## Advanced Features

### Interleaved Thinking

Models can reason between tool calls for sophisticated multi-step decision-making, though this increases token usage.

### Agentic Loops

Implement autonomous cycles where the model iteratively calls tools until completion, with safeguards like maximum iteration limits.

```typescript
let iterations = 0;
const MAX_ITERATIONS = 10;

while (iterations < MAX_ITERATIONS) {
  const response = await openrouter.chat.completions.create({...});

  if (!response.choices[0].message.tool_calls) {
    break; // Model is done calling tools
  }

  // Execute tools and continue loop
  iterations++;
}
```

## Best Practices

- Use descriptive function names clearly indicating purpose
- Provide comprehensive descriptions explaining when/how to use tools
- Define parameter schemas with detailed property descriptions
- Control tool usage via `tool_choice` parameter ("auto", "none", or specific function)
- Use `parallel_tool_calls: false` for sequential execution
- Design complementary tools that chain naturally together

## Tool Choice Options

| Value | Behavior |
|-------|----------|
| `"auto"` | Model decides whether to call tools |
| `"none"` | Model will not call any tools |
| `{"type": "function", "function": {"name": "func_name"}}` | Force specific function |

## Supported Models

Filter available models at openrouter.ai/models supporting the tools parameter.
