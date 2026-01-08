---
source: https://openrouter.ai/docs/guides/community/mastra
scraped: 2026-01-08
---

# Mastra

Integrate OpenRouter using Mastra framework for unified AI model access.

## Overview

Mastra is a TypeScript framework for building AI applications. It provides a unified interface for accessing multiple AI providers, including OpenRouter's 500+ models.

## Installation

```bash
npm install mastra @mastra/openrouter
```

## Configuration

```typescript
import { Mastra } from "mastra";
import { OpenRouterProvider } from "@mastra/openrouter";

const mastra = new Mastra({
  providers: {
    openrouter: new OpenRouterProvider({
      apiKey: process.env.OPENROUTER_API_KEY
    })
  }
});
```

## Basic Usage

```typescript
import { Mastra } from "mastra";

const mastra = new Mastra({
  // ... configuration
});

// Generate text
const response = await mastra.generate({
  provider: "openrouter",
  model: "openai/gpt-4o",
  messages: [
    { role: "user", content: "Hello, world!" }
  ]
});

console.log(response.text);
```

## Streaming

```typescript
const stream = await mastra.stream({
  provider: "openrouter",
  model: "anthropic/claude-3.5-sonnet",
  messages: [
    { role: "user", content: "Tell me a story" }
  ]
});

for await (const chunk of stream) {
  process.stdout.write(chunk.text);
}
```

## Agent Integration

```typescript
import { Agent } from "mastra";

const agent = new Agent({
  name: "Assistant",
  provider: "openrouter",
  model: "openai/gpt-4o",
  instructions: "You are a helpful assistant."
});

const response = await agent.run("What is the weather?");
```

## Features

- **Unified API** - Single interface for all providers
- **Type Safety** - Full TypeScript support
- **Streaming** - Real-time token streaming
- **Agents** - Build AI agents with tools
- **Model Switching** - Easy model swapping

## Available Models

Access 500+ models through OpenRouter:

```typescript
// OpenAI models
model: "openai/gpt-4o"
model: "openai/gpt-4o-mini"

// Anthropic models
model: "anthropic/claude-3.5-sonnet"
model: "anthropic/claude-3-opus"

// Google models
model: "google/gemini-2.0-flash"

// Open source models
model: "meta-llama/llama-3.3-70b-instruct"
model: "mistralai/mistral-large"
```

---

*For more information, visit the [Mastra documentation](https://mastra.dev).*
