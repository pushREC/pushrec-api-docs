# Trigger.dev Agent Rules Documentation

## Overview

Trigger.dev provides comprehensive instruction sets designed to guide AI assistants in writing optimal code for the Trigger.dev platform. These "agent rules" ensure AI tools understand best practices, current APIs, and recommended patterns.

## Installation

Users install agent rules via CLI command:
```
npx trigger.dev@latest install-rules
```

## Available Rule Sets

The platform offers five specialized rule collections:

| Rule Set | Tokens | Purpose |
|----------|--------|---------|
| Basic Tasks | 1,200 | "Essential rules for writing basic Trigger.dev tasks and fundamental patterns" |
| Advanced Tasks | 3,000 | Covers complex workflows, error handling, advanced patterns |
| Scheduled Tasks | 780 | Guidance for cron jobs, scheduled workflows, time-based triggers |
| Configuration | 1,900 | "Complete guide for trigger.config.ts setup, environment configuration, and project structure" |
| Realtime | 1,700 | "Using Trigger.dev Realtime features and frontend integration patterns" |

## Claude Code Subagent

For Claude Code users, a specialized subagent called `trigger-dev-expert` provides focused guidance on well-structured Trigger.dev implementations. Users enable it during the rules installation process.

## Supported AI Clients

The rules work across multiple platforms including Cursor, Claude Code, VSCode Copilot, Windsurf, Gemini CLI, Cline, Sourcegraph AMP, Kilo, Ruler, and AGENTS.md format clients.

## Activation Behavior

- **Automatic**: Cursor, Windsurf, VSCode Copilot, Cline apply rules when working in Trigger.dev projects
- **Context-Aware**: Claude Code intelligently applies rules based on file types and context
- **Manual**: AGENTS.md clients require explicit configuration file integration

## Updates

The CLI provides automatic update notifications during development. Manual updates use the same installation command. Updates reflect new features, API changes, and best practices without creating duplicates.
