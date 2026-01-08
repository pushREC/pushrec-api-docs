---
source: https://openrouter.ai/docs/sdks/typescript/overview
scraped: 2026-01-08
---

# TypeScript SDK Overview

The OpenRouter TypeScript SDK is a type-safe toolkit providing access to 300+ language models through a unified API. The SDK and documentation are currently in beta, with issues reportable on GitHub.

## Key Benefits

### Auto-generated from API specifications

The SDK is automatically generated from OpenRouter's OpenAPI specs and updated with every API change. This ensures new models and features appear immediately in IDE autocomplete without manual updates.

### Type safety

All parameters and response fields are fully typed, catching invalid configurations at compile time rather than runtime. The SDK provides contextual error messages and type-safe streaming support where response types adapt based on configuration parameters.

## Installation & Setup

Install via npm:

```bash
npm install @openrouter/sdk
```

Obtain your API key from [openrouter.ai/settings/keys](https://openrouter.ai/settings/keys), then initialize the client with your credentials.

## Basic Usage

The SDK enables straightforward API calls with full type support:

```typescript
import { OpenRouter } from "@openrouter/sdk";

const openRouter = new OpenRouter({
  apiKey: process.env["OPENROUTER_API_KEY"] ?? "",
});

const response = await openRouter.chat.send({
  model: "minimax/minimax-m2",
  messages: [{ role: "user", content: "Hello!" }]
});
```

Streaming is supported with proper type inference, allowing iteration over response chunks with full type information available throughout.

## Note

The TypeScript SDK and docs are currently in beta. Report issues on GitHub.
