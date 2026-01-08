---
source: https://openrouter.ai/docs/guides/community/pydantic-ai
scraped: 2026-01-08
---

# PydanticAI

Integrate OpenRouter using PydanticAI framework. Complete guide for PydanticAI integration with OpenRouter for Python applications.

## Overview

PydanticAI is a Python agent framework that leverages Pydantic for type-safe LLM interactions. Use OpenRouter as a model provider to access 500+ models with full type safety.

## Installation

```bash
pip install pydantic-ai
```

## Basic Setup

```python
from pydantic_ai import Agent
from pydantic_ai.models.openai import OpenAIModel

# Configure OpenRouter as the model provider
model = OpenAIModel(
    "openai/gpt-4o",
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

agent = Agent(model)

result = agent.run_sync("Hello, world!")
print(result.data)
```

## Async Usage

```python
import asyncio
from pydantic_ai import Agent
from pydantic_ai.models.openai import OpenAIModel

model = OpenAIModel(
    "anthropic/claude-3.5-sonnet",
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

agent = Agent(model)

async def main():
    result = await agent.run("Tell me a story")
    print(result.data)

asyncio.run(main())
```

## Structured Output

```python
from pydantic import BaseModel
from pydantic_ai import Agent
from pydantic_ai.models.openai import OpenAIModel

class Person(BaseModel):
    name: str
    age: int
    occupation: str

model = OpenAIModel(
    "openai/gpt-4o",
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

agent = Agent(model, result_type=Person)

result = agent.run_sync("Generate a fictional person")
person: Person = result.data

print(f"Name: {person.name}")
print(f"Age: {person.age}")
print(f"Occupation: {person.occupation}")
```

## With Tools

```python
from pydantic_ai import Agent, Tool
from pydantic_ai.models.openai import OpenAIModel

model = OpenAIModel(
    "openai/gpt-4o",
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

def get_weather(city: str) -> str:
    """Get weather for a city."""
    return f"The weather in {city} is sunny and 72°F"

agent = Agent(
    model,
    tools=[Tool(get_weather)]
)

result = agent.run_sync("What's the weather in San Francisco?")
print(result.data)
```

## System Prompts

```python
from pydantic_ai import Agent
from pydantic_ai.models.openai import OpenAIModel

model = OpenAIModel(
    "anthropic/claude-3.5-sonnet",
    base_url="https://openrouter.ai/api/v1",
    api_key="YOUR_OPENROUTER_API_KEY"
)

agent = Agent(
    model,
    system_prompt="You are a helpful assistant that speaks like a pirate."
)

result = agent.run_sync("How do I make coffee?")
print(result.data)
```

## Features

| Feature | Description |
|---------|-------------|
| **Type Safety** | Full Pydantic validation for inputs and outputs |
| **Structured Output** | Parse LLM responses into Pydantic models |
| **Tools** | Define typed tool functions for agents |
| **Streaming** | Stream responses in real-time |
| **Async Support** | Native async/await support |

## Environment Variables

```bash
export OPENROUTER_API_KEY=sk-or-v1-...
```

---

*For more information, visit the [PydanticAI documentation](https://ai.pydantic.dev).*
