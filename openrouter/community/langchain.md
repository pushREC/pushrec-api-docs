---
source: https://openrouter.ai/docs/guides/community/langchain
scraped: 2026-01-08
---

# LangChain

Integrate OpenRouter using LangChain framework. Complete guide for LangChain integration with OpenRouter for Python and JavaScript.

## Python Integration

### Installation

```bash
pip install langchain-openai
```

### Setup

```python
from langchain_openai import ChatOpenAI

# Configure OpenRouter as the LLM provider
llm = ChatOpenAI(
    model="openai/gpt-4o",
    openai_api_key="YOUR_OPENROUTER_API_KEY",
    openai_api_base="https://openrouter.ai/api/v1",
)

# Basic usage
response = llm.invoke("Hello, world!")
print(response.content)
```

### With Streaming

```python
from langchain_openai import ChatOpenAI

llm = ChatOpenAI(
    model="anthropic/claude-3.5-sonnet",
    openai_api_key="YOUR_OPENROUTER_API_KEY",
    openai_api_base="https://openrouter.ai/api/v1",
    streaming=True
)

for chunk in llm.stream("Tell me a story"):
    print(chunk.content, end="", flush=True)
```

### In Chains

```python
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser

llm = ChatOpenAI(
    model="openai/gpt-4o",
    openai_api_key="YOUR_OPENROUTER_API_KEY",
    openai_api_base="https://openrouter.ai/api/v1",
)

prompt = ChatPromptTemplate.from_template("Translate to French: {text}")
chain = prompt | llm | StrOutputParser()

result = chain.invoke({"text": "Hello, world!"})
```

## JavaScript/TypeScript Integration

### Installation

```bash
npm install @langchain/openai
```

### Setup

```typescript
import { ChatOpenAI } from "@langchain/openai";

const llm = new ChatOpenAI({
  model: "openai/gpt-4o",
  openAIApiKey: process.env.OPENROUTER_API_KEY,
  configuration: {
    baseURL: "https://openrouter.ai/api/v1"
  }
});

const response = await llm.invoke("Hello, world!");
console.log(response.content);
```

### With Streaming

```typescript
import { ChatOpenAI } from "@langchain/openai";

const llm = new ChatOpenAI({
  model: "anthropic/claude-3.5-sonnet",
  openAIApiKey: process.env.OPENROUTER_API_KEY,
  configuration: {
    baseURL: "https://openrouter.ai/api/v1"
  },
  streaming: true
});

const stream = await llm.stream("Tell me a story");
for await (const chunk of stream) {
  process.stdout.write(chunk.content);
}
```

## Model Selection

OpenRouter provides access to 500+ models. Use the model ID format:

```
provider/model-name
```

Examples:
- `openai/gpt-4o`
- `anthropic/claude-3.5-sonnet`
- `google/gemini-2.0-flash`
- `meta-llama/llama-3.3-70b-instruct`

---

*For more information, visit the [LangChain documentation](https://python.langchain.com) and [OpenRouter models page](https://openrouter.ai/models).*
