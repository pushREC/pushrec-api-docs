---
source: https://openrouter.ai/docs/guides/community/effect-ai-sdk
scraped: 2026-01-08
---

# Effect AI SDK

Integrate OpenRouter using the Effect AI SDK. Complete guide for integrating the Effect AI SDK with OpenRouter.

## Overview

The Effect AI SDK provides a functional programming approach to integrating with OpenRouter's API, leveraging the Effect library for TypeScript.

## Installation

```bash
npm install @effect/ai @effect/ai-openai
```

## Basic Usage

```typescript
import { OpenAiClient } from "@effect/ai-openai"
import { Effect, Layer } from "effect"

const OpenRouterClient = OpenAiClient.layer({
  baseUrl: "https://openrouter.ai/api/v1",
  apiKey: process.env.OPENROUTER_API_KEY
})

const program = Effect.gen(function* () {
  const client = yield* OpenAiClient.OpenAiClient

  const response = yield* client.chat.completions.create({
    model: "openai/gpt-4o",
    messages: [
      { role: "user", content: "Hello, world!" }
    ]
  })

  return response
})

Effect.runPromise(
  program.pipe(Effect.provide(OpenRouterClient))
)
```

## Configuration

Set your OpenRouter API key as an environment variable:

```bash
export OPENROUTER_API_KEY=sk-or-v1-...
```

## Key Features

- Type-safe API client with Effect's error handling
- Composable and testable code structure
- Built-in retry and timeout handling
- Compatible with OpenRouter's model selection

---

*For more information, visit the [Effect AI SDK documentation](https://github.com/Effect-TS/effect).*
