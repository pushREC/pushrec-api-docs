---
source: https://openrouter.ai/docs/guides/community/arize
scraped: 2026-01-08
---

# Arize

Observability and tracing with OpenRouter. Complete guide for Arize integration with OpenRouter for Python and JavaScript applications.

## Overview

Arize provides observability and tracing capabilities for AI applications using OpenRouter. Monitor your LLM calls, track performance, and debug issues in production.

## Python Integration

### Installation

```bash
pip install arize openai
```

### Setup

```python
from arize.otel import register
from openai import OpenAI

# Initialize Arize tracer
tracer_provider = register(
    space_id="YOUR_SPACE_ID",
    api_key="YOUR_ARIZE_API_KEY",
    project_name="openrouter-project"
)

# Configure OpenRouter client
client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

# Make traced requests
response = client.chat.completions.create(
    model="openai/gpt-4o",
    messages=[
        {"role": "user", "content": "Hello, world!"}
    ]
)
```

## JavaScript Integration

### Installation

```bash
npm install @arizeai/openinference-instrumentation-openai openai
```

### Setup

```javascript
import { OpenAI } from "openai";
import { registerInstrumentations } from "@arizeai/openinference-instrumentation-openai";

// Register Arize instrumentation
registerInstrumentations({
  spaceId: "YOUR_SPACE_ID",
  apiKey: "YOUR_ARIZE_API_KEY"
});

// Configure OpenRouter client
const client = new OpenAI({
  baseURL: "https://openrouter.ai/api/v1",
  apiKey: process.env.OPENROUTER_API_KEY
});

// Make traced requests
const response = await client.chat.completions.create({
  model: "openai/gpt-4o",
  messages: [
    { role: "user", content: "Hello, world!" }
  ]
});
```

## Features

- **Trace Visualization** - View complete request/response traces
- **Performance Monitoring** - Track latency, tokens, and costs
- **Error Tracking** - Debug failed requests and timeouts
- **Model Comparison** - Compare performance across different models

---

*For more information, visit the [Arize documentation](https://docs.arize.com).*
