---
source: https://openrouter.ai/docs/guides/community/openai-sdk
scraped: 2026-01-08
---

# OpenAI SDK

Integrate OpenRouter using the official OpenAI SDK. Complete guide for OpenAI SDK integration with OpenRouter for Python and TypeScript.

## Overview

The OpenAI SDK is fully compatible with OpenRouter's API. Simply change the base URL and use your OpenRouter API key to access 500+ models.

## Python Integration

### Installation

```bash
pip install openai
```

### Basic Setup

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

response = client.chat.completions.create(
    model="openai/gpt-4o",
    messages=[
        {"role": "user", "content": "Hello, world!"}
    ]
)

print(response.choices[0].message.content)
```

### Streaming

```python
from openai import OpenAI

client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

stream = client.chat.completions.create(
    model="anthropic/claude-3.5-sonnet",
    messages=[
        {"role": "user", "content": "Tell me a story"}
    ],
    stream=True
)

for chunk in stream:
    if chunk.choices[0].delta.content:
        print(chunk.choices[0].delta.content, end="", flush=True)
```

### Async Usage

```python
from openai import AsyncOpenAI
import asyncio

client = AsyncOpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

async def main():
    response = await client.chat.completions.create(
        model="openai/gpt-4o",
        messages=[
            {"role": "user", "content": "Hello, world!"}
        ]
    )
    print(response.choices[0].message.content)

asyncio.run(main())
```

## TypeScript Integration

### Installation

```bash
npm install openai
```

### Basic Setup

```typescript
import OpenAI from "openai";

const client = new OpenAI({
  baseURL: "https://openrouter.ai/api/v1",
  apiKey: process.env.OPENROUTER_API_KEY
});

const response = await client.chat.completions.create({
  model: "openai/gpt-4o",
  messages: [
    { role: "user", content: "Hello, world!" }
  ]
});

console.log(response.choices[0].message.content);
```

### Streaming

```typescript
import OpenAI from "openai";

const client = new OpenAI({
  baseURL: "https://openrouter.ai/api/v1",
  apiKey: process.env.OPENROUTER_API_KEY
});

const stream = await client.chat.completions.create({
  model: "anthropic/claude-3.5-sonnet",
  messages: [
    { role: "user", content: "Tell me a story" }
  ],
  stream: true
});

for await (const chunk of stream) {
  const content = chunk.choices[0]?.delta?.content;
  if (content) {
    process.stdout.write(content);
  }
}
```

## Optional Headers

OpenRouter supports additional headers for tracking and customization:

```python
response = client.chat.completions.create(
    model="openai/gpt-4o",
    messages=[{"role": "user", "content": "Hello"}],
    extra_headers={
        "HTTP-Referer": "https://your-site.com",
        "X-Title": "Your App Name"
    }
)
```

```typescript
const response = await client.chat.completions.create({
  model: "openai/gpt-4o",
  messages: [{ role: "user", content: "Hello" }]
}, {
  headers: {
    "HTTP-Referer": "https://your-site.com",
    "X-Title": "Your App Name"
  }
});
```

## Environment Variables

```bash
export OPENROUTER_API_KEY=sk-or-v1-...
```

## Model Selection

Use the format `provider/model-name`:

| Model ID | Description |
|----------|-------------|
| `openai/gpt-4o` | GPT-4o latest |
| `openai/gpt-4o-mini` | GPT-4o Mini |
| `anthropic/claude-3.5-sonnet` | Claude 3.5 Sonnet |
| `anthropic/claude-3-opus` | Claude 3 Opus |
| `google/gemini-2.0-flash` | Gemini 2.0 Flash |
| `meta-llama/llama-3.3-70b-instruct` | Llama 3.3 70B |

---

*For more information, visit the [OpenAI SDK documentation](https://platform.openai.com/docs) and [OpenRouter API reference](https://openrouter.ai/docs).*
