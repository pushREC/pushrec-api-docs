---
source: https://openrouter.ai/docs/sdks/call-model/streaming
scraped: 2026-01-08
---

# Streaming

## Overview

The OpenRouter SDK provides comprehensive streaming capabilities for LLM responses through the `callModel` method.

## Core Streaming Methods

### Text Streaming

The `getTextStream()` method yields small text chunks as they're generated, allowing real-time output display:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Write a short story about a robot.',
});

for await (const chunk of result.getTextStream()) {
  process.stdout.write(chunk);
}
```

### Reasoning Streaming

Models supporting reasoning (o1, Claude with thinking) can stream their reasoning process separately via `getReasoningStream()`, displaying the thinking before final answers:

```typescript
const result = openrouter.callModel({
  model: 'anthropic/claude-3-opus',
  input: 'Solve this complex problem step by step.',
  reasoning: { effort: 'high' },
});

console.log('Reasoning:');
for await (const chunk of result.getReasoningStream()) {
  process.stdout.write(chunk);
}

console.log('\n\nFinal Answer:');
const text = await result.getText();
console.log(text);
```

### Message Streaming

`getNewMessagesStream()` provides incremental updates in OpenResponses format, including assistant messages and tool execution results:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Help me with a task',
  tools: [myTool],
});

for await (const message of result.getNewMessagesStream()) {
  console.log('New message:', message.role, message.content);
}
```

## Advanced Streaming

### Full Event Streaming

The SDK supports full event streaming through `getFullResponsesStream()`, which captures granular events:

- Text deltas
- Reasoning chunks
- Tool arguments
- Generator tool progress

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Complex task',
  tools: [generatorTool],
});

for await (const event of result.getFullResponsesStream()) {
  switch (event.type) {
    case 'text_delta':
      process.stdout.write(event.delta);
      break;
    case 'reasoning_delta':
      console.log('Thinking:', event.delta);
      break;
    case 'tool_call_delta':
      console.log('Tool args:', event.delta);
      break;
    case 'tool_progress':
      console.log('Progress:', event.progress);
      break;
  }
}
```

### Tool Calls Streaming

`getToolCallsStream()` provides structured tool calls as they arrive:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Use the available tools',
  tools: [tool1, tool2],
});

for await (const toolCall of result.getToolCallsStream()) {
  console.log('Tool called:', toolCall.name);
  console.log('Arguments:', toolCall.arguments);
  console.log('Result:', toolCall.result);
}
```

### Tool Stream

`getToolStream()` provides argument deltas and preliminary results from generator tools:

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
    console.log('Preliminary:', event.result);
  }
}
```

## Key Features

### Concurrent Consumers

Multiple consumers can simultaneously read from the same result object using `ReusableReadableStream`:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Generate content',
});

// Multiple consumers reading the same stream
const [text, reasoning] = await Promise.all([
  (async () => {
    let text = '';
    for await (const chunk of result.getTextStream()) {
      text += chunk;
    }
    return text;
  })(),
  (async () => {
    let reasoning = '';
    for await (const chunk of result.getReasoningStream()) {
      reasoning += chunk;
    }
    return reasoning;
  })(),
]);
```

### Cancellation

The `cancel()` method stops generation mid-stream:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Write a very long document',
});

setTimeout(() => {
  result.cancel();
}, 5000); // Cancel after 5 seconds

try {
  for await (const chunk of result.getTextStream()) {
    process.stdout.write(chunk);
  }
} catch (error) {
  if (error.name === 'AbortError') {
    console.log('\nGeneration cancelled');
  }
}
```

## Framework Integration

### React Component Example

```typescript
function StreamingChat({ prompt }: { prompt: string }) {
  const [text, setText] = useState('');
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const result = openrouter.callModel({
      model: 'openai/gpt-4o',
      input: prompt,
    });

    (async () => {
      for await (const chunk of result.getTextStream()) {
        setText(prev => prev + chunk);
      }
      setIsLoading(false);
    })();

    return () => result.cancel();
  }, [prompt]);

  return (
    <div>
      <p>{text}</p>
      {isLoading && <span>Loading...</span>}
    </div>
  );
}
```

### Server-Sent Events Example

```typescript
import { Hono } from 'hono';
import { streamSSE } from 'hono/streaming';

const app = new Hono();

app.get('/stream', (c) => {
  return streamSSE(c, async (stream) => {
    const result = openrouter.callModel({
      model: 'openai/gpt-4o',
      input: c.req.query('prompt') || 'Hello',
    });

    for await (const chunk of result.getTextStream()) {
      await stream.writeSSE({
        data: JSON.stringify({ text: chunk }),
        event: 'message',
      });
    }

    await stream.writeSSE({
      data: JSON.stringify({ done: true }),
      event: 'done',
    });
  });
});
```

## Summary Table

| Method | Returns | Use Case |
|--------|---------|----------|
| `getTextStream()` | Text chunks | Real-time text display |
| `getReasoningStream()` | Reasoning chunks | Show model thinking |
| `getNewMessagesStream()` | Full messages | Track conversation flow |
| `getFullResponsesStream()` | All events | Complete event handling |
| `getToolCallsStream()` | Tool calls | Process tools as they execute |
| `getToolStream()` | Tool deltas | Track tool argument building |
