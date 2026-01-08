---
source: https://openrouter.ai/docs/guides/community/livekit
scraped: 2026-01-08
---

# LiveKit

Integrate OpenRouter with LiveKit Agents framework. Build voice AI agents with access to 500+ models.

## Overview

LiveKit Agents is a framework for building voice-based AI agents. By integrating with OpenRouter, you can access a wide variety of AI models for your voice applications.

## Installation

```bash
pip install livekit-agents livekit-plugins-openai
```

## Basic Setup

```python
from livekit.agents import Agent, AgentContext
from livekit.plugins.openai import LLM

# Configure OpenRouter as the LLM provider
llm = LLM(
    model="openai/gpt-4o",
    api_key="YOUR_OPENROUTER_API_KEY",
    base_url="https://openrouter.ai/api/v1"
)

class VoiceAgent(Agent):
    def __init__(self, ctx: AgentContext):
        super().__init__(ctx)
        self.llm = llm

    async def on_message(self, message: str):
        response = await self.llm.chat(
            messages=[{"role": "user", "content": message}]
        )
        return response.content
```

## Voice Pipeline Integration

```python
from livekit.agents import VoicePipelineAgent
from livekit.plugins.openai import LLM
from livekit.plugins.silero import VAD
from livekit.plugins.deepgram import STT
from livekit.plugins.elevenlabs import TTS

# Configure components
llm = LLM(
    model="anthropic/claude-3.5-sonnet",
    api_key="YOUR_OPENROUTER_API_KEY",
    base_url="https://openrouter.ai/api/v1"
)

agent = VoicePipelineAgent(
    vad=VAD(),
    stt=STT(),
    llm=llm,
    tts=TTS()
)
```

## Model Selection

Choose from 500+ models available on OpenRouter:

| Model | Best For |
|-------|----------|
| `openai/gpt-4o` | General conversation, reasoning |
| `anthropic/claude-3.5-sonnet` | Nuanced dialogue, analysis |
| `google/gemini-2.0-flash` | Fast responses |
| `meta-llama/llama-3.3-70b-instruct` | Open-source alternative |

## Features

- **Real-time Voice** - Low-latency voice interactions
- **Model Flexibility** - Switch between models easily
- **Streaming Support** - Token-by-token streaming for responsive agents
- **Cost Optimization** - Use different models for different tasks

---

*For more information, visit the [LiveKit Agents documentation](https://docs.livekit.io/agents).*
