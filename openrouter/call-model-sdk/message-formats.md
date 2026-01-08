---
source: https://openrouter.ai/docs/sdks/call-model/message-formats
scraped: 2026-01-08
---

# Message Formats

## Overview

The OpenRouter SDK provides converter functions for interoperability between different LLM SDK message formats.

## Core Conversion Functions

### OpenAI Chat Format

#### fromChatMessages()

Transforms OpenAI-style messages into OpenResponses format:

```typescript
import { fromChatMessages } from '@openrouter/sdk';

const chatMessages = [
  { role: 'system', content: 'You are a helpful assistant.' },
  { role: 'user', content: 'Hello!' },
  { role: 'assistant', content: 'Hi there! How can I help?' },
  { role: 'user', content: 'What is 2+2?' },
];

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: fromChatMessages(chatMessages),
});
```

**Supported Roles:**

| Role | Description |
|------|-------------|
| `system` | System instructions |
| `user` | User messages |
| `assistant` | Assistant responses |
| `developer` | Developer instructions |
| `tool` | Tool results |

#### toChatMessage()

Converts responses back to chat message format:

```typescript
import { toChatMessage } from '@openrouter/sdk';

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: 'Hello',
});

const response = await result.getResponse();
const chatMessage = toChatMessage(response);
// { role: 'assistant', content: '...' }
```

### Anthropic Claude Format

#### fromClaudeMessages()

Handles Claude-formatted messages:

```typescript
import { fromClaudeMessages } from '@openrouter/sdk';

const claudeMessages = [
  {
    role: 'user',
    content: [
      { type: 'text', text: 'Describe this image.' },
      {
        type: 'image',
        source: {
          type: 'url',
          url: 'https://example.com/image.jpg',
        },
      },
    ],
  },
];

const result = openrouter.callModel({
  model: 'anthropic/claude-3-opus',
  input: fromClaudeMessages(claudeMessages),
});
```

#### toClaudeMessage()

Converts responses to Claude compatibility:

```typescript
import { toClaudeMessage } from '@openrouter/sdk';

const result = openrouter.callModel({
  model: 'anthropic/claude-3-opus',
  input: 'Hello',
});

const response = await result.getResponse();
const claudeMessage = toClaudeMessage(response);
```

## Content Block Support

Claude's content system allows structured message composition with multiple content types:

### Text Content

```typescript
const message = {
  role: 'user',
  content: [
    { type: 'text', text: 'First paragraph.' },
    { type: 'text', text: 'Second paragraph.' },
  ],
};
```

### Image Content (URL)

```typescript
const message = {
  role: 'user',
  content: [
    { type: 'text', text: 'What is in this image?' },
    {
      type: 'image',
      source: {
        type: 'url',
        url: 'https://example.com/photo.jpg',
      },
    },
  ],
};
```

### Image Content (Base64)

```typescript
const message = {
  role: 'user',
  content: [
    { type: 'text', text: 'Analyze this image.' },
    {
      type: 'image',
      source: {
        type: 'base64',
        media_type: 'image/png',
        data: 'iVBORw0KGgo...base64data...',
      },
    },
  ],
};
```

## Tool Handling

Tool handling is preserved across formats.

### OpenAI Tool Calls

```typescript
const messages = [
  { role: 'user', content: 'What is the weather in Paris?' },
  {
    role: 'assistant',
    content: null,
    tool_calls: [
      {
        id: 'call_123',
        type: 'function',
        function: {
          name: 'get_weather',
          arguments: '{"city": "Paris"}',
        },
      },
    ],
  },
  {
    role: 'tool',
    tool_call_id: 'call_123',
    content: '{"temperature": 20, "condition": "sunny"}',
  },
];

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: fromChatMessages(messages),
});
```

### Claude Tool Use

```typescript
const claudeMessages = [
  { role: 'user', content: 'What is the weather in Paris?' },
  {
    role: 'assistant',
    content: [
      {
        type: 'tool_use',
        id: 'tool_123',
        name: 'get_weather',
        input: { city: 'Paris' },
      },
    ],
  },
  {
    role: 'user',
    content: [
      {
        type: 'tool_result',
        tool_use_id: 'tool_123',
        content: '{"temperature": 20, "condition": "sunny"}',
      },
    ],
  },
];

const result = openrouter.callModel({
  model: 'anthropic/claude-3-opus',
  input: fromClaudeMessages(claudeMessages),
});
```

**Note:** Some Claude-specific features like the `is_error` flag don't convert to other formats since they're proprietary to Anthropic's system.

## Migration Patterns

### Migrating from OpenAI SDK

Replace the client initialization and wrap message arrays with `fromChatMessages()`:

**Before (OpenAI SDK):**

```typescript
import OpenAI from 'openai';

const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

const response = await openai.chat.completions.create({
  model: 'gpt-4o',
  messages: [
    { role: 'system', content: 'You are a helpful assistant.' },
    { role: 'user', content: 'Hello!' },
  ],
});
```

**After (OpenRouter SDK):**

```typescript
import { OpenRouter, fromChatMessages } from '@openrouter/sdk';

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

const result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: fromChatMessages([
    { role: 'system', content: 'You are a helpful assistant.' },
    { role: 'user', content: 'Hello!' },
  ]),
});

const text = await result.getText();
```

### Migrating from Anthropic SDK

Use `fromClaudeMessages()` with equivalent parameters:

**Before (Anthropic SDK):**

```typescript
import Anthropic from '@anthropic-ai/sdk';

const anthropic = new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY });

const response = await anthropic.messages.create({
  model: 'claude-3-opus-20240229',
  max_tokens: 1000,
  messages: [{ role: 'user', content: 'Hello!' }],
});
```

**After (OpenRouter SDK):**

```typescript
import { OpenRouter, fromClaudeMessages } from '@openrouter/sdk';

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

const result = openrouter.callModel({
  model: 'anthropic/claude-3-opus',
  maxOutputTokens: 1000,
  input: fromClaudeMessages([{ role: 'user', content: 'Hello!' }]),
});

const text = await result.getText();
```

## Multi-Turn Conversation Example

Accumulating messages across API calls for sustained dialogue:

```typescript
import { OpenRouter, fromChatMessages, toChatMessage } from '@openrouter/sdk';

const openrouter = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

// Start conversation
let messages = [
  { role: 'system', content: 'You are a helpful assistant.' },
  { role: 'user', content: 'My name is Alice.' },
];

// First turn
let result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: fromChatMessages(messages),
});

let response = await result.getResponse();
messages.push(toChatMessage(response));

// Second turn
messages.push({ role: 'user', content: 'What is my name?' });

result = openrouter.callModel({
  model: 'openai/gpt-4o',
  input: fromChatMessages(messages),
});

const text = await result.getText();
console.log(text); // "Your name is Alice."
```

## Conversion Function Summary

| Function | From | To |
|----------|------|-----|
| `fromChatMessages()` | OpenAI chat format | OpenResponses format |
| `toChatMessage()` | OpenResponses format | OpenAI chat format |
| `fromClaudeMessages()` | Claude format | OpenResponses format |
| `toClaudeMessage()` | OpenResponses format | Claude format |
