---
source: https://openrouter.ai/docs/sdks/call-model/overview
scraped: 2026-01-08
---

# Call Model (TypeScript)

## Overview

The `callModel` function provides unified access to 300+ language models through a single API, supporting three primary consumption patterns:

- **Text generation**: Direct response retrieval with usage metrics
- **Streaming responses**: Real-time text, reasoning, and event feeds
- **Tool execution**: Automatic handling of function calls with type safety

## Key Features

### Multiple Response Patterns

The SDK returns a `ModelResult` object enabling flexible consumption:
- Fetch complete responses
- Stream deltas progressively
- Access individual tool calls

### TypeScript Integration

Full type inference ensures compile-time safety for tool parameters and return values.

### Streaming Architecture

Built on reusable streams supporting concurrent consumers across text, reasoning, and event channels.

## Quick Start

The simplest usage retrieves text directly:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-5-nano',
  input: 'What is the capital of France?',
});

const text = await result.getText();
```

## Input Flexibility

The `callModel` function accepts multiple input formats:

- **Simple strings**: Converted to a user message automatically
- **Message arrays**: Following OpenAI conventions for multi-turn conversations
- **System instructions**: For role-based behavior customization

## Available Learning Resources

The documentation includes specialized guides covering:

- Streaming patterns
- Tool creation with Zod schemas
- Message format conversion
- Adaptive parameter handling through async functions

## Next Steps

- [API Reference](./api-reference.md) - Complete function and type definitions
- [Text Generation](./text-generation.md) - Basic text generation patterns
- [Streaming](./streaming.md) - Real-time response streaming
- [Tools](./tools.md) - Creating and using tools with Zod schemas
- [Dynamic Parameters](./dynamic-parameters.md) - Adaptive parameter handling
- [Message Formats](./message-formats.md) - Converting between SDK formats
