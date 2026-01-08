---
source: https://openrouter.ai/docs/sdks/call-model/tools
scraped: 2026-01-08
---

# Tools

## Overview

The OpenRouter SDK provides a `tool()` helper function for creating type-safe tools with Zod schema validation for language models. The SDK supports three tool types: regular tools, generator tools with progress tracking, and manual tools requiring user handling.

## Installation

```bash
npm install @openrouter/sdk zod
```

## Core Tool Types

### Regular Tools

Execute synchronously with an input and output schema:

```typescript
import { tool } from '@openrouter/sdk';
import { z } from 'zod';

const calculatorTool = tool({
  name: 'calculator',
  description: 'Perform basic math calculations',
  inputSchema: z.object({
    operation: z.enum(['add', 'subtract', 'multiply', 'divide']),
    a: z.number(),
    b: z.number(),
  }),
  outputSchema: z.object({
    result: z.number(),
  }),
  execute: async ({ params }) => {
    const { operation, a, b } = params;
    let result: number;
    switch (operation) {
      case 'add': result = a + b; break;
      case 'subtract': result = a - b; break;
      case 'multiply': result = a * b; break;
      case 'divide': result = a / b; break;
    }
    return { result };
  },
});
```

### Generator Tools

Yield progress updates during execution using an additional `eventSchema`:

```typescript
const reportGeneratorTool = tool({
  name: 'generate_report',
  description: 'Generate a detailed report with progress updates',
  inputSchema: z.object({
    topic: z.string(),
    sections: z.number(),
  }),
  outputSchema: z.object({
    report: z.string(),
  }),
  eventSchema: z.object({
    section: z.number(),
    content: z.string(),
  }),
  execute: async function* ({ params }) {
    const { topic, sections } = params;
    let report = '';

    for (let i = 1; i <= sections; i++) {
      const sectionContent = `Section ${i}: Content about ${topic}`;
      report += sectionContent + '\n';

      // Yield progress event
      yield { section: i, content: sectionContent };
    }

    return { report };
  },
});
```

### Manual Tools

Skip automatic execution, allowing you to handle tool calls yourself:

```typescript
const manualTool = tool({
  name: 'user_confirmation',
  description: 'Request user confirmation',
  inputSchema: z.object({
    message: z.string(),
  }),
  outputSchema: z.object({
    confirmed: z.boolean(),
  }),
  // No execute function - handled manually
});

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Ask for user confirmation',
  tools: [manualTool],
});

// Handle tool calls manually
const toolCalls = await result.getToolCalls();
for (const call of toolCalls) {
  if (call.name === 'user_confirmation') {
    // Prompt user for confirmation
    const confirmed = await promptUser(call.arguments.message);
    // Continue conversation with result
  }
}
```

## TurnContext

Tools receive a `TurnContext` parameter containing:

| Property | Description |
|----------|-------------|
| `numberOfTurns` | Current turn number (1-indexed) |
| `turnRequest` | Current request details |
| `toolCall` | Specific tool call being executed |

```typescript
const contextAwareTool = tool({
  name: 'context_tool',
  description: 'A tool that uses context',
  inputSchema: z.object({ query: z.string() }),
  outputSchema: z.object({ result: z.string() }),
  execute: async ({ params, context }) => {
    console.log('Turn number:', context.numberOfTurns);
    console.log('Tool call ID:', context.toolCall.id);
    return { result: `Processed: ${params.query}` };
  },
});
```

## Schema Descriptions

Use `.describe()` methods to help models understand parameters:

```typescript
const searchTool = tool({
  name: 'search',
  description: 'Search for information on the web',
  inputSchema: z.object({
    query: z.string().describe('The search query to look up'),
    limit: z.number().optional().describe('Maximum number of results (default: 10)'),
    filter: z.enum(['all', 'recent', 'popular']).describe('Filter type for results'),
  }),
  outputSchema: z.object({
    results: z.array(z.object({
      title: z.string(),
      url: z.string(),
      snippet: z.string(),
    })).describe('List of search results'),
  }),
  execute: async ({ params }) => {
    // Implementation
  },
});
```

## Type Utilities

Extract types from tools for type-safe usage:

```typescript
import { InferToolInput, InferToolOutput, InferToolEvent } from '@openrouter/sdk';

type CalculatorInput = InferToolInput<typeof calculatorTool>;
// { operation: 'add' | 'subtract' | 'multiply' | 'divide'; a: number; b: number }

type CalculatorOutput = InferToolOutput<typeof calculatorTool>;
// { result: number }

type ReportEvent = InferToolEvent<typeof reportGeneratorTool>;
// { section: number; content: string }
```

## Execution Control

### maxToolRounds

Limits execution rounds as either a number or function:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Help me with calculations',
  tools: [calculatorTool],
  maxToolRounds: 5, // Maximum 5 rounds of tool execution
});

// Or as a function
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Complex task',
  tools: [tool1, tool2],
  maxToolRounds: (ctx) => ctx.numberOfTurns > 3 ? 1 : 3,
});
```

Setting `maxToolRounds` to 0 disables automatic execution.

### Parallel Tool Calls

Tools execute in parallel when the model calls multiple tools simultaneously:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Get weather for Paris, London, and Tokyo',
  tools: [weatherTool],
  parallelToolCalls: true, // Enable parallel execution
});
```

## Streaming and Access

### getToolStream()

Streams both argument deltas and preliminary results from generator tools:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Generate a report',
  tools: [reportGeneratorTool],
});

for await (const event of result.getToolStream()) {
  if (event.type === 'arguments_delta') {
    console.log('Building arguments:', event.delta);
  } else if (event.type === 'preliminary_result') {
    console.log('Progress:', event.result);
  } else if (event.type === 'final_result') {
    console.log('Complete:', event.result);
  }
}
```

### getToolCallsStream()

Processes tool calls as they arrive:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Use the tools',
  tools: [tool1, tool2],
});

for await (const toolCall of result.getToolCallsStream()) {
  console.log('Tool:', toolCall.name);
  console.log('Args:', toolCall.arguments);
  console.log('Result:', toolCall.result);
}
```

## Error Handling

### Automatic Error Handling

Execution errors are caught and sent back to the model for response handling:

```typescript
const errorProneToolTool = tool({
  name: 'risky_operation',
  description: 'An operation that might fail',
  inputSchema: z.object({ input: z.string() }),
  outputSchema: z.object({ result: z.string() }),
  execute: async ({ params }) => {
    if (params.input === 'bad') {
      throw new Error('Invalid input provided');
    }
    return { result: 'Success' };
  },
});

// The model will receive the error and can respond appropriately
```

### Graceful Error Returns

Return error objects instead of throwing exceptions when appropriate:

```typescript
const robustTool = tool({
  name: 'robust_operation',
  description: 'An operation with graceful error handling',
  inputSchema: z.object({ url: z.string() }),
  outputSchema: z.object({
    data: z.string().optional(),
    error: z.string().optional(),
  }),
  execute: async ({ params }) => {
    try {
      const response = await fetch(params.url);
      if (!response.ok) {
        return { error: `HTTP ${response.status}: ${response.statusText}` };
      }
      return { data: await response.text() };
    } catch (error) {
      return { error: `Failed to fetch: ${error.message}` };
    }
  },
});
```

### Validation Errors

Invalid arguments fail validation before execution:

```typescript
// If the model provides { a: "not a number", b: 5 } to calculator,
// Zod validation fails before execute() is called
```

## Best Practices

| Practice | Description |
|----------|-------------|
| **Descriptive Names** | Use clear, action-oriented tool names |
| **Detailed Descriptions** | Write descriptions that help models understand when to use the tool |
| **Schema Descriptions** | Add `.describe()` to all parameters |
| **Idempotency** | Design tools to be safely re-executable |
| **Timeout Handling** | Implement timeouts for long-running operations |
| **Pre-validation** | Consider validation before expensive operations |

## Complete Example

```typescript
import { OpenRouter, tool, stepCountIs } from '@openrouter/sdk';
import { z } from 'zod';

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

const weatherTool = tool({
  name: 'get_weather',
  description: 'Get the current weather for a city',
  inputSchema: z.object({
    city: z.string().describe('City name'),
    units: z.enum(['celsius', 'fahrenheit']).optional().describe('Temperature units'),
  }),
  outputSchema: z.object({
    temperature: z.number(),
    condition: z.string(),
    humidity: z.number(),
  }),
  execute: async ({ params }) => {
    // Simulated weather data
    return {
      temperature: params.units === 'fahrenheit' ? 68 : 20,
      condition: 'sunny',
      humidity: 45,
    };
  },
});

const calculatorTool = tool({
  name: 'calculate',
  description: 'Perform a mathematical calculation',
  inputSchema: z.object({
    expression: z.string().describe('Math expression to evaluate'),
  }),
  outputSchema: z.object({
    result: z.number(),
  }),
  execute: async ({ params }) => {
    // Safe evaluation (in production, use a proper math parser)
    const result = eval(params.expression);
    return { result };
  },
});

async function main() {
  const result = openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'What is the weather in Paris? Also calculate 15% of 200.',
    tools: [weatherTool, calculatorTool],
    stopWhen: stepCountIs(5),
  });

  // Stream tool calls
  for await (const toolCall of result.getToolCallsStream()) {
    console.log(`Tool: ${toolCall.name}`);
    console.log(`Result: ${JSON.stringify(toolCall.result)}`);
  }

  // Get final text
  const text = await result.getText();
  console.log('Response:', text);
}

main();
```
