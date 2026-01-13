# Mastra Agents with Memory Sharing + Trigger.dev Task Orchestration

## Overview
This example demonstrates a multi-agent workflow where users enter a city and activity to receive AI-generated clothing recommendations based on current weather conditions. The system combines Mastra's persistent memory capabilities with Trigger.dev's task orchestration for production-ready AI workflows.

## Technology Stack
- **Node.js** - Runtime environment
- **Mastra** - AI agent orchestration and memory management (TypeScript framework using Vercel's AI Agent SDK)
- **PostgreSQL** - Persistent storage and memory sharing
- **Trigger.dev** - Task orchestration, batching, and observability
- **OpenAI GPT-4** - Natural language processing
- **Open-Meteo API** - Weather data (no API key required)
- **Zod** - Schema validation and type safety

## Featured Architectural Patterns

**Agent Memory Sharing**: Efficiently shares data between agents using Mastra's working memory system.

**Task Orchestration**: Implements multi-step workflows with `triggerAndWait` for sequential agent execution.

**Centralized Storage**: Single PostgreSQL instance shared across all agents prevents duplicate database connections.

**Custom Tools**: External API integration with structured output validation.

**Agent Specialization**: Purpose-built agents with specific roles and instructions.

**Schema Optimization**: Lightweight data structures for enhanced performance.

## Project Structure
```
src/
├── mastra/
│   ├── agents/
│   │   ├── weather-analyst.ts (Weather data collection)
│   │   ├── clothing-advisor.ts (Clothing recommendations)
│   ├── tools/
│   │   └── weather-tool.ts (Enhanced weather API tool)
│   ├── schemas/
│   │   └── weather-data.ts (Weather schema)
│   └── index.ts (Mastra configuration)
├── trigger/
│   └── weather-task.ts (Trigger.dev tasks)
```

## Storage Architecture
The implementation uses a centralized PostgreSQL storage approach where a single database connection is shared across all Mastra agents. This design eliminates duplicate database connections and ensures efficient memory sharing between the weather analyst and clothing advisor agents.

Storage is configured once in the main Mastra instance and automatically inherited by all agent Memory instances. The PostgreSQL storage works seamlessly in both local development and serverless environments with providers like Supabase, Neon, Railway, and AWS RDS.

## Resources
- [Mastra documentation](https://mastra.ai/en/docs)
- [Mastra working memory guide](https://mastra.ai/en/docs/memory/overview)
- [GitHub repository](https://github.com/triggerdotdev/examples/tree/main/mastra-agents)
