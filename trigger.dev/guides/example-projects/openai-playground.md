# OpenAI Agents SDK for Typescript + Trigger.dev Playground

## Overview

This documentation covers a production-ready example project combining the OpenAI Agents SDK for Typescript with Trigger.dev for durable, scalable AI agent orchestration. The integration enables "agents that can be deployed to production and scaled to any size, with retries, queues, and full observability built-in."

## Tech Stack

- **Node.js**: Runtime environment
- **OpenAI Agents SDK for Typescript**: Agent creation and management framework
- **Trigger.dev**: Task orchestration, batching, scheduling, and workflow management
- **Zod**: Payload validation library

## Seven Agent Patterns Included

1. **Basic Agent Chat**: Personality-based conversations with strategic model selection (GPT-4, o1-preview, o1-mini, gpt-4o-mini)

2. **Agent with Tools**: Simple agent capable of calling tools to retrieve weather data

3. **Streaming Agent**: Real-time content generation with progress tracking

4. **Agent Handoffs**: Multi-agent collaboration using the "handoff pattern where agents can dynamically transfer control to specialists"

5. **Parallel Agents**: Concurrent processing for complex analysis tasks

6. **Scheduled Agent**: Time-based workflows running every 6 hours with trend analysis

7. **Agent with Guardrails**: Input validation for safe AI interactions

## Key Implementation Files

- **basicAgentChat.ts**: Maps personality types to specific OpenAI models within Trigger.dev orchestration
- **agentWithTools.ts**: Integrates OpenAI tool calling with Zod validation into retry mechanisms
- **streamingAgent.ts**: Leverages native OpenAI streaming with Trigger.dev metadata tracking
- **scheduledAgent.ts**: Cron-scheduled agents with automatic analysis
- **parallelAgents.ts**: Uses `batch.triggerByTaskAndWait` for scalable execution
- **agentWithGuardrails.ts**: Classification agents for input validation
- **agentHandoff.ts**: Specialist delegation orchestrated through Trigger.dev

## Learning Resources

- OpenAI Agents SDK documentation
- Handoff pattern guide for agent-to-agent delegation
- Batch triggering documentation for parallel execution
- Cron scheduling reference for scheduled tasks

## Repository Access

The complete project is available on GitHub at the triggerdotdev/examples repository under the openai-agents-sdk-with-trigger-playground directory, allowing developers to fork and customize for their needs.
