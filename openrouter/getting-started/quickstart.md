---
source: https://openrouter.ai/docs/quickstart
scraped: 2026-01-08
---

# OpenRouter Quickstart

## Overview

OpenRouter provides unified API access to hundreds of AI models through a single endpoint. The service handles fallbacks automatically and selects cost-effective options. Integration requires minimal code using preferred SDKs or frameworks.

## Key Features

- Single endpoint for multiple AI models
- Automatic fallback handling
- Cost optimization
- Optional app attribution headers for leaderboard rankings

## Installation & Setup Methods

### OpenRouter SDK (Beta)

Package installation via npm, yarn, or pnpm:

```bash
npm install @openrouter/sdk
```

```bash
yarn add @openrouter/sdk
```

```bash
pnpm add @openrouter/sdk
```

### Direct API Access

The service supports requests in Python, TypeScript, and shell/curl, using the endpoint:

```
https://openrouter.ai/api/v1/chat/completions
```

### OpenAI SDK Compatibility

OpenRouter works with OpenAI SDKs by configuring a custom base URL pointing to:

```
https://openrouter.ai/api/v1
```

## Optional Headers

| Header | Purpose |
|--------|---------|
| `HTTP-Referer` | Site URL for rankings |
| `X-Title` | Site title for rankings |

## Additional Resources

- Interactive Request Builder available for generating API requests
- Streaming support documented separately
- Third-party SDK and framework integration guides provided
- FAQ section covers rate limits and free model information
