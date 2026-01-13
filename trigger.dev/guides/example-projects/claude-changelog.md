# Changelog Generator Using Claude Agent SDK - Trigger.dev

## Overview

This demonstration showcases how to construct an AI agent leveraging the Claude Agent SDK that examines GitHub commits, examines ambiguous modifications by requesting diffs when necessary, and produces developer-focused changelog documentation.

## Technology Stack

- **Next.js** – Frontend framework utilizing App Router
- **Claude Agent SDK** – Anthropic's toolkit for constructing AI agents with personalized tools
- **Trigger.dev** – Orchestration service featuring live streaming, monitoring, and hosting capabilities
- **Octokit** – GitHub API integration for retrieving commits and modifications

## Operational Flow

The agent executes the following sequence:

1. **Request Reception** – Developer furnishes a GitHub repository URL and timeframe
2. **Commit Retrieval** – Agent activates `list_commits` tool to gather all commits
3. **Commit Evaluation** – Agent categorizes commits:
   - Discards insignificant commits (corrections, style changes)
   - Incorporates transparent features/enhancements directly
   - Examines ambiguous commits by retrieving their diffs
4. **Changelog Production** – Agent generates organized markdown documentation
5. **Live Output** – Changelog transmits to frontend instantaneously

## Key Capabilities

- **Dual-Phase Processing** – Gathers commits first, then retrieves diffs selectively for uncertain commits
- **Personalized Tools** – `list_commits` and `get_commit_diff` executed autonomously by Claude
- **Real-Time Broadcast** – Changelog transmits during generation via Trigger.dev Realtime
- **Active Monitoring** – Agent phase, iteration count, and tool usage distributed through run metadata
- **Repository Access** – Accommodates GitHub authentication tokens for confidential repositories

## Essential Code Files

| File | Purpose |
|------|---------|
| trigger/generate-changelog.ts | Primary task incorporating agent tools |
| trigger/changelog-stream.ts | Stream configuration for live updates |
| app/api/generate-changelog/route.ts | Request handler triggering the task |
| app/response/[runId]/page.tsx | Frontend streaming interface |

## Configuration Requirements

Mark the Claude Agent SDK as external in `trigger.config.ts`:

```typescript
export default defineConfig({
  project: process.env.TRIGGER_PROJECT_REF!,
  runtime: "node",
  logLevel: "log",
  maxDuration: 300,
  build: {
    external: ["@anthropic-ai/claude-agent-sdk"],
  },
  machine: "small-2x",
});
```

**Note:** Marking packages as external prevents bundling, essential for the Claude Agent SDK.

## Additional Resources

- Building agents with Claude Agent SDK – Comprehensive implementation guide
- Realtime – Frontend progress streaming documentation
- Scheduled tasks – Automate changelog creation on recurring intervals
