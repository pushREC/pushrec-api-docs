# Claude Agent SDK Setup Guide - Trigger.dev

## Overview

The Claude Agent SDK provides the same tools, agent loop, and context management that power Claude Code. When combined with Trigger.dev, developers gain durable execution, automatic retries, and full observability for their agents.

## Setup Instructions

### 1. Installation

Install the Claude Agent SDK package:
```bash
npm install @anthropic-ai/claude-agent-sdk
```

### 2. Configuration

Update `trigger.config.ts` to prevent bundling:

```typescript
import { defineConfig } from "@trigger.dev/sdk";

export default defineConfig({
  project: process.env.TRIGGER_PROJECT_REF!,
  build: {
    external: ["@anthropic-ai/claude-agent-sdk"],
  },
  machine: "small-2x",
});
```

**Important:** "Adding packages to `external` prevents them from being bundled, which is necessary for the Claude Agent SDK."

### 3. Environment Variables

Set your Anthropic API key:
```
ANTHROPIC_API_KEY=sk-ant-...
```

Configure via the Trigger.dev dashboard under Environment Variables or locally in `.env`.

### 4. Creating an Agent Task

```typescript
import { query } from "@anthropic-ai/claude-agent-sdk";
import { schemaTask, logger } from "@trigger.dev/sdk";
import { z } from "zod";

export const codeGenerator = schemaTask({
  id: "code-generator",
  schema: z.object({
    prompt: z.string(),
  }),
  run: async ({ prompt }, { signal }) => {
    const abortController = new AbortController();
    signal.addEventListener("abort", () => abortController.abort());

    const workDir = await mkdtemp(join(tmpdir(), "claude-agent-"));

    try {
      const result = query({
        prompt,
        options: {
          model: "claude-sonnet-4-20250514",
          abortController,
          cwd: workDir,
          maxTurns: 10,
          permissionMode: "acceptEdits",
          allowedTools: ["Read", "Edit", "Write", "Glob"],
        },
      });

      for await (const message of result) {
        logger.info("Agent message", { type: message.type });
      }

      const files = await readdir(workDir, { recursive: true });
      return { filesCreated: files };
    } finally {
      await rm(workDir, { recursive: true, force: true });
    }
  },
});
```

### 5. Running Development Server

```bash
npx trigger.dev@latest dev
```

## Agent Capabilities

The `query()` function enables Claude to:

- **Read files** using Read, Grep, and Glob tools
- **Edit files** with Edit and Write tools
- **Run commands** via Bash tool (when enabled)
- **Reason step-by-step** using extended thinking for complex tasks

Execution continues until task completion or reaching `maxTurns`.

## Permission Modes

| Mode | Behavior |
|------|----------|
| `"default"` | Requests approval for dangerous operations |
| `"acceptEdits"` | Auto-approves file operations; asks for bash/network |
| `"bypassPermissions"` | Skips all safety checks (not recommended) |

## Available Tools

Supported tools include: Task, Glob, Grep, Read, Edit, Write, Bash, TodoRead, and TodoWrite.

## Resources

- [Official Claude Agent SDK Documentation](https://platform.claude.com/docs/en/agent-sdk/overview)
- [Trigger.dev Realtime API](/realtime/overview)
- [GitHub Example Repository](https://github.com/triggerdotdev/examples/tree/main/claude-agent-sdk-trigger)
