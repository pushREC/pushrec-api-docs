---
source: https://openrouter.ai/docs/sdks/call-model/dynamic-parameters
scraped: 2026-01-08
---

# Dynamic Parameters

## Overview

The documentation explains how to use async functions to compute `callModel` parameters dynamically, enabling adaptive behavior throughout conversations.

## Core Concept

Any parameter in `callModel` can be a function that computes its value based on conversation context, allowing developers to modify models, temperature, and instructions as conversations evolve.

```typescript
const result = openrouter.callModel({
  model: (ctx) => ctx.numberOfTurns > 3 ? 'openai/gpt-4o' : 'openai/gpt-4o-mini',
  input: 'What is the capital of France?',
});
```

## TurnContext Properties

Functions receive a `TurnContext` object with the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `numberOfTurns` | `number` | Current turn number (1-indexed) |
| `turnRequest` | `object` | Current request object with messages and settings |
| `toolCall` | `object \| undefined` | Specific tool being executed (if applicable) |

## Function Signature

```typescript
type DynamicParameter<T> = T | ((ctx: TurnContext) => T | Promise<T>);
```

Functions receive a `TurnContext` and return parameter values synchronously or asynchronously.

## Practical Applications

### 1. Progressive Model Upgrade

Start with fast models, escalate to capable ones for complex tasks:

```typescript
const result = openrouter.callModel({
  model: (ctx) => {
    if (ctx.numberOfTurns > 5) {
      return 'anthropic/claude-3-opus';
    }
    return 'openai/gpt-4o-mini';
  },
  input: messages,
});
```

### 2. Adaptive Temperature

Adjust creativity levels based on task type:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  temperature: (ctx) => {
    const lastMessage = ctx.turnRequest.messages.at(-1);
    if (lastMessage?.content?.includes('creative')) {
      return 1.0; // Creative tasks
    }
    return 0.2; // Precise tasks
  },
  input: messages,
});
```

### 3. Context-Aware Instructions

Tailor guidance based on conversation length:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  instructions: (ctx) => {
    if (ctx.numberOfTurns === 1) {
      return 'You are a helpful assistant. Introduce yourself briefly.';
    }
    return 'You are a helpful assistant. Continue the conversation naturally.';
  },
  input: messages,
});
```

### 4. Dynamic Max Tokens

Vary output length based on request type:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  maxOutputTokens: (ctx) => {
    const lastMessage = ctx.turnRequest.messages.at(-1);
    if (lastMessage?.content?.includes('summary')) {
      return 200;
    }
    return 2000;
  },
  input: messages,
});
```

### 5. Feature Flags

Enable capabilities like extended thinking for complex turns:

```typescript
const result = openrouter.callModel({
  model: 'anthropic/claude-3-opus',
  reasoning: (ctx) => {
    if (ctx.numberOfTurns > 3) {
      return { effort: 'high' };
    }
    return undefined;
  },
  input: messages,
});
```

## Best Practices

| Practice | Description |
|----------|-------------|
| **Pure Functions** | Maintain pure functions without side effects |
| **Caching** | Cache expensive operations to avoid repeated lookups |
| **Defaults** | Use sensible defaults for fallback scenarios |
| **Error Handling** | Implement error handling for async operations |

## Execution Flow

Parameters resolve at each turn's start following this sequence:

1. Dynamic parameters are evaluated
2. Request is built with resolved values
3. Request sent to model
4. Tools executed (if any)
5. Stop conditions checked
6. Process repeats for next turn (if not stopped)

## Example: Complete Dynamic Configuration

```typescript
const result = openrouter.callModel({
  model: async (ctx) => {
    // Could fetch from a configuration service
    const config = await getModelConfig(ctx.numberOfTurns);
    return config.model;
  },
  temperature: (ctx) => ctx.numberOfTurns > 2 ? 0.7 : 0.3,
  maxOutputTokens: (ctx) => Math.min(ctx.numberOfTurns * 500, 4000),
  instructions: (ctx) => {
    const phase = ctx.numberOfTurns <= 2 ? 'exploration' : 'refinement';
    return `You are in the ${phase} phase. Act accordingly.`;
  },
  input: messages,
});
```
