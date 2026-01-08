---
source: https://openrouter.ai/docs/guides/community/langfuse
scraped: 2026-01-08
---

# Langfuse

Observability and tracing with OpenRouter. Complete guide for Langfuse integration with OpenRouter for Python applications.

## Overview

Langfuse provides observability, analytics, and debugging tools for LLM applications. Integrate with OpenRouter to monitor performance, track costs, and debug your AI applications.

## Installation

```bash
pip install langfuse openai
```

## Basic Setup

```python
from langfuse import Langfuse
from langfuse.openai import openai
import os

# Initialize Langfuse
langfuse = Langfuse(
    public_key="YOUR_LANGFUSE_PUBLIC_KEY",
    secret_key="YOUR_LANGFUSE_SECRET_KEY",
    host="https://cloud.langfuse.com"  # or self-hosted URL
)

# Configure OpenAI client for OpenRouter
openai.api_key = os.getenv("OPENROUTER_API_KEY")
openai.api_base = "https://openrouter.ai/api/v1"
```

## Traced Requests

```python
from langfuse.openai import openai

# All OpenAI calls are automatically traced
response = openai.chat.completions.create(
    model="openai/gpt-4o",
    messages=[
        {"role": "user", "content": "Hello, world!"}
    ]
)

print(response.choices[0].message.content)
```

## Manual Tracing

```python
from langfuse import Langfuse
from openai import OpenAI

langfuse = Langfuse()
client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

# Create a trace
trace = langfuse.trace(name="openrouter-request")

# Create a generation span
generation = trace.generation(
    name="chat-completion",
    model="openai/gpt-4o",
    input=[{"role": "user", "content": "Hello, world!"}]
)

# Make the request
response = client.chat.completions.create(
    model="openai/gpt-4o",
    messages=[{"role": "user", "content": "Hello, world!"}]
)

# End the generation with output
generation.end(
    output=response.choices[0].message.content,
    usage={
        "input": response.usage.prompt_tokens,
        "output": response.usage.completion_tokens
    }
)
```

## Features

| Feature | Description |
|---------|-------------|
| **Tracing** | View complete request/response traces |
| **Analytics** | Track latency, tokens, and usage patterns |
| **Cost Tracking** | Monitor spending across models |
| **Prompt Management** | Version and test prompts |
| **Evaluations** | Score and evaluate LLM outputs |

## Environment Variables

```bash
export OPENROUTER_API_KEY=sk-or-v1-...
export LANGFUSE_PUBLIC_KEY=pk-lf-...
export LANGFUSE_SECRET_KEY=sk-lf-...
export LANGFUSE_HOST=https://cloud.langfuse.com
```

---

*For more information, visit the [Langfuse documentation](https://langfuse.com/docs).*
