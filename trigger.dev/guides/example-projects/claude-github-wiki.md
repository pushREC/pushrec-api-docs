# Claude GitHub Wiki - Documentation Extract

## Overview
This demonstration illustrates building an AI agent using the Claude Agent SDK that duplicates any public GitHub repository and leverages Claude to answer questions about its codebase. The agent navigates code using `Grep` and `Read` tools to deliver thorough, precise responses.

## Technology Stack
- **Next.js** – React framework with App Router for frontend development
- **Claude Agent SDK** – Anthropic's toolkit for constructing AI agents with filesystem and search capabilities
- **Trigger.dev** – Orchestration platform offering real-time streaming, observability, and deployment features

## Operational Workflow
The agent follows these steps:

1. **Question Reception** – User submits a GitHub URL and repository inquiry
2. **Repository Cloning** – Shallow clone to temporary directory (depth=1 for efficiency)
3. **Claude Analysis** – Agent investigates codebase using available tools:
   - `Grep` – Pattern matching across files
   - `Read` – File content retrieval
4. **Response Streaming** – Analysis transmits to frontend instantaneously
5. **Cleanup** – Temporary directory deletion, guaranteed even upon failure

## Key Features
- Interrogate any public repository regarding architecture, security concerns, API design, testing approaches
- Claude Agent SDK explores code with `Grep` and `Read` capabilities
- Task cancellation with thorough cleanup procedures
- Trigger.dev Realtime streaming for live analysis observation
- Progress visibility including clone status and repository metrics

## Important Configuration
Mark the Claude Agent SDK as external in `trigger.config.ts` to prevent bundling:

```typescript
export default defineConfig({
  project: process.env.TRIGGER_PROJECT_REF!,
  runtime: "node",
  maxDuration: 3600,
  build: {
    external: ["@anthropic-ai/claude-agent-sdk"],
  },
  machine: "medium-2x",
});
```

This prevents bundling, necessary for the Claude Agent SDK's functionality.

## Repository Reference
Full source code available at the triggerdotdev/examples GitHub repository, suitable for forking as a foundation for custom implementations.
