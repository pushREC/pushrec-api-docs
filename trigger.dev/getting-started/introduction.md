---
source: https://trigger.dev/docs/introduction
scraped: 2026-01-13
---

# Trigger.dev Documentation Summary

## Overview
Trigger.dev is an open-source background jobs framework enabling users to "write reliable workflows in plain async code" with built-in queuing, automatic retries, and real-time monitoring capabilities.

## Core Features

**Key Capabilities:**
- Long-running AI task execution
- Complex background job handling
- AI agent building
- No execution timeouts
- Elastic scaling
- Zero infrastructure management required

## Getting Started Resources

The documentation provides multiple entry points:
- Quick start guide (3-minute setup)
- Video walkthrough (10-minute demo)
- Manual setup instructions
- Framework-specific guides (Next.js, Node.js, Remix, Bun, SvelteKit)

## Fundamental Concepts

**Core Components:**
1. **Tasks** - Core functions that can run for extended periods with failure resilience
2. **Triggering** - Methods to initiate tasks from code
3. **Runs** - Individual task execution instances with lifecycle tracking
4. **API Keys** - Authentication mechanism for API requests

## Advanced Features

- Scheduled tasks (cron-based)
- Realtime API with React hooks for frontend integration
- Wait functions for task coordination
- Error handling and retry mechanisms
- Concurrency and queue management
- Human-in-the-loop workflows via wait tokens
- Idempotency support
- Custom metadata attachment
- Real-time streaming capabilities

## Build Extensions

The platform includes extensible build capabilities for:
- Database integration (Prisma)
- Language support (Python)
- Browser automation (Playwright, Puppeteer)
- Media processing (FFmpeg, Sharp, LibreOffice)
- Environment variable synchronization

## Deployment Options

- Trigger.dev Cloud hosting
- Self-hosting (Docker, Kubernetes)
- GitHub Actions integration
- Preview branch deployments
- Atomic deployment coordination

## Example Integrations

Documentation covers integration examples including OpenAI, Fal.ai, Supabase, Resend, and various media processing workflows.
