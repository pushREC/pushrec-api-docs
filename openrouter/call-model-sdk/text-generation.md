---
source: https://openrouter.ai/docs/sdks/call-model/text-generation
scraped: 2026-01-08
---

# Text Generation

## Overview

The documentation covers using `callModel` for text generation, including input handling, model selection, system instructions, and response management.

## Installation

```bash
npm install @openrouter/sdk zod
```

## Basic Setup

```typescript
import { OpenRouter } from '@openrouter/sdk';

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});
```

## Input Formats

### String Input

Simple text becomes a user message:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'What is the capital of France?',
});

const text = await result.getText();
console.log(text); // "The capital of France is Paris."
```

### Message Arrays

Support multi-turn conversations with alternating user and assistant roles:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: [
    { role: 'user', content: 'My name is Alice.' },
    { role: 'assistant', content: 'Hello Alice! How can I help you today?' },
    { role: 'user', content: 'What is my name?' },
  ],
});

const text = await result.getText();
console.log(text); // "Your name is Alice."
```

### Multimodal Input

Enables image analysis by combining text and image content in a single request:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: [
    {
      role: 'user',
      content: [
        { type: 'text', text: 'What is in this image?' },
        {
          type: 'image_url',
          image_url: { url: 'https://example.com/image.jpg' },
        },
      ],
    },
  ],
});

const text = await result.getText();
```

## System Instructions

Shape model behavior via the `instructions` parameter to customize responses:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  instructions: 'You are a helpful assistant that responds in haiku format.',
  input: 'Describe the ocean.',
});

const text = await result.getText();
```

## Model Selection

### Single Model

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Hello',
});
```

### Fallback Models

Provide fallback options - the SDK will try each model in order until one succeeds:

```typescript
const result = openrouter.callModel({
  models: ['openai/gpt-4o', 'anthropic/claude-3-opus', 'google/gemini-pro'],
  input: 'Hello',
});
```

## Generation Parameters

Control output through these parameters:

| Parameter | Type | Range | Description |
|-----------|------|-------|-------------|
| `temperature` | `number` | 0-2 | Controls randomness |
| `maxOutputTokens` | `number` | - | Maximum tokens to generate |
| `topP` | `number` | 0-1 | Nucleus sampling threshold |
| `topK` | `number` | - | Top-k sampling limit |

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Write a creative story.',
  temperature: 0.9,
  maxOutputTokens: 1000,
  topP: 0.95,
});
```

## Response Handling

### getText()

Returns processed text content:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Hello',
});

const text = await result.getText();
console.log(text);
```

### getResponse()

Provides full response objects with usage metrics:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Hello',
});

const response = await result.getResponse();
console.log({
  content: response.content,
  inputTokens: response.usage.inputTokens,
  outputTokens: response.usage.outputTokens,
  cachedTokens: response.usage.cachedTokens,
});
```

## Error Management

### Common Status Codes

| Status | Description |
|--------|-------------|
| 401 | Invalid credentials |
| 429 | Rate limiting |
| 503 | Model unavailable |

### Error Handling Example

```typescript
try {
  const result = openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'Hello',
  });
  const text = await result.getText();
} catch (error) {
  if (error.status === 401) {
    console.error('Invalid API key');
  } else if (error.status === 429) {
    console.error('Rate limited, try again later');
  } else if (error.status === 503) {
    console.error('Model unavailable');
  } else {
    console.error('Unexpected error:', error);
  }
}
```

## Structured Output

Request JSON-formatted responses:

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  instructions: 'Respond with valid JSON only.',
  input: 'List 3 colors with their hex codes.',
});

const text = await result.getText();
const data = JSON.parse(text);
```

## Concurrent Requests

Execute multiple independent `callModel` calls simultaneously:

```typescript
const [result1, result2, result3] = await Promise.all([
  openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'What is 2+2?',
  }).getText(),
  openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'What is 3+3?',
  }).getText(),
  openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'What is 4+4?',
  }).getText(),
]);

console.log(result1, result2, result3);
```

## Streaming

For real-time response delivery, see the [Streaming documentation](./streaming.md):

```typescript
const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Write a long story.',
});

for await (const chunk of result.getTextStream()) {
  process.stdout.write(chunk);
}
```

## Complete Example

```typescript
import { OpenRouter } from '@openrouter/sdk';

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

async function main() {
  // Simple generation
  const simple = await openrouter.callModel({
    model: 'openai/gpt-4o',
    input: 'Explain quantum computing briefly.',
  }).getText();
  console.log('Simple:', simple);

  // With instructions and parameters
  const detailed = await openrouter.callModel({
    model: 'openai/gpt-4o',
    instructions: 'You are a physics professor. Explain concepts clearly.',
    input: 'What is quantum entanglement?',
    temperature: 0.3,
    maxOutputTokens: 500,
  }).getText();
  console.log('Detailed:', detailed);

  // Multi-turn conversation
  const conversation = await openrouter.callModel({
    model: 'openai/gpt-4o',
    input: [
      { role: 'user', content: 'I want to learn about black holes.' },
      { role: 'assistant', content: 'Great topic! What aspect interests you most?' },
      { role: 'user', content: 'How do they form?' },
    ],
  }).getText();
  console.log('Conversation:', conversation);
}

main();
```
