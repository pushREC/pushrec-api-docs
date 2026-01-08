---
source: https://openrouter.ai/docs/guides/community/vercel-ai-sdk
scraped: 2026-01-08
---

# Vercel AI SDK

Integrate OpenRouter with Vercel AI SDK for Next.js applications.

## Overview

The Vercel AI SDK provides React hooks and utilities for building AI-powered applications. Use OpenRouter as a provider to access 500+ models in your Next.js apps.

## Installation

```bash
npm install ai @ai-sdk/openai
```

## Configuration

### Environment Variables

```bash
# .env.local
OPENROUTER_API_KEY=sk-or-v1-...
```

### Provider Setup

```typescript
// lib/openrouter.ts
import { createOpenAI } from "@ai-sdk/openai";

export const openrouter = createOpenAI({
  baseURL: "https://openrouter.ai/api/v1",
  apiKey: process.env.OPENROUTER_API_KEY
});
```

## Server-Side Usage

### Route Handler

```typescript
// app/api/chat/route.ts
import { openrouter } from "@/lib/openrouter";
import { streamText } from "ai";

export async function POST(req: Request) {
  const { messages } = await req.json();

  const result = await streamText({
    model: openrouter("openai/gpt-4o"),
    messages
  });

  return result.toDataStreamResponse();
}
```

### Generate Text

```typescript
// app/api/generate/route.ts
import { openrouter } from "@/lib/openrouter";
import { generateText } from "ai";

export async function POST(req: Request) {
  const { prompt } = await req.json();

  const { text } = await generateText({
    model: openrouter("anthropic/claude-3.5-sonnet"),
    prompt
  });

  return Response.json({ text });
}
```

## Client-Side Usage

### useChat Hook

```tsx
// app/page.tsx
"use client";

import { useChat } from "ai/react";

export default function Chat() {
  const { messages, input, handleInputChange, handleSubmit } = useChat();

  return (
    <div>
      {messages.map((m) => (
        <div key={m.id}>
          <strong>{m.role}:</strong> {m.content}
        </div>
      ))}

      <form onSubmit={handleSubmit}>
        <input
          value={input}
          onChange={handleInputChange}
          placeholder="Say something..."
        />
        <button type="submit">Send</button>
      </form>
    </div>
  );
}
```

### useCompletion Hook

```tsx
"use client";

import { useCompletion } from "ai/react";

export default function Completion() {
  const { completion, input, handleInputChange, handleSubmit } = useCompletion();

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <input
          value={input}
          onChange={handleInputChange}
          placeholder="Enter a prompt..."
        />
        <button type="submit">Generate</button>
      </form>
      <p>{completion}</p>
    </div>
  );
}
```

## Streaming with UI

```tsx
// app/api/chat/route.ts
import { openrouter } from "@/lib/openrouter";
import { streamText } from "ai";

export async function POST(req: Request) {
  const { messages } = await req.json();

  const result = await streamText({
    model: openrouter("openai/gpt-4o"),
    messages,
    onFinish: ({ text, usage }) => {
      console.log("Finished:", text);
      console.log("Tokens used:", usage);
    }
  });

  return result.toDataStreamResponse();
}
```

## Structured Output

```typescript
import { openrouter } from "@/lib/openrouter";
import { generateObject } from "ai";
import { z } from "zod";

const PersonSchema = z.object({
  name: z.string(),
  age: z.number(),
  occupation: z.string()
});

const { object } = await generateObject({
  model: openrouter("openai/gpt-4o"),
  schema: PersonSchema,
  prompt: "Generate a fictional person"
});

console.log(object.name, object.age, object.occupation);
```

## Model Selection

| Model ID | Best For |
|----------|----------|
| `openai/gpt-4o` | General purpose, reasoning |
| `anthropic/claude-3.5-sonnet` | Long context, analysis |
| `google/gemini-2.0-flash` | Fast responses |
| `meta-llama/llama-3.3-70b-instruct` | Open source |

## OpenRouter Headers

```typescript
const result = await streamText({
  model: openrouter("openai/gpt-4o"),
  messages,
  headers: {
    "HTTP-Referer": "https://your-site.com",
    "X-Title": "Your App Name"
  }
});
```

---

*For more information, visit the [Vercel AI SDK documentation](https://sdk.vercel.ai).*
