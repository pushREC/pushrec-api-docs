---
source: https://openrouter.ai/docs/sdks/call-model/api-reference
scraped: 2026-01-08
---

# API Reference

## Core Functions

### callModel

The primary function for creating responses through the OpenResponses API with flexible consumption patterns.

```typescript
const result = openrouter.callModel(options: CallModelInput);
```

Either a `model` string or `models` array must be specified.

## ModelResult

The `ModelResult` object provides multiple ways to consume responses:

### Text Methods

| Method | Description |
|--------|-------------|
| `getText()` | Returns the complete text content |
| `getTextStream()` | Returns an async iterable of text chunks |

### Tool Methods

| Method | Description |
|--------|-------------|
| `getToolCalls()` | Returns all tool calls from the response |
| `getToolCallsStream()` | Returns an async iterable of tool calls |

### Response Methods

| Method | Description |
|--------|-------------|
| `getFullResponsesStream()` | Returns comprehensive event streaming |
| `getResponse()` | Returns the full response object with usage metrics |

### Control Methods

| Method | Description |
|--------|-------------|
| `cancel()` | Terminates the request |

## Tool System

### tool() Function

Creates type-safe tools with Zod schema validation:

```typescript
import { tool } from '@openrouter/sdk';
import { z } from 'zod';

const myTool = tool({
  name: 'my_tool',
  description: 'Description of what the tool does',
  inputSchema: z.object({
    param: z.string().describe('Parameter description'),
  }),
  outputSchema: z.object({
    result: z.string(),
  }),
  execute: async ({ params }) => {
    return { result: 'value' };
  },
});
```

### Tool Types

| Type | Description |
|------|-------------|
| `ToolWithExecute` | Functions with immediate execution |
| `ToolWithGenerator` | Tools producing event streams |
| `ManualTool` | Tools without automatic execution |

## CallModelInput Options

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `model` | `string` | Single model identifier |
| `models` | `string[]` | Array of fallback models |

### Input Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `input` | `string \| Message[]` | The prompt or conversation history |
| `instructions` | `string` | System instructions for the model |

### Generation Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `temperature` | `number` | Controls randomness (0-2) |
| `topP` | `number` | Nucleus sampling threshold |
| `topK` | `number` | Top-k sampling limit |
| `maxOutputTokens` | `number` | Maximum tokens to generate |

### Reasoning Configuration

| Parameter | Type | Description |
|-----------|------|-------------|
| `reasoning` | `object` | Extended thinking configuration |

### Provider Routing

| Parameter | Type | Description |
|-----------|------|-------------|
| `provider` | `object` | Provider routing preferences |

### Tool Execution Settings

| Parameter | Type | Description |
|-----------|------|-------------|
| `tools` | `Tool[]` | Array of tools available to the model |
| `maxToolRounds` | `number \| Function` | Limits execution rounds |
| `parallelToolCalls` | `boolean` | Enable parallel tool execution |

### Session Tracking

| Parameter | Type | Description |
|-----------|------|-------------|
| `sessionId` | `string` | Session identifier |
| `userId` | `string` | User identifier |

## Stop Condition Helpers

Built-in functions for controlling execution flow:

| Helper | Description |
|--------|-------------|
| `stepCountIs(n)` | Stop after n steps |
| `hasToolCall(name)` | Stop when a specific tool is called |
| `maxTokensUsed(n)` | Stop after n tokens consumed |
| `maxCost(amount)` | Stop at a spending limit |

## Format Converters

Support for interoperability between SDK formats:

| Function | Description |
|----------|-------------|
| `fromChatMessages()` | Convert OpenAI format to OpenResponses |
| `toChatMessage()` | Convert OpenResponses to OpenAI format |
| `fromClaudeMessages()` | Convert Claude format to OpenResponses |
| `toClaudeMessage()` | Convert OpenResponses to Claude format |

## Type Utilities

| Utility | Description |
|---------|-------------|
| `InferToolInput<T>` | Extract input type from a tool |
| `InferToolOutput<T>` | Extract output type from a tool |
| `InferToolEvent<T>` | Extract event type from a generator tool |
